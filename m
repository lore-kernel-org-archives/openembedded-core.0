Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563ABFA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:27:18 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.19841.1666621634591431380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=GR1Ilj7W;
 spf=pass (domain: google.com, ip: 209.85.160.178, mailfrom: wltu@google.com)
Received: by mail-qt1-f178.google.com with SMTP id r19so5695047qtx.6
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cY/fPVlPGeyOc15ZGnx0+TlcvWs/HCTC/kmbqTZuU48=;
        b=GR1Ilj7WYeETXfOcOuTlsAqFgoGXomdB1CjgI1gqDb759xttGybP3ft51Z4pNCsNHb
         Ftu5j6uznwKsrhgOPxuWu8qgboOidsoXYVA0YeUh3KfI1xcsrFoVJZBdAXZZdrl6DrtK
         VV+JSlgwr/+Wmvd3JyOmgWScaKiunVzGi81GC52htLjoS3qn+aQ6gTdciJM0FOC3rd7e
         LxU4fxUL9MG5zVqrZz9u2v1hADOSZPw3bKYGhxI6rsHiwjM8P66hZ/7EnMftpZBNZ5Nd
         Nl18oTvSUrppqAIhGfXSA1evMtE61Ubc2+UJKClScDXqQNq6RXWpvFbwzsB1OWSKhQaD
         mkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cY/fPVlPGeyOc15ZGnx0+TlcvWs/HCTC/kmbqTZuU48=;
        b=SBOWhvEx6lwo2kvh6b/akAoimtMeUK2HyuwHapaNPFp1teGbWuFzcQOm/4SRLEZyEW
         osVfMw71tnlZjLAmDIJ3HPjkH6JQyqESDoU0LXVl3bEnfMpWENPUVvxDZRBJbtgTYXG0
         4DVTtUo/Y4909k1KATXzZ5Ef+2Lbhild6T+oezWBAmkL7tejDCvJHNyVYEp3X5piZtFI
         bgqt1DEhHIFEiOXeclfrlOBIKyRbcNKNF9OFomBoTqrEIcggJq+dV03soaI6ISAxu68o
         pGpsZoVO/6OEutIpZfy21bEQn7tCP65ggehTQOA5qKE76KdUABoHSecq2PdsSHl5rNgB
         a5Aw==
X-Gm-Message-State: ACrzQf3/6wAG4hIxiyysVdAF0drF2j4zft71+v0Y4hok9wIdlgyt14rG
	y7ugVJwSB3BUoMKopPeQFKtYEpYM7FD9osShCwZtfV5InuIGTQ==
X-Google-Smtp-Source: AMsMyM7iEwei8VewVCevMbMCd1ksooo8V/NAOWGRJNIv3m7TeCRt9++tRmyCQvg/Qca+0vr/Y9k1PYKMafaN1ZF7hnc=
X-Received: by 2002:a05:622a:15d1:b0:39c:f1da:fe0e with SMTP id
 d17-20020a05622a15d100b0039cf1dafe0emr27444783qty.662.1666621633520; Mon, 24
 Oct 2022 07:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org> <f39014e0-6847-fcd0-f6d7-142cb3658a58@bootlin.com>
In-Reply-To: <f39014e0-6847-fcd0-f6d7-142cb3658a58@bootlin.com>
From: Willy Tu <wltu@google.com>
Date: Mon, 24 Oct 2022 07:27:02 -0700
Message-ID: <CAHwn2XmuM6_tDe3z3qsK3jMGLOtzWa57azRO0xm00cP6aN2=2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000713fa405ebc8966d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172098

--000000000000713fa405ebc8966d
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

Thanks for the response. Sorry for the delay. I must have missed the email
when I was setting up the filters. I have sent the patch directly to you
privately to see if that works.

As for
```
git config --global sendemail.from "wltu@google.com"
```
,

I think I already have to setup properly
```
$ git config --global sendemail.from
Willy Tu <wltu@google.com>
```

I believe the issue is because I created the topic directly with
https://lists.openembedded.org/g/openembedded-core/post. Instead with git
email and it filtered out the email from there for some reason. I should
probably just send the email through git instead. I did with the web UI
because I wasn't able to get my message show up before. Sorry for the
confusion. I'll try with git send-email next time.

Best,

Willy Tu


