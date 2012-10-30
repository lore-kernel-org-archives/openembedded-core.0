Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TTLTF-00058R-Fk
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 00:43:45 +0100
Received: by mail-vc0-f175.google.com with SMTP id p1so955317vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 16:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=Z4zJxQsax8cBD4T+qplwsA663ypM0OIWU9JLtPS2oA4=;
	b=Opz6psiXavHPvsIxO/GtuTMVy0cVoX54HUhzAKYlu83JtKJkzyBUI8w8fOIEcR6Gfj
	PrrJZNuYQdL3VeOGlaciyxtqT7WAMOo1E85kXct3TzdfaPPw6L6ztlMZfYZeMVd/n0LO
	qNpu/u0VhkkbnBOuhD9x5qckQ4tRVT8TvmtorCfqakZNnnDKye7TOqTtZkC5EvRDRqKZ
	XC1Okx2nHlPQoM3/DlnTlBrNEDt5ltb2sks1BUjQHVDr79gkviK42oNtshG+Z/HvyRx4
	rYk4AZJkPZp84IcvjDnu+kq3omq55JkEEDMXiXqunWBxTofZytuhbhqQOdbokFcDf91R
	BqIA==
Received: by 10.58.200.39 with SMTP id jp7mr8402171vec.26.1351639809161; Tue,
	30 Oct 2012 16:30:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.59.0.10 with HTTP; Tue, 30 Oct 2012 16:29:48 -0700 (PDT)
X-Originating-IP: [5.13.215.9]
In-Reply-To: <1351596626-6603-1-git-send-email-ross.burton@intel.com>
References: <1351596626-6603-1-git-send-email-ross.burton@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 31 Oct 2012 01:29:48 +0200
Message-ID: <CAK18fxG12=LiGzfjpisrVHFHF5Z6qsq2v5bYBeARWNG7fry1Vg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkjgm8F0SfY8XE6VqAu9q0L0xLRDk0u7N6/sMS7PdM4s2O0Xev4Fdp9ZVAA+iOvJccdara4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnomebase: depend on gnome-common-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 23:43:45 -0000
Content-Type: multipart/alternative; boundary=047d7bdc06aab07ab604cd4f2ad9

--047d7bdc06aab07ab604cd4f2ad9
Content-Type: text/plain; charset=ISO-8859-1

Acked.


On Tue, Oct 30, 2012 at 1:30 PM, Ross Burton <ross.burton@intel.com> wrote:

> gnome-common is a build-only dependency so we should depend on the native
> variant.  This also resolves an (incorrect) GPLv3 license issue in
> gnome-common
> at build-time.
>
> This will also remove the pointless gnome-common-dev RRECOMMENDS in any
> -dev
> package that uses gnomebase.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/gnomebase.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/gnomebase.bbclass
> b/meta/classes/gnomebase.bbclass
> index 19c7f71..91c476c 100644
> --- a/meta/classes/gnomebase.bbclass
> +++ b/meta/classes/gnomebase.bbclass
> @@ -7,7 +7,7 @@ GNOME_COMPRESS_TYPE ?= "bz2"
>  SECTION ?= "x11/gnome"
>  SRC_URI =
> "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
>
> -DEPENDS += "gnome-common"
> +DEPENDS += "gnome-common-native"
>
>  FILES_${PN} += "${datadir}/application-registry  \
>         ${datadir}/mime-info \
> --
> 1.7.10
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--047d7bdc06aab07ab604cd4f2ad9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked.<br>
<br><br><div class=3D"gmail_quote">On Tue, Oct 30, 2012 at 1:30 PM, Ross Bu=
rton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">

gnome-common is a build-only dependency so we should depend on the native<b=
r>
variant. =A0This also resolves an (incorrect) GPLv3 license issue in gnome-=
common<br>
at build-time.<br>
<br>
This will also remove the pointless gnome-common-dev RRECOMMENDS in any -de=
v<br>
package that uses gnomebase.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=A0meta/classes/gnomebase.bbclass | =A0 =A02 +-<br>
=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclas=
s<br>
index 19c7f71..91c476c 100644<br>
--- a/meta/classes/gnomebase.bbclass<br>
+++ b/meta/classes/gnomebase.bbclass<br>
@@ -7,7 +7,7 @@ GNOME_COMPRESS_TYPE ?=3D &quot;bz2&quot;<br>
=A0SECTION ?=3D &quot;x11/gnome&quot;<br>
=A0SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${@gnome_verdir(&quot;${PV}&quo=
t;)}/${BPN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive&quot;<br>
<br>
-DEPENDS +=3D &quot;gnome-common&quot;<br>
+DEPENDS +=3D &quot;gnome-common-native&quot;<br>
<br>
=A0FILES_${PN} +=3D &quot;${datadir}/application-registry =A0\<br>
=A0 =A0 =A0 =A0 ${datadir}/mime-info \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--047d7bdc06aab07ab604cd4f2ad9--
