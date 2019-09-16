Return-Path: <prvs=15518f367=Mikko.Rapeli@bmw.de>
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id 199E77EE97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1568637792; x=1600173792;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=XQnUuu/StpmDGSmsMowk9ds5c+1q6OrwaXWkObLPPAQ=;
	b=YA8xgodjFqukTvmwEjDnlSLPlIQWtCojnmVBNRqnlJVzB+WDQb/1VL73
	AL2f6IgjHA5B6BdICsXqllfEHykbs8wxHcsUj1rar6JKgR5vpchAJu+72
	zubFpC2QPmhgAsEn5j2AobYV35XGeP8R41BfUVkHEYMWd8xjGcj6+MU5M c=;
IronPort-SDR: KnGzO0w1JaHp6O0r+U/VAyvQor/hsVPBuNm0sDgBaFSVGHAtHn5QHi1qoIvwRJlBfP6s4mE7Al
	qci1vvFne+RBtZfTKJHuRn+yB9H9Pr93/5GtzEmbgXdzZxpsWLJz0SZsWDDVK+GV8YOSd6nkIM
	1l9FGDmfEj07IKBmf/0HT2tQskMywe5DTXx4diSFvy8827svD2ivs52xRVaN7hxLroTI0XGngL
	19GLHUbsLVbfhdsv3YE8mAuF8/cCmla8PxWsWPVIIv969qE7Nzy5nPU/oMA61zRgi+kcJpHEKA
	a2Q=
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 16 Sep 2019 14:43:10 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
	16 Sep 2019 14:43:07 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb3.muc with ESMTP/TLS; 16 Sep 2019 14:43:07 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Mon, 16 Sep 2019 14:43:05 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Mon, 16 Sep 2019 14:43:05 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] busybox.inc: handle empty DEBUG_PREFIX_MAP
Thread-Index: AQHVbF6sAKFPmiT1vkWnxTUxcb1uD6cuHLeAgAABlQA=
Date: Mon, 16 Sep 2019 12:43:05 +0000
Message-ID: <20190916124304.GP6154@hiutale>
References: <1568618176-5365-1-git-send-email-mikko.rapeli@bmw.de>
	<71c210c6-abf0-4c0c-06b6-1a7bf01279e7@intel.com>
In-Reply-To: <71c210c6-abf0-4c0c-06b6-1a7bf01279e7@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.42]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] busybox.inc: handle empty DEBUG_PREFIX_MAP
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
X-List-Received-Date: Mon, 16 Sep 2019 12:43:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7244437FB459F489410EE47070C86F1@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 16, 2019 at 01:37:25PM +0100, Ross Burton wrote:
> Hi Mikko,
>=20
> This is 1/2 but 2/2 never arrived on the list.  Can you repost it?

Sorry, 2/2 from my poky tree was the bitbake svn fetcher patch in
http://lists.openembedded.org/pipermail/bitbake-devel/2019-September/020328=
.html

Can you ignore the numberings or shall I send again without them?

-Mikko=

