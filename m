Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E20ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:38:38 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.20148.1666622311873389966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=kH4cyOlU;
 spf=pass (domain: google.com, ip: 209.85.222.181, mailfrom: wltu@google.com)
Received: by mail-qk1-f181.google.com with SMTP id b25so6161593qkk.7
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uSZ9Yr/oP771c6w/w1vJewi9UAkilX8SBNRJ4HnONTI=;
        b=kH4cyOlU8GUrJYxhsIkxkEcYGwPITXoLaj2idwdQtE65YMZgI0V9/ui7KYDRfAe2kf
         X9UFyGq+7ag92og1K0DBRmWJKE9cYvMSielu3ezWulzobJGlygcd1hsHtuBjrIFwaEf1
         nlrIRddK8T8F9L7ZeG5MFhcokLFcuaPTDWq22UsYULXpnRJxAWqqkb2FBwk0SVBXVTL2
         z/ojoN1hq2bYjzUxV7UinUHctrI9aTvBddaFhasrViCfJryMikbiNQSpEAWyHA0FqHiG
         ie3h+zkjh9aksvf5HGR0mu8yg7JSnxAE5GewESIg1j1y+9qljPgs131ickhUWPIXrPAi
         8+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSZ9Yr/oP771c6w/w1vJewi9UAkilX8SBNRJ4HnONTI=;
        b=JJzMQT9ytlsomPqbnDqzhxeAF9QCE6FtYdTzosl1HPhvJeaPBi3wzDlWHREMcYrQ/u
         VRLgJGyUFuxSSS22Zccw10RJ3vzkflThhVBoLTER/BkYW3NmfcZiULtRZS9WyGAG9w0Y
         6lytYwZazpHoZQ5ITUqtlrheniYejWa1ePVZjqIFGHNrgKXhNXjz7Bu8jLZa7UxOAFtK
         nMZhZQqM+d26e2klyzw9PpBzmfJ+MHi/86klupjxQQLIZZYDoGu0ZRqIU0Rg0pBr6Xlm
         ed6vmjJsVMjT1i2DLAGatPd8dgcR2unlXob32PuPuG1nLy/5F+M8aKYVbVKQHoYv9VHN
         dL+Q==
X-Gm-Message-State: ACrzQf3+WP8taV4Ny9+4KK99CYTIxQzptVlkQ9LpqklH2cTRJ8ege2rx
	wGu/zWk+sJYfFVhZD6cK4zMkkLgkFIEnZ6woX4w1lA==
X-Google-Smtp-Source: AMsMyM5Kv/MzqOseJJCu4edm6DvBPSLCioGYoGzNlAI400UqXIjVKzms7n4KAnXftx+A9mhRlCLE88R9qXmM2/1sTGs=
X-Received: by 2002:a37:583:0:b0:6f1:7aa:c505 with SMTP id 125-20020a370583000000b006f107aac505mr9976300qkf.221.1666622310648;
 Mon, 24 Oct 2022 07:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <f39014e0-6847-fcd0-f6d7-142cb3658a58@bootlin.com> <1721078C03B5AEB6.808@lists.openembedded.org>
In-Reply-To: <1721078C03B5AEB6.808@lists.openembedded.org>
From: Willy Tu <wltu@google.com>
Date: Mon, 24 Oct 2022 07:38:19 -0700
Message-ID: <CAHwn2X=O7pRJrvOHPT8h4iaeJjcujuse+MVgoi8ZzRYB1eaiXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: wltu@google.com, Tristan Lelong <tlelong@google.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cd70ff05ebc8be89"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172099

--000000000000cd70ff05ebc8be89
Content-Type: text/plain; charset="UTF-8"

Adding +Tristan Lelong <tlelong@google.com> for visibility and comment on
any concern.

On Mon, Oct 24, 2022 at 7:27 AM Willy Tu via lists.openembedded.org <wltu=
google.com@lists.openembedded.org> wrote:

