Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 61DED6018C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:16:13 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id f1so12909501igr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 04:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eQ6frvbBzADVRtdDGXPfiHKZb8rC+552YNuEQdeP0+I=;
	b=PsS3QAIBjyln/5qjLSeEN247NHlwkGNLPewKEd5Qg3WV5NqOfyp8c/9T2JETD0IAzh
	T/rSiU6hz8bGIc4yEFK2kOM7RxUwDyuSz+aHTL0Rj6VNCU7GlGa77KWSPqFBCSlWPZ1T
	6ZhHmvB1TraAfHSwqv9pKjOyWyfHEMdCY47aLnA6J7yOaxykZvInZsAo7l0E0i20FtB4
	BjryxTsbbeNAErjF6ISYLbUcU/eu/YdIsEvAQFI7ZcB0vdROQnpG7to7CosW8kG8KdxQ
	eCTxyvG3S+42YM2lVsFrm3SnAF/8mfm5qROvwYltn+tcwPZAInlfBsnO8JwdU8MhNvoN
	mE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eQ6frvbBzADVRtdDGXPfiHKZb8rC+552YNuEQdeP0+I=;
	b=nIxePN2OTPFDsycheEtw/Zn2ofvLSl8Fi3uKmy1YO+KSWFbTTwZ0blSBTXpqjvqVbA
	IG8OVhpJhHIopOEm+L/1vp10RYPheRYyo7GZOdsERdPZZFKZflPiOQDH7qSmPYEzbI6Q
	dk2X4UHkHUeVKe0AjVRdHkQNpvxcdQaZX3YcMj/0FMLK5n2EGaVM2djq/W6RTZ68Y28p
	ElCeLFxshpe5UL2MhUXLVkiF6ZEDUDTGoBBzCcZBefaIwP+RJyI7Alvjb289hVCMeJuw
	zho7kqdiOwUKTJe0KejyphTZZRvE0q84e3lqMRgIG62a46g4f5BjqSD0y6cU4huXosJ/
	KSZQ==
X-Gm-Message-State: AOPr4FVj9vr3CUajs4+rvBmyg57qmjsmALOCV9M5dltFaBTr+CfQC5O4nYL8ur86RXHWC/Q9TufvTsvusvl+74YP
X-Received: by 10.50.18.111 with SMTP id v15mr3582644igd.64.1461323773289;
	Fri, 22 Apr 2016 04:16:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Fri, 22 Apr 2016 04:15:53 -0700 (PDT)
In-Reply-To: <dc4e0e3653ac28bddfca011c39a7779bba5ec1b0.1461303847.git.liezhi.yang@windriver.com>
References: <cover.1461303847.git.liezhi.yang@windriver.com>
	<dc4e0e3653ac28bddfca011c39a7779bba5ec1b0.1461303847.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Apr 2016 12:15:53 +0100
Message-ID: <CAJTo0LYjvdtzq=q-f+BPNi7k3OraKV_Hez-TZmRucCWYmf0D8A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] utils.bbclass: warn for deprecated base_contains
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
X-List-Received-Date: Fri, 22 Apr 2016 11:16:15 -0000
Content-Type: multipart/alternative; boundary=089e014953cc68c179053110f4e5

--089e014953cc68c179053110f4e5
Content-Type: text/plain; charset=UTF-8

On 22 April 2016 at 06:44, Robert Yang <liezhi.yang@windriver.com> wrote:

> +    bb.warn('base_contains is depracated, please use bb.utils.contains
> instead.')
>

WARN seems a bit excessive.  Would a NOTE be visible in the output?

Also typo, "deprecated".

Ross

--089e014953cc68c179053110f4e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 April 2016 at 06:44, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2x" cla=
ss=3D"a3s aXjCH">+=C2=A0 =C2=A0 bb.warn(&#39;base_contains is depracated, p=
lease use bb.utils.contains instead.&#39;)<br></div></blockquote></div><br>=
WARN seems a bit excessive.=C2=A0 Would a NOTE be visible in the output?</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also typ=
o, &quot;deprecated&quot;.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--089e014953cc68c179053110f4e5--
