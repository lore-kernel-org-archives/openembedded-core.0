Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id 221C9794D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 23:28:16 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id b19-v6so2029746qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 16:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P1h4f+ZHafG/miMhi0/PqH7X1sWCmlxyM7e3WKOMbz0=;
	b=Te5HLrnLAMPxRkvzSTIJqDY1pW7ZNhBzCwz6p7kIKXVT9sNwBugn0f/lT6q5AYGrnh
	i273ZLrEmzygvODT0dqiEurjl1nNhzyAGEj6x3hcmKTNIJi9aETmOBdEJRwhr0nAzBb1
	lYNBzo6XUGLcjf0/bDzvRqZk3KUyvjaK5oQln28yV9qoxfwXJLvGEl2t1li5vFJ6fL1+
	8tDpDHZLRNljS3Ou7hseudBR0sU/tbDCeiVe1w+NjNGbWz+JXO+3E7f1CpTAYldBXj1O
	3rm53z4mwPkmo5Ae633sMgQPI2bXWmF+hRylLROna/KGHHYA/FEco31bkAICVBxpwYcS
	mOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P1h4f+ZHafG/miMhi0/PqH7X1sWCmlxyM7e3WKOMbz0=;
	b=n1usuBnOlWanYETOXz7ZVGnJyEj4AD1ZYqqS3K4k8pbWjB7xR7SIwoI9HQRL7Sd8qA
	8Oqi4BHNJIE0TPrkCaGFLRGlUrgPnvGUzWmP4f4RZe6NcPKK7FR5eZ/RV9dy1aIBjpsi
	DqfOVTKKpApmzgf/oi9bTlSjKS02QGmJDb0Rmz8RrayZ5dJdBPJWtIBdXM7D9zabviEz
	jw7tuikn7Lgg1scF90eq4WZbNJT2h9IWYJdSPHxEgU1ZqF9XHe7/V6swzkr5frbR8wQf
	pux38iuwERXPNbkqpYThhpxN4dO0pNqz6xtnmVtEuP1tgawoWoF5AYCMAB1HYPydIGv3
	vWhg==
X-Gm-Message-State: APzg51B20poB1E6PcsznJD50jsFhWtFTCPE2qyxf9uOV8cJ9rbJtbhz1
	puJTXrrAApHQOUhySIXWGwXOWJ7Bl12XVnwiRgo=
X-Google-Smtp-Source: ANB0VdaYhvJiMn2VOwsxc32Nvr1Kt3S0dHSLqoEuY+Qzeq25oq+fp4cuqp8tB8pepuZBDzOskFWd8kXyAKQBsanjWeg=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr22382595qkm.2.1537313296865;
	Tue, 18 Sep 2018 16:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20180917212943.27237-1-abrodkin@synopsys.com>
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 16:28:06 -0700
Message-ID: <CAMKF1sp3XVL-kfgBsviS045BwraSFCUm7V1mqb382Z=it39c4w@mail.gmail.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Introduce ARC port of OpenEmbedded
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
X-List-Received-Date: Tue, 18 Sep 2018 23:28:16 -0000
Content-Type: multipart/alternative; boundary="000000000000f7de4605762da4ad"

--000000000000f7de4605762da4ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2018 at 2:29 PM Alexey Brodkin <Alexey.Brodkin@synopsys.com=
>
wrote:

> DesignWare ARC Processors are a family of 32-bit CPUs from Synopsys.
> This series introduces basic support for ARC architecture in
> OpenEmbedded.


Thanks for the contributions

>
>
> As of today latest upstream GCC and Binutils are perfectly usable
> for building packages for ARC so we just need a couple of fixes.


These fixes look primarily ok you might have to
Address the little tweaks I asked

>
>
> Glibc for ARC is under review and we're working hard to get it
> accepted in the next upstream release. For now we'll use latest
> code-base back-ported on top of 2.28 release via meta-synopsys.
>
> Its fine once it=E2=80=99s upstreamed we can then get the support into co=
re via
normal recipe updates


More platform and architecture specific bits could be found in
> meta-synopsys layer here (please refer to the "master" branch):
> https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys
>
> Alexey Brodkin (8):
>   siteinfo: Define data for ARC
>   site: Add ARC linux
>   kernel-arch.bbclass: Add ARC to kernel arch map
>   openssl: Add support for ARC
>   icu: Add ARC support
>   gcc: Disable libitm for ARC
>   binutils: Fix Glibc building for ARC
>   gcc: Fix specs generation for ARC
>
> Antoine Tenart (1):
>   nspr: Add ARC support
>
> Mylene Josserand (1):
>   libgpg-error: Add ARC support
>
>  meta/classes/kernel-arch.bbclass                   |   1 +
>  meta/classes/siteinfo.bbclass                      |   2 +
>  .../openssl/openssl10_1.0.2p.bb                    |   2 +-
>  .../openssl/openssl_1.1.1-pre9.bb                  |   2 +-
>  meta/recipes-devtools/binutils/binutils-2.31.inc   |   4 +
>  ...location-where-GOT-information-is-collect.patch | 198
> +++++++++++++++++++++
>  ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  35 ++++
>  ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  43 +++++
>  ...tion-was-still-being-generated-when-symbo.patch |  37 ++++
>  meta/recipes-devtools/gcc/gcc-8.2.inc              |   1 +
>  .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch        |  40 +++++
>  meta/recipes-devtools/gcc/gcc-runtime.inc          |   1 +
>  .../icu/icu/0002-Add-ARC-support.patch             |  25 +++
>  meta/recipes-support/icu/icu_62.1.bb               |   1 +
>  .../0001-syscfg-Add-an-arc-architecture.patch      |  75 ++++++++
>  .../libgpg-error/libgpg-error_1.32.bb              |   1 +
>  .../nspr/nspr/0004-Add-ARC-support.patch           |  86 +++++++++
>  meta/recipes-support/nspr/nspr_4.19.bb             |   1 +
>  meta/site/arc-linux                                |  11 ++
>  19 files changed, 564 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GO=
T-information-is-collect.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-=
FALSE-in-case-of-NULL-po.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-n=
ot-an-indirect-or-warnin.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-be=
ing-generated-when-symbo.patch
>  create mode 100644
> meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
>  create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.pat=
ch
>  create mode 100644
> meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Add-an-arc-arc=
hitecture.patch
>  create mode 100644
> meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
>  create mode 100644 meta/site/arc-linux
>
> --
> 1.8.3.1
>
>

