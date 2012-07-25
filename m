Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Su2aJ-0000dp-QC
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 16:29:07 +0200
Received: by wibhm2 with SMTP id hm2so4672051wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 07:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=2tossF4G3r+Lo/itTht2Xhl0ExJ+98mkVTU3lxc0o7A=;
	b=nfQHyfjj1sSrLeSCOKaG0huhyYftDODCQR4qkUedrGh4NyO7iF/ZZD5fBW3sMaKNEX
	ocSgT5fU28kkH0V8r49oF2CumZYNXf+3a2/suzwxhSaNezCzsBIIgnbp/zmpFgycHe9x
	1PnDozXVrJcnxsOgQ3mMq8TOK47agE/voUvMtgUyj0yPWVJY00aNA9l4XaZnXSgvEdcW
	IsefWLfdWEpv3Q75ntEX1bthni8IqCziHzeEbp5/iD6bI9PmKJ61Dc+lW2cYJhaelOWg
	bxId0EYOziTgc9JWpgqm6aALRZt+C0LVK8o7B6LLg5peuYKhlXsDsNwPYAGEV7xp5PRe
	zjeQ==
Received: by 10.216.131.135 with SMTP id m7mr720439wei.72.1343225858241;
	Wed, 25 Jul 2012 07:17:38 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fb20sm4357796wid.1.2012.07.25.07.17.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 07:17:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343225031-19107-1-git-send-email-radu.moisan@intel.com>
Date: Wed, 25 Jul 2012 16:17:34 +0200
Message-Id: <E1C8B862-C08F-4098-93A4-9C7E6262038B@dominion.thruhere.net>
References: <1343225031-19107-1-git-send-email-radu.moisan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl447HyUTiBea9NCgy6mrdcXJA6madPWnBTh6DOkE5tjIz7vCsHpKI9H8f5Q0X8fH2f/YgY
Subject: Re: [PATCH] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Wed, 25 Jul 2012 14:29:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jul. 2012, om 16:03 heeft Radu Moisan het volgende geschreven:

> Followed suggestions from Bugz 2261:
>=20
> 1) remove the --with-x/--without-x configure arguments. If you want to =
force
> no-discovery for native builds the correct argument is =
--disable-x11-autolaunch.
> This ensures that DBus looks at the build environment to determine =
whether to
> enable X11 bus discovery or not.
>=20
> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro =
feature.
> This makes the build dependencies reflect the feature list.
>=20
> 3) remove dbus-x11, meaning that dbus-launch with its potential X11 =
dependency
> is now back in dbus where is belongs.
>=20
> 4) Potentially make dbus provide dbus-x11, for compatibility.

This breaks the upgrade path=


