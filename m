Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880C3C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 11:18:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.8784.1651231106829893174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 04:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mkGiPsJ1;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: rwmacleod@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id s137so6281978pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aOh8kpeKEBZBFw5h8Pe6aoxmw9HFWIQDWr4rlYDSnts=;
        b=mkGiPsJ1ob0CBae68KyzHu2Y6/omhvaNuFQl/p1ljlnNjnS9LaLT5ljXrtfgwhusBr
         FyG5b1MiNo7yW99GfSznfu/3GfP7tzfJpgm0DjyKTB6GxS3/S9HHEWPtWP/uSa6RS2V4
         31gVk5LF8NgJtL8jGUL7kG+rUpjtu2lfbOPgkPLP11J0hW55VPHxehs1OXpvoT/rtEmJ
         jK6sUnCAwM+VR7h6oWVO/ZJST2yuGrkna2nBJLC+w6JSWeYzwMj9Kgp1oODV0afBU5KZ
         uo2koNUN/enOpaYlN+z3H+QHgoQn3qLxWQr0Daaf8oibA+3ecz9nqgoTUc+geOdEwd2D
         tH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aOh8kpeKEBZBFw5h8Pe6aoxmw9HFWIQDWr4rlYDSnts=;
        b=Uw6fHe4QOQdb/E4TpHDB60BscQYPVPshHuNpn0wK+Eny9O62H4g7l9Ae5tMn9j1EzF
         smIrwAmnl1dsTl0dQ9nh0vNY5bkMBr3WRsftwe2MlarLqWn4th5t/UjHwME/LvBdpZGE
         NWx2yCqXvaziRlvrKPvqHEPY1BzzmukQGGZy6pPynyIhzLLlCyg6hy//Feo+yQTTU/Yi
         /k4FGr4aLvOfaaf2HB/6kSObyl0GUlyHfiCgJMsGJHFVd57JWIvGnfTGZukbNDPBhf66
         62iKNlo/0GzMfVXI1AK/BazEIFyDAH5OhGU/RIzRwczzNHk/q7NM9cU34gY0RPG7rFK2
         5Y9g==
X-Gm-Message-State: AOAM5300BzIO48sasGHD4aT0QV8j2F9jRAYLAq4KWyPmCPpQebuuZKpH
	TacL9Rab+mGtox/o3B+D8tmRK7DLh40FEdMG+QsYLSWl
X-Google-Smtp-Source: 
 ABdhPJwDdit2FdQw7XwNlVXCDAs4B3wopxYT4NdZRPO7r77Fwjthije3douDWLSqCHl63rnX0Rdu/KAQZoBm77/UWKs=
X-Received: by 2002:a05:6a00:1781:b0:50a:94f0:661d with SMTP id
 s1-20020a056a00178100b0050a94f0661dmr39209557pfg.10.1651231106288; Fri, 29
 Apr 2022 04:18:26 -0700 (PDT)
MIME-Version: 1.0
References: 
 <f4d40ea0992fe47d20c161e7f806d9489f33f2a7.camel@linuxfoundation.org>
 <1511.1650962078739542872@lists.openembedded.org>
In-Reply-To: <1511.1650962078739542872@lists.openembedded.org>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Fri, 29 Apr 2022 07:18:13 -0400
Message-ID: 
 <CAK6=ix62MHMLwkinQgLdcX=EVcLrU3oJ-OvLvEvV8vM8sTwvpQ@mail.gmail.com>
Subject: Re: [OE-core] patches.openembedded.org web page down.
To: Rahul Chauhan <rahulchauhankitps@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000884e6d05ddc933da"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 11:18:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165003

--000000000000884e6d05ddc933da
Content-Type: text/plain; charset="UTF-8"

On Tue., Apr. 26, 2022, 04:34 Rahul Chauhan, <rahulchauhankitps@gmail.com>
wrote:

> Thanks Richard for quick response.
>
> Yesterday, I sent a patch to oe-core and using below command but i am not
> able to see my patch here.
> git send-email --to=openembedded-core@lists.openembedded.org
> --confirm=always -M -1
>
> Is there any change in process to send the patch?
>

Hi Rahul,


Following up just to close the thread.

It looks like it has been merged:

https://git.openembedded.org/openembedded-core/log/?h=master&qt=grep&q=Rahul

Sometimes it takes a few days. You have to check in master-next and/or
master. If there's no merge or email response and a few days have passed,
ask on IRC or email as you have done.


Someone, maybe even me, should add a few words about this to:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded


Randy



> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164863):
> https://lists.openembedded.org/g/openembedded-core/message/164863
> Mute This Topic: https://lists.openembedded.org/mt/90702971/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000884e6d05ddc933da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue., Apr. 26, 2022, 04:34 Rahul Chauhan, &lt;<a hr=
ef=3D"mailto:rahulchauhankitps@gmail.com">rahulchauhankitps@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Thanks Richard for q=
uick response.</div>
<div>=C2=A0</div>
<div>Yesterday, I sent a patch to oe-core and using below command but i am =
not able to see my patch here.</div>
<div>git send-email --to=3D<a href=3D"mailto:openembedded-core@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.op=
enembedded.org</a> --confirm=3Dalways -M -1</div>
<div>=C2=A0</div>
<div>Is there any change in process to send the patch?</div></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Hi Rahul,</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Follo=
wing up just to close the thread.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">It looks like it has been merged:</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><a href=3D"https://git.openembedded.org/openembedded-co=
re/log/?h=3Dmaster&amp;qt=3Dgrep&amp;q=3DRahul">https://git.openembedded.or=
g/openembedded-core/log/?h=3Dmaster&amp;qt=3Dgrep&amp;q=3DRahul</a><br></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Sometimes it takes a few da=
ys. You have to check in master-next and/or master. If there&#39;s no merge=
 or email response and a few days have passed, ask on IRC or email as you h=
ave done.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Someone, maybe even me, should add a few words about this to:=
</div><div dir=3D"auto"><a href=3D"https://www.openembedded.org/wiki/How_to=
_submit_a_patch_to_OpenEmbedded">https://www.openembedded.org/wiki/How_to_s=
ubmit_a_patch_to_OpenEmbedded</a><br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Randy</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164863): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164863" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/164863</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90702971/9533=
99" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/90702971/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000884e6d05ddc933da--

