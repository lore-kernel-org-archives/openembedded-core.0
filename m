Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9D8C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 10:45:02 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.4097.1668163496026003675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 02:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SJmXaO6c;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id a15so4084685ljb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 02:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W3hpYxVPbec/7fdjpBaNe3L4KSyNCUjRE+iExrvCBAQ=;
        b=SJmXaO6c0ZNAbwx+9Drj6U4VXvgjOepfHpvtt0z6fHKrTGW61AzXazvR7+O6Ds3T5D
         /enlfQB6D+hgrHo3LMj/quk8LbwxAipmkVLmzfTAq5lD0VnRccpGRJ1V1ehgAZD2/p9p
         CcaFNzBs4xT8bwiGXXiOx2XfNB1c16i6D0d36YkGpSP336ygEKu0SFpvAJdnr07meK2/
         a9CG4NZzEo5JO89/qj+J3Y3SGlo1QQrfjrOGx7a7l7iLyQIsgTB9HmXBaaAN3/V4cnKN
         GCOZGf9RQsdfI35K4ihJY7NixDwBG0yU/vxw0T5LsnA4X0ZlqGq3MUSCl4A9w4fc3LRW
         jzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3hpYxVPbec/7fdjpBaNe3L4KSyNCUjRE+iExrvCBAQ=;
        b=dDbLLxTZG0wTe6PTn7A2zyR76qvLytg91mJM1GWgqHTMSRsrBYuquMiCyMZb+bka3F
         Wg+P+d1T9DkUCdo8dj3CNJG7CT6zz8osFraJBacNXcprhp6kLWIndPTTIKKpfJGsKuWj
         YiTrcAwOXrEQC4ZlLFSMg8YtBbr6WsxKPS0McYQvzmWf+VX9TqLihE0l9M7pHLA6NsEH
         /k9VLbQcsshDhbsR/jHbqjP4uVkBU3Ag5Mvc1MWBf7+08zCwB7s06xyKpa7Yo9RoAB9y
         vidktBdXuQGlPmW/2QU69vW/YeZbrk3X901YRJulvbq/0c8woHFGt73Vu/KKWw2EurwQ
         yeHw==
X-Gm-Message-State: ANoB5pkKIvXLoLOuk9tmblZcxUzHlM7cdRYYVjkSYZnNj0yKXPKTxMvc
	kPVaV2Rh/AHY7VFhns6TtGsyI/8V+cgvTmtXbdI=
X-Google-Smtp-Source: AA0mqf5XJPLzBjLUyzJhLFCSbyBWUNIEveKTGQ5LPz/vHMk3dI16RnKPr46PhT+4fFeL8P+I2pr9ptYC5PmsvlAXF9I=
X-Received: by 2002:a2e:8706:0:b0:26d:e3ae:886a with SMTP id
 m6-20020a2e8706000000b0026de3ae886amr463220lji.531.1668163493877; Fri, 11 Nov
 2022 02:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20221110204232.12768-1-jorcrous@amazon.com> <20221110204232.12768-2-jorcrous@amazon.com>
In-Reply-To: <20221110204232.12768-2-jorcrous@amazon.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 11 Nov 2022 10:44:36 +0000
Message-ID: <CANPvuRmQDJEJ9O5ozCjVVnkcm3f8n+sLtcD8xLiVaun133hTPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] spirv-tools: Correctly set the prefix in
 exported cmake packages
To: jorcrous@amazon.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007adb2105ed2f9446"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 10:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173125

--0000000000007adb2105ed2f9446
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jordan Crouse via lists.openembedded.org <jorcrous=3D
amazon.com@lists.openembedded.org> escreveu no dia quinta, 10/11/2022 =C3=
=A0(s)
20:42:

