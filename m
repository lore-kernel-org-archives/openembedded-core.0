Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 39C117F79C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 21:37:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47RdkH4DP0z4R;
	Mon,  2 Dec 2019 22:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575322649;
	bh=rMLCrWqOM0PMfhnPk8zgob1rrolBvyvjVzsHXAi7POU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1UWCZTUKuy7GNtIPz7CC6bueB9UJ2IzGk/VTsHlIuNXF3NP6fY3BpzTMplY47TTl
	3RADAaKGEZzlq6zhflRp1Vr2bAJ44l4Dk35FsU6eDxBT0YoG4TtMTLwsgkphZZhEOy
	uDV08MSrHLoVyu27cnIK8IIIz3RX6AYCKzyjL62LoctME0z7Dqt0N8l8EjE3sPBtC6
	0NLdgA5YkFHgPIn/7c4VTk3Iv71DkWmo3pBQMPemgca9Zrhng9ueUU7METlUMjC3sE
	el+gHwOaXloU+SOpptdSOoQ+pDzmfqWthM3n+298tdLBfCVcVD440WN32TrDkMvWuB
	pI7Mce7HWaEABE4yPQI9zlz2n5T3zfjN+UTq+eMpV7Avpxl0gyIlexbRfX/tN71I1d
	wlhAF5rsZA92si3WOUr4+2J03Na8IOh9hIWKQSIqsbAKXgyJmmRExYrgJyoffuxSFr
	3c6b8z7+MRrZQKrUwUlC7vHhDNi31D7qbh0tLfM6PX1jL/nGpNBXGpmlnv7Qk7cDdt
	gKBX7w8vcui1h/CLmg7x2IEPuHYKBmlwFtOVIBPFGKC3r8tz7t9r5dtLPyVo1B/vOR
	4U086laiRbvTP6J3ZuWwd2boxejLAtkl7kw5n+05cwcGwE7VN0qYM9cBoBerpNnH3m
	6BQN/QP5XRxXFgwIU7KBN82E=
Date: Mon, 2 Dec 2019 23:37:25 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191202213725.GA20379@localhost>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-2-alex.kanavin@gmail.com>
	<33182b29-de6e-f918-2915-df016b854e81@intel.com>
	<20191202151051.GC1581@localhost>
	<CANNYZj-VDVRB4qQDRG9+uHk0+QSm4d+Af-U2DNyb8QjyAj+o=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-VDVRB4qQDRG9+uHk0+QSm4d+Af-U2DNyb8QjyAj+o=w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/15] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Mon, 02 Dec 2019 21:37:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 02, 2019 at 04:24:49PM +0100, Alexander Kanavin wrote:
> It's using -std=c++11.

Oh.

> I'm not sure if switching to gnu flavour would have
> made a difference with gcc 4.8 provided in centos 7 and gcc 4.9 from Debian
> 8 - is it worth trying?

No, it doesn't make a difference.

> Newer gcc versions don't complain and build this
> without error while still using -std=c++11.
> 
> I'm leaning towards taking out the dnf/libdnf updates until these distros
> are retired from the supported distro list.

I was able to reproduce the error in an Ubuntu 14.04 chroot,
but no immediate clue whether it is easily fixable.

> Alex

cu
Adrian

