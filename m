Return-Path: <prvs=068970028=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Jun 2019 11:11:04 UTC
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id AECED7E6B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1561115466; x=1592651466;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=s+lQN+RjzPB65Gz5m/6Zm+rTq7MWcBXibn18fJ3hwYs=;
	b=BTVdgfnnL/EqUbyZyRULnenSg4/J6NAfLmD28v8LnAziMSiPKNBUnDnt
	WfklU+PGKY9MFFqMB5zrzs5GT5TRy0C/an3Kp55C8umUZXyjWAzQYtTiz
	funP2sXoWT/ZkOFGvXmQjBo8D5Q85gI+/mVJ4htjGH1nlMn41+qPGFJxF 8=;
IronPort-SDR: /Qg1W9r+0+KNwomf5dBY/nzGH4NCQ0mMAYo+hPnk9jz6UTNIebMr7MPlGVcsRBebVG+GxT1u3p
	e1BpIdcSx2/LwkjdRR2QviQwcPyoQ/Mconz+ipdNMEEEeyXgIrFsGiArjJg/PDsYPYCZVWyBeL
	B6V+jOT7y7uD94IrlMaIhhlFpOqrhGDXi+RcuKGp1RDDyEvZMFm4RcOtp921QbpAHcnlIbQj1E
	SLwRIqfVLVyV2VrfzSjc9T+9486jBcy/bnpg7dB4OzP9fO6eXYoqjFDZATAmndd8MVGaio0NBV
	VBM=
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 21 Jun 2019 13:03:58 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
	21 Jun 2019 13:03:57 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb1.muc with ESMTP/TLS; 21 Jun 2019 13:03:57 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Fri, 21 Jun 2019 13:03:57 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Fri, 21 Jun 2019 13:03:57 +0200
From: <Mikko.Rapeli@bmw.de>
To: <lemagoup@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/4] cve-update-db: New recipe to update CVE
	database
Thread-Index: AQHVKCEF/7FR1WB9kkiS/l8PQE4K9A==
Date: Fri, 21 Jun 2019 11:03:56 +0000
Message-ID: <20190621110356.GO3459@hiutale>
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
In-Reply-To: <CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.34]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Fri, 21 Jun 2019 11:11:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <45AE1A885780944A839A68C2FA36DE16@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

This adds python3 urllib3 (python3-urllib3 in Debian) to build environment
dependencies. It's the first user of urllib3 in poky, AFAIK. Maybe
documentation could be updated too, e.g.
https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#brief=
-build-system-packages

On my Debian 9 build container python3-urllib3 wasn't installed by default
or via other dependencies.

Thanks for these features!

-Mikko=

