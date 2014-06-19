Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC7760144;
	Thu, 19 Jun 2014 11:34:50 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so9192767wib.5
	for <multiple recipients>; Thu, 19 Jun 2014 04:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=GYdZ37wsi9a9ixzztOmzMGadYgEIoSTq9Yt0eI7n68k=;
	b=PEXRp2B+V7aEgYOzyE9dEII29ovCT7Waf3u80elx9Q2KkY7XG7/7IvDT+CrYFLuWpB
	IkDPS/nj+fqTFx3U1dOyjg4AFcvQA/FKv6z+76XBKvXKyAcdpHjGTmcinh7PnbJYsBd1
	D4K34Wa+xMTCslPMHQiTfQf2B/Kmit5wf/43hZEeDFjrGeXSH/MM+LAMihCbIX9vO5Tx
	+3NKbXxvhaL3yaf7rjn1uQdCH7/zWVS4ZDAgOfR8eMOBzm3L+8IyObu6SjW1cG7k7rMR
	AUlMI4pmavWfJTUva3FHpZrvr/Gsr8/RXuHhXAYKSSmNn759eaaRjwKHoOVsEolRoG0Q
	4omg==
X-Received: by 10.180.105.72 with SMTP id gk8mr5869218wib.32.1403177691077;
	Thu, 19 Jun 2014 04:34:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l9sm10754488wic.21.2014.06.19.04.34.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 04:34:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jun 2014 13:34:51 +0200
To: Tom King <ka6sox@gmail.com>, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20140619113451.GO2117@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Few archives to add on sources.oe.org
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
X-List-Received-Date: Thu, 19 Jun 2014 11:34:51 -0000
X-Groupsio-MsgNum: 54267
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nljfjKcp9HDtPSOP"
Content-Disposition: inline

--nljfjKcp9HDtPSOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom,

can you please add:
IO-Tty-1.10.tar.gz
SQLAlchemy-0.7.9.tar.gz
fetchmail-6.3.26.tar.xz
usb-modeswitch-2.0.1.tar.bz2
usb-modeswitch-data-20130807.tar.bz2

to sources.oe.org? I can send you tarballs (or fetch them from
/home/jenkins/oe/shr-core-branches/downloads-missing/ on aruba)

The most annoying is fetchmail which is now fetching HTML page from
berlios (so checksum check fails instead of showing 404) :/. And user
needs to download it manually or use sources.oe.org as PREMIRROR, but
still better than nothing.

--nljfjKcp9HDtPSOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlOiytsACgkQN1Ujt2V2gBzzSACfa+lTejjXgM9phUHfT1/7O2bB
PAMAlRQV9iJQ4XMOKwjItIG+SvzDV/c=
=Y1Rv
-----END PGP SIGNATURE-----

--nljfjKcp9HDtPSOP--
