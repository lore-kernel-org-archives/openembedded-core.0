Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 65DC560248
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 09:28:46 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id q130so168658247qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mCyHZZfvlN3vYQVI0bhUajgTZG7083UoZgod7EMvuN4=;
	b=IL8mElsFmZHXqm07cawFJEm+GOAUQCG6YkciQXs2L93/q7+y409DEvUqB3WxbSRCIO
	0utU6RxWnfAWe6d+njhoppTBpQkUnaGEITx+1jbMqEsH1hh7nciftieFw938i/XueBTL
	6kj1qRzwkSJgwme28zW3XOkGzqefS2wE6QyU31qoAr6yCATEOYLNBDtwnI+qLrtr44Rz
	+RYUZ8mnqt70qXRpwsSoaDtwlTBIs2S/96S+ditg52ut53tyl5x4zDWwfPvhM1uE4Jmh
	Paz3hZWGFKT90SP1uV8sCzWfVA2o+DYkmuYkRcq5gkdr4zpCWjybV8awrXxEEYsWnSqF
	IaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mCyHZZfvlN3vYQVI0bhUajgTZG7083UoZgod7EMvuN4=;
	b=mUc+f8laO31LEBeRw9J6IGOaBHsiyaKVkCVPoUbsLeyGY+/baKoB+ZyYHERhp8plB5
	ckcoOCM3HzH5Ofl5XNjPCDB8yy5ZeFLjC6BUxRwmKKIH3A0b7U9J6lC357CpMHGGYSlS
	7TkineJ52Ty9s8v/A/VCPRQszJqY8Z8Vhfv7j8rWdc4hdJPij9YrueIWYt/k/15kWaOY
	R8itUIlQi+f04728z2jdfxCuBHuY8TD/jzr5sKF8NuuSPsevSkG056VyBCmfb62iXkub
	YFS06CaapzLgt6TrpJxQseK9c5WwtjJAWDMCzYtcL4MooOEVSZfllYRdVVxAlHNFIYfE
	Q+kQ==
X-Gm-Message-State: ABUngveRN8XMWAQJiaqVHV5Xq7QKwYNd1Vt7ekHVrTNBBCJ+Ilg0wVAhIjorLX2QDAYDzq8277xry03DqlMfrESO
X-Received: by 10.55.8.20 with SMTP id 20mr6164577qki.3.1478510928196; Mon, 07
	Nov 2016 01:28:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 7 Nov 2016 01:28:27 -0800 (PST)
In-Reply-To: <1478304597.3662.28.camel@pbcl.net>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
	<CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
	<CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
	<1478304597.3662.28.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Nov 2016 09:28:27 +0000
Message-ID: <CAJTo0LaKjNiFY3Z41Zk0Ln1fH_mLBF+hjKhr46+f3tewO5bTow@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Mon, 07 Nov 2016 09:28:47 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60ac00430540b2a6dc

--001a114c9d60ac00430540b2a6dc
Content-Type: text/plain; charset=UTF-8

On 5 November 2016 at 00:09, Phil Blundell <pb@pbcl.net> wrote:

> That would happen if your glibc was compiled against a newer version of
> the kernel headers than you actually have installed (bits/syscall.h is
> auto-generated from the kernel headers at build time). If this is a clean
> Debian install then it does sound like they have messed up the packaging
> somehow.
>

Ah.  I might (cough) have a hybrid stable/testing setup as I needed a newer
kernel.  I'll have a look.

Ross

--001a114c9d60ac00430540b2a6dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2016 at 00:09, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div>That would happen if your glibc was co=
mpiled against a newer version of the kernel headers than you actually have=
 installed (bits/syscall.h is auto-generated from the kernel headers at bui=
ld time). If this is a clean Debian install then it does sound like they ha=
ve messed up the packaging somehow.</div></blockquote><div><br></div><div>A=
h.=C2=A0 I might (cough) have a hybrid stable/testing setup as I needed a n=
ewer kernel.=C2=A0 I&#39;ll have a look.</div><div><br></div><div>Ross=C2=
=A0</div></div><br></div></div>

--001a114c9d60ac00430540b2a6dc--
