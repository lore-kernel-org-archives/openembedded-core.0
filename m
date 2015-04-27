Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id D6AD873D53
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:53:36 +0000 (UTC)
Received: by pdea3 with SMTP id a3so132700692pde.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PofcdQx880ug8lNir7VFjhZsixLp2HNSkn2PevWskbU=;
	b=lLfgYoZ6qqZom3DavypymOxOVWIcojmzXHV8iZpXdlvTvIdAbc3ysCT+wIigXBNKDG
	OUKWedPp3f1A6HM/++jrUbgwceVBP1ZDLtOlh7i7A2tKBowenLK6ToiZzbvAdxQPXSDj
	v7dBmNoxODMy+bl6wwDCK1LJOmxul7dcsCYYbKou1iFrZRSATjkUAu+/BZ7J6s5jaB4i
	nidHri4fVSOZ16Psuxj+2hVXsaHvgxgIxvjb2nM3MvbRtfnc6FnTObNxtNazsN3KELC+
	1PDgj54nG14rOjfLIV8XoXokN3GBc3l1DtJ95Oc03JNIOj/jKmVaIAAND31Bvz5DGI0C
	PfxA==
X-Received: by 10.68.205.226 with SMTP id lj2mr23129568pbc.52.1430150017504;
	Mon, 27 Apr 2015 08:53:37 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:b1a4:3fdf:dcf8:7b1c?
	([2601:9:3580:84c:b1a4:3fdf:dcf8:7b1c])
	by mx.google.com with ESMTPSA id
	fp3sm19833293pdb.52.2015.04.27.08.53.36
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 08:53:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZb_Zy3Csdw_ktAquYH4ea2qN3R=JoMCc0OC0NH3Pdr0g@mail.gmail.com>
Date: Mon, 27 Apr 2015 08:53:35 -0700
Message-Id: <FB113603-844C-440A-80EF-A086036F07CB@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<822e842d4cc54ffcdfaaed0782eb7165c5d435f2.1429846256.git.raj.khem@gmail.com>
	<CAJTo0LZb_Zy3Csdw_ktAquYH4ea2qN3R=JoMCc0OC0NH3Pdr0g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/14] fontconfig: Upgrade to 2.11.93
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2015 15:53:42 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_23055380-DFDA-4C99-9F5E-71FC8E601368"

--Apple-Mail=_23055380-DFDA-4C99-9F5E-71FC8E601368
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 27, 2015, at 8:49 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> This is a development snapshot which the mailing list shows has known =
problems.  Let's wait for 2.12 or cherry-pick any required fixes.


