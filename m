Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sq0z0-0005ZD-V8
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 13:57:59 +0200
Received: by eaal1 with SMTP id l1so1131525eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jul 2012 04:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WC9b64DUMy59vFtSOBCAxu3v4nzg/86uF6+ExLfi/h8=;
	b=C+QRRQjWvqOP9LrP8DMn5l2ByW/LjmuwuDJfp6XMg9DGONW7GuuvUxwTJIysoa7TA3
	PtEIzzgiLThVd0j35G+devBs00D2Pz0rJB6kFH8LIh0e90wA5bAaP2XIl4EplXzKpH4n
	Ah1Gtvlnngpup/SeOerYtOR9pBHUXJ7gCCdHQWtWoN/ZvP5YaRh6QwJOMGS1fU2zRdeH
	BOAd4pMo72Y0bKZX18Mmr2nVVnP0E+Txy3CfekjiCqg/Ik8RxUtSh9IKbuGrVBkXJi4H
	SpDsuULIcb6L0JiDvMtmmUINv+MxAMc1+8kXE+qFuq8J+U5Pcd29y5xX8OMr20okEfSx
	UOZw==
Received: by 10.14.204.72 with SMTP id g48mr1814381eeo.36.1342266403473;
	Sat, 14 Jul 2012 04:46:43 -0700 (PDT)
Received: from [172.20.3.200] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k48sm3376144een.10.2012.07.14.04.46.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Jul 2012 04:46:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
Date: Sat, 14 Jul 2012 13:46:37 +0200
Message-Id: <626657ED-D451-4139-9580-953373E4620C@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkLZoRfapnmu8IZnCUJLwU4rTIPQXPWWCOfR3UEBNXLzf7w0CE0a4QFR092wbEquiaBLx4a
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Sat, 14 Jul 2012 11:57:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jul. 2012, om 11:59 heeft Koen Kooi het volgende geschreven:

> The recipe is autotools based now, the COPYING file was replaced with =
the complete GPLv2 license text.
> No more 'lspci' needed ad runtime, but zlib and libnl are needed =
nowadays.
> Add 2 patches, one to fix cross builds and one from Linaro to fix C =
state parsing on !x86.

Please ignore this one, it needs a few more patches to work properly on =
ARM.=


