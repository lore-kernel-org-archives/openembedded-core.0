Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 73E4470034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 10:21:50 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ik10so32345130igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 02:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hCIhiFy+w8DThNyjjYFkJAEDhrGPEDMWmJ+uvFYGgvQ=;
	b=VBkqd9V+eCAoEpgjYhegOJXJZXhDAnrG24aTafMxgMQkKMakcGpKn5JqfySnyTOtGY
	LC3FMEQvgyS1RyGfsFrAHKY1d9uADhyeNc/U04yl70ayXOEeGyJ2vicCcmqOVU+WQ+rp
	MLs5dssQ1Meg2rfgufdgIXGtAffw6E0vCM4lJDdVk1+b/Ik7XKzqx2gp7efCGpkRFGwJ
	eDYSFQF/5wRV3b3o7a0LodGxhvycJdy6YCSTJN6ztlC3B1NMffOqFt/juy9R/W5vkFgj
	6E+izFt4IblNNyjNHiauRFtgU5ohc+pF8E9e+PbcEodoXgG+K+sIzNDgQd2vQ8vbY+FI
	hrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hCIhiFy+w8DThNyjjYFkJAEDhrGPEDMWmJ+uvFYGgvQ=;
	b=CFsNrvc8vMNC0oJL8gmyYymw2s364YUpTuHc37CaORDrd22fjVJrG1UdCMPGl87cl6
	Pw6bxvNQ5O4Wew4um//S6Ybdf65jhNrrXt4d7eg369tg0kBHFtCRE1bxlpmFRSJApvy4
	ZSfM4HBC5UldkN5TPtBZ0BdLI6VOKcKDaYJk87yQSW8mJDV0HSh7dHDr58TZfzMQ5Jp8
	4QEsvcNB4spiA2LVcrEBap41ZsaPaj7yIUheaBWmZZQs7HoEblo8xetBTOtSbvOHDnCA
	4cDvhYiWWmcAyhGoWntFQpn+x0ENlGh/aFGnH24WKRx5//dSC08TK+BEhpExSM2NLu6m
	cxDQ==
X-Gm-Message-State: AG10YOQIq56mdOV+1BA53vp5pmb4hOleWzI2gGhJVWSXECCw0lvhOT8+9iT0YI85FQ/VUrdgGr82qGkLKfl+3HGB
X-Received: by 10.50.23.108 with SMTP id l12mr10572091igf.78.1454322110992;
	Mon, 01 Feb 2016 02:21:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 02:21:31 -0800 (PST)
In-Reply-To: <855A5CD7-3AD7-45F7-972F-E25D5F23EEA0@gmail.com>
References: <56A22767.7050000@linux.intel.com>
	<56A24CE8.8010501@opendreambox.org>
	<CAJTo0LaAY=Bru-JzaNMQe5KNuAH3+A0VW_mQ6sNy4GvDU7nk6w@mail.gmail.com>
	<56A26F89.8080505@opendreambox.org>
	<61461.10.252.10.201.1453489831.squirrel@linux.intel.com>
	<855A5CD7-3AD7-45F7-972F-E25D5F23EEA0@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 10:21:31 +0000
Message-ID: <CAJTo0Lb=CFOCeSkS9DUv-RhYeYHHXFa=CDe5uP2t46pUHH-K6Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Mon, 01 Feb 2016 10:21:50 -0000
Content-Type: multipart/alternative; boundary=089e0149cbe8d0ac95052ab2c010

--089e0149cbe8d0ac95052ab2c010
Content-Type: text/plain; charset=UTF-8

On 22 January 2016 at 18:49, Khem Raj <raj.khem@gmail.com> wrote:

> Lets just wait and point our recipes to new github repo,
>

If you can find the sha corresponding to the directfb-1.7.7 tarball then
we'll certainly update the SRC_URI, separately from the "should it be
removed from oe-core" discussion.

(https://github.com/deniskropp/DirectFB/issues/2, the bulk of the 1.7
branch and tags are missing)

Ross

--089e0149cbe8d0ac95052ab2c010
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2016 at 18:49, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":22" class=3D"" style=3D"overflow:hid=
den">Lets just wait and point our recipes to new github repo,<br></div></bl=
ockquote></div><br>If you can find the sha corresponding to the directfb-1.=
7.7 tarball then we&#39;ll certainly update the SRC_URI, separately from th=
e &quot;should it be removed from oe-core&quot; discussion.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(<a href=3D"https://g=
ithub.com/deniskropp/DirectFB/issues/2">https://github.com/deniskropp/Direc=
tFB/issues/2</a>, the bulk of the 1.7 branch and tags are missing)</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--089e0149cbe8d0ac95052ab2c010--
