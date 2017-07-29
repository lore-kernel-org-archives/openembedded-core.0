Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7B57178430
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 18:28:41 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v127so110605912itd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 11:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UkScowOHVM4mMrOCVc6b1EmRiMd72rDTO7Z4ED11oIQ=;
	b=DsKy3UizBmKFQgFjKjXQyVOyHrbJIAJtxU2jCBu9FcDOx5XnrWKqJOSUuqJjriYgmf
	18SMfsxTLU3NbcJDoqnsVkZxdA5JvV2gaATfdLMqK+LGT2J/QsX9V1pa4Cv651hQ9DJG
	Pq1rVguDNaykkRiyEwyVXBbZuHAS9lzNImhIRSuDl+stVhFORoJqbEc9K8DIKN4Vum4D
	Av3CFuUiDs+bP46RXrqIoZXPWzgrABacGMqbQRdnr1nv/+XwyzVcpv44CdEJ+LGgyRcX
	RGolPSBVXRBBd35PujrgzoWbql4EjctIFkajF6G7x13CemLPnd5dDU5HrGCRkfk6oiif
	QfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UkScowOHVM4mMrOCVc6b1EmRiMd72rDTO7Z4ED11oIQ=;
	b=VnxX0/H2DyINXdhU/cOwTOcZkB5AMthz6DCvT0NyHtxNTLUKAS+bSFtbzVCP8HxDgF
	vo8YuLo6W8XpZ7vrPmf/H0S/259KzLdo6zVafW8B68xB+i2vEEayRYR/60anXCdEHWxz
	whZvGBD4FcTAibG9OEbXVkLWQ3dBFkCp8UWyaiVRwa/p00tPYFvG71NhZ5lIm/tjaef+
	8X8VXeYDjRp06yLTqXdWTUFT1hjWtVY6EYQ10YoO6+s+LI3FMmzGqpElG+D99A4PubEj
	Kn2fJUUHA9HqvHYHDDXoNfXCuHPn3I90XL1bl77BHx/W88aEFzrhINkJEnyKnmxXTb+P
	C+RQ==
X-Gm-Message-State: AIVw111Zf3Lt5bVswvxMyXyTbQbHrEHsmRaVmGdbB/UrQtoxgBh/8fAU
	kqSf3pm7axxXNgvyTq9PT9nndIjdkf7EXh0=
X-Received: by 10.36.218.3 with SMTP id z3mr12754840itg.116.1501352922605;
	Sat, 29 Jul 2017 11:28:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Sat, 29 Jul 2017 11:28:22 -0700 (PDT)
In-Reply-To: <20170728180734.1920-1-otavio@ossystems.com.br>
References: <20170728180734.1920-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 29 Jul 2017 19:28:22 +0100
Message-ID: <CAJTo0LbhyV1g4w4PG_hxMEioTTJdthaDvmgQhU-r2V-w3RHLeA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: Add 0.2.0 release
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
X-List-Received-Date: Sat, 29 Jul 2017 18:28:41 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b0ad6a28443055578f78f"

--94eb2c0b0ad6a28443055578f78f
Content-Type: text/plain; charset="UTF-8"

Failed in the no-x11 builder at least so far:

ERROR: go-dep-0.2.0-r0 do_package: QA Issue: go-dep: Files/directories were
installed but not shipped in any package:
  /usr/lib/x86_64-poky-linux/go/bin/dep
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/537

Ross

On 28 July 2017 at 19:07, Otavio Salvador <otavio@ossystems.com.br> wrote:

> This is the Golang dependency management tool under development; it is
> ready for production use and intended to be merged onto Golang
> 1.10. Until that, projects are starting to use it and making it
> available on OE-Core reduces the Golang integration work for new
> recipes.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta/recipes-devtools/go/go-dep_0.2.0.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-dep_0.2.0.bb
>
> diff --git a/meta/recipes-devtools/go/go-dep_0.2.0.bb
> b/meta/recipes-devtools/go/go-dep_0.2.0.bb
> new file mode 100644
> index 0000000000..2b116c9af2
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-dep_0.2.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Dependency management tool for Golang"
> +HOMEPAGE = "https://github.com/golang/dep"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=
> 1bad315647751fab0007812f70d42c0d"
> +
> +GO_IMPORT = "github.com/golang/dep"
> +SRC_URI = "git://${GO_IMPORT};destsuffix=${BPN}-${PV}/src/${
> GO_IMPORT};nobranch=1"
> +
> +# Points to 0.2.0 tag
> +SRCREV = "6a17782ed25ba4ccd2adf191990cc32e65c3934c"
> +
> +inherit go
> +
> +GO_INSTALL = "${GO_IMPORT}/cmd/dep"
> +
> +INSANE_SKIP_${PN} += "ldflags"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0b0ad6a28443055578f78f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Failed in the no-x11 builder at least so far:<br><br>ERROR=
: go-dep-0.2.0-r0 do_package: QA Issue: go-dep: Files/directories were inst=
alled but not shipped in any package:<br>=C2=A0 /usr/lib/x86_64-poky-linux/=
go/bin/dep<br>Please set FILES such that these items are packaged. Alternat=
ively if they are unneeded, avoid installing them or delete them within do_=
install.<br><br><a href=3D"https://autobuilder.yoctoproject.org/main/builde=
rs/nightly-no-x11/builds/537">https://autobuilder.yoctoproject.org/main/bui=
lders/nightly-no-x11/builds/537</a><div><br>Ross<br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 July 2017 at 19:07, O=
tavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com=
.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">This is the Golang dependency management tool u=
nder development; it is<br>
ready for production use and intended to be merged onto Golang<br>
1.10. Until that, projects are starting to use it and making it<br>
available on OE-Core reduces the Golang integration work for new<br>
recipes.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-dep_0.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>dep_0.2.0.bb</a> | 18 +++++++++++++++++=
+<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-dep_=
0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>dep_0.2.0.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-dep_0.2.0.bb" re=
l=3D"noreferrer" target=3D"_blank">go-<wbr>dep_0.2.0.bb</a> b/meta/recipes-=
devtools/go/<a href=3D"http://go-dep_0.2.0.bb" rel=3D"noreferrer" target=3D=
"_blank">go-<wbr>dep_0.2.0.bb</a><br>
new file mode 100644<br>
index 0000000000..2b116c9af2<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-dep_0.2.0.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>dep_0.2.0.bb</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Dependency management tool for Golang&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/golang/dep" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/golang/dep</a><wbr>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/${GO_IMPORT}/<wbr>LICENSE;md5=3D<wbr=
>1bad315647751fab0007812f70d42c<wbr>0d&quot;<br>
+<br>
+GO_IMPORT =3D &quot;<a href=3D"http://github.com/golang/dep" rel=3D"norefe=
rrer" target=3D"_blank">github.com/golang/dep</a>&quot;<br>
+SRC_URI =3D &quot;git://${GO_IMPORT};<wbr>destsuffix=3D${BPN}-${PV}/src/${=
<wbr>GO_IMPORT};nobranch=3D1&quot;<br>
+<br>
+# Points to 0.2.0 tag<br>
+SRCREV =3D &quot;<wbr>6a17782ed25ba4ccd2adf191990cc3<wbr>2e65c3934c&quot;<=
br>
+<br>
+inherit go<br>
+<br>
+GO_INSTALL =3D &quot;${GO_IMPORT}/cmd/dep&quot;<br>
+<br>
+INSANE_SKIP_${PN} +=3D &quot;ldflags&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.3<br>
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

--94eb2c0b0ad6a28443055578f78f--
