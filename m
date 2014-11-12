Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id E7F7862252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 09:28:26 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k15so8232620qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 01:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nIcqz0R2wWqwgFyy7KN934He8L8HtqT0hoJphFhRh3c=;
	b=IMYIEI57GA/lNsED//M9qWe1YnVWkeO8Ga9anCXhe9MpZl4Jfxjv0AvVVdYcBMPu7c
	+XRtSVA/OoJo9lyZw5kF6fmi7+ZczwXLjyDs+cM54QT4ngkKbsq15MYCzjHQS5bjcRvw
	H6f3JqgGziIMjZX+MrofAz5Ty93Stidc92zQuazoWhqicAoL2qmsqcMVlUCU1JVei73y
	EP0euEEO+N2H6trxBe6u/uIoGEyFvmUqkwM1J4PiAVXW/6SLLWuj+vRJ5FGx7/hs3Ygf
	bXIveQNPCr3it6t6ZygPQaxf1M/R9GD0zAN7MZrNRybBb6AE84AQ1vkJ/tqW2tvInQHG
	fKKg==
X-Gm-Message-State: ALoCoQkvQ0wfSFgp54+BBxWyCCqphZIKAqfJXi8nyAEs9JSFmaPQmmZrH19uqxkfYVidq8RHHC2G
X-Received: by 10.224.156.136 with SMTP id x8mr31085657qaw.22.1415784507106;
	Wed, 12 Nov 2014 01:28:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 12 Nov 2014 01:28:06 -0800 (PST)
In-Reply-To: <5462F625.6080207@gmail.com>
References: <cover.1415260194.git.Chong.Lu@windriver.com>
	<CAJTo0LZKsp1UvRNVMiFobDo92okUwDdjUCMj84Sx2xTjHBvNsw@mail.gmail.com>
	<5462F625.6080207@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 09:28:06 +0000
Message-ID: <CAJTo0LY3yuy2uJHnejApDA3RLVoQsKz_8zeVYkS-4E8bvc_62w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] nss: CVE-2014-1568
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
X-List-Received-Date: Wed, 12 Nov 2014 09:28:37 -0000
Content-Type: multipart/alternative; boundary=089e012947e09fffa40507a604d6

--089e012947e09fffa40507a604d6
Content-Type: text/plain; charset=UTF-8

Hi Armin,

On 12 November 2014 05:54, akuster808 <akuster808@gmail.com> wrote:

> Would I upgrade nss for dizzy or backport the cve fix (leaning towards
> back porting).
>

For stable releases, unless there's a *very* good reason then backport the
CVE patch instead of upgrading.  The recent exception was openssl in daisy
which was upgraded because the number of patches being applied would be
unmanageable!

Ross

--089e012947e09fffa40507a604d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Armin,</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 12 November 2014 05:54, akuste=
r808 <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com" target=
=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":3ay" class=3D"a3s" style=3D"overflow:hidden">Woul=
d I upgrade nss for dizzy or backport the cve fix (leaning towards back por=
ting).<br></div></blockquote></div><br>For stable releases, unless there&#3=
9;s a *very* good reason then backport the CVE patch instead of upgrading.=
=C2=A0 The recent exception was openssl in daisy which was upgraded because=
 the number of patches being applied would be unmanageable!</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e012947e09fffa40507a604d6--
