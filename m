Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 320627850D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 21:41:20 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id g47so16772212uad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 14:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vOco9/iUyi2ue1WlDRWRUpKWyu3xcuSty1Txd23MYoM=;
	b=dPcRTWJ0j9C96HKp0I1Uqyveh7pSi3B8JTXK6fApz0NV5kzeFEqmnPORKEP5WCF9Bu
	iFbeUVgcw/ZHSnpI/vfxpWkJrSAPiwMUIo/ajqpy1rhGpv7J3bJHvMUWC4mC2A3WVF12
	vnytDioUcPtmQkVJeftzf93qpxnpYZAc7OvyhteKyfTRLNPkmrMzvTFMlXgBR3CiAoKM
	PcXnPO7ga+xyvAwvFdLwQQVlKEE3OZCt6f9TBuF1fLncFMF5jKZUORfp9yr68ehskZYe
	XkR5RxfCye0VWo2rUkX7YpxD5aoJD/+2RIvpys0B6nBSMLWR7UDRocYNn3dLvnHtTcYY
	VPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vOco9/iUyi2ue1WlDRWRUpKWyu3xcuSty1Txd23MYoM=;
	b=CxpgR3keSpqf59hFisbIl683DG2qp9w1L72uPd5jcT35R1DOXb7g/pPf4OiNPGZ/Ql
	OetQu8cXaN9ZFV/dKfvHORMOHh6SfefIr4CmzRLKlE7jjir+5QPJ2dACY/E3HfMC0h2k
	mO7huPmszOm8P1wCKBv3fMFytq7MgwxCpyt/Id/hut9MhXLkXKwwVOU3VT6g/Oc8ODW0
	Sxbo3EpTmO3VLJHpH507Gz19nAHtF69Vrf3NTnqrr2DWeiO6jdV8BZayUxbsrqWu+hR5
	cuhp9vmnukCp1jkI2lP1RA0G6zGXxeoxvdxuTdxuWjpCFxQjwU5id24wTyl77y+3/fsm
	MHLw==
X-Gm-Message-State: AHPjjUiajUlxtlgNiY9kjXvl+42cBn09JAZ+KLxiuc6mT8ymYmjRqbFC
	ieFAsOF4qP9w4SwKUGSqCJ6sspE1Gg==
X-Google-Smtp-Source: ADKCNb5P59CRIlDCE2QCGe1PRdaRwLJ8aZSWCebmDPzZ1Y1jMQIMD3SDftHM3Nal5CIHPRqI8yk9QQM4UCmrI6zLRNI=
X-Received: by 10.176.84.70 with SMTP id o6mr9528271uaa.73.1505252481952; Tue,
	12 Sep 2017 14:41:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.9.136 with HTTP; Tue, 12 Sep 2017 14:41:21 -0700 (PDT)
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Sep 2017 17:41:21 -0400
Message-ID: <CADkTA4NmzVka45pmP8Ts4hCR2piHXemWLfvex2=Ti0dYTxCr8A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Will Newton <willn@resin.io>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 00/13] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 21:41:21 -0000
Content-Type: multipart/alternative; boundary="94eb2c1b04867bee17055904e74a"

--94eb2c1b04867bee17055904e74a
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 8:50 AM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> This improves the Go support on OE-Core.
>
> We are trying to port as much as possible work done by Matt on
> meta-golang back to OE-Core and also to avoid carrying old releases as
> there is no need to support more versions of Go toolchain.
>
> This fixes issues in existing support as well as add support for SDK
> generation which supports Go.
>

Testing against what has merged, and what are in these series is showing
that large
parts of the go applications that are used in meta-virt no longer work. Was
it the
intention of the re-work to not be compatible with existing users of the
language support ?

Just curious, since I haven't seen this flagged in this context
(compatibility), but now we
have to fixup the layers before I branch to match the release .. and that
was unexpected.

Bruce


