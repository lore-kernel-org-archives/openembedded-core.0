Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC8DC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 14:33:46 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.12323.1639060425874790192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DsIzLIKd;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id n6so11141539uak.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=om7/q3surfQK+1B4OivEV2AGFT11VmjVxwkpaCWH9x4=;
        b=DsIzLIKdA1C8zt3fMPHCGX21kdLqycs8Esyzlhr4j1NHXuH2vFZ9lQujbcbOPvfDQ4
         FcM79aDnNAx6W9xfrQtlnwcb+1yu0MIfRaRWoEGIzqrEgEtNureuQTZkHrtft/SAV5hb
         BPzZ3bP9c+RO6eYKcy3kwJ1LEjcc+5hQCCZme2Hj/BqFKMmc8m3lLCzAp7KvjCO/iuic
         UVFdhnsT9xXe7SJn6dB+4b7rbSQK32MrTIQcofF+5KUS90+0EsDvzH9mMMUKPAiDPKnw
         0ystj3xRk471cSi2Pa0zrlRtFac+dL5ZrgXnLmo2yihAPReE5TRnkg8ywaidFErQIR2s
         J8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=om7/q3surfQK+1B4OivEV2AGFT11VmjVxwkpaCWH9x4=;
        b=o4gtX/eFO5rEo2RcGoMmoJ7ZC81cLt0Sd/szbzmhDMe1nvwxCi3FB6Qv91zOQj2yBc
         ctR3O3Q5N7iXKnvyv2jKGv0/tqY0p03TtORU+QDhEQ7Sv6kinSXGK7Z4pla7fN8Ycw6N
         MpBzG8jjGc1kANFrLqzi1Fs72NJsDpMpj1euM5E5+xTv22Yyh+92747Tqr0P45Fc9iTY
         H1HoAbj9XR6lNU4e4tRs3xC2gsvqeKrhUfYQJuBu4Z31JtG+PdrPfgE+4CMmdQti46wR
         hmScUePY4Wbl9+d2wAp8YVz1XOsXTr4KjylZahD1XPaA8xjBWadAQw8NI9vBh9f1Lnd7
         SSJA==
X-Gm-Message-State: AOAM5306Qmi09vFTfhmbZApz4qhOXJfIOYq943sTF+boFSzvvAs73bWW
	j66O7nSNrq1dqozwy3Uj3+zlYSMImR+mWMYMJ54=
X-Google-Smtp-Source: 
 ABdhPJxl1IOTm75B1QBV6tNmocQ6BrWHwUfD5YlG8904O+JU6EYKGxhbZDpMLfUj65kPfF7Qki+LVDucJwHW173I+0o=
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr7916723vst.42.1639060424975;
 Thu, 09 Dec 2021 06:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-5-alex@linutronix.de>
 <2b5536624c6324dd6f73dd6fa3d53e05c33eb64f.camel@linuxfoundation.org>
 <AM9PR09MB46422CD393A3298518687FF7A8709@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <16BF1B61B6B32D54.14236@lists.openembedded.org>
In-Reply-To: <16BF1B61B6B32D54.14236@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Dec 2021 15:33:33 +0100
Message-ID: 
 <CANNYZj-zW4gCZ3xkuRqAsbHiRmhS_ccNXmZSOOVdWQMcKiyBeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/29] serf: mark patches as inappropriate for
 upstream submission
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>, Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="000000000000656aa905d2b77e95"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 14:33:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159451

--000000000000656aa905d2b77e95
Content-Type: text/plain; charset="UTF-8"

I sent a message to oe-architecture.

Alex

On Thu, 9 Dec 2021 at 15:08, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> I think we only have a single doc that needs to be updated first:
>
>
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status
>
> The question is, how? Presumably, I need to make some kind of official
> proposal to OE organization, and not just edit the wiki without asking?
>
> Alex
>
> On Thu, 9 Dec 2021 at 14:56, Konrad Weihmann <kweihmann@outlook.com>
> wrote:
>
>>
>>
>> On 09.12.21 14:45, Richard Purdie wrote:
>> > On Wed, 2021-12-08 at 22:59 +0100, Alexander Kanavin wrote:
>> >> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> >> ---
>> >>   .../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch   | 3
>> ++-
>> >>   ...p.creating.directories.without.sandbox-install.prefix.patch | 3
>> ++-
>> >>   2 files changed, 4 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git
>> a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
>> b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
>> >> index e6172ef5aa..5b8fb70639 100644
>> >> ---
>> a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
>> >> +++
>> b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
>> >> @@ -6,7 +6,8 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use
>> ERR_GET_FUNC
>> >>   Upstream removed it in
>> >>   https://github.com/openssl/openssl/pull/16004
>> >>
>> >> -Upstream-Status: Pending
>> >> +Upstream is defunct: last release in 2015, last commit in 2019.
>> >> +Upstream-Status: Inappropriate [no upstream]
>> >>   Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> >>   ---
>> >>    buckets/ssl_buckets.c | 3 +--
>> >> diff --git
>> a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
>> b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
>> >> index 91640d6044..cf00dbf5ac 100644
>> >> ---
>> a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
>> >> +++
>> b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
>> >> @@ -31,7 +31,8 @@ ERROR: scons install execution failed.
>> >>     and the installed paths (including the paths inside libserf*.pc)
>> >>     look correct
>> >>
>> >> -Upstream-Status: Pending
>> >> +Upstream is defunct: last release in 2015, last commit in 2019
>> >> +Upstream-Status: Inappropriate [no upstream]
>> >>
>> >>   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >>
>> >
>> > I'm still not convinced this is the right thing to do. I appreciate
>> what the
>> > docs say but I also think we may need to evolve.
>> >
>> > Let's imagine we do have an "Inactive-Upstream" status for a minute and
>> this
>> > patch changes to:
>> >
>> > Upstream-Status: Inactive-Upstream [last release 2015, last commit 2019]
>> >
>> > If you now happen to be changing the recipe due to a new release, this
>> is going
>> > to trigger some kind of thought/action by seeing that status in that we
>> might
>> > now be able to upstream the patches. If it just says "Inappropriate",
>> it won't
>> > trigger the response we'd like.
>> >
>> > We're also going to eventually end up with a whole pile of
>> "Inappropriate"
>> > patches, it may be useful to keep an open mind on whether any
>> subdivision of
>> > those would be helpful.
>> >
>> > Does this make sense to anyone else?
>>
>> It would makes sense, but then the support and the docs has to
>> backported again, otherwise cherry-picking won't be easy for older
>> releases. But yeah I'm with you that Inappropriate looks odd in this
>> context - still this is stated in the docs, we always refer to, so a doc
>> update needs to come in first IMO
>>
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159450):
> https://lists.openembedded.org/g/openembedded-core/message/159450
> Mute This Topic: https://lists.openembedded.org/mt/87599630/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000656aa905d2b77e95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I sent a message to oe-architecture.</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, 9 Dec 2021 at 15:08, Alexander Kanavin via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ale=
x.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>I think we only have a single do=
c that needs to be updated first:</div><div><br></div><div><a href=3D"https=
://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_R=
ecommendations:_Upstream-Status" target=3D"_blank">https://www.openembedded=
.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Ups=
tream-Status</a></div><div><br></div><div>The question is, how? Presumably,=
 I need to make some kind of official proposal to OE organization, and not =
