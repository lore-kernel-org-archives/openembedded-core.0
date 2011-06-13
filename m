Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QW40C-0008IP-Vr
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 12:04:13 +0200
Received: by ywg8 with SMTP id 8so2064591ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=N9xO2QDf0CQ/fiF5U3uKScNFAn5b2tdkv3GjJVyDSjI=;
	b=ixhv/kE2Yh0eBKgNz7B+L1VolsJyntagKwVIRMM17IRPaPww9Vxqo229uubwD3Nugn
	b2sIJj0hv/MZef49DDGhNEVJex57YPK5oIuKkf404sAzrKfAW4M4EQzfsat3GcdMwpL4
	j0PVsYxRcLALNWJyk8mEoXYCAFF2XvMTQWiTA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ba/dJfCgPlh2fiBTg8w/Y2AmuHmVBLyHZ9AnkhJDiTKy3pmdmitOTrNeEu6VOC9q69
	/wjnTMLlBdlx09J3hicG7Iagk2Vqt8OUXX5c9Wwg5zr+osSvDEdvywLT3NkzSOnkc6/S
	C8BAYNRF7gBLRPI4QErcliGMOUQ0XCYcpDuoc=
MIME-Version: 1.0
Received: by 10.236.78.198 with SMTP id g46mr6274693yhe.404.1307959248332;
	Mon, 13 Jun 2011 03:00:48 -0700 (PDT)
Received: by 10.147.83.8 with HTTP; Mon, 13 Jun 2011 03:00:48 -0700 (PDT)
In-Reply-To: <1307958174.6879.29.camel@lenovo.internal.reciva.com>
References: <cover.1307954821.git.kai.kang@windriver.com>
	<5ffcb67a8acc41eeb36fe98aba6d38f3f1c67a88.1307954821.git.kai.kang@windriver.com>
	<1307955932.6879.12.camel@lenovo.internal.reciva.com>
	<4DF5D514.3030102@windriver.com>
	<1307957234.6879.22.camel@lenovo.internal.reciva.com>
	<4DF5D9B6.1010100@windriver.com>
	<1307958174.6879.29.camel@lenovo.internal.reciva.com>
Date: Mon, 13 Jun 2011 12:00:48 +0200
Message-ID: <BANLkTi=eocC9OGqLSiFHPttwYsDhNBR61Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2011 10:04:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2011 at 11:42 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2011-06-13 at 17:34 +0800, Kang Kai wrote:
>> It seems DISTRO_FEATURE doesn't want to enable ipv6 by default, but
>> eglibc needs supports it.
>
> That doesn't seem like it can be right. =A0Why would you want ipv6 in
> eglibc if your DISTRO isn't using it?
>
> The whole point of DISTRO_FEATURES is that it's meant to give you a
> coherent set of system-wide options.
>
> FWIW, I think ipv6 should probably be set on in default-distrovar's
> DISTRO_FEATURES, but I guess some higher authority would need to make
> that decision.
>
> p.

I see your point

but ipv6 as DISTRO_FEATURES_LIBC ends in DISTRO_FEATURES as well
DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhost
wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
so I'm fine with ipv6 in DISTRO_FEATURES_LIBC

this way I can expect *libc to be tweaked by DISTRO_FEATURES_LIBC only
and the rest of image by whole DISTRO_FEATURES (including libc-* flags
and ipv6 from DISTRO_FEATURES_LIBC)

Regards,