On Fri, Oct 21, 2022 at 9:24 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Willy
>
> Thanks for the patch!
>
> On 10/21/22 15:17, Willy Tu via lists.openembedded.org wrote:
> > Install API only if opensshinternals is in DISTRO_FEATURES.
> > Install the OpenSSH header + lib files for other repo to build using it.
> > For example, https://github.com/google/hiba is dependent on those files
> > to build and this change is needed to meet that requirement.
> > https://github.com/openembedded/meta-openembedded/pull/597
> > Signed-off-by: Willy Tu <wltu@google.com>
> > ---
> >  meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
>
>
> There's a problem with the way you send your patches though. I used to
> have it too.
>
> If I apply your patch through "git am", the author of the commit will be:
> Willy Tu via lists.openembedded.org <wltu=
> google.com@lists.openembedded.org>
> instead of
> Willy Tu <wltu@google.com>
>
> Because of this issue, the maintainer has to manually fix this field
> when accepting your patch. Worse, if he doesn't catch this, that's
> harder to fix afterwards.
>
> You should be able to fix this by running:
>
> git config --global sendemail.from "wltu@google.com"
> This should add a "From" field to the sent patch which "git am" should
> be able to match with your name.
>
> At least this worked for me. See
>
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email
>
> Could you try to send an update? You could send it to me again through
> private-email first.
>
> Thanks in advance
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000713fa405ebc8966d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Michael,<div><br></div><div>Thanks for the respons=
e. Sorry for the delay. I must have missed the email when I was setting up =
the filters. I have sent the patch directly to you privately to see if that=
 works.</div><div><br></div><div>As for</div><div>```</div><div>git config =
--global sendemail.from &quot;<a href=3D"mailto:wltu@google.com" target=3D"=
_blank">wltu@google.com</a>&quot;</div><div>```</div><div>,</div><div><br><=
/div><div>I think I already have to setup=C2=A0properly</div><div>```</div>=
<div>$ git config --global sendemail.from <br>Willy Tu &lt;<a href=3D"mailt=
o:wltu@google.com">wltu@google.com</a>&gt;<br></div><div>```</div><div><br>=
</div><div>I believe the issue is because=C2=A0I created the topic directly=
 with=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/po=
st">https://lists.openembedded.org/g/openembedded-core/post</a>. Instead wi=
th git email and it filtered out the email from there for some=C2=A0reason.=
 I should probably just send the email through git instead. I did with the =
web UI because=C2=A0I wasn&#39;t able to get my message show up before. Sor=
ry for the confusion. I&#39;ll try with git send-email next time.</div><div=
><br></div><div>Best,</div><div><br></div><div>Willy Tu</div><div><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, Oct 21, 2022 at 9:24 AM Michael Opdenacker &lt;<a href=3D"mailto:m=
ichael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Willy<br>
<br>
Thanks for the patch!<br>
<br>
On 10/21/22 15:17, Willy Tu via <a href=3D"http://lists.openembedded.org" r=
el=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Install API only if opensshinternals is in DISTRO_FEATURES.<br>
&gt; Install the OpenSSH header + lib files for other repo to build using i=
t.<br>
&gt; For example, <a href=3D"https://github.com/google/hiba" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/google/hiba</a> is dependent on t=
hose files<br>
&gt; to build and this change is needed to meet that requirement.<br>
&gt; <a href=3D"https://github.com/openembedded/meta-openembedded/pull/597"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/meta-=
openembedded/pull/597</a><br>
&gt; Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=
=3D"_blank">wltu@google.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.0p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.0p1.bb</a> | 11 ++++++=
+++++<br>
&gt; =C2=A01 file changed, 11 insertions(+)<br>
<br>
<br>
There&#39;s a problem with the way you send your patches though. I used to =
<br>
have it too.<br>
<br>
If I apply your patch through &quot;git am&quot;, the author of the commit =
will be:<br>
Willy Tu via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> &lt;wltu=3D<a href=3D"mailto:go=
ogle.com@lists.openembedded.org" target=3D"_blank">google.com@lists.openemb=
edded.org</a>&gt;<br>
instead of<br>
Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_blank">wltu@goog=
le.com</a>&gt;<br>
<br>
Because of this issue, the maintainer has to manually fix this field <br>
when accepting your patch. Worse, if he doesn&#39;t catch this, that&#39;s =
<br>
harder to fix afterwards.<br>
<br>
You should be able to fix this by running:<br>
<br>
git config --global sendemail.from &quot;<a href=3D"mailto:wltu@google.com"=
 target=3D"_blank">wltu@google.com</a>&quot;<br>
This should add a &quot;From&quot; field to the sent patch which &quot;git =
am&quot; should <br>
be able to match with your name.<br>
<br>
At least this worked for me. See <br>
<a href=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenE=
mbedded#Sending_using_git-send-email" rel=3D"noreferrer" target=3D"_blank">=
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sen=
ding_using_git-send-email</a><br>
<br>
Could you try to send an update? You could send it to me again through <br>
private-email first.<br>
<br>
Thanks in advance<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000713fa405ebc8966d--

