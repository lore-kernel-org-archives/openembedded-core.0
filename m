Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id A02AB760AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 17:42:20 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id p64so45667494qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DMHLd4stKOOqeamH73bCTni1FcwUGhVbpgeGMKiahG8=;
	b=LuLuJTziBPaVBnQzILiEiBsRlQ54Nzrha3YwHmc5E6evNJTRZ84Jz9g/9D6VCY982O
	NkzuFT34pXr6eXjnNWIdb5JcLie4jJ1jRzkeFpnjOtMyeZdcWUcW7VTh+tbgvx6Y9s5e
	pP5yWDAneKtPin7F65Am4ypD1OVnBsF32qm/K0+f3hbqjaIA0FwSXRyZncFmVrRzOiQ5
	pZAJGdPJhAi6ZSY6xl9JJ1CoGq0Vu+RftfvXCRz0lkU18x0lkpsr372GMD0XavOmAZoF
	8AHMJw4rcP4XXCJnoiUD0k0X1UnbXuFkZBmZZjtE9Kx9+4cBLIilEBaH5EuC5cO/vD7K
	KYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DMHLd4stKOOqeamH73bCTni1FcwUGhVbpgeGMKiahG8=;
	b=VUjn0yPS47KN4/2bIGKV8aEWanFxzlDg2CTFUz9P/24CKbWzcjwpgcrRbsBfyovXz2
	UFp50sLeaVh4uyI5rNC8Nj1MQc7VzcR/Hjj9XOaZTccaNblzbhPlcViZGxN17Sh8R3nS
	Gb66ZipyuFayprOT1iXoYrzvZwIjoOOdz3YuOEn7/CRRFGqLMXYqMLwTW0tdrtCSx7gc
	rwX32vjMDaTvRPJTnd6d8j8jIUDDwS3IGUglb1RQtiWkQezrkgrPOVluq/NtK5tFx0qd
	5EYztxwfvaP6EsxLh5e71jn7Ym+f6+ggQufpat0exH3kOWgYVrs9xyboRmj+GOvlspPI
	gh+Q==
X-Gm-Message-State: AFeK/H3guf2Q4tw+8LcoLq8GgELFCltxxFXtWP7BqkOpiebyw9HL65aW6/V37Rn5olDFaa47VQCyiAh1Z4hFNHuU
X-Received: by 10.55.3.151 with SMTP id 145mr8732954qkd.244.1489686141236;
	Thu, 16 Mar 2017 10:42:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 16 Mar 2017 10:42:00 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF2971C7@ALA-MBC.corp.ad.wrs.com>
References: <1489684755-27165-1-git-send-email-jslater@windriver.com>
	<007BD92917A2324FA403BCF9A464CF84CF2971C7@ALA-MBC.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Mar 2017 17:42:00 +0000
Message-ID: <CAJTo0LbihmZMtH3dM7fv4BjUaL2SCj3Dbi-wLsKraL-erZ1B_g@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH 1/1] build-compare: add date to PV
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
X-List-Received-Date: Thu, 16 Mar 2017 17:42:21 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b93a047111a054adc95cd

--94eb2c0b93a047111a054adc95cd
Content-Type: text/plain; charset=UTF-8

On 16 March 2017 at 17:28, Slater, Joseph <joe.slater@windriver.com> wrote:

> Also, should PE be defined given that the form of PV has changed?
> I know it hasn't been for any of the recipes modified so far.
>

Depends on how it changed.  Numbers sort before letters, so yes this needs
a PE bump.

Ross

--94eb2c0b93a047111a054adc95cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2017 at 17:28, Slater, Joseph <span dir=3D"ltr">&lt;<a href=3D"=
mailto:joe.slater@windriver.com" target=3D"_blank">joe.slater@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4jj" c=
lass=3D"a3s aXjCH m15ad82a18e1cf305">Also, should PE be defined given that =
the form of PV has changed?<br>
I know it hasn&#39;t been for any of the recipes modified so far.<br></div>=
</blockquote></div><br>Depends on how it changed.=C2=A0 Numbers sort before=
 letters, so yes this needs a PE bump.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0b93a047111a054adc95cd--
