Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sa724-0001KB-Ju
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 17:11:24 +0200
Received: by eekd49 with SMTP id d49so435232eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 08:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=NhD2GT3v855hY4hrD3+pM9lVlCuYLJe1+3XFYgKqmeo=;
	b=jXK5Mrmyfc3fvRHXrHtthmsASkiaV/cOvKTeXcGOpa30PpC6LKlKSzCI/srCRPfr/G
	i3//SQX+lGtXFCXmUMgZDeQa3pMuCcXYeX+aUxrxQmxkBlBeUM3p0MuHRxxbbOIpMwZX
	pMxAHQZOKPtyD2T4qPt3Ej26kpB+JIPyrwF+ARxK4koqMN6jWN1Xz6h2wuYXheweCNqL
	F/PWnH3yK8kSKdNC2Pm3/U2DOOywpLqzl/FAmg/frxVTNbtAdZ9YdfmzeE7KkBb4pSlY
	ZzZcFR7qY8UJNmaWFkTux5qN2yHNliO1OurJQf7BsUmfRtpzyC8YcS13XEGwYVmCyB+l
	FabQ==
Received: by 10.14.187.11 with SMTP id x11mr8707467eem.57.1338476464421;
	Thu, 31 May 2012 08:01:04 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id t3sm11353234eeb.15.2012.05.31.08.01.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 08:01:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
Date: Thu, 31 May 2012 17:01:01 +0200
Message-Id: <D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl0GhWOmO/0BT9w/fbo0KAEDfmNDpSSGHpKir152PvjUpWsC7A9Q723xyQTLdPhwq4LVKdu
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Thu, 31 May 2012 15:11:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende geschreven:

> There is a bug if we:
> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
>=20
> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
> image even if there is one in deploy/ipk/core2 and we have set the
> core2's priority higher than i586, when the version in deploy/ipk/i586 =
is
> higher. This doesn't work for us, for example, what the crownbay need =
is
> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.

And this is working exactly as intended. Don't break opkg because your =
hardware driver situation sucks.

So: NAK on this patch.=


