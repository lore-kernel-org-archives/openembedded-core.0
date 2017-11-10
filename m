Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB467785BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:26:52 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 72so1455746itl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4cVlU5ejdp3GWFQLm4PDsZcwB39sU971CawukwmL044=;
	b=aeOBVqvBarm+u+q3nB1XlFoTWxvzZIesNgEhM5mTuFbddJPoqAZyWS872wu9uLloQh
	bYI5iSVHSoEJvIJ4lLPBgJ4zbdxHeQlNjLGM6kWxiOC+sTSd8niEexBwBuPc1AfUPY/8
	cmloEwiG70ntL35Gqiw2mHDsxDWzLs84Ut/5cUJ3KUCBl4V3TM/DxQ+X8ERucXobqOv8
	ENgvcA094FVBRDYy9b9LsNWhtgdeDwSrwrMpVqAW/2Ol0sBXXgg/iVCQdIDVcEfHdyqT
	EyK6OzL9ZFC17iJMZpBL+6AGPUmeBQ/hAnGguberRCKR0U0nkMhl7atkd8tc5L2+m0wJ
	5OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4cVlU5ejdp3GWFQLm4PDsZcwB39sU971CawukwmL044=;
	b=SSW+eWmmpX6nuzUWXOvDhGU/CD9BktgrEoQeIuEitg55KGbb0dJXFFqILd3fe0EOsH
	QluVKLki6Nd4HBDNH1+eX2VTSSAd7/XcA37gf6m9uR4betJvwFvNpPCLz/ovnvOdysvC
	zYdIyFm2bxzGem6IwijL57t8vizR0nj14KnXKkDD5ePFgsQTSkfs5btcoNEOY0FWcd/S
	LkFooNXFiSy+c01BuCpV52OBYrTzEuTaagOcibYvhA0og4tlqQ3xulJ+5tFloRxCo6+P
	16a0H95C7U99txB8TzbENvY74mcPDeM2F9hinZP1jfzQWcoVI/unx9sqDLs+43DsKfuz
	Mitg==
X-Gm-Message-State: AJaThX4OCBlnruwNUYREkcjyQZcxeIbAYoOH4N4dFlAvXBvK0A3giGch
	xmWvgSro9zHygtO5zwbQXyTK1EDrsy/4XMxtYctVHg==
X-Google-Smtp-Source: AGs4zMZPUL9eYjA19aAP6N5waX5iobbExmp7aCnWOAWFEWaDnKMUomPyu4P04lq2jLaqbknWJl8sgzMnYksFra6lRDk=
X-Received: by 10.36.125.76 with SMTP id b73mr227869itc.10.1510316813861; Fri,
	10 Nov 2017 04:26:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 10 Nov 2017 04:26:33 -0800 (PST)
In-Reply-To: <1510315228-24186-8-git-send-email-maxin.john@intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
	<1510315228-24186-8-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Nov 2017 12:26:33 +0000
Message-ID: <CAJTo0LYrkDO0d8udyN3t_YN-rLFJe34m4tv6q=YCZao_ms2fVA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] libsoup-2.4: upgrade to 2.60.2
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
X-List-Received-Date: Fri, 10 Nov 2017 12:26:52 -0000
Content-Type: multipart/alternative; boundary="001a11444174305ced055da009fe"

--001a11444174305ced055da009fe
Content-Type: text/plain; charset="UTF-8"

Alex's 2.60.1 upgrade was just merged, so can you rebase please.

Ross

On 10 November 2017 at 12:00, Maxin B. John <maxin.john@intel.com> wrote:

> 2.58.2 -> 2.60.2
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../libsoup/{libsoup-2.4_2.58.2.bb => libsoup-2.4_2.60.2.bb}          |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/libsoup/{libsoup-2.4_2.58.2.bb =>
> libsoup-2.4_2.60.2.bb} (89%)
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb
> b/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
> similarity index 89%
> rename from meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb
> rename to meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
> index c9f95e5..abc7bdb 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
> @@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[
> 0]}.${@d.getVar('PV').split('.')[1]}"
>
>  SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "eb33adb459c2283efc5c7d09ccdbbcfc"
> -SRC_URI[sha256sum] = "442300ca1b1bf8a3bbf2f788203287
> ff862542d4fc048f19a92a068a27d17b72"
> +SRC_URI[md5sum] = "9c49831b62c4bf18cdb81c86ac6516fd"
> +SRC_URI[sha256sum] = "7263cfe18872e2e652c196f5667e51
> 4616d9c97c861dfca82a65a55f45f0da01"
>
>  S = "${WORKDIR}/libsoup-${PV}"
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11444174305ced055da009fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alex&#39;s 2.60.1 upgrade was just merged, so can you reba=
se please.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 10 November 2017 at 12:00, Maxin B. John <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=3D"_blan=
k">maxin.john@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">2.58.2 -&gt; 2.60.2<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0.../libsoup/{<a href=3D"http://libsoup-2.4_2.58.2.bb" rel=3D"noreferr=
er" target=3D"_blank">libsoup-2.4_2.58.<wbr>2.bb</a> =3D&gt; <a href=3D"htt=
p://libsoup-2.4_2.60.2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4=
_2.60.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/libsoup/{<a href=3D"http://libsoup-2.4_2.=
58.2.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>libsoup-2.4_2.58.2.bb</a=
> =3D&gt; <a href=3D"http://libsoup-2.4_2.60.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libsoup-2.4_2.60.2.bb</a>} (89%)<br>
<br>
diff --git a/meta/recipes-support/<wbr>libsoup/<a href=3D"http://libsoup-2.=
4_2.58.2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.58.2.bb</a>=
 b/meta/recipes-support/<wbr>libsoup/<a href=3D"http://libsoup-2.4_2.60.2.b=
b" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.60.2.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.58=
.2.bb" rel=3D"noreferrer" target=3D"_blank">l<wbr>ibsoup-2.4_2.58.2.bb</a><=
br>
rename to meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.60.2=
.bb" rel=3D"noreferrer" target=3D"_blank">l<wbr>ibsoup-2.4_2.60.2.bb</a><br=
>
index c9f95e5..abc7bdb 100644<br>
--- a/meta/recipes-support/<wbr>libsoup/<a href=3D"http://libsoup-2.4_2.58.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.58.2.bb</a><br>
+++ b/meta/recipes-support/<wbr>libsoup/<a href=3D"http://libsoup-2.4_2.60.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.60.2.bb</a><br>
@@ -11,8 +11,8 @@ SHRT_VER =3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;.=
&#39;)[<wbr>0]}.${@d.getVar(&#39;PV&#39;).split(&#39;.<wbr>&#39;)[1]}&quot;=
<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${<wbr>SHRT_VER}/libsoup-${=
PV}.tar.<wbr>xz&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>eb33adb459c2283efc5c7d09ccdbbc<wbr>fc&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>442300ca1b1bf8a3bbf2f788203287<wbr>ff862=
542d4fc048f19a92a068a27d1<wbr>7b72&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>9c49831b62c4bf18cdb81c86ac6516<wbr>fd&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>7263cfe18872e2e652c196f5667e51<wbr>4616d=
9c97c861dfca82a65a55f45f0<wbr>da01&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/libsoup-${PV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.4.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11444174305ced055da009fe--
