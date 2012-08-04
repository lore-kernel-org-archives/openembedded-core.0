Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SxbiZ-0003Dn-Bb
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 12:36:23 +0200
Received: by eaad12 with SMTP id d12so406508eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2012 03:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=15G1mk++e3BStPe/Rq9fdx4Fdba1hWSduOPm6kkZwIs=;
	b=FOcYDJP6Ubf16FJdWB7NxFR8/uf6ILo0ouidi7WT2W3fJP61vnhvA1wZn+tp9dMipn
	O2gubNcLhUmKROrs0VVL9CrW6M+vyMi4xXnplPAztvs4mSL1Htf2RdjAiBwXDLrAEg8i
	bv8uL3S0fGdC1mfW2mYXnsAgKgBjXrC4c+gsW96i0c2aq2x1Oitg2ela0LjtibJv0f6n
	YOfkEWdtvnFAJyfrZelALHL9tikl8onQHMKUHuSwCLMhY6nLjoHwug3KYA82pfs2dL2B
	66HNigQisPoOd410cT2LYONjE6ByBXYRuzLY1AZlQxC3Tb/EzWQE0SZ7LUohSzzoo0g2
	DXgQ==
Received: by 10.14.210.194 with SMTP id u42mr5769548eeo.11.1344075881411;
	Sat, 04 Aug 2012 03:24:41 -0700 (PDT)
Received: from [172.20.0.2] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id j4sm32131934eeo.11.2012.08.04.03.24.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 03:24:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
Date: Sat, 4 Aug 2012 12:24:38 +0200
Message-Id: <12F75F74-476B-447F-830F-3F3C44F129C5@dominion.thruhere.net>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQn+HPVgWf9e4izmaG8Wo9ZYpIa6hhAAZ++eTGAVvC/Jtp6UPly7JB8aIIcjPMCvdvvMhxw1
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Sat, 04 Aug 2012 10:36:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 aug. 2012, om 22:19 heeft Laurentiu Palcu =
<laurentiu.palcu@intel.com> het volgende geschreven:

> This will improve first boot time because building the icon cache is
> done on host, with more processing power than the target.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

Don't forget to send a patch with PR bumps for all recipes inheriting =
this class.=


