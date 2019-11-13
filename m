Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id CA6667F7DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 16:40:40 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id 31so859147uas.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KcHv6CzJD3NAQkah+Ioi/s/bTbI9sxG+szmgBat8Hcg=;
	b=kLNjuhs3y1SZxsVmjnuNPztv4OJKAfrFsBzPc74Sn7Jv71KOqU/2yxDRyBlIUDbXe1
	X9AgMpomshl6j1PrlS9ca5TdPb5bG/FY0FJZBwSZnOZrPvLy54+L0nA5nDim2OlifXLz
	ZwGwPhSHc0T14M1yToe0TpGhrF3dBaDS9Or1E+Lr0xIluCmdqMpTaLzmoNUx7eSBFdUj
	LkQKmAnxqNpsp3nouZ74DmcU4VHR7qOfG2mdhPUk7LHNhRe3mRRnQS1m6AAsDTw7MgpM
	vPd5c0QoLdBW/nk5NVZi70r1WmwK8G0E/8ylGihgrHNjFSyrUMebUTJQETulq5QNQ1GJ
	ELUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KcHv6CzJD3NAQkah+Ioi/s/bTbI9sxG+szmgBat8Hcg=;
	b=oDPkdpD7OrkdpLubFNMHT2Hcf0FmZmB+7DxjCaLmgiVTF6YW3AZ3g5NrmACGD5Gobu
	KVah5GyN29cigXT1+TonNqFFUWUyi82KNR2eq344A3spOgCYMxkqFrMvSAZUNvmhezCu
	oZ2t1qO5MmOavS8Tm9PuDo33OllWefVcfSEGRhwsULjVW8HiWvcrqm4t+zYaXAUbUpmA
	KzvTiE1U/pWez+EM8f1Do5FYIy3bRPfGse57fBNc6vag+4XcjWSfYLvjp7E3pXqyeLb9
	hz6fqvEIpWiQayHIGWUEQDkDfGgR7UERE+0lBdjfMmWrbd0+4g0mhCyC+hMn3AQWw75K
	mC+g==
X-Gm-Message-State: APjAAAXlOqWbEpycGhLpDYkHVp6IkHAwx67auE6ErB2yuu8adF6PZ0F5
	rH3mghKVpIAXHv1VlXg9cIHIXoPHHIrxDD2LyqU=
X-Google-Smtp-Source: APXvYqwlX7q7AB3B7CKMzf8kKlQAT2w5k/svhgt4s4tt3zAXsoSAJJ8H+O2k3SHMGlG/OC1f8mpX/rzTL2O8F43IRg8=
X-Received: by 2002:ab0:2381:: with SMTP id b1mr2441688uan.106.1573663241491; 
	Wed, 13 Nov 2019 08:40:41 -0800 (PST)
MIME-Version: 1.0
References: <CAJ86T=W=wDNw7PPH5w5Vo0WEtdfZj41J036o3bAb=D4hiV9cVA@mail.gmail.com>
	<f53835dc2b5b9b2188d5e946ac1198c969821322.camel@linuxfoundation.org>
	<202eb2c6008a6eef16ed1a644e304607eb576999.camel@linuxfoundation.org>
In-Reply-To: <202eb2c6008a6eef16ed1a644e304607eb576999.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 13 Nov 2019 08:40:33 -0800
Message-ID: <CAJ86T=VvV9C_WFhKzQ0JedNyKUggpUjhg0LQngGsW0dV3=rZkQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: fetcher uses wrong SRCREV for class-native
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
X-List-Received-Date: Wed, 13 Nov 2019 16:40:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 13, 2019 at 8:23 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-11-13 at 16:21 +0000, Richard Purdie wrote:
> > On Wed, 2019-11-13 at 06:00 -0800, Andre McCurdy wrote:
> > > With the following test recipe, foo.bb:
> > >
> > >   LICENSE = "CLOSED"
> > >   PV .= "+git${SRCPV}"
> > >   SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> > >   SRCREV_class-native = "fc3e8f717779cabcbe583cac304308eaad5f1648"
> > >   SRC_URI = "git://github.com/file/file.git;protocol=https"
> > >   S = "${WORKDIR}/git"
> > >   BBCLASSEXTEND = "native"
> > >
> > > when building foo-native, although SRCREV is set to "fc3..." via
> > > the
> > > class-native over-ride, the version of code actually fetched is
> > > "015..":
> > >
> > >   $ bitbake foo-native -e | grep -e ^SRCREV= -e ^PV=
> > >   PV="1.0+gitAUTOINC+015b0cdce1"
> > >   SRCREV="fc3e8f717779cabcbe583cac304308eaad5f1648"
> > >
> > > A similar problem happens in reverse if SRCREV is set using a
> > > machine
> > > specific over-ride, e.g.
> > >
> > >   SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> > >   SRCREV_mymachine = "fc3e8f717779cabcbe583cac304308eaad5f1648"
> > >
> > > Now foo-native fetches the target specific version "fc3..." even
> > > though the machine specific over-ride shouldn't effect -native
> > > variants:
> > >
> > >   $ bitbake foo-native -e | grep -e ^SRCREV= -e ^PV=
> > >   PV="1.0+gitAUTOINC+fc3e8f7177"
> > >   SRCREV="015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> > >
> > > Commenting out the line which appends "+git${SRCPV}" to PV seems to
> > > be
> > > a workaround which results in the expected version of code being
> > > fetched.
> >
> > I tried this with master and didn't see it reproduce. Do you have:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d427f58977a46f2bda4b7f30cf83793373e401d3
> >
> > applied when your build sees this?
>
> I just reverted that and retested. I started seeing a lot of basehash
> errors which tends to confirm my suspicion that the above patch is the
> same issue and fixes this. It does raise the idea we may be able to
> make a testcase out of this though...

I tested with 2.7 and 3.0 but not latest master, so didn't have this fix.

Cherry-picking that one change does seem to fix the issue (tested with 2.7).

