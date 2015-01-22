Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4B19B71144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 12:01:12 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id r5so763290qcx.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 04:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VJ+0nYuhXqAJbAabYXattv9ZCwOmzIuTSZjZB73+68w=;
	b=ViJEiztge5e1Xu/Qz7hZggv/CfAMMz2UBRUFE7bvXEOkmVOKVVjGinD+G4vNdhUE/s
	MisRQWY/WKbTWNN/uDCg7/y9D6ROPn3kAuaX4jCPzi/LZsD2rIA2pSA6SPKbczYqSKYh
	7cFEZFo+xTuJD3gjL0vGr/IM4ctnGwTsG1w2avUDkx9hFRWyy5l/5Ve+T6Dp/SX6b3SB
	QaR7/oC3JUeVwsKRb1yaJAhNx8sLRGFdl4AwfjT6NQMUKAs4Sm32Abw7OuWGEzpiPTPJ
	yvXLFHi+4TcoqBLoVX3obylN6ezMZ4qsyKqx/nsN0PaEAeiruxVq5cZ3oJTcEllZrg7F
	az9A==
X-Gm-Message-State: ALoCoQnBQpLOngr03txrUU+vFkcyeGpG5rPwlyCLt7A/uE/VsxzusL4AC7OH/vTg8OjQsYODZU5D
X-Received: by 10.224.93.6 with SMTP id t6mr1577711qam.93.1421928072942; Thu,
	22 Jan 2015 04:01:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 22 Jan 2015 04:00:52 -0800 (PST)
In-Reply-To: <c1e126ada5030706b289f4916e24f280f423d6f3.1421651689.git.liezhi.yang@windriver.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
	<c1e126ada5030706b289f4916e24f280f423d6f3.1421651689.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jan 2015 12:00:52 +0000
Message-ID: <CAJTo0LZG97KQbY8mTwBpruADXJz+mJomGa1s2Q_KWVgAENB-hg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] binutils: upgrade to 2.25
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
X-List-Received-Date: Thu, 22 Jan 2015 12:01:22 -0000
Content-Type: multipart/alternative; boundary=089e01495028af2cde050d3c6daa

--089e01495028af2cde050d3c6daa
Content-Type: text/plain; charset=UTF-8

On 19 January 2015 at 07:16, Robert Yang <liezhi.yang@windriver.com> wrote:

> * Remove the following patches since they are already in the new code:
>   binutils/fix-pr15815.patch
>   binutils/fix-pr16428.patch
>   binutils/fix-pr16476.patch
>   binutils/fix-pr2404.patch
>   binutils/replace_macros_with_static_inline.patch
>   binutils/binutils_CVE-2014-8484.patch
>   binutils/binutils_CVE-2014-8485.patch
>   binutils/binutils_CVE-2014-8501.patch
>   binutils/binutils_CVE-2014-8502.patch
>   binutils/binutils_CVE-2014-8502_1.patch
>   binutils/binutils_CVE-2014-8503.patch
>   binutils/binutils_CVE-2014-8504.patch
>   binutils/binutils_CVE-2014-8737.patch
>
> * The file src-release is gone.
>
> * Updated patches for the new code.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

FYI, this is breaking u-boot on meta-fsl-ppc (#7145) so when Freescale have
fixed their u-boot fork we can merge this.

Ross

--089e01495028af2cde050d3c6daa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2015 at 07:16, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D":5be" class=3D"" sty=
le=3D"overflow:hidden">* Remove the following patches since they are alread=
y in the new code:<br>
=C2=A0 <span class=3D"">binutils</span>/fix-pr15815.patch<br>
=C2=A0 <span class=3D"">binutils</span>/fix-pr16428.patch<br>
=C2=A0 <span class=3D"">binutils</span>/fix-pr16476.patch<br>
=C2=A0 <span class=3D"">binutils</span>/fix-pr2404.patch<br>
=C2=A0 <span class=3D"">binutils</span>/replace_macros_with_static_inline.p=
atch<br>
=C2=A0 <span class=3D"">binutils</span>/binutils_CVE-2014-8484.patch<br>
=C2=A0 <span class=3D"">binutils</span>/binutils_CVE-2014-8485.patch<br>
=C2=A0 <span class=3D"">binutils</span>/binutils_CVE-2014-8501.patch<br>
=C2=A0 <span class=3D"">binutils</span>/binutils_CVE-2014-8502.patch<br>
=C2=A0 <span class=3D"">binutils</span>/binutils_CVE-2014-8502_1.patch<br>
=C2=A0 <span class=3D"">binutils</span>/binutils_CVE-2014-8503.patch<br>
=C2=A0 <span class=3D"">binutils</span>/binutils_CVE-2014-8504.patch<br>
=C2=A0 <span class=3D"">binutils</span>/binutils_CVE-2014-8737.patch<br>
<br>
* The file src-release is gone.<br>
<br>
* Updated patches for the new code.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><br>FYI, this is=
 breaking u-boot on meta-fsl-ppc (#7145) so when Freescale have fixed their=
 u-boot fork we can merge this.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--089e01495028af2cde050d3c6daa--