--000000000000f7de4605762da4ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon,=
 Sep 17, 2018 at 2:29 PM Alexey Brodkin &lt;<a href=3D"mailto:Alexey.Brodki=
n@synopsys.com">Alexey.Brodkin@synopsys.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">DesignWare ARC Processors are a family of 32-bit CP=
Us from Synopsys.<br>
This series introduces basic support for ARC architecture in<br>
OpenEmbedded.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the contributions=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
As of today latest upstream GCC and Binutils are perfectly usable<br>
for building packages for ARC so we just need a couple of fixes.</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">These fixes look primarily =
ok you might have to</div><div dir=3D"auto">Address the little tweaks I ask=
ed=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Glibc for ARC is under review and we&#39;re working hard to get it<br>
accepted in the next upstream release. For now we&#39;ll use latest<br>
code-base back-ported on top of 2.28 release via meta-synopsys.<br>
<br>
</blockquote><div dir=3D"auto">Its fine once it=E2=80=99s upstreamed we can=
 then get the support into core via normal recipe updates</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
More platform and architecture specific bits could be found in<br>
meta-synopsys layer here (please refer to the &quot;master&quot; branch):<b=
r>
<a href=3D"https://github.com/foss-for-synopsys-dwc-arc-processors/meta-syn=
opsys" rel=3D"noreferrer" target=3D"_blank">https://github.com/foss-for-syn=
opsys-dwc-arc-processors/meta-synopsys</a><br>
<br>
Alexey Brodkin (8):<br>
=C2=A0 siteinfo: Define data for ARC<br>
=C2=A0 site: Add ARC linux<br>
=C2=A0 kernel-arch.bbclass: Add ARC to kernel arch map<br>
=C2=A0 openssl: Add support for ARC<br>
=C2=A0 icu: Add ARC support<br>
=C2=A0 gcc: Disable libitm for ARC<br>
=C2=A0 binutils: Fix Glibc building for ARC<br>
=C2=A0 gcc: Fix specs generation for ARC<br>
<br>
Antoine Tenart (1):<br>
=C2=A0 nspr: Add ARC support<br>
<br>
Mylene Josserand (1):<br>
=C2=A0 libgpg-error: Add ARC support<br>
<br>
=C2=A0meta/classes/kernel-arch.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/classes/siteinfo.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../openssl/<a href=3D"http://openssl10_1.0.2p.bb" rel=3D"noreferrer"=
 target=3D"_blank">openssl10_1.0.2p.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../openssl/<a href=3D"http://openssl_1.1.1-pre9.bb" rel=3D"noreferre=
r" target=3D"_blank">openssl_1.1.1-pre9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/binutils/binutils-2.31.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A04 +<br>
=C2=A0...location-where-GOT-information-is-collect.patch | 198 ++++++++++++=
+++++++++<br>
=C2=A0...bustness.-Return-FALSE-in-case-of-NULL-po.patch |=C2=A0 35 ++++<br=
>
=C2=A0...lobal-symbol-is-not-an-indirect-or-warnin.patch |=C2=A0 43 +++++<b=
r>
=C2=A0...tion-was-still-being-generated-when-symbo.patch |=C2=A0 37 ++++<br=
>
=C2=A0meta/recipes-devtools/gcc/gcc-8.2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 40 +++++<br>
=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../icu/icu/0002-Add-ARC-support.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 25 +++<br>
=C2=A0meta/recipes-support/icu/<a href=3D"http://icu_62.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_62.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../0001-syscfg-Add-an-arc-architecture.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 75 ++++++++<br>
=C2=A0.../libgpg-error/<a href=3D"http://libgpg-error_1.32.bb" rel=3D"noref=
errer" target=3D"_blank">libgpg-error_1.32.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../nspr/nspr/0004-Add-ARC-support.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 86 +++++++++<br>
=C2=A0meta/recipes-support/nspr/<a href=3D"http://nspr_4.19.bb" rel=3D"nore=
ferrer" target=3D"_blank">nspr_4.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/site/arc-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +=
+<br>
=C2=A019 files changed, 564 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refac=
tored-location-where-GOT-information-is-collect.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0019-Impro=
ved-robustness.-Return-FALSE-in-case-of-NULL-po.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-=
sure-global-symbol-is-not-an-indirect-or-warnin.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-i=
nformation-was-still-being-generated-when-symbo.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spe=
c-gen.patch<br>
=C2=A0create mode 100644 meta/recipes-support/icu/icu/0002-Add-ARC-support.=
patch<br>
=C2=A0create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/000=
1-syscfg-Add-an-arc-architecture.patch<br>
=C2=A0create mode 100644 meta/recipes-support/nspr/nspr/0004-Add-ARC-suppor=
t.patch<br>
=C2=A0create mode 100644 meta/site/arc-linux<br>
<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--000000000000f7de4605762da4ad--
