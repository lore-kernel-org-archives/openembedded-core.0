Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1D6C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 09:32:14 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.4189.1667381527794702346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 02:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UEMhjPIe;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id u2so24392470ljl.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pWbL4tc8pWzBjfGGSVF+0PP/aWT1/wSOLi5FwxqDzGw=;
        b=UEMhjPIeF0FWIo4NBcy32rjMnhpYTY5Pg7LasgJs+J+acpHsqNbb5zmkthM1aXzVdg
         +QNUo6bwWaBkHoELpgCiRerON/zlYRJfYeY5t9GIi40xdeuPn1Uu5yRyfqjc6R4AJWf7
         Kfs7ofp0/uIAz8a+oQAgV35wd6LaagZx67tBlffXHkFAqddK4wA0HSPxOg8morEGf9SB
         LZXDCeDAeZcx1t6A1iNrl2rIPSTja8ysNT8XYs33mXH54aHWlWA75gjSqJvBGoP08H7Y
         e6wJEh0qg/m+kWlcDCBolnSyYZyqV4iFlPPahQKstju09eMAm8jOYFeuud4VZ34nGbQN
         zHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWbL4tc8pWzBjfGGSVF+0PP/aWT1/wSOLi5FwxqDzGw=;
        b=i+XQQCgg5OfM2XMDCGH6hjDNKNzuAUQ/nwcpIPIEi04DEfysW4j8Cc2UMrX7qPyIZT
         R/3cGCv3wCHl6tTqq/fGhfxfSDqw01QhNam4nGlIGjqL0OXOXcBTBMgBQmyCPKs/sOQ6
         JGE5xGT0tghG/kfMkz0gKPR9KqMrPliWoLYUSB+PFBvjByJetLOHFQVk44IQwJG9+gAm
         T1J/EM3EZFaUniI9HkHgiPl6Aix+Vc9eEY7Ik/nGD3KA76TOpH6mKQM9SPG5qWyYI9mw
         /FHgAeBKgWXiCx4ZCXa5SkBAGLUO3oqiWScUB9J70RceWV5Px/7xN+r7ikppCnXsCynw
         4cMg==
X-Gm-Message-State: ACrzQf2Zm32OX3HbNJLZ9fuBZBoGjZ7guY1Ga9hnDjumN9EEebw8ivAT
	dXlcLYo2dzevOzPnm13XBOSyeMk3wuZ7b1HEuFs=
X-Google-Smtp-Source: AMsMyM5H93AmlVlGVMofzXoa6EnPVrkTdW4vLqhLudbHKLVAp3dkwY0Murdm/Fj8aa9s8/ZVWXB8NPzJq98EESC6Ghs=
X-Received: by 2002:a2e:8e28:0:b0:277:11fe:f9b5 with SMTP id
 r8-20020a2e8e28000000b0027711fef9b5mr8442148ljk.463.1667381525983; Wed, 02
 Nov 2022 02:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666150638.git.bruce.ashfield@gmail.com> <00d1b34b5d92325ea31564c0f7f4a5876f2e2edc.1666150638.git.bruce.ashfield@gmail.com>
In-Reply-To: <00d1b34b5d92325ea31564c0f7f4a5876f2e2edc.1666150638.git.bruce.ashfield@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 2 Nov 2022 09:31:10 +0000
Message-ID: <CANPvuRntp+PviLVBbyr72XnSMczB176WXYOROmDV2kV=WMeb0w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] kern-tools: fix relative path processing
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008fb7cc05ec7983e3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 09:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172580

--0000000000008fb7cc05ec7983e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Can this patch be backported to kirkstone?

