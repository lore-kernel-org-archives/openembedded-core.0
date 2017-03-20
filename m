Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id F01A872F18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 08:33:01 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id o4so85193838ywd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nnNVTdLZ2raFhHQCXqmjcMQM1TPLkfJtoK4ESExOQbI=;
	b=KoHOv/aSlcOwDWHuJayc8qlnKSK9orIrteboqzmDqRJ/3qj0WS1Wn+QiakT32TWPv/
	CaENRKIFBTYCM9LSbU/oFy+2Izd29aqkJEE/lDKbv0pl9jlG4arIFsl9knKijldqXriM
	5q3VcjgDlBSKhoTKoitmjlfcP6eyvIbmJO88AAMUcmQRl9GyqckHzsJo1MX2M63KWqGd
	el0iw9A6uqaNAsUJfFPMKlF5czXrRwDNHJwcFgts7xz/pZ+/GgvoJUVBTVQnZ/CS5teh
	Vs6tq1psoUDdmaGAN2XDEp4eXJPm52JXNTRZRX7iVnAE3K6vN+fiyZEXmtcz8rLSvxWA
	RMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nnNVTdLZ2raFhHQCXqmjcMQM1TPLkfJtoK4ESExOQbI=;
	b=SELDXBzCWvFjmMEyAkweogO1nrYYMVCb/aKkdiDjJKa8JFh/wr35mYlCEm4VzGb/a/
	MMfbPK3shqI8ygtPEnFr1LD7skLQVG0/ejy21pWVxdlmBSnt2DCAjo0O8DrOvHkul+SE
	jbMRvNJf9nmUgGDn8yXKwflWaCEb8f6MlPcovaIau5PlMUKZW7VLbVAcpQH6wrxK7Jn5
	Iuyn32kNsAbfCzt0MeJ+BhQSOAggse2jv/SBkD0NJfGJ7SEMqsnBRdamSzeHDkutRbGR
	pLDoi1NrMESI/9IY2wrAXC9jHylKylBjBXskZThzMIh0VgSFv76oc1o/J0LraxD495Iw
	MojA==
X-Gm-Message-State: AFeK/H308uV/RBCwzt/P+zqXvRzYRH2iCu8KXwUhi3CvBrEV/Y/FZEkvvfyp11dK9nr4Y9Rd6jdH+MT4pgHp00m/
X-Received: by 10.37.35.205 with SMTP id j196mr12444763ybj.3.1489998782544;
	Mon, 20 Mar 2017 01:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Mon, 20 Mar 2017 01:32:32 -0700 (PDT)
In-Reply-To: <2a1cd614717f323afc788e24fae76337cffa8816.1489534345.git.raj.khem@gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
	<2a1cd614717f323afc788e24fae76337cffa8816.1489534345.git.raj.khem@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 20 Mar 2017 10:32:32 +0200
Message-ID: <CAHiDW_EvTOKpqOACTS6M9Y2_wofaEQ6sL89ThNHem4cPrxLFmQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] musl: Update to latest
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
X-List-Received-Date: Mon, 20 Mar 2017 08:33:02 -0000
Content-Type: multipart/alternative; boundary=001a113d4508269697054b256056

--001a113d4508269697054b256056
Content-Type: text/plain; charset=UTF-8

On 15 March 2017 at 01:35, Khem Raj <raj.khem@gmail.com> wrote:

> Rich Felker (11):
>       fix ld-behavior-dependent crash in ppc64 ldso startup
>       rework ldso handling of global symbol table for consistency
>       reorder addend handling before symbol lookup in relocation code
>       emulate lazy relocation as deferrable relocation
>       fix free of uninitialized buffer pointer on error in regexec
>       in static dl_iterate_phdr, fix use of possibly-uninitialized aux data
>       fix possible fd leak, unrestored cancellation state on dns socket
> fail
>       fix wide scanf's use of a compound literal past its lifetime
>       fix one-byte overflow in legacy getpass function
>       avoid loading of multiple libc versions via explicit pathname
>       remove unused refcnt field for shared libraries
>
> Szabolcs Nagy (1):
>       treat STB_WEAK and STB_GNU_UNIQUE like STB_GLOBAL in find_sym
>


Could the relocation changes here be responsible for these ovmf build
failures:
  "GenFw: ERROR 3000: Invalid ... unsupported ELF EM_386 relocation"
?

https://autobuilder.yocto.io/builders/nightly-musl/builds/196/steps/BuildImages/logs/stdio


Jussi

--001a113d4508269697054b256056
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 March 2017 at 01:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rich Felker (11):=
<br>
=C2=A0 =C2=A0 =C2=A0 fix ld-behavior-dependent crash in ppc64 ldso startup<=
br>
=C2=A0 =C2=A0 =C2=A0 rework ldso handling of global symbol table for consis=
tency<br>
=C2=A0 =C2=A0 =C2=A0 reorder addend handling before symbol lookup in reloca=
tion code<br>
=C2=A0 =C2=A0 =C2=A0 emulate lazy relocation as deferrable relocation<br>
=C2=A0 =C2=A0 =C2=A0 fix free of uninitialized buffer pointer on error in r=
egexec<br>
=C2=A0 =C2=A0 =C2=A0 in static dl_iterate_phdr, fix use of possibly-uniniti=
alized aux data<br>
=C2=A0 =C2=A0 =C2=A0 fix possible fd leak, unrestored cancellation state on=
 dns socket fail<br>
=C2=A0 =C2=A0 =C2=A0 fix wide scanf&#39;s use of a compound literal past it=
s lifetime<br>
=C2=A0 =C2=A0 =C2=A0 fix one-byte overflow in legacy getpass function<br>
=C2=A0 =C2=A0 =C2=A0 avoid loading of multiple libc versions via explicit p=
athname<br>
=C2=A0 =C2=A0 =C2=A0 remove unused refcnt field for shared libraries<br>
<br>
Szabolcs Nagy (1):<br>
=C2=A0 =C2=A0 =C2=A0 treat STB_WEAK and STB_GNU_UNIQUE like STB_GLOBAL in f=
ind_sym<br></blockquote><div><br></div><div><br></div><div>Could the reloca=
tion changes here be responsible for these ovmf build failures:</div><div>=
=C2=A0 &quot;GenFw: ERROR 3000: Invalid ... unsupported ELF EM_386 relocati=
on&quot;</div><div>?</div><div><br></div><div><a href=3D"https://autobuilde=
r.yocto.io/builders/nightly-musl/builds/196/steps/BuildImages/logs/stdio">h=
ttps://autobuilder.yocto.io/builders/nightly-musl/builds/196/steps/BuildIma=
ges/logs/stdio</a><br></div><div><br></div><div><br></div><div>Jussi</div><=
/div></div></div>

--001a113d4508269697054b256056--
