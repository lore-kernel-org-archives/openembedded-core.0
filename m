Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 23B976FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 16:54:43 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id f6so145421940ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vJkehD94FeHfQ0QqJ6JzsSuBLF0U/wT5FSWfYaPsQ60=;
	b=mDsO89va7Y8ZWihYGxGiLJBkLcrW5uVFZtBKI5guFhMpeBe4CFR2F2zv3ZZBiZCYYs
	4EnBIvPQneEOC3hiiUrJWe4YppFvcosUigiiJMDJ8Sm+BBILfngTCmARpFwZfbIB7s5g
	vuliWH93ooS4g/1LLuyvTxc555Cdhf/gdCmq4lkoT0gd4ikCe0Xm7IP2YcnHwTm0v4r/
	Tl8jvG54S9hoyBuGLG5h5cecxmpKSclQ12gkqkUHkHOeueqjh5pKr7HGlIFLAH5i9uuq
	7oqOSzsnCXzfloRXKquRMj6jDlL8Kfw+6PPiIqWZgUyzzskCHMPPLfVFm54K1F/FH4J9
	CZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vJkehD94FeHfQ0QqJ6JzsSuBLF0U/wT5FSWfYaPsQ60=;
	b=ObEAjA8awf771oQOaT9ldjhqOKUd8osqYR+4XW8H+hUfyAdglbel+6VgeSONP56eE6
	MNRnsq3pRazNqxoUcYb9qhixE5Fd46vRFXyzFCdtW0PmsGi4WVgzOLRVMfK/1EyA3SNy
	VMMZQSsN4QBUtKH6umMuA3TgjAGkQ2lCvxfTefjuANT6Z2HCEpMMAihAS4iZWf/+SEG0
	BnlMGbFP+rgL3MlrIKCsEp6HpGqRPqKhzmM5wyuR/HIGEES3ZdlRa2gAq6NT6S96izHs
	RfjefsUz4JOsvFggrA3QKWKEG+wch6Zea1uCRGgu3yDYOwvt0dHUFRH8BeUw//B7AXxS
	mveg==
X-Gm-Message-State: AEkoouu3k472+GU63Q54HIlnaoSakMaFo0A4NsCT8/sv0JAs0irAJQarGIbObwCySpQk6TpN+slkkXy8FZIlttHp
X-Received: by 10.107.154.196 with SMTP id c187mr29550104ioe.99.1471971284558; 
	Tue, 23 Aug 2016 09:54:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 09:54:24 -0700 (PDT)
In-Reply-To: <4878b5cf9dd13a06a3c6aa1c9c126527918e0f62.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<4878b5cf9dd13a06a3c6aa1c9c126527918e0f62.1471936926.git-series.jeremy.rosen@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 17:54:24 +0100
Message-ID: <CAJTo0LbHr7Bi20zYEG5+1383UkSb8=YmKATxOoP57DO-ZKX1Aw@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>, 
	Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] [rpm] force a configure before make distclean
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
X-List-Received-Date: Tue, 23 Aug 2016 16:54:44 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e894e88053ac0051e

--001a1140e81e894e88053ac0051e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 August 2016 at 08:25, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> -       ( cd ${S}/syck ; set +e ; rm -- -l* ; make distclean ) || :
> +       ( cd ${S}/syck ; set +e ; rm -- -l* ; ./configure ; make distclea=
n
> ) || :
>

Running configure without all the options it needs to actually work just so
that distclean works in a subbuild that shouldn't be breaking on rebuilds
because we have out of tree builds scares me a little.

Mark, you added this line, can you remember what it was for?

Ross

--001a1140e81e894e88053ac0051e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 August 2016 at 08:25, J=C3=A9r=C3=A9my Rosen <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile=
.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1wj=
" class=3D"a3s aXjCH m156b64af0a16ff1f">-=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${=
S}/syck ; set +e ; rm -- -l* ; make distclean ) || :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${S}/syck ; set +e ; rm -- -l* ; ./configu=
re ; make distclean ) || :<br></div></blockquote></div><br>Running configur=
e without all the options it needs to actually work just so that distclean =
works in a subbuild that shouldn&#39;t be breaking on rebuilds because we h=
ave out of tree builds scares me a little.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Mark, you added this line, can you rem=
ember what it was for?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a1140e81e894e88053ac0051e--