Jose

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quarta,
19/10/2022 =C3=A0(s) 04:39:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The previous fix for processing of paths with relative components, broke
> uses cases that were a mix of patches and configuration fragments.
>
> Updating the SRCREV to include a simplied fix for relative paths, and
> a cleanup patch from Jose:
>
> [
>   Author: Jose Quaresma <quaresma.jose@gmail.com>
>   Date:   Thu Sep 29 16:37:23 2022 +0000
>
>       scc: only look for error in scc_output_file if it has valid content
>
>       When process_file function fails the output of the processed script
> is show to
>       the user, some parsing is performed as well to look for common
> errors so we
>       can point to the right input file.
>
>       This can only be done when the scc_output_file have some valid
> content
>       otherwise it will show invalid messages to the user.
>
>       Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
>   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
>   Date:   Wed Oct 5 19:13:33 2022 +0000
>
>       spp: ensure that prefix check uses absolute paths
>
>       The previous fix for this issue was too broad, and impacted
>       all calls to the prefix check and removal. With this change,
>       we only expand the input on scc/spp operations that may
>       execute with relative paths.
>
>       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index dea7b65a7c..07d7daf5fb 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
>
>  DEPENDS =3D "git-native"
>
> -SRCREV =3D "ba600ef61a85966596126a6e8d936971905e8749"
> +SRCREV =3D "6a4752ebbe7d242c02b3c74a5772926edd243626"
>  PV =3D "0.3+git${SRCPV}"
>
>  inherit native
> --
> 2.19.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171951):
> https://lists.openembedded.org/g/openembedded-core/message/171951
> Mute This Topic: https://lists.openembedded.org/mt/94424337/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008fb7cc05ec7983e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>Can this patch be backported=
=C2=A0to kirkstone?<br><br>Jose</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia q=
uarta, 19/10/2022 =C3=A0(s) 04:39:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
The previous fix for processing of paths with relative components, broke<br=
>
uses cases that were a mix of patches and configuration fragments.<br>
<br>
Updating the SRCREV to include a simplied fix for relative paths, and<br>
a cleanup patch from Jose:<br>
<br>
[<br>
=C2=A0 Author: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Thu Sep 29 16:37:23 2022 +0000<br>
<br>
=C2=A0 =C2=A0 =C2=A0 scc: only look for error in scc_output_file if it has =
valid content<br>
<br>
=C2=A0 =C2=A0 =C2=A0 When process_file function fails the output of the pro=
cessed script is show to<br>
=C2=A0 =C2=A0 =C2=A0 the user, some parsing is performed as well to look fo=
r common errors so we<br>
=C2=A0 =C2=A0 =C2=A0 can point to the right input file.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 This can only be done when the scc_output_file have so=
me valid content<br>
=C2=A0 =C2=A0 =C2=A0 otherwise it will show invalid messages to the user.<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jos=
e.quaresma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<=
br>
<br>
=C2=A0 Author: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Wed Oct 5 19:13:33 2022 +0000<br>
<br>
=C2=A0 =C2=A0 =C2=A0 spp: ensure that prefix check uses absolute paths<br>
<br>
=C2=A0 =C2=A0 =C2=A0 The previous fix for this issue was too broad, and imp=
acted<br>
=C2=A0 =C2=A0 =C2=A0 all calls to the prefix check and removal. With this c=
hange,<br>
=C2=A0 =C2=A0 =C2=A0 we only expand the input on scc/spp operations that ma=
y<br>
=C2=A0 =C2=A0 =C2=A0 execute with relative paths.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<=
br>
]<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a> | 2=
 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-na=
tive_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb<=
/a> b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
index dea7b65a7c..07d7daf5fb 100644<br>
--- a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
+++ b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
<br>
=C2=A0DEPENDS =3D &quot;git-native&quot;<br>
<br>
-SRCREV =3D &quot;ba600ef61a85966596126a6e8d936971905e8749&quot;<br>
+SRCREV =3D &quot;6a4752ebbe7d242c02b3c74a5772926edd243626&quot;<br>
=C2=A0PV =3D &quot;0.3+git${SRCPV}&quot;<br>
<br>
=C2=A0inherit native<br>
-- <br>
2.19.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171951): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171951" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171951</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94424337/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94424337/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--0000000000008fb7cc05ec7983e3--