>
> Changes in v8:
> - new patch
> - Fix patch header
>
> Changes in v7:
> - Fix Upstream-Status header typo
> - Add patch header
>
> Changes in v6:
> - new patch
> - new patch
> - new patch
> - new patch
> - new patch
> - new patch
> - new patch
> - new patch
> - new patch
> - new patch
> - new patch
> - new patch
>
> Matt Madison (12):
>   go-native: remove dependency on go-bootstrap-native
>   go-bootstrap-native: remove recipe
>   go: split out go-runtime into separate recipe
>   go.bbclass: remove GO_GCFLAGS nad GO_LDFLAGS
>   go.bbclass: remove some xxx_FINAL variables
>   go.bbclass: clean up CGO_xxx settings
>   go: rename go.inc -> go-target.inc
>   go-cross: take GOARM environment setting
>   go: enable nativesdk builds for the toolchain
>   go-crosssdk: add recipe
>   go.bbclass: enable nativesdk builds for Go packages
>   go-cross-canadian: add recipe
>
> Otavio Salvador (1):
>   go-dep: Move bash dependency to -dev package
>
>  meta/classes/go.bbclass                            |  54 +++--
>  meta/recipes-devtools/go/go-1.4.inc                |  16 --
>  ...alignment-for-the-.rel.plt-section-on-32-.patch |  33 ---
>  .../go/go-1.4/016-armhf-elf-header.patch           |  24 ---
>  ...ckport-cmd-link-support-new-386-amd64-rel.patch | 225
> ---------------------
>  meta/recipes-devtools/go/go-1.4/syslog.patch       |  62 ------
>  meta/recipes-devtools/go/go-1.8.inc                |   6 +-
>  .../go/go-1.8/make-goroot-precious.patch           |  21 ++
>  .../go/go-1.8/set-gotooldir-during-bootstrap.patch |  22 ++
>  .../recipes-devtools/go/go-bootstrap-native_1.4.bb |   3 -
>  meta/recipes-devtools/go/go-common.inc             |   2 +-
>  meta/recipes-devtools/go/go-cross-canadian.inc     |  64 ++++++
>  meta/recipes-devtools/go/go-cross-canadian_1.8.bb  |   2 +
>  meta/recipes-devtools/go/go-cross.inc              |  61 +++++-
>  meta/recipes-devtools/go/go-cross_1.8.bb           |   5 +-
>  meta/recipes-devtools/go/go-crosssdk.inc           |  55 +++++
>  meta/recipes-devtools/go/go-crosssdk_1.8.bb        |   2 +
>  meta/recipes-devtools/go/go-dep_0.3.0.bb           |   2 +-
>  meta/recipes-devtools/go/go-native.inc             |  48 +++--
>  meta/recipes-devtools/go/go-native_1.8.bb          |   1 -
>  meta/recipes-devtools/go/go-runtime.inc            |  58 ++++++
>  meta/recipes-devtools/go/go-runtime_1.8.bb         |   2 +
>  meta/recipes-devtools/go/go-target.inc             |  54 +++++
>  meta/recipes-devtools/go/go.inc                    |  81 --------
>  meta/recipes-devtools/go/go_1.8.bb                 |   2 +-
>  25 files changed, 394 insertions(+), 511 deletions(-)
>  delete mode 100644 meta/recipes-devtools/go/go-1.4.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 4/016-armhf-elf-header.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 4/go-cross-backport-cmd-link-support-new-386-amd64-rel.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.4/syslog.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.
> 8/make-goroot-precious.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.8/set-gotooldir-during-
> bootstrap.patch
>  delete mode 100644 meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
>  create mode 100644 meta/recipes-devtools/go/go-cross-canadian.inc
>  create mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.8.bb
>  create mode 100644 meta/recipes-devtools/go/go-crosssdk.inc
>  create mode 100644 meta/recipes-devtools/go/go-crosssdk_1.8.bb
>  create mode 100644 meta/recipes-devtools/go/go-runtime.inc
>  create mode 100644 meta/recipes-devtools/go/go-runtime_1.8.bb
>  create mode 100644 meta/recipes-devtools/go/go-target.inc
>  delete mode 100644 meta/recipes-devtools/go/go.inc
>
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c1b04867bee17055904e74a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Sep 12, 2017 at 8:50 AM, Otavio Salvador <span dir=3D"ltr">&lt;=
<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossyste=
ms.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This imp=
roves the Go support on OE-Core.<br>
<br>
We are trying to port as much as possible work done by Matt on<br>
meta-golang back to OE-Core and also to avoid carrying old releases as<br>
there is no need to support more versions of Go toolchain.<br>
<br>
This fixes issues in existing support as well as add support for SDK<br>
generation which supports Go.<br></blockquote><div><br></div><div>Testing a=
gainst what has merged, and what are in these series is showing that large<=
/div><div>parts of the go applications that are used in meta-virt no longer=
 work. Was it the</div><div>intention of the re-work to not be compatible w=
