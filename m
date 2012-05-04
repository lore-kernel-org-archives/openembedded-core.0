Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SQFpP-0003P0-9n
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 12:33:35 +0200
Received: by wibhj13 with SMTP id hj13so1051303wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 03:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=KuG3AZ0d567p1TdDUBMoBh73apJ/nWJtN7HkxQ0RsvM=;
	b=M+O9uNAEN80HUzFpyL9Q/uoRLfC6/ULRbRAjn+pO6JAK/LGoHA4spp19PLuJN6OBqF
	sefb/SyA0KdUg5vWczGx77kHs71c9T079WkcM4aRgycCbXGMMvdLEVFNwviorFwJ2Rtm
	MEhh9vcY92TZ6aZXNDcnoMWBQt4qYwhQaXKdaoWJG8N5SJgmiiOjvTdgPkPHamUDzxo4
	eUXxyERbNx36Nz5sMlwVoYA0/fTnKKtnmW32YK3PvWIoSwozy30OQ1Xlxh+BYXKhsalY
	0bdJQiWi1EPt6vmtN36oj6NBz9Rv2LWgWwrQa4+MrT02NlxhDLpOxSh4BqTu3a+WU4c+
	QbCg==
Received: by 10.180.82.132 with SMTP id i4mr11589094wiy.12.1336127028464;
	Fri, 04 May 2012 03:23:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e6sm297202wix.8.2012.05.04.03.23.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 03:23:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <D54EB56C-3187-439B-BF54-4C4ACD76C8CC@gmail.com>
Date: Fri, 4 May 2012 12:23:45 +0200
Message-Id: <E5289E91-73CA-4C6A-884C-8C6CDB67640F@dominion.thruhere.net>
References: <D54EB56C-3187-439B-BF54-4C4ACD76C8CC@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk01tOACxAoQ2j3DSLpiWz7kZWS1/GnpUCz6/dWcWhkH6bN4/xkzqmlTfSwhSY0URNAwi4+
Subject: Re: [meta-openembedded] [PATCH] networkmanager: silence systemd bbclass WARNING.
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
X-List-Received-Date: Fri, 04 May 2012 10:33:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Please follow the README for submitting patches to meta-oe.

Op 4 mei 2012, om 11:15 heeft Elvis Dowson het volgende geschreven:

> This patch fixes WARNING: /tool/yocto/meta-openembedded/meta-oe/
> recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb:
> it is recommended to set SYSTEMD_PACKAGES as =
<existing-package>-systemd
>=20
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> index 474d98a..478d61e 100644
> --- =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> +++ =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
> @@ -54,7 +54,7 @@ do_install_append () {
> 	install -d ${D}/etc/NetworkManager/VPN
> }
>=20
> -SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> SYSTEMD_SERVICE =3D "NetworkManager.service"
>=20
> PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests"=20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