> Hi Michael,
>
> Thanks for the response. Sorry for the delay. I must have missed the email
> when I was setting up the filters. I have sent the patch directly to you
> privately to see if that works.
>
> As for
> ```
> git config --global sendemail.from "wltu@google.com"
> ```
> ,
>
> I think I already have to setup properly
> ```
> $ git config --global sendemail.from
> Willy Tu <wltu@google.com>
> ```
>
> I believe the issue is because I created the topic directly with
> https://lists.openembedded.org/g/openembedded-core/post. Instead with git
> email and it filtered out the email from there for some reason. I should
> probably just send the email through git instead. I did with the web UI
> because I wasn't able to get my message show up before. Sorry for the
> confusion. I'll try with git send-email next time.
>
> Best,
>
> Willy Tu
>
>
> On Fri, Oct 21, 2022 at 9:24 AM Michael Opdenacker <
> michael.opdenacker@bootlin.com> wrote:
>
>> Hi Willy
>>
>> Thanks for the patch!
>>
>> On 10/21/22 15:17, Willy Tu via lists.openembedded.org wrote:
>> > Install API only if opensshinternals is in DISTRO_FEATURES.
>> > Install the OpenSSH header + lib files for other repo to build using it.
>> > For example, https://github.com/google/hiba is dependent on those files
>> > to build and this change is needed to meet that requirement.
>> > https://github.com/openembedded/meta-openembedded/pull/597
>> > Signed-off-by: Willy Tu <wltu@google.com>
>> > ---
>> >  meta/recipes-connectivity/openssh/openssh_9.0p1.bb | 11 +++++++++++
>> >  1 file changed, 11 insertions(+)
>>
>>
>> There's a problem with the way you send your patches though. I used to
>> have it too.
>>
>> If I apply your patch through "git am", the author of the commit will be:
>> Willy Tu via lists.openembedded.org <wltu=
>> google.com@lists.openembedded.org>
>> instead of
>> Willy Tu <wltu@google.com>
>>
>> Because of this issue, the maintainer has to manually fix this field
>> when accepting your patch. Worse, if he doesn't catch this, that's
>> harder to fix afterwards.
>>
>> You should be able to fix this by running:
>>
>> git config --global sendemail.from "wltu@google.com"
>> This should add a "From" field to the sent patch which "git am" should
>> be able to match with your name.
>>
>> At least this worked for me. See
>>
>> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email
>>
>> Could you try to send an update? You could send it to me again through
>> private-email first.
>>
>> Thanks in advance
>> Michael.
>>
>> --
>> Michael Opdenacker, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172098):
> https://lists.openembedded.org/g/openembedded-core/message/172098
> Mute This Topic: https://lists.openembedded.org/mt/94475279/6858837
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> wltu@google.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cd70ff05ebc8be89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Adding=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyCh=
ip-1" href=3D"mailto:tlelong@google.com" tabindex=3D"-1">+Tristan Lelong</a=
>=C2=A0for visibility and comment on any concern.=C2=A0<br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 24, =
2022 at 7:27 AM Willy Tu via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;wltu=3D<a href=3D"mailto:google.com@lists.openem=
bedded.org">google.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi=C2=A0Micha=
el,<div><br></div><div>Thanks for the response. Sorry for the delay. I must=
 have missed the email when I was setting up the filters. I have sent the p=
atch directly to you privately to see if that works.</div><div><br></div><d=
iv>As for</div><div>```</div><div>git config --global sendemail.from &quot;=
<a href=3D"mailto:wltu@google.com" target=3D"_blank">wltu@google.com</a>&qu=
ot;</div><div>```</div><div>,</div><div><br></div><div>I think I already ha=
ve to setup=C2=A0properly</div><div>```</div><div>$ git config --global sen=
demail.from <br>Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_=
blank">wltu@google.com</a>&gt;<br></div><div>```</div><div><br></div><div>I=
 believe the issue is because=C2=A0I created the topic directly with=C2=A0<=
a href=3D"https://lists.openembedded.org/g/openembedded-core/post" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/post</a>. In=
stead with git email and it filtered out the email from there for some=C2=
=A0reason. I should probably just send the email through git instead. I did=
 with the web UI because=C2=A0I wasn&#39;t able to get my message show up b=
efore. Sorry for the confusion. I&#39;ll try with git send-email next time.=
</div><div><br></div><div>Best,</div><div><br></div><div>Willy Tu</div><div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Oct 21, 2022 at 9:24 AM Michael Opdenacker &lt;<a href=
=3D"mailto:michael.opdenacker@bootlin.com" target=3D"_blank">michael.opdena=
cker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Willy<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172098): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172098" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172098</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94475279/6858=
837" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94475279/6858837</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:wltu@google.com" target=3D=
"_blank">wltu@google.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cd70ff05ebc8be89--

