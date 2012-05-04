Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQFFS-0000Q3-KB
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 11:56:26 +0200
Received: by wgbdr1 with SMTP id dr1so2208304wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 02:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=p6MmeqvcgW6S5BBojJXI3p2P5qKfhmSG+Y1WN9PdmpQ=;
	b=ZFTvXj1ZdQqsQ6oevBadyRnUOzs+9cqfMDrfDYVk3IyRe4fqK2B5Lhe3SG4lGcLhKN
	xGeyiqtczj1rJd/P+WDQT7i7m4JDpRH0Xyge801SX0EGL5/5owIcexAVGv40RCR8xU69
	30pVneBGRFzRwJZ6AcFA9aV1OXn+OkAa4JXWfE9q/vm+Lk22Ph/LvBZ2KpaaDJDJne+b
	/pO6X7Hu4TfLrJGGmJiUIUYf9PXEZaOR1vnX6IejYxzrEXwOw+Qc91QLf9/JNdcaTeuQ
	ApnH6MlOiJiKyQxDs4MNdMq92ty57h3s0G8WgQZWg75yxjz1IK49fNMPx+NJCul28c8z
	+FAg==
Received: by 10.216.144.228 with SMTP id n78mr2892523wej.100.1336124800069;
	Fri, 04 May 2012 02:46:40 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm13278569wiv.11.2012.05.04.02.46.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 02:46:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <E4CB1C49-5AAE-4A6D-9218-83F2ED109A08@gmail.com>
Date: Fri, 4 May 2012 11:46:30 +0200
Message-Id: <0E974700-0AC5-4D2D-8CED-9B50FFC36854@dominion.thruhere.net>
References: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
	<20120504080242.GD3163@jama.jama.net>
	<E4CB1C49-5AAE-4A6D-9218-83F2ED109A08@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmLusO0ciTbVrMmE1bzJwi9XrqcDJNlzR+rboFMkviRMqqdfyaiqUnRDZBCzgoS3lnb0TIw
Subject: Re: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 09:56:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mei 2012, om 11:19 heeft Elvis Dowson het volgende geschreven:

> Hi,
>       I've submitted a patch to fix the warning for =
networkmanager_0.9.2.0.bb.
>=20
> However, I still get the warning for lighttpd_1.4.30.bb
>=20
> even after adding the following line:
>=20
> SYSTEMD_PACKAGES =3D "${PN}-systemd"
>=20
> or both these two lines in the recipe:
>=20
> SYSTEMD_PACKAGES =3D "${PN}-systemd"
> SYSTEMD_SERVICE =3D "lighttpd.service"
>=20
> WARNING: =
/tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb: it =
is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

When doing things like that you need to bump PR and fixup all dependents =
like tasks and images to ensure upgrade paths.=


