Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2281A77DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 22:03:22 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 77so4685711itj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 15:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pnPlG6KCzi2E7QSo5oAxDQUhU+JhZbez40OGuIrBR1s=;
	b=g0002A2A1NOW0ZU0U07GLKZNL1/8v/CPkEdQDKyklpjJN8qlnruDqwHdF75TG0dx1J
	VihVK8fGA3ctSbhazC4FYbwE1avBaxC7iPl2kFPMH0dLamjhefbpXfKjxQwJ9xKR2qgu
	6oUXnMLqVSrgKvyYcvJiMBfleH27XoyQguC71kXbK2OWgHKGqHLpNxtvjjqekIGh4qUx
	FIhxk06lLA8zTcgjQzhL/+4IoTmQy2DSjiPMYxwflRxXR5tbqL2fDLswYsCwJDaHYR4Y
	4+M5yWildD1P9NkzV1PsSjCJJW6KJ5nwWKH7CfWhKqNgGj0pqauGqpmqavn/45WWanht
	2S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pnPlG6KCzi2E7QSo5oAxDQUhU+JhZbez40OGuIrBR1s=;
	b=n2Zsh2mUEXqnayyaowDFtJ05v4b/wsig2Vk8iSVNIVFdqsUPGbvNyojunQ6Blj2W6v
	4kWYinAL+uEwqJ+vNJ/l0vq/sTwHVNlaQjlIlPZjprjaqZcD/2Aei/gXskiSmZ1fpEJB
	S64NHUaOj/Aa76YyMxEBEkIkcMq2uFGPYn20nXCpjVk4bLCwwHz5h7kVhSerUyI1wqmo
	pmPiMU+APiPFD2jgPdGkSKMTJ0GMn4OYsGrmNAJrLgfaxovhSxb3f1r36fx/rJLHxct9
	XA4DggYp1dKlrmOPToryhX1d0Qcc50NhhAbshCb0kuR2bcU9A+tWUnoahnEO6NUfXixF
	fvrw==
X-Gm-Message-State: AIVw112Xtc0o8Pio692tPNUmrdDgo8vRpLYI3cIJ5gLbfrikM/vzfZF+
	flNErjlwAJiw0QGiBdY+T/0sMHKbvVgM
X-Received: by 10.36.172.15 with SMTP id s15mr7794138ite.111.1502316204188;
	Wed, 09 Aug 2017 15:03:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Wed, 9 Aug 2017 15:03:03 -0700 (PDT)
In-Reply-To: <b8ccbfdc-cb51-69e2-7516-5f95e949e170@windriver.com>
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
	<41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
	<1502110800.18633.220.camel@linuxfoundation.org>
	<d6c76558-21f5-c41d-9f47-2677644e4087@linux.intel.com>
	<b8ccbfdc-cb51-69e2-7516-5f95e949e170@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Aug 2017 23:03:03 +0100
Message-ID: <CAJTo0LbKoKi7JKT4tM4dnZbkoz35uixieQiUAPNz9kboka2qhg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Meson support in oe-core
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
X-List-Received-Date: Wed, 09 Aug 2017 22:03:23 -0000
Content-Type: multipart/alternative; boundary="94eb2c1fd75cb0fcff0556593f66"

--94eb2c1fd75cb0fcff0556593f66
Content-Type: text/plain; charset="UTF-8"

On 9 August 2017 at 22:10, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Yep, total time for 'without gtk-doc' is *more* than cut in half!
>

gtk-doc does some large XSLT transforms, which are single-threaded.  There
is a plan to move gtk-doc to use a simpler set of transformations which
should give an improvement there (or rewrite libxslt to be parallel, but
thats harder).

Ross

--94eb2c1fd75cb0fcff0556593f66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 9=
 August 2017 at 22:10, Randy MacLeod <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-le=
ft-color:rgb(204,204,204);padding-left:1ex"><div class=3D"gmail-HOEnZb"><di=
v class=3D"gmail-h5"><span style=3D"color:rgb(34,34,34)">Yep, total time fo=
r &#39;without gtk-doc&#39; is *more* than cut in half!</span><br></div></d=
iv>
</blockquote></div><br></div><div class=3D"gmail_extra">gtk-doc does some l=
arge XSLT transforms, which are single-threaded.=C2=A0 There is a plan to m=
ove gtk-doc to use a simpler set of transformations which should give an im=
provement there (or rewrite libxslt to be parallel, but thats harder).</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--94eb2c1fd75cb0fcff0556593f66--