ith existing users of the language support ?</div><div><br></div><div>Just =
curious, since I haven&#39;t seen this flagged in this context (compatibili=
ty), but now we</div><div>have to fixup the layers before I branch to match=
 the release .. and that was unexpected.</div><div><br></div><div>Bruce</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Changes in v8:<br>
- new patch<br>
- Fix patch header<br>
<br>
Changes in v7:<br>
- Fix Upstream-Status header typo<br>
- Add patch header<br>
<br>
Changes in v6:<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
- new patch<br>
<br>
Matt Madison (12):<br>
=C2=A0 go-native: remove dependency on go-bootstrap-native<br>
=C2=A0 go-bootstrap-native: remove recipe<br>
=C2=A0 go: split out go-runtime into separate recipe<br>
=C2=A0 go.bbclass: remove GO_GCFLAGS nad GO_LDFLAGS<br>
=C2=A0 go.bbclass: remove some xxx_FINAL variables<br>
=C2=A0 go.bbclass: clean up CGO_xxx settings<br>
=C2=A0 go: rename go.inc -&gt; go-target.inc<br>
=C2=A0 go-cross: take GOARM environment setting<br>
=C2=A0 go: enable nativesdk builds for the toolchain<br>
=C2=A0 go-crosssdk: add recipe<br>
=C2=A0 go.bbclass: enable nativesdk builds for Go packages<br>
=C2=A0 go-cross-canadian: add recipe<br>
<br>
Otavio Salvador (1):<br>
=C2=A0 go-dep: Move bash dependency to -dev package<br>
<br>
=C2=A0meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 54 +++--<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>4.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 --<br>
=C2=A0...alignment-for-the-.rel.plt-<wbr>section-on-32-.patch |=C2=A0 33 --=
-<br>
=C2=A0.../go/go-1.4/016-armhf-elf-<wbr>header.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 24 ---<br>
=C2=A0...ckport-cmd-link-support-<wbr>new-386-amd64-rel.patch | 225 -------=
--------------<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>4/syslog.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 62 ------<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>8.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../go/go-1.8/make-goroot-<wbr>precious.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 21 ++<br>
=C2=A0.../go/go-1.8/set-gotooldir-<wbr>during-bootstrap.patch |=C2=A0 22 ++=
<br>
=C2=A0.../recipes-devtools/go/<a href=3D"http://go-bootstrap-native_1.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-<wbr>bootstrap-native_1.4.bb</a> |=
=C2=A0 =C2=A03 -<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>common.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>cross-canadian.inc=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 64 ++++++<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.8.bb" =
rel=3D"noreferrer" target=3D"_blank">go-<wbr>cross-canadian_1.8.bb</a>=C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>cross.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 61 +++++-<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-cross_1.8.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>cross_1.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>crosssdk.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 55 +++++<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.8.bb" rel=3D=
"noreferrer" target=3D"_blank">go-<wbr>crosssdk_1.8.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-dep_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>dep_0.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>native.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 48 +++--<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-native_1.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-<wbr>native_1.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>runtime.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 58 ++++++<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.8.bb" rel=3D"=
noreferrer" target=3D"_blank">go-<wbr>runtime_1.8.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>target.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 54 +++++<br>
=C2=A0meta/recipes-devtools/go/go.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 81 --------<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.8.bb" rel=3D"noreferr=
er" target=3D"_blank">go_1.<wbr>8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A025 files changed, 394 insertions(+), 511 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>4.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>4/0001-cmd-ld-s=
et-alignment-<wbr>for-the-.rel.plt-section-on-<wbr>32-.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>4/016-armhf-elf=
-header.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>4/go-cross-back=
port-cmd-link-<wbr>support-new-386-amd64-rel.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>4/syslog.patch<=
br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>8/make-goroot-p=
recious.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-1.<wbr>8/set-gotooldir=
-during-<wbr>bootstrap.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-boot=
strap-native_1.4.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>bootstrap=
-native_1.4.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-<wbr>cross-canadian.in=
c<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-cros=
s-canadian_1.8.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>cross-canad=
ian_1.8.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-<wbr>crosssdk.inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-cros=
ssdk_1.8.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>crosssdk_1.8.bb</=
a><br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-<wbr>runtime.inc<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-runt=
ime_1.8.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>runtime_1.8.bb</a>=
<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go-<wbr>target.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go.<wbr>inc<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.14.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c1b04867bee17055904e74a--
