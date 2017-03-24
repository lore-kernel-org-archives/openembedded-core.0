Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 773BF77BE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 17:26:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y90so1374512wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 10:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ym/CGxiCTOH0VVoEEwHP1rTJAre/Ij9RcufpRiC/ZZw=;
	b=eBAuVZpeVcIKMt0O0Uf3f4F5S0ltKZiGnVGd0d8ofPP6wVWyLGa745ycXUvcw0WeR+
	+stziyehICiQXaxW7e+1IhLHi1KdqzUnqzHtcZb/A4sdCQKZcnYmFGxSiPjQ/XjK6uUY
	qw5R8TVYoltmR1iGctPYlHACRy3NA35HzzBD/8KaCObaxUFHKeaI/iisLuqcP7nOuJYM
	7fJQ65mxnXC4MkGkqUI069jqja3dq8m9JmiGCWTuPF/eZ/2tgtwVqN+oTET6Rc4QcMqc
	UAy7teQKHlBJG5Ij4zWaUvoK3/8o5eXPsMeAjx/gJZTTORWOYLQeO98vFZ29nfCRXnva
	2fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ym/CGxiCTOH0VVoEEwHP1rTJAre/Ij9RcufpRiC/ZZw=;
	b=O7eQXlh2Te/2nG97vrj6QVy8c0908bfGmVmxaXXC6cnypK4qpIrLlc57PYpK0gf/0h
	hszn6mvtLsahvf1nGmCHmSdpIqSREU84D/Q8Qls6i2jTLohvwQSEwzseVOqNd0tVhLvl
	Qqt1Ky6SWj2Xs5lDIUWkRM1KnsHeWR9MBbTF0MGbQ+yVh4QfDy+HH7IM6/fuIOI06gPB
	ozX2KP1/T3iqqCTo/c8diklsgjbC0jqjw34j1uArdf3m+m22lVJQn120KXG/kHJ8k1D/
	Bl0iYQ7PjiH8MTdNWNgPdJC9O0tVUgql3VH0XSK4MIaD0wrT0VyaDlRCVq6MCiN+GoPE
	2+sw==
X-Gm-Message-State: AFeK/H0rp+bXmdmHF7ezrU4FrO2Hgn7J0Swm5JuqWw/PQxxZl+rrjwgaht9mhUgcpw04xU9Q/jUoarK7sqFtHw==
X-Received: by 10.223.164.201 with SMTP id h9mr8456817wrb.175.1490376392854;
	Fri, 24 Mar 2017 10:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20170324164038.30804-1-raj.khem@gmail.com>
	<CAJTo0LZH-RV5-s7krGXNURFMOZ+9-iMCyY_O9RUJfHff8qvC2A@mail.gmail.com>
In-Reply-To: <CAJTo0LZH-RV5-s7krGXNURFMOZ+9-iMCyY_O9RUJfHff8qvC2A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Mar 2017 17:26:21 +0000
Message-ID: <CAMKF1sr-X9SmLd_1R_peLk01OyHUaO3=-7hGD-GbC7hqLNpqDw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix build with thumb2
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
X-List-Received-Date: Fri, 24 Mar 2017 17:26:33 -0000
Content-Type: multipart/alternative; boundary=f403045f15187a56e8054b7d4b40

--f403045f15187a56e8054b7d4b40
Content-Type: text/plain; charset=UTF-8

Yeah they are essentially same


On Fri, Mar 24, 2017 at 9:50 AM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 24 March 2017 at 16:40, Khem Raj <raj.khem@gmail.com> wrote:
>
>  create mode 100644 pull-30041/0000-cover-letter.patch
>  create mode 100644
> pull-30041/0001-db-Fix-atomic-function-namespace-clash-with-clang-bu.patch
>  create mode 100644
> pull-30041/0002-libvorbis-Contain-gcc-specific-compiler-flags-using-.patch
>  create mode 100644 scripts/lib/wic/canned-wks/sdimage-bootpart-8g.wks
>  create mode 120000 tools/python
>  create mode 120000 tools/python-config
>
>
> This patch went crazy, I think I'll merge the other one. :)
>
> Ross
>

--f403045f15187a56e8054b7d4b40
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Yeah they are essentially same=C2=A0</div><div><br></div><div><br><div=
 class=3D"gmail_quote"><div>On Fri, Mar 24, 2017 at 9:50 AM Burton, Ross &l=
t;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_msg"><div =
class=3D"gmail_extra gmail_msg"><br class=3D"gmail_msg"><div class=3D"gmail=
_quote gmail_msg">On 24 March 2017 at 16:40, Khem Raj <span class=3D"gmail_=
msg">&lt;<a href=3D"mailto:raj.khem@gmail.com" class=3D"gmail_msg" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=3D"gmail_msg"=
><blockquote class=3D"gmail_quote gmail_msg" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-1542366029311094963=
:2sh" class=3D"m_-1542366029311094963a3s m_-1542366029311094963aXjCH m_-154=
2366029311094963m15b01316ffaf55cd gmail_msg">=C2=A0create mode 100644 pull-=
30041/0000-cover-letter.patch<br class=3D"gmail_msg">
=C2=A0create mode 100644 pull-30041/0001-db-Fix-atomic-function-namespace-c=
lash-with-clang-bu.patch<br class=3D"gmail_msg">
=C2=A0create mode 100644 pull-30041/0002-libvorbis-Contain-gcc-specific-com=
piler-flags-using-.patch<br class=3D"gmail_msg">
=C2=A0create mode 100644 scripts/lib/wic/canned-wks/sdimage-bootpart-8g.wks=
<br class=3D"gmail_msg">
=C2=A0create mode 120000 tools/python<br class=3D"gmail_msg">
=C2=A0create mode 120000 tools/python-config</div></blockquote></div><br cl=
ass=3D"gmail_msg"></div></div><div class=3D"gmail_msg"><div class=3D"gmail_=
extra gmail_msg">This patch went crazy, I think I&#39;ll merge the other on=
e. :)</div></div><div class=3D"gmail_msg"><div class=3D"gmail_extra gmail_m=
sg"><br class=3D"gmail_msg"></div><div class=3D"gmail_extra gmail_msg">Ross=
</div></div></blockquote></div></div>

--f403045f15187a56e8054b7d4b40--
