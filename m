Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE737317A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 12:12:25 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ph11so35854974igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 04:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D3Sj52TIbEWOXjsFp0SlWjfq/YxPjkkeNTAVmW3WRWQ=;
	b=yeHkplxdprIDrJ+MDAdy5NarU2+pcDkYycusyLI3YpG5zsWUaJMWMrzMHmNlZ6BAPT
	Zi1zMAOwL7ahl5NviQTV2vSgcYIy3EtzG0tpfTYenPWLTHoPC56Ajn6DXyY72PK/9BUV
	NSy8D9xmqaQeu6ixXoQ+6Htn35J6HCSaBh7wJ2+16LvigSnhvxsgkNAc26nC878Aavh7
	rB4sUO0KI6stf+2oTkg4aUNCuDJYYW+nuiwNwrmQJ9i2NpvfcqDFB2kUXN+q2zfRYwG6
	x8vSdzymauYHgst3D+xInJHChvvXIOtn4Gwl8RY74ZPGTwi6C3E+v5yaeunO19jwjnYI
	+beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D3Sj52TIbEWOXjsFp0SlWjfq/YxPjkkeNTAVmW3WRWQ=;
	b=KH2NvStgsT0nhOLAFwSex8aDTD6ozB2hXCPPT2DE/SgZsnPnt8mtAc3q3Ngd3/Urmc
	hgyrjQ3bpXQ5vu0OzB3bv2kgZEvNaEedmS0IBG/Zs0krah1uOCXOnwbiBn2e7C24a1nC
	c9R0VS4Rb1iKPPhCE9tPTTf3+0mFSWtGMNBr9WTnDTe4QVH92AMOeseQLrKkFPC92yEC
	S6tDrgxcyDQAx5S+QUnpEayeLqzKleQarxprw+VPog/J3Kzuy9F8Py31mh0dzoSawltC
	dbhUnzlIBZRI1OyMLVghRRw2t1sSd2OplFeS798YCotE+tg62EYplYtdIWVjMwveFvC7
	TZ3g==
X-Gm-Message-State: ALoCoQlOZG9cYrwAZU1lzfCCzhvOdY59gUW5w/UUjlc1GaAA62vq/nz/NULKKzByemj36u+5z3UAyCxp+Jtcduv5vIpZq8BHuo8bYO+06OgYQcLQCLRUDMo=
X-Received: by 10.50.22.33 with SMTP id a1mr16730276igf.52.1450699946141; Mon,
	21 Dec 2015 04:12:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Dec 2015 04:12:06 -0800 (PST)
In-Reply-To: <34c1af17ee715cf0016952cce7868370c3068628.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<34c1af17ee715cf0016952cce7868370c3068628.1450568936.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Dec 2015 12:12:06 +0000
Message-ID: <CAJTo0LY_U2Q6z_Ne98YCKX9B=FOCE6MJ39iAukgEb6P7FL_UaA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/17] blktrace: Include <sys/types.h for dev_t
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
X-List-Received-Date: Mon, 21 Dec 2015 12:12:25 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca19f7457105276766a8

--047d7b10ca19f7457105276766a8
Content-Type: text/plain; charset=UTF-8

On 19 December 2015 at 23:52, Khem Raj <raj.khem@gmail.com> wrote:

> +Status: Submitted
>

We have tooling around this tag, so please use Upstream-Status.

Ross

--047d7b10ca19f7457105276766a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2015 at 23:52, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":2oa" class=3D"a3s" st=
yle=3D"overflow:hidden">+Status: Submitted<br></div></blockquote></div><br>=
We have tooling around this tag, so please use Upstream-Status.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b10ca19f7457105276766a8--
