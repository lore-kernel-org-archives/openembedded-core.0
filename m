Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 491A571B0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 11:16:28 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n204so45920875qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 03:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OcXJDYwb4qFcq55IhIoPexsMOkwu3kiqTxX42bQrgak=;
	b=NBKYy4528x4rPX+hw0+AAgz1pGiRD6k70HlcF2i/bT6oB7XTbU2I7VrBHUQI3OTJEe
	xw7I3vsvm94J3XXN5K1/+cx2iu8PJX7NnV0NLrtYn2CLngv7dICNDnThqX2oymrpjrmF
	qRAxVYdyra1PyaFtfTi2W6B+h9+TBaMbexu9mEm0fFvQPDPGy/SPHIV69qwZzor/UWXQ
	8O+2gvbbQoBVh1xAED7uZzjuqe2QLwYWzsGO8ttzpNySmr3pXGegW0P3k4K0Ol4qjCCw
	s9PHoRuqVdv9t2Yf/TNcYtOcZ5XDtQaH1gAsN0DCAqaOL18rlfcMbWp2zqHbeM8Ap68w
	B7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OcXJDYwb4qFcq55IhIoPexsMOkwu3kiqTxX42bQrgak=;
	b=KiOvOLxOMS4uRVWVILGznugEWNIe0NL6zk3hPaIwz6FoM0i2Vy7EeJTCwpUs6LjRYH
	fyyQJyKXARJlhzz1qIm+A1KUJVo7Y29k2VuEaoJjLYz7HSfErBH3bhb/Xv04uairtFxU
	1okCSzLYmrXm7k4TDkFDqjSpqNAVaXuXn4mH5iGmVZwEN4GD6/oR0f5pOH+ERDSZ1IA9
	fGEUgsguNLURJbrEeCSAlHFx8Ba5m2N9Hubo+f4iCpyAY+ykWi8LLuzT2AeUe2KAc/3n
	k/VkcJoVRlMQl6S6TcAtLHpEmHqUaKfj1j+wqCpgunB3cy3asYFCmhq80vn0yd4GLIQt
	aabg==
X-Gm-Message-State: AKaTC02iJPfKuw8SqXep+WQ/ld/lYRO/jqa1ObJFhg0kMZttlMQNhPIyjOGkVNMGxLZAQEC08Q4j5di5iwHnMpDk
X-Received: by 10.55.75.17 with SMTP id y17mr1330846qka.26.1479986189875; Thu,
	24 Nov 2016 03:16:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 24 Nov 2016 03:16:09 -0800 (PST)
In-Reply-To: <20161124094609.30386-1-freesilicon@gmail.com>
References: <20161124094609.30386-1-freesilicon@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Nov 2016 11:16:09 +0000
Message-ID: <CAJTo0LazwgXNRER5gzjWhp2jWdWWZmbfx6qktQCbdiTYUKyyrA@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] slang: Disable parallel make install
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
X-List-Received-Date: Thu, 24 Nov 2016 11:16:29 -0000
Content-Type: multipart/alternative; boundary=001a114a88c81ed35f05420a23f9

--001a114a88c81ed35f05420a23f9
Content-Type: text/plain; charset=UTF-8

On 24 November 2016 at 09:46, David Vincent <freesilicon@gmail.com> wrote:

> Installation task fails if run in parallel. This case happens if we
> define PARALLEL_MAKEINST to a different value of PARALLEL_MAKE.
>

Do you still have the logs of this failure?

Ross

--001a114a88c81ed35f05420a23f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 November 2016 at 09:46, David Vincent <span dir=3D"ltr">&lt;<a href=
=3D"mailto:freesilicon@gmail.com" target=3D"_blank">freesilicon@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ox" cla=
ss=3D"a3s aXjCH m15895d334bff7300">Installation task fails if run in parall=
el. This case happens if we<br>
define PARALLEL_MAKEINST to a different value of PARALLEL_MAKE.<br></div></=
blockquote></div><br>Do you still have the logs of this failure?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a88c81ed35f05420a23f9--
