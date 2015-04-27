Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6F173D66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:50:06 +0000 (UTC)
Received: by qku63 with SMTP id 63so64363682qku.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xc93NQbaJi/5Z+JZnSdWdFhymCifgmITOdnQW+MQwfA=;
	b=gGvkRdAbVZ1KsMqNissmwbdAkaT1I2yPK6TqZ8IObgPLaSpgxqX63ToMSnZJZ0U++N
	w5v8ROMbMotQNzF15hHeuyLxu0SgUqQjGlIbwTBG+S0hVB+Gmq6e8WiphFqeuYZs2H9t
	4WWIavMGvR0j5pX1vSAOXiFFUG5YG2BS0Owy1sm5z4lWzptJ/phqrhrrQ+ptO9ywitJp
	rZpL0WmRPXooJF3QhU5IQjFConbW3h5z4XwgUX6F8ATCja0uep/KTMy+TW1BSY5Nn1fg
	UcnWeedA1q03RDsqC8wNcKxo1OHu5/tmMBjv7+lgR6iQMTsdGahx+lT8eM4Ob7bwOh5R
	AT6A==
X-Gm-Message-State: ALoCoQmPwJLUNQHnVunpX4YeFlJkmuMp+pnKXdxP7HWp4RLd9FAGT48gMHUBZM4lAWh3eQ/ZD9Mc
X-Received: by 10.229.37.200 with SMTP id y8mr8213326qcd.28.1430149808010;
	Mon, 27 Apr 2015 08:50:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 27 Apr 2015 08:49:47 -0700 (PDT)
In-Reply-To: <822e842d4cc54ffcdfaaed0782eb7165c5d435f2.1429846256.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<822e842d4cc54ffcdfaaed0782eb7165c5d435f2.1429846256.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Apr 2015 16:49:47 +0100
Message-ID: <CAJTo0LZb_Zy3Csdw_ktAquYH4ea2qN3R=JoMCc0OC0NH3Pdr0g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 27 Apr 2015 15:50:07 -0000
Content-Type: multipart/alternative; boundary=001a11c2b180484d7d0514b6b317

--001a11c2b180484d7d0514b6b317
Content-Type: text/plain; charset=UTF-8

This is a development snapshot which the mailing list shows has known
problems.  Let's wait for 2.12 or cherry-pick any required fixes.

Ross

On 24 April 2015 at 04:35, Khem Raj <raj.khem@gmail.com> wrote:

> LIC_FILES_CHKSUM change is due to shifting of
> the hunk to different line numbers, checksum remains same still
>
> Change-Id: I0ce0cc96d39c801e57394f7a839a01d11a6f3979
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../fontconfig/{fontconfig_2.11.1.bb => fontconfig_2.11.93.bb}      | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.1.bb =>
> fontconfig_2.11.93.bb} (86%)
>
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
> similarity index 86%
> rename from meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> rename to meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
> index 7c5b4b4..44cfe2b 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
> @@ -14,7 +14,7 @@ BUGTRACKER = "
> https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
>  LICENSE = "MIT-style & MIT & PD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
>
>  file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
> -
> file://src/fccache.c;beginline=1143;endline=1158;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
> +
> file://src/fccache.c;beginline=1199;endline=1214;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
>
>  SECTION = "libs"
>
> @@ -22,8 +22,8 @@ DEPENDS = "expat freetype zlib"
>
>  SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
>             "
> -SRC_URI[md5sum] = "e75e303b4f7756c2b16203a57ac87eba"
> -SRC_URI[sha256sum] =
> "b6b066c7dce3f436fdc0dfbae9d36122b38094f4f53bd8dffd45e195b0540d8d"
> +SRC_URI[md5sum] = "622f94f0f74e40775ea72d7d5f17a36d"
> +SRC_URI[sha256sum] =
> "296b5e83189589e537992d65ff01e0cd74eba9a91eb16a6890ce942e3695c526"
>
>  PACKAGES =+ "fontconfig-utils"
>  FILES_${PN} =+ "${datadir}/xml/*"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c2b180484d7d0514b6b317
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a development snapshot which the mailing list show=
s has known problems.=C2=A0 Let&#39;s wait for 2.12 or cherry-pick any requ=
ired fixes.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 24 April 2015 at 04:35, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">LIC_FI=
LES_CHKSUM change is due to shifting of<br>
the hunk to different line numbers, checksum remains same still<br>
<br>
Change-Id: I0ce0cc96d39c801e57394f7a839a01d11a6f3979<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0.../fontconfig/{<a href=3D"http://fontconfig_2.11.1.bb" target=3D"_bl=
ank">fontconfig_2.11.1.bb</a> =3D&gt; <a href=3D"http://fontconfig_2.11.93.=
bb" target=3D"_blank">fontconfig_2.11.93.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 6 ++=
+---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/fontconfig/{<a href=3D"http://fontconfig=
_2.11.1.bb" target=3D"_blank">fontconfig_2.11.1.bb</a> =3D&gt; <a href=3D"h=
ttp://fontconfig_2.11.93.bb" target=3D"_blank">fontconfig_2.11.93.bb</a>} (=
86%)<br>
<br>
diff --git a/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_=
2.11.1.bb" target=3D"_blank">fontconfig_2.11.1.bb</a> b/meta/recipes-graphi=
cs/fontconfig/<a href=3D"http://fontconfig_2.11.93.bb" target=3D"_blank">fo=
ntconfig_2.11.93.bb</a><br>
similarity index 86%<br>
rename from meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2=
.11.1.bb" target=3D"_blank">fontconfig_2.11.1.bb</a><br>
rename to meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.1=
1.93.bb" target=3D"_blank">fontconfig_2.11.93.bb</a><br>
index 7c5b4b4..44cfe2b 100644<br>
--- a/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.11.1.=
bb" target=3D"_blank">fontconfig_2.11.1.bb</a><br>
+++ b/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.11.93=
.bb" target=3D"_blank">fontconfig_2.11.93.bb</a><br>
@@ -14,7 +14,7 @@ BUGTRACKER =3D &quot;<a href=3D"https://bugs.freedesktop.=
org/enter_bug.cgi?product=3Dfontconfig" target=3D"_blank">https://bugs.free=
desktop.org/enter_bug.cgi?product=3Dfontconfig</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT-style &amp; MIT &amp; PD&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D7a0449e9bc5370402a94c=
00204beca3d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/fcfreetype.c;endline=3D45;md5=3D5d9513e3196a1fbfdfa94051c09df=
c84 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/fccache.c;beginline=3D1143;endline=3D1158;md5=3D0326cfeb4a7333dd4dd2=
5fbbc4b9f27f&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/fccache.c;beginline=3D1199;endline=3D1214;md5=3D0326cfeb4a7333dd4dd2=
5fbbc4b9f27f&quot;<br>
<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
<br>
@@ -22,8 +22,8 @@ DEPENDS =3D &quot;expat freetype zlib&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://fontconfig.org/release/fontconfig=
-${PV}.tar.gz" target=3D"_blank">http://fontconfig.org/release/fontconfig-$=
{PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;e75e303b4f7756c2b16203a57ac87eba&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b6b066c7dce3f436fdc0dfbae9d36122b38094f4f53bd=
8dffd45e195b0540d8d&quot;<br>
+SRC_URI[md5sum] =3D &quot;622f94f0f74e40775ea72d7d5f17a36d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;296b5e83189589e537992d65ff01e0cd74eba9a91eb16=
a6890ce942e3695c526&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;fontconfig-utils&quot;<br>
=C2=A0FILES_${PN} =3D+ &quot;${datadir}/xml/*&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11c2b180484d7d0514b6b317--
