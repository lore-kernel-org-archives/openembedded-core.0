Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tldt6-0006dT-MP
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 12:02:04 +0100
Received: by mail-la0-f43.google.com with SMTP id z14so2730008lag.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 02:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=T7ii/7fBcK4ws6jeXhVuI0dYziPeeRWA70alzyQUR4s=;
	b=FedRVY7+/mdFjjP25QATZDyH+Vwr8t3hebQqFIBDtkxTGelGPoBcHHpryF60NRfJA6
	1T74n22G38tihKsGXTctgbbxjuSf+A1OqYG7syo9dXy25p8PxZFOskSx8Jjq+41XzD+d
	aVLjJ8zMRbBTlkupOkq3RJw7tLPJoKyYwzBNNYmfvmNdk1/Hlr20B7hOfI17K7Uy4bzP
	pzl+/u6eOH15PlgTEXijSDn0gQ7A8dxPHv26ygmvgf6FGhQcQku7JMq7LA4msqQQXh9L
	/WIjdKWkM2fdy2wX5mZ+ObEP0wQfMmAMz4E2k7902g+zY8kRorlljzarxHKFZDQdVGBC
	Jeaw==
X-Received: by 10.152.124.111 with SMTP id mh15mr8384614lab.20.1356000440389; 
	Thu, 20 Dec 2012 02:47:20 -0800 (PST)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id lx18sm3150774lab.14.2012.12.20.02.47.18
	(version=SSLv3 cipher=OTHER); Thu, 20 Dec 2012 02:47:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <50D1F76D.4070000@intel.com>
Date: Thu, 20 Dec 2012 11:47:19 +0100
Message-Id: <EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
References: <50D1F76D.4070000@intel.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlRQtwwf1OrXg52OYF04PV5xmw4hdVCSVCkMo8W9R1QPXhfJRTVmyXnxCM6p8dUzdKvtt9o
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 11:02:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 19 dec. 2012, om 18:20 heeft Radu Moisan <radu.moisan@intel.com> het =
volgende geschreven:

> Hi guys,
>     I have prepared a branch on poky-contrib (rmoisan/systemd) where I =
pulled systemd from meta-openembedded. The goal is to merge this into =
oe-core, so please take a look and give me your feedback on stuff that =
needs work or things that I might have done wrong, so that I can prepare =
it for merge.
>     At this point core-image-minimal and core-image-sato both boot =
fine with systemd. There still are a few warnings but not critical(at =
runtime), at least in my opinion, you may want to take a look at those =
too.
>     You can activate systemd by  DISTRO_FEATURES_INITMAN =3D "systemd"

What happens when I do DISTRO_FEATURES_INITMAN =3D "sysvinit systemd"?




