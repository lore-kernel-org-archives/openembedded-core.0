Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id C8ADE771C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 12:34:05 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id 5so10236398igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 04:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xNbgHavZ4iraGm8fb1hGDwX4I1l2eR7bowbm+AneBOs=;
	b=WBBL5KZ+KNuQk9KFYClDjUfSPG+ItP9Pz2JE4euwK32saMCm1c/A/4iiOl3+6kWdUY
	xrC0oXj1NBJl11SkcRZr1nd/pPDLSZfGHNXCuN66bBcRMP1RMHeGxLGwplpjp7IvLagA
	F1YHLMVdsT80gcHwJWTrmdnYgDeOFWZKz05P79GhX/oGD8QhZvi0NDXc5mJln13xlXmI
	zZmDY9FePmFzZAYlI6df+ewjJBtv+j+/Xtis8JKfWXxdueOMWieFHGKhSu7kM+Sm/CeI
	j/PMPBjDwXZV15dNhXMD7A39MAeNiDisxpPvwRAV17OxcL9ft2ldy6wpZy5GZkI+afbY
	0zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xNbgHavZ4iraGm8fb1hGDwX4I1l2eR7bowbm+AneBOs=;
	b=Dh3bwa1sq+5MymELRMiRj8GpRJMpJkXvTMCpzhq/jzLciab7iOe2fLn2r7PYc+gETN
	yHuMCwHdDhHRHeXBxJS5yJ9iJDgoOL5couGTidyZteJYMTjsCHwtWIDbntIR1zWlrNTv
	ZxBD5eOU6BEJdMq1CySZSD5B9NAINWnF5AUFuZB3veNCkbYiV2RZaeXJ2AJ9TjCF2+Sh
	K2dnrr71C8cGgkeS/mPAN+aoxhdNSFc40OEb+hViuOEeIKLN9RlIzHW/8JxhICxpn1R/
	76EsTleXEwu2r3nkj4kcq1tEA86g+NrFKAP6+Fm9PYJTiQL/GcZV5Of8Lh3snC5ORQxT
	aFqQ==
X-Gm-Message-State: AG10YORVZZ0MA/4GziPbQgzZuP4TqP2qn6pUTaIiZUe7MZ0zJ02lvmUfRqaiILOVgy667C7jN9oqLEEQuUh0Mdtq
X-Received: by 10.50.111.111 with SMTP id ih15mr11157372igb.78.1454330046023; 
	Mon, 01 Feb 2016 04:34:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 04:33:46 -0800 (PST)
In-Reply-To: <CAJTo0LYY12dKQF7u3_QxkZhpiqt1=UX=M4iUR568kpvvnuQ+SA@mail.gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
	<be55911f598d8e203b6481011d30086ad79b6bff.1454303080.git.raj.khem@gmail.com>
	<CAJTo0LYY12dKQF7u3_QxkZhpiqt1=UX=M4iUR568kpvvnuQ+SA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 12:33:46 +0000
Message-ID: <CAJTo0LbCHLao9R1UK-J=iUUt+3bD9gLhiNOBu5rjEYknUiNPrA@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Feb 2016 12:34:08 -0000
Content-Type: multipart/alternative; boundary=089e0149be34c7a749052ab49986

--089e0149be34c7a749052ab49986
Content-Type: text/plain; charset=UTF-8

On 1 February 2016 at 10:23, Burton, Ross <ross.burton@intel.com> wrote:

> Please update the packagegroups that refer to pth.
>

Sorry, this was already merged by Richard and he pulled the fixed version
that I'd made locally.

Ross

--089e0149be34c7a749052ab49986
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 February 2016 at 10:23, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extr=
a">Please update the packagegroups that refer to pth.</div><div class=3D"yj=
6qo ajU"><div id=3D":l0" class=3D"ajR" tabindex=3D"0"></div></div></blockqu=
ote></div><br>Sorry, this was already merged by Richard and he pulled the f=
ixed version that I&#39;d made locally.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--089e0149be34c7a749052ab49986--
