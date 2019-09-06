Return-Path: <prvs=14556ee86=Mikko.Rapeli@bmw.de>
Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com
	[68.232.133.201])
	by mail.openembedded.org (Postfix) with ESMTP id 78AED7F363
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1567763002; x=1599299002;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=LOAMI/Q4KhdKNDyLMbuynP3sEJ/drxgfraL9duJWsGk=;
	b=ZDvVxjVtdnyXCL7khJBuTntNPAs+k0iNNo5xjBCU09zS5v/JaXDNCmH3
	uNd5YzSaIPa4ALEc2bfG99rBVWnPLh/NyjSNt/cD+mvrIWkTL78G7mC1p
	vvkBPnoHabbmiGj8DiLxli+2aoVV+RqBFTs18FWa0+5xY6UGyE+l5zbjW M=;
IronPort-SDR: aPs7+EP9K7J+XdfYxfyIUTQLLvQIf2HOEw7jB4qHBvJjWZaF2fA0p4VNJ/WITP46SrN6Qf2aEl
	8X1zsmdvzItcLY5TB6OzowZPQWjXYBso9gUO5r4M3wAGjuBTM8fqAf++yHI0LVasg4DiSqfVh5
	4C5kciXHbWeSQYuufzAuxgkZWofzmMljwae7KkyXliyFACylXu2ieYa9rZvtG6/iHbDH0RznFY
	a1I6AZ2vwI8ilWAxLIRfgXtNDwg69SvWQ6BQfXjHhEyKg3k9zMFN3YTLoYGmex48gWfRKg6eFF
	p7o=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 06 Sep 2019 11:43:21 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
	06 Sep 2019 11:43:20 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb2.muc with ESMTP/TLS; 06 Sep 2019 11:43:20 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Fri, 6 Sep 2019 11:43:19 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Fri, 6 Sep 2019 11:43:19 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] systemd: ensure reproducible builds by clearly
	exposing the time epoch support
Thread-Index: AQHVZIl26Qp36vankES4uB2+wLaIJKceOToAgAALM4A=
Date: Fri, 6 Sep 2019 09:43:19 +0000
Message-ID: <20190906094319.GS3040@hiutale>
References: <20190905230706.31765-1-ross.burton@intel.com>
	<20190906080244.GQ3040@hiutale>
	<08bbe1da-daa8-cd05-b684-befb79353dbb@intel.com>
In-Reply-To: <08bbe1da-daa8-cd05-b684-befb79353dbb@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.33]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: ensure reproducible builds by clearly exposing the time epoch support
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
X-List-Received-Date: Fri, 06 Sep 2019 09:43:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B160A00F9161A440B582B30FC2B46751@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 10:03:14AM +0100, Ross Burton wrote:
> On 06/09/2019 09:02, Mikko.Rapeli@bmw.de wrote:
> > Could this be enabled automatically when local.conf has INHERIT +=3D "r=
eproducible_build" ?
>=20
> The default behaviour is to respect that if enabled, otherwise use the
> upstream default of the build time.  If the recipe followed the
> reproducble_build inherit then if a user wants reproducible builds but
> doesn't want the epoch then they won't be able to disable it (after all, =
an
> epoch of 0 is reproducible).

Ok, fair enough. Thanks for this patch!

-Mikko=

