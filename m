Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634CAC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 08:31:09 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web12.9066.1642667468697179258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 00:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DsWbnfQU;
 spf=pass (domain: gmail.com, ip: 209.85.221.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id 19so3138390vkl.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 00:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UIccGov5NriKCTT9UrkyX1rdUK/KnowXBVldDTwg9qc=;
        b=DsWbnfQUcmPOxiBHl1awf9jP4Y9s90NBdpW39qVyLU1m9nQcGPK/Ez1pa/NzQGDH4p
         C2QCud7FQh5jt8dHu2v+smIh8webSeCq8cw11s2Hil+Ro1va8fI+VYox3qYSz9V/dic/
         VOp2tI6Mqu1aAkbuWwJV1AE1N2C2YWM3PDqvnGgy15vN/AZg8tWGzflxxAtLVC8AwxGB
         FzctOwqhWu5Vh63sFRl/SelxpHP2FkdekFeHGJbto/KTyPxc8JJK7h4Q9/U6bYR/xzln
         FJhXEhBx14qqrD3nyTmRKF2uaNP2hEHzoTmb61E96b2pp+OdZ8QSpEoLtlfjuUNz90Ip
         3/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UIccGov5NriKCTT9UrkyX1rdUK/KnowXBVldDTwg9qc=;
        b=hydmqqEGtccjPGWjULeBRe0wgu2lF31iSyST6dbkRrIZa1Dw+toXfMcwwQ3tGtmgax
         Vl8aP8GU6PQqoFCokZjY1qoh3Qcd+AGot6RGhxpW3BHmu7xajcVyVX1+o+2BD6lByR8d
         4aFLou9DCRgCx8hsrCBzy53O17OvzOOODtNgQEW35Nm0tp1yfvTfAOfq4mw7LHLsjD00
         B8/AE2DNGiL67zzMeUvH6p17avRPzJEFpBD0lvUenwCu7WPknvBIt30ALlmuPIxW5ODJ
         DPu6eoUXtqsWqw3GVPHWsMW2VBN3WHq4MVVWipv9PCtPHc3mTHnihAtVbi/jiutAkskF
         8Ppg==
X-Gm-Message-State: AOAM53098zllOyq1+fUMKhT7eBTahIsVB69XVPGHugz4CMooPCF4ttwy
	0IHzOIEkxBcWtyspDsKWgrB4kxxarqfEb6YdVU0=
X-Google-Smtp-Source: 
 ABdhPJyJ73nQNp90z4L14CbTS1kRatBknc2O3VdQzj+18ZH3R/AuTWOFHXQeBBRiHlAJlfmgLTwV77RgC0V71mXweRo=
X-Received: by 2002:a1f:30c1:: with SMTP id
 w184mr14029851vkw.20.1642667467747;
 Thu, 20 Jan 2022 00:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20220120033045.1098738-1-bkylerussell@gmail.com>
In-Reply-To: <20220120033045.1098738-1-bkylerussell@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 09:30:56 +0100
Message-ID: 
 <CANNYZj9TtSZmzNJ8Jjsoa86WUEzKcBgMMEn2=OBrwyYj+dmxQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] security_flags.inc: don't default to PIE if
 image-prelink is enabled
To: bkylerussell@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6352f05d5ff5217"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 08:31:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160753

--000000000000e6352f05d5ff5217
Content-Type: text/plain; charset="UTF-8"

I think we pretty much abandoned prelink at this point, are you using it
and do you see the benefits?

Alex

On Thu, 20 Jan 2022 at 04:30, <bkylerussell@gmail.com> wrote:

> Since a prelinked rootfs is in conflict with PIE, don't attempt the latter
> if the image enables prelink.
> ---
>  meta/conf/distro/include/security_flags.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc
> b/meta/conf/distro/include/security_flags.inc
> index e469eadca1..be6feb9e5f 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -5,7 +5,7 @@
>  # From a Yocto Project perspective, this file is included and tested
>  # in the DISTRO="poky" configuration.
>
> -GCCPIE ?= "--enable-default-pie"
> +GCCPIE ?= "${@bb.utils.contains('USER_CLASSES', 'image-prelink',
> '--disable-default-pie', '--enable-default-pie', d)}"
>  # If static PIE is known to work well, GLIBCPIE="--enable-static-pie" can
> be set
>
>  # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as
> they use
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160749):
> https://lists.openembedded.org/g/openembedded-core/message/160749
> Mute This Topic: https://lists.openembedded.org/mt/88551948/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e6352f05d5ff5217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think we pretty much abandoned prelink at this poin=
t, are you using it and do you see the benefits?</div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, 20 Jan 2022 at 04:30, &lt;<a href=3D"mailto:bkylerusse=
ll@gmail.com">bkylerussell@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Since a prelinked rootfs is in conflict=
 with PIE, don&#39;t attempt the latter<br>
if the image enables prelink.<br>
---<br>
=C2=A0meta/conf/distro/include/security_flags.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro=
/include/security_flags.inc<br>
index e469eadca1..be6feb9e5f 100644<br>
--- a/meta/conf/distro/include/security_flags.inc<br>
+++ b/meta/conf/distro/include/security_flags.inc<br>
@@ -5,7 +5,7 @@<br>
=C2=A0# From a Yocto Project perspective, this file is included and tested<=
br>
=C2=A0# in the DISTRO=3D&quot;poky&quot; configuration.<br>
<br>
-GCCPIE ?=3D &quot;--enable-default-pie&quot;<br>
+GCCPIE ?=3D &quot;${@bb.utils.contains(&#39;USER_CLASSES&#39;, &#39;image-=
prelink&#39;, &#39;--disable-default-pie&#39;, &#39;--enable-default-pie&#3=
9;, d)}&quot;<br>
=C2=A0# If static PIE is known to work well, GLIBCPIE=3D&quot;--enable-stat=
ic-pie&quot; can be set<br>
<br>
=C2=A0# _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds =
as they use<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160749): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160749" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160749</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88551948/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88551948/1686489</a><br>
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

--000000000000e6352f05d5ff5217--