fair enough. I will have to dig into what needs to be back ported.
>=20
> Ross
>=20
> On 24 April 2015 at 04:35, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> LIC_FILES_CHKSUM change is due to shifting of
> the hunk to different line numbers, checksum remains same still
>=20
> Change-Id: I0ce0cc96d39c801e57394f7a839a01d11a6f3979
> Signed-off-by: Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>>
> ---
>  .../fontconfig/{fontconfig_2.11.1.bb <http://fontconfig_2.11.1.bb/> =
=3D> fontconfig_2.11.93.bb <http://fontconfig_2.11.93.bb/>}      | 6 =
+++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.1.bb =
<http://fontconfig_2.11.1.bb/> =3D> fontconfig_2.11.93.bb =
<http://fontconfig_2.11.93.bb/>} (86%)
>=20
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb =
<http://fontconfig_2.11.1.bb/> =
b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb =
<http://fontconfig_2.11.93.bb/>
> similarity index 86%
> rename from meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb =
<http://fontconfig_2.11.1.bb/>
> rename to meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb =
<http://fontconfig_2.11.93.bb/>
> index 7c5b4b4..44cfe2b 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb =
<http://fontconfig_2.11.1.bb/>
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb =
<http://fontconfig_2.11.93.bb/>
> @@ -14,7 +14,7 @@ BUGTRACKER =3D =
"https://bugs.freedesktop.org/enter_bug.cgi?product=3Dfontconfig =
<https://bugs.freedesktop.org/enter_bug.cgi?product=3Dfontconfig>"
>  LICENSE =3D "MIT-style & MIT & PD"
>  LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D7a0449e9bc5370402a94c00204beca3d \
>                      =
file://src/fcfreetype.c;endline=3D45;md5=3D5d9513e3196a1fbfdfa94051c09dfc8=
4 \
> -                    =
file://src/fccache.c;beginline=3D1143;endline=3D1158;md5=3D0326cfeb4a7333d=
d4dd25fbbc4b9f27f"
> +                    =
file://src/fccache.c;beginline=3D1199;endline=3D1214;md5=3D0326cfeb4a7333d=
d4dd25fbbc4b9f27f"
>=20
>  SECTION =3D "libs"
>=20
> @@ -22,8 +22,8 @@ DEPENDS =3D "expat freetype zlib"
>=20
>  SRC_URI =3D "http://fontconfig.org/release/fontconfig-${PV}.tar.gz =
<http://fontconfig.org/release/fontconfig-${PV}.tar.gz> \
>             "
> -SRC_URI[md5sum] =3D "e75e303b4f7756c2b16203a57ac87eba"
> -SRC_URI[sha256sum] =3D =
"b6b066c7dce3f436fdc0dfbae9d36122b38094f4f53bd8dffd45e195b0540d8d"
> +SRC_URI[md5sum] =3D "622f94f0f74e40775ea72d7d5f17a36d"
> +SRC_URI[sha256sum] =3D =
"296b5e83189589e537992d65ff01e0cd74eba9a91eb16a6890ce942e3695c526"
>=20
>  PACKAGES =3D+ "fontconfig-utils"
>  FILES_${PN} =3D+ "${datadir}/xml/*"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20


--Apple-Mail=_23055380-DFDA-4C99-9F5E-71FC8E601368
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Apr 27, 2015, at 8:49 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">This is a development snapshot which the mailing list shows =
has known problems.&nbsp; Let's wait for 2.12 or cherry-pick any =
required fixes.</div></div></blockquote><div><br class=3D""></div><div><br=
 class=3D""></div>fair enough. I will have to dig into what needs to be =
back ported.<br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D""><br =
class=3D""></div><div class=3D"">Ross</div></div><div =
class=3D"gmail_extra"><br class=3D""><div class=3D"gmail_quote">On 24 =
April 2015 at 04:35, Khem Raj <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">LIC_FILES_CHKSUM =
change is due to shifting of<br class=3D"">
the hunk to different line numbers, checksum remains same still<br =
class=3D"">
<br class=3D"">
Change-Id: I0ce0cc96d39c801e57394f7a839a01d11a6f3979<br class=3D"">
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">
---<br class=3D"">
&nbsp;.../fontconfig/{<a href=3D"http://fontconfig_2.11.1.bb/" =
target=3D"_blank" class=3D"">fontconfig_2.11.1.bb</a> =3D&gt; <a =
href=3D"http://fontconfig_2.11.93.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.93.bb</a>}&nbsp; &nbsp; &nbsp; | 6 +++---<br =
class=3D"">
&nbsp;1 file changed, 3 insertions(+), 3 deletions(-)<br class=3D"">
&nbsp;rename meta/recipes-graphics/fontconfig/{<a =
href=3D"http://fontconfig_2.11.1.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.1.bb</a> =3D&gt; <a =
href=3D"http://fontconfig_2.11.93.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.93.bb</a>} (86%)<br class=3D"">
<br class=3D"">
diff --git a/meta/recipes-graphics/fontconfig/<a =
href=3D"http://fontconfig_2.11.1.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.1.bb</a> =
b/meta/recipes-graphics/fontconfig/<a =
href=3D"http://fontconfig_2.11.93.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.93.bb</a><br class=3D"">
similarity index 86%<br class=3D"">
rename from meta/recipes-graphics/fontconfig/<a =
href=3D"http://fontconfig_2.11.1.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.1.bb</a><br class=3D"">
rename to meta/recipes-graphics/fontconfig/<a =
href=3D"http://fontconfig_2.11.93.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.93.bb</a><br class=3D"">
index 7c5b4b4..44cfe2b 100644<br class=3D"">
--- a/meta/recipes-graphics/fontconfig/<a =
href=3D"http://fontconfig_2.11.1.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.1.bb</a><br class=3D"">
+++ b/meta/recipes-graphics/fontconfig/<a =
href=3D"http://fontconfig_2.11.93.bb/" target=3D"_blank" =
class=3D"">fontconfig_2.11.93.bb</a><br class=3D"">
@@ -14,7 +14,7 @@ BUGTRACKER =3D "<a =
href=3D"https://bugs.freedesktop.org/enter_bug.cgi?product=3Dfontconfig" =
target=3D"_blank" =
class=3D"">https://bugs.freedesktop.org/enter_bug.cgi?product=3Dfontconfig=
</a>"<br class=3D"">
&nbsp;LICENSE =3D "MIT-style &amp; MIT &amp; PD"<br class=3D"">
&nbsp;LIC_FILES_CHKSUM =3D "<a =
href=3D"file:///COPYING;md5=3D7a0449e9bc5370402a94c00204beca3d" =
class=3D"">file://COPYING;md5=3D7a0449e9bc5370402a94c00204beca3d</a> =
\<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;<a =
href=3D"file://src/fcfreetype.c;endline=3D45;md5=3D5d9513e3196a1fbfdfa9405=
1c09dfc84" =
class=3D"">file://src/fcfreetype.c;endline=3D45;md5=3D5d9513e3196a1fbfdfa9=
4051c09dfc84</a> \<br class=3D"">
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
<a =
href=3D"file://src/fccache.c;beginline=3D1143;endline=3D1158;md5=3D0326cfe=
b4a7333dd4dd25fbbc4b9f27f" =
class=3D"">file://src/fccache.c;beginline=3D1143;endline=3D1158;md5=3D0326=
cfeb4a7333dd4dd25fbbc4b9f27f</a>"<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
<a =
href=3D"file://src/fccache.c;beginline=3D1199;endline=3D1214;md5=3D0326cfe=
b4a7333dd4dd25fbbc4b9f27f" =
class=3D"">file://src/fccache.c;beginline=3D1199;endline=3D1214;md5=3D0326=
cfeb4a7333dd4dd25fbbc4b9f27f</a>"<br class=3D"">
<br class=3D"">
&nbsp;SECTION =3D "libs"<br class=3D"">
<br class=3D"">
@@ -22,8 +22,8 @@ DEPENDS =3D "expat freetype zlib"<br class=3D"">
<br class=3D"">
&nbsp;SRC_URI =3D "<a =
href=3D"http://fontconfig.org/release/fontconfig-${PV}.tar.gz" =
target=3D"_blank" =
class=3D"">http://fontconfig.org/release/fontconfig-${PV}.tar.gz</a> =
\<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br class=3D"">
-SRC_URI[md5sum] =3D "e75e303b4f7756c2b16203a57ac87eba"<br class=3D"">
-SRC_URI[sha256sum] =3D =
"b6b066c7dce3f436fdc0dfbae9d36122b38094f4f53bd8dffd45e195b0540d8d"<br =
class=3D"">
+SRC_URI[md5sum] =3D "622f94f0f74e40775ea72d7d5f17a36d"<br class=3D"">
+SRC_URI[sha256sum] =3D =
"296b5e83189589e537992d65ff01e0cd74eba9a91eb16a6890ce942e3695c526"<br =
class=3D"">
<br class=3D"">
&nbsp;PACKAGES =3D+ "fontconfig-utils"<br class=3D"">
&nbsp;FILES_${PN} =3D+ "${datadir}/xml/*"<br class=3D"">
<span class=3D"HOEnZb"><font color=3D"#888888" class=3D"">--<br =
class=3D"">
2.1.4<br class=3D"">
<br class=3D"">
--<br class=3D"">
_______________________________________________<br class=3D"">
Openembedded-core mailing list<br class=3D"">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br class=3D"">
<a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
target=3D"_blank" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a><br class=3D"">
</font></span></blockquote></div><br class=3D""></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_23055380-DFDA-4C99-9F5E-71FC8E601368--