just edit the wiki without asking?</div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, 9 Dec 2021 at 14:56, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann=
@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 09.12.21 14:45, Richard Purdie wrote:<br>
&gt; On Wed, 2021-12-08 at 22:59 +0100, Alexander Kanavin wrote:<br>
&gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutr=
onix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC=
.patch=C2=A0 =C2=A0| 3 ++-<br>
&gt;&gt;=C2=A0 =C2=A0...p.creating.directories.without.sandbox-install.pref=
ix.patch | 3 ++-<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_bucke=
ts.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-bu=
ckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch<br>
&gt;&gt; index e6172ef5aa..5b8fb70639 100644<br>
&gt;&gt; --- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do=
-not-use-ERR_GET_FUNC.patch<br>
&gt;&gt; +++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do=
-not-use-ERR_GET_FUNC.patch<br>
&gt;&gt; @@ -6,7 +6,8 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use=
 ERR_GET_FUNC<br>
&gt;&gt;=C2=A0 =C2=A0Upstream removed it in<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/openssl/openssl/pull/160=
04" rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl=
/pull/16004</a><br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt; +Upstream is defunct: last release in 2015, last commit in 2019.<b=
r>
&gt;&gt; +Upstream-Status: Inappropriate [no upstream]<br>
&gt;&gt;=C2=A0 =C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0---<br>
&gt;&gt;=C2=A0 =C2=A0 buckets/ssl_buckets.c | 3 +--<br>
&gt;&gt; diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creati=
ng.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/=
serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.pref=
ix.patch<br>
&gt;&gt; index 91640d6044..cf00dbf5ac 100644<br>
&gt;&gt; --- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.dire=
ctories.without.sandbox-install.prefix.patch<br>
&gt;&gt; +++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.dire=
ctories.without.sandbox-install.prefix.patch<br>
&gt;&gt; @@ -31,7 +31,8 @@ ERROR: scons install execution failed.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0and the installed paths (including the paths in=
side libserf*.pc)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0look correct<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt; +Upstream is defunct: last release in 2015, last commit in 2019<br=
>
&gt;&gt; +Upstream-Status: Inappropriate [no upstream]<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Mart=
in.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; I&#39;m still not convinced this is the right thing to do. I appreciat=
e what the<br>
&gt; docs say but I also think we may need to evolve.<br>
&gt; <br>
&gt; Let&#39;s imagine we do have an &quot;Inactive-Upstream&quot; status f=
or a minute and this<br>
&gt; patch changes to:<br>
&gt; <br>
&gt; Upstream-Status: Inactive-Upstream [last release 2015, last commit 201=
9]<br>
&gt; <br>
&gt; If you now happen to be changing the recipe due to a new release, this=
 is going<br>
&gt; to trigger some kind of thought/action by seeing that status in that w=
e might<br>
&gt; now be able to upstream the patches. If it just says &quot;Inappropria=
te&quot;, it won&#39;t<br>
&gt; trigger the response we&#39;d like.<br>
&gt; <br>
&gt; We&#39;re also going to eventually end up with a whole pile of &quot;I=
nappropriate&quot;<br>
&gt; patches, it may be useful to keep an open mind on whether any subdivis=
ion of<br>
&gt; those would be helpful.<br>
&gt; <br>
&gt; Does this make sense to anyone else?<br>
<br>
It would makes sense, but then the support and the docs has to <br>
backported again, otherwise cherry-picking won&#39;t be easy for older <br>
releases. But yeah I&#39;m with you that Inappropriate looks odd in this <b=
r>
context - still this is stated in the docs, we always refer to, so a doc <b=
r>
update needs to come in first IMO<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159450): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159450" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159450</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87599630/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87599630/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000656aa905d2b77e95--