> spirv-tools exports Cmake packages.  When they are installed the
> INTERFACE_LINK_LIBRARIES variable is not correctly updated to use
> _IMPORT_PREFIX like the other variables. This may have something to do wi=
th
> the path to the sysroot being different than the source path.
>
> The existing recipe recognizes that the sysroot path made it through to t=
he
> install and tries to get rid of it, but this just ends up with dependent
> tools looking in vain for /usr/lib/librt.so.
>
> Replace the INTERFACE_LINK_LIBRARIES value in SPIRV-ToolsTarget.cmake wit=
h
> "${IMPORT_PREFIX}/lib".
>
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
>
>  meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
> b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
> index ea47796543..fdc9c9225a 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
>  SRCREV =3D "eb0a36633d2acf4de82588504f951ad0f2cecacb"
>  SRC_URI =3D "git://
> github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmaster;protocol=3Dhttps"
>  PE =3D "1"
> +PR =3D "r1"
> +
>  UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
>  S =3D "${WORKDIR}/git"
>
> @@ -25,9 +27,10 @@ EXTRA_OECMAKE +=3D "\
>  "
>
>  do_install:append:class-target() {
> -    # reproducibility: remove build host path
> +    # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that
> dependent
> +    # tools can find the right library
>      sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
> -        -e 's:${STAGING_DIR_HOST}::g'
> +        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES
> "\$\{_IMPORT_PREFIX\}/lib":'
>

As this change don't use any bitbake variable can it be done patching the
cmake source file?

Jose


>  }
>
>  # all the libraries are unversioned, so don't pack it on PN-dev
> --
> 2.37.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173108):
> https://lists.openembedded.org/g/openembedded-core/message/173108
> Mute This Topic: https://lists.openembedded.org/mt/94945230/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007adb2105ed2f9446
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jordan Crouse via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;jorcrous=3D<a href=3D=
"mailto:amazon.com@lists.openembedded.org">amazon.com@lists.openembedded.or=
g</a>&gt; escreveu no dia quinta, 10/11/2022 =C3=A0(s) 20:42:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">spirv-tools exports Cmake pac=
kages.=C2=A0 When they are installed the<br>
INTERFACE_LINK_LIBRARIES variable is not correctly updated to use<br>
_IMPORT_PREFIX like the other variables. This may have something to do with=
<br>
the path to the sysroot being different than the source path.<br>
<br>
The existing recipe recognizes that the sysroot path made it through to the=
<br>
install and tries to get rid of it, but this just ends up with dependent<br=
>
tools looking in vain for /usr/lib/librt.so.<br>
<br>
Replace the INTERFACE_LINK_LIBRARIES value in SPIRV-ToolsTarget.cmake with<=
br>
&quot;${IMPORT_PREFIX}/lib&quot;.<br>
<br>
Signed-off-by: Jordan Crouse &lt;<a href=3D"mailto:jorcrous@amazon.com" tar=
get=3D"_blank">jorcrous@amazon.com</a>&gt;<br>
---<br>
<br>
=C2=A0meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.231.1.bb=
" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.231.1.bb</a> | 7 +++=
++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.2=
31.1.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.231.1.bb</a> =
b/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.231.1.bb" re=
l=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.231.1.bb</a><br>
index ea47796543..fdc9c9225a 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.231.1.bb=
" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.231.1.bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.231.1.bb=
" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.231.1.bb</a><br>
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef963=
87f14655fc854ddc3c6bd57&quot;<br>
=C2=A0SRCREV =3D &quot;eb0a36633d2acf4de82588504f951ad0f2cecacb&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/SPI=
RV-Tools.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmaster;protocol=
=3Dhttps</a>&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
+PR =3D &quot;r1&quot;<br>
+<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;sdk-(?P&lt;pver&gt;\d+(\.\d+)+)&=
quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
@@ -25,9 +27,10 @@ EXTRA_OECMAKE +=3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0do_install:append:class-target() {<br>
-=C2=A0 =C2=A0 # reproducibility: remove build host path<br>
+=C2=A0 =C2=A0 # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so=
 that dependent<br>
+=C2=A0 =C2=A0 # tools can find the right library<br>
=C2=A0 =C2=A0 =C2=A0sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarge=
t.cmake \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:${STAGING_DIR_HOST}::g&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s:INTERFACE_LINK_LIBRARIES.*$:INTERFAC=
E_LINK_LIBRARIES &quot;\$\{_IMPORT_PREFIX\}/lib&quot;:&#39;<br></blockquote=
><div><br>As this change don&#39;t use any bitbake variable can it be done =
patching the cmake source file?<br><br>Jose<br>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0# all the libraries are unversioned, so don&#39;t pack it on PN-dev<b=
r>
-- <br>
2.37.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173108): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173108" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173108</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94945230/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94945230/5052612</a><br>
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
 Quaresma</div></div></div></div>

--0000000000007adb2105ed2f9446--

