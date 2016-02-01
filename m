Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1E1731BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 10:23:52 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ik10so32376874igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 02:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=u0clIVewul8t0oPne4gPFcAdIeAKZQhgMAr90vUmAyw=;
	b=Xo8JzbZ1Cd8QBp6nmbwsgzBJOWSq1PTeqYKgUjDeKqHHMrcoNgY0teBC1MepLDahdH
	DNzSMgJkWS04BSP/2PpVOHkQ8RiLEGE/0A16yZP+QncTEt7JJPEHiVjohHh1a1i/9okB
	k4wn/DEirRBd/kYPDrpd+drmkKJS3RYNT1j4N+RYHfWC/eDRcF2PcVyNJUH9XhzRyEwO
	cnbMiNWh+ptn/NdKkW1Wj9YHpVkkAOuN7gpHEHyVVUhPfrrfD07wCl1w7gdE3w+O4YGb
	+nGC+2Fnw36wiEPJy5bT//3CJ2hZ2KUER853KwqoBQa9/s1H0ZX5aKF1aDdsF/I22oWC
	2V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u0clIVewul8t0oPne4gPFcAdIeAKZQhgMAr90vUmAyw=;
	b=gXhnPnrYICPgHIrncYXtr6x4Hl7xdNGLeOH7L4tXQfXHnqhHxpDdAFp2zg0hXR8fN+
	LaM2S6ah/0w9OFdmG8sDcxq1bJQ7g3t8+VybLAjIQfFHQe/ylEtdRTuGi2zB5IscwMzf
	NjXp7U8YHJlBiNCsiIk7Df4X/AnbcY+et8fktpuFLcbncjYltGmNnwKqrw/Zkhpc6j/z
	FvIfg0FuxAEBrqRselthp5FDa3lNQQTZ6iy76icZ72wGeSBofOmy9HSj6eXy2OqE20Uh
	wHTgvd8xPqMsbQDWVnh36TY8biuyPTn7h7HoEwFDSTbLXHDYKeU4WR2U+c3EVyZ74zfX
	Nprg==
X-Gm-Message-State: AG10YOQcjbGSYMKMcs4s7HoQFTg8If51xUd/x+NEfSF8E9dI1+t4LsD279hHfQ+3+yYSF2d9hD4CkLsTtupGxuXT
X-Received: by 10.50.43.133 with SMTP id w5mr9661197igl.52.1454322233393; Mon,
	01 Feb 2016 02:23:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 02:23:34 -0800 (PST)
In-Reply-To: <be55911f598d8e203b6481011d30086ad79b6bff.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
	<be55911f598d8e203b6481011d30086ad79b6bff.1454303080.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 10:23:34 +0000
Message-ID: <CAJTo0LYY12dKQF7u3_QxkZhpiqt1=UX=M4iUR568kpvvnuQ+SA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] pth: Remove dead code
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
X-List-Received-Date: Mon, 01 Feb 2016 10:23:52 -0000
Content-Type: multipart/alternative; boundary=089e01175f2b1c5d05052ab2c89d

--089e01175f2b1c5d05052ab2c89d
Content-Type: text/plain; charset=UTF-8

On 1 February 2016 at 05:08, Khem Raj <raj.khem@gmail.com> wrote:

> recipe is removed, delete remaining cruft
>

Please update the packagegroups that refer to pth.

Ross

--089e01175f2b1c5d05052ab2c89d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 February 2016 at 05:08, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":9q" class=3D"a3s" styl=
e=3D"overflow:hidden">recipe is removed, delete remaining cruft<br></div></=
blockquote></div><br>Please update the packagegroups that refer to pth.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--089e01175f2b1c5d05052ab2c89d--
