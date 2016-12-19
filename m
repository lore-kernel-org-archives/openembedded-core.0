Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD3F719C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:57:18 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id u25so1401291qki.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uK5p34uPWQlLYC0zHfR0Jc82KhRJPzQmM6EqVjkoG5I=;
	b=qTiMmXA9hTwxIXh3q4PfR/u2SQTuTFJdf8/joWyjFRIVTDh6eEY/twmF8c2E3Ag4M8
	CfXqBpIOwSSjRW453EEqTG2As08k6vNXJKJPSDZZ/jAVE/VlvPjdTbJ6y20oaDrZMlJL
	iYDi20dFLXzAIHT9XKYcHS6g6WGT5oZ3nhbdetyd2UnXybGwdn7U9GWWkY/vy/57qCIN
	Wv0nRId3q6I1mzAJ1wd195zXPKc1U3A/0YoIv9gOS5w3XXYT+q0anJA/vZaHA7/upQcH
	/6shDISaGgNCnclA/q/DQ6QuBFRzsbqMFnpA94Xf+ARsRQrVmjQ+G9san5Nak88cwJYK
	ksrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uK5p34uPWQlLYC0zHfR0Jc82KhRJPzQmM6EqVjkoG5I=;
	b=fX7bybnF0XEdSU8QL5CCbQqqORwT0Dcw9+lS0S9y3T4iKNb9UZwgHGMu6EN2Gd+0gH
	9rg4vKk+JpfGSU5Z0EbGm2xwdRd+7UYqsiGAT8vsH3HRqRpLen51mIKYzhBr7NWdoT4t
	Y8Fow0dRqfyeXrCfKqG/mMs2cd+z4e+ElOcytsloFUvU/DeHvlzYjobUKQUe5JjNT3KI
	OhXNaVybEd0pG3bZDNZ2qXXrj8C9Sh+tmPIQf+QNsDrpiIgVRwu0OCwZ0ZXoExJAqdNb
	qOw/GQkXoh+DD+Xr4l1JUY5rqCnPF2XyxyVnxgKLNqD7qUUK7meUiToncT5WBn7tnX7p
	Lgaw==
X-Gm-Message-State: AIkVDXJd9UEwC2ykRkJoYoPj9afoUMKoxMfbyZkwY22lefczEP+dcLFZwSgzc2MUMdIpxTS9gehQtWx7TKIMhsBs
X-Received: by 10.55.207.78 with SMTP id e75mr515827qkj.36.1482148640023; Mon,
	19 Dec 2016 03:57:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 03:56:59 -0800 (PST)
In-Reply-To: <b462c405d5967bc06c0cb6e7b984c95852739480.1482125840.git.dengke.du@windriver.com>
References: <cover.1482125840.git.dengke.du@windriver.com>
	<b462c405d5967bc06c0cb6e7b984c95852739480.1482125840.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 11:56:59 +0000
Message-ID: <CAJTo0LaPw5z2W5-rx3DJrNj0w1APeTCsAhwGq8GEGC6_zAW4fg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Mon, 19 Dec 2016 11:57:20 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b831afe00544019faf

--001a1145b7b831afe00544019faf
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 05:40, Dengke Du <dengke.du@windriver.com> wrote:

> +I have send a discussing for the upstream, the maintainer said the macro
> in
> +APR designed with only any attention paid to the build platform,
> considering
> +cross compiling less, we can check the discussing from:
>

Sigh...

Have you verified that there are no other instances of that macros in
configure.ac?  It's clear that it's broken by design and should just be
removed.

Ross

--001a1145b7b831afe00544019faf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 05:40, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":24c" class=
=3D"a3s aXjCH m159159940b77dd71">+I have send a discussing for the upstream=
, the maintainer said the macro in<br>
+APR designed with only any attention paid to the build platform, consideri=
ng<br>
+cross compiling less, we can check the discussing from:</div></blockquote>=
</div><br>Sigh...</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Have you verified that there are no other instances of that mac=
ros in <a href=3D"http://configure.ac">configure.ac</a>?=C2=A0 It&#39;s cle=
ar that it&#39;s broken by design and should just be removed.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b831afe00544019faf--
