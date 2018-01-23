Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E7EAC78735
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:45:14 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id f34so1137352ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ETiao2cxT4Yr5Re1rxg0zuKCxx6maNgkHD+9ChW9teY=;
	b=frlTei0rAsCIz5CnHzACzy8kcpg50icKdgCP/cVQ4eSrc9wGJiqznOIqXmCeFEokIU
	foUZQAYNfEC7Kh7NyaWe2xrjfsfo0XYuzxfZtbUdPApVNPmZzk3KeA1g6y1MzDetuJVv
	idnl7KMwuxBgxZIKz3qB6rh/nb0G4jCRuP1F+4hTusv0jfwMhGiLFcqY4dx65DdvqNF3
	dgzu2w+xabOULNFcevq3MBfYqARSOj9RF54nBiJAQweh2X5Oi/SCcrDCOvIQ9sl24w0d
	3GrTKdXx/0kNiN8ioj6EzI5dWloouG8HB8xB78h9sWR9AB1UszDG62ZAqKAsRbaI5GU6
	0pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ETiao2cxT4Yr5Re1rxg0zuKCxx6maNgkHD+9ChW9teY=;
	b=aBOwvP1t0LBuRtgIDbhTuAhNI7jrheCNeCANUjR7oXdJnMaJDkgsXw/wgu1Ff0AjOq
	9d5sX/AJqWpm4KqaoKyVcJSvDy/FzfTp2BxE/yg+iTQJi5J03NJnippbQZCDeN6INkzz
	LCRHBKuD4blQdlC05Scfa6NQpZDPBcuxtSPaU6lZ0EW4AKOaaNQtiMKBHOPmrmbIkMop
	05tWwRoMv9zyqHxB1bjpsySJhXJkHNAIathO4KXD8ewl+EKeZ34tWTLjy5HSe38OPu/9
	EjX4rYnP1PLPZjR94M1p+DxH9mrytpGTobnE0w/CQmt9oklE/+VSYewP9wuWM7GRFcFV
	lSOg==
X-Gm-Message-State: AKwxytdll0mnzOfhtevrLcfIWmHmgLILCy93+aWsxLKfLmOb4l6V6qGi
	w463KIyfqSBvH/eBShe79hsL6K/3KBZ+Obf4mnfn2g==
X-Google-Smtp-Source: AH8x225yt6W9a9pvCTLj6xBL7Fs//d/qofy40fh0iT83C6d0S1li0v/eUzGsUvYA4MZgmMpGb9xosqjq5Nb9cY1G8eU=
X-Received: by 10.107.133.75 with SMTP id h72mr3756571iod.227.1516718716027;
	Tue, 23 Jan 2018 06:45:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Tue, 23 Jan 2018 06:44:55 -0800 (PST)
In-Reply-To: <1516716352-32735-3-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
	<1516716352-32735-3-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jan 2018 14:44:55 +0000
Message-ID: <CAJTo0Lb145RP1phZNzOYTbXpufyOwPmnDLDT7u_drSU3fvoUrQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] libsoup-2.4: upgrade to version 2.61.2
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
X-List-Received-Date: Tue, 23 Jan 2018 14:45:15 -0000
Content-Type: multipart/alternative; boundary="001a113ec5e44b139d05637298c3"

--001a113ec5e44b139d05637298c3
Content-Type: text/plain; charset="UTF-8"

Nope, this inherit upstream-version-is-even so this is a development
snapshot.

Ross

On 23 January 2018 at 14:05, Maxin B. John <maxin.john@intel.com> wrote:

> 2.60.2 -> 2.61.2
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../libsoup/{libsoup-2.4_2.60.2.bb => libsoup-2.4_2.61.2.bb}          |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/libsoup/{libsoup-2.4_2.60.2.bb =>
> libsoup-2.4_2.61.2.bb} (89%)
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
> b/meta/recipes-support/libsoup/libsoup-2.4_2.61.2.bb
> similarity index 89%
> rename from meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
> rename to meta/recipes-support/libsoup/libsoup-2.4_2.61.2.bb
> index abc7bdb..9414278 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.61.2.bb
> @@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[
> 0]}.${@d.getVar('PV').split('.')[1]}"
>
>  SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "9c49831b62c4bf18cdb81c86ac6516fd"
> -SRC_URI[sha256sum] = "7263cfe18872e2e652c196f5667e51
> 4616d9c97c861dfca82a65a55f45f0da01"
> +SRC_URI[md5sum] = "cf70001a73925a0f12b5b34b91c68923"
> +SRC_URI[sha256sum] = "fe786a9d0a59454bd59f5d3198b9ae
> a5f6518adda36561e7d31461bf7f791785"
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

--001a113ec5e44b139d05637298c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nope, this inherit upstream-version-is-even so this is a d=
evelopment snapshot.<div><br></div><div>Ross</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On 23 January 2018 at 14:05, Maxin B=
. John <span dir=3D"ltr">&lt;<a href=3D"mailto:maxin.john@intel.com" target=
=3D"_blank">maxin.john@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">2.60.2 -&gt; 2.61.2<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0.../libsoup/{<a href=3D"http://libsoup-2.4_2.60.2.bb" rel=3D"noreferr=
er" target=3D"_blank">libsoup-2.4_2.60.<wbr>2.bb</a> =3D&gt; <a href=3D"htt=
p://libsoup-2.4_2.61.2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4=
_2.61.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/libsoup/{<a href=3D"http://libsoup-2.4_2.=
60.2.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>libsoup-2.4_2.60.2.bb</a=
> =3D&gt; <a href=3D"http://libsoup-2.4_2.61.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libsoup-2.4_2.61.2.bb</a>} (89%)<br>
<br>
diff --git a/meta/recipes-support/<wbr>libsoup/<a href=3D"http://libsoup-2.=
4_2.60.2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.60.2.bb</a>=
 b/meta/recipes-support/<wbr>libsoup/<a href=3D"http://libsoup-2.4_2.61.2.b=
b" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.61.2.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.60=
.2.bb" rel=3D"noreferrer" target=3D"_blank">l<wbr>ibsoup-2.4_2.60.2.bb</a><=
br>
rename to meta/recipes-support/libsoup/<a href=3D"http://libsoup-2.4_2.61.2=
.bb" rel=3D"noreferrer" target=3D"_blank">l<wbr>ibsoup-2.4_2.61.2.bb</a><br=
>
index abc7bdb..9414278 100644<br>
--- a/meta/recipes-support/<wbr>libsoup/<a href=3D"http://libsoup-2.4_2.60.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.60.2.bb</a><br>
+++ b/meta/recipes-support/<wbr>libsoup/<a href=3D"http://libsoup-2.4_2.61.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libsoup-2.4_2.61.2.bb</a><br>
@@ -11,8 +11,8 @@ SHRT_VER =3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;.=
&#39;)[<wbr>0]}.${@d.getVar(&#39;PV&#39;).split(&#39;.<wbr>&#39;)[1]}&quot;=
<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${<wbr>SHRT_VER}/libsoup-${=
PV}.tar.<wbr>xz&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>9c49831b62c4bf18cdb81c86ac6516<wbr>fd&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>7263cfe18872e2e652c196f5667e51<wbr>4616d=
9c97c861dfca82a65a55f45f0<wbr>da01&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>cf70001a73925a0f12b5b34b91c689<wbr>23&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>fe786a9d0a59454bd59f5d3198b9ae<wbr>a5f65=
18adda36561e7d31461bf7f79<wbr>1785&quot;<br>
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

--001a113ec5e44b139d05637298c3--
