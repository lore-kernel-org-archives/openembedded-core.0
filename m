Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RVTbu-00024V-DX
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 20:44:58 +0100
Received: by bkbzs2 with SMTP id zs2so9801183bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 11:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ofbed7N3yXCt7JNvhsc7ZGa7DPJOMo+cnK6ryZrMKWM=;
	b=dnaeCuvlDitKw5VADI7RIEox6zEU6Ds2VWC1Vx4HbLA6ZhAZ/XJ40M1jB6Kw2erWhi
	hE3aeQ5d0ueWV7pr/FlO912xKlxpKtxXg523fTMMIMn4LDMofjGXB/kofjzioMv76MiB
	aJgNxNUV6HtFddW/u3STSsOmpE5LdtecCWBBs=
MIME-Version: 1.0
Received: by 10.205.83.73 with SMTP id af9mr51974580bkc.24.1322595492924; Tue,
	29 Nov 2011 11:38:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Tue, 29 Nov 2011 11:38:12 -0800 (PST)
In-Reply-To: <31da063f85416b31c137b5026029c0660e7e3b7a.1322594902.git.nitin.a.kamble@intel.com>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
	<31da063f85416b31c137b5026029c0660e7e3b7a.1322594902.git.nitin.a.kamble@intel.com>
Date: Tue, 29 Nov 2011 17:38:12 -0200
X-Google-Sender-Auth: 2xRyp1b8tVUEDRsf3ryssUCCqjY
Message-ID: <CAP9ODKpiRUg_vKmcuE9rewV4wUpK23MSLj6V3QCe1y_r5pqH0A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] libx11-trip_1.4.4: fix the source tarall checksums
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 19:44:58 -0000
Content-Type: multipart/alternative; boundary=bcaec554016a898e8004b2e4c20f

--bcaec554016a898e8004b2e4c20f
Content-Type: text/plain; charset=ISO-8859-1

Typo on commit log. It is libx11-trim not trip ;)

On Tue, Nov 29, 2011 at 17:30, <nitin.a.kamble@intel.com> wrote:

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bbb/meta/recipes-graphics/xorg-lib/
> libx11-trim_1.4.4.bb
> index 7aed308..c94a3a8 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
> @@ -13,8 +13,7 @@ SRC_URI += "file://x11_disable_makekeys.patch \
>             file://keysymdef_include.patch \
>             file://makekeys_crosscompile.patch"
>
> -
> -SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
> -SRC_URI[sha256sum] =
> "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
> +SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
> +SRC_URI[sha256sum] =
> "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
>
>  EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/ --disable-xcms "
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--bcaec554016a898e8004b2e4c20f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Typo on commit log. It is libx11-trim not trip ;)<br><br><div class=3D"gmai=
l_quote">On Tue, Nov 29, 2011 at 17:30,  <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:nitin.a.kamble@intel.com">nitin.a.kamble@intel.com</a>&gt;</span> wro=
te:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">From: Nitin A Kamble &lt;<a href=3D"mailto:=
nitin.a.kamble@intel.com">nitin.a.kamble@intel.com</a>&gt;<br>
<br>
Signed-off-by: Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.co=
m">nitin.a.kamble@intel.com</a>&gt;<br>
---<br>
=A0.../recipes-graphics/xorg-lib/<a href=3D"http://libx11-trim_1.4.4.bb" ta=
rget=3D"_blank">libx11-trim_1.4.4.bb</a> | =A0 =A05 ++---<br>
=A01 files changed, 2 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11-trim_1=
.4.4.bb" target=3D"_blank">libx11-trim_1.4.4.bb</a> b/meta/recipes-graphics=
/xorg-lib/<a href=3D"http://libx11-trim_1.4.4.bb" target=3D"_blank">libx11-=
trim_1.4.4.bb</a><br>

index 7aed308..c94a3a8 100644<br>
--- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11-trim_1.4.4.bb=
" target=3D"_blank">libx11-trim_1.4.4.bb</a><br>
+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11-trim_1.4.4.bb=
" target=3D"_blank">libx11-trim_1.4.4.bb</a><br>
@@ -13,8 +13,7 @@ SRC_URI +=3D &quot;file://x11_disable_makekeys.patch \<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 file://keysymdef_include.patch \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 file://makekeys_crosscompile.patch&quot;<br>
<br>
-<br>
-SRC_URI[md5sum] =3D &quot;f65c9c7ecbfb64c19dbd7927160d63fd&quot;<br>
-SRC_URI[sha256sum] =3D &quot;88d7238ce5f7cd123450567de7a3b56a43556e4ccc45d=
f38b8324147c889a844&quot;<br>
+SRC_URI[md5sum] =3D &quot;ed7c382cbf8c13425b6a66bcac0ca5d9&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad=
834599f5c654e6c840d&quot;<br>
<br>
=A0EXTRA_OECONF +=3D &quot;--with-keysymdef=3D${STAGING_INCDIR}/X11/ --disa=
ble-xcms &quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.6.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--bcaec554016a898e8004b2e4c20f--
