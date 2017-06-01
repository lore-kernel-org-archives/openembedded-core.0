Return-Path: <prvs=31872cab3=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Jun 2017 09:54:43 UTC
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD1860291
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1496310886; x=1527846886;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=hyPL06EyTmYPFaSxSViurxbbgSCKOGnXPck4oGFuNHE=;
	b=FJZhoeNgqpJ2CnFjcPqTaurQ5RI6YYkLlFPdH786UYsF1iLnfCmcl/e5
	GUSnokexW0JlZ+yE4i5QbxKRPrZZI8RWZtpTgSDWrF7cMBzPobxgL7akz
	8osTpCTM+l0LoBe/V/MwwN+sQmJvFc/Yria/f9vqcwUI09BgaomuM7t1U 4=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 01 Jun 2017 11:44:48 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw2.muc with ESMTP/TLS;
	01 Jun 2017 11:44:46 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb3.muc with ESMTP/TLS; 01 Jun 2017 11:44:44 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Thu, 1 Jun 2017 11:44:43 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1263.000;
	Thu, 1 Jun 2017 11:44:43 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] Fix return value checks from subprocess.call()'s
Thread-Index: AQHS0G/7wjrREpahp0apkdMg+WxVPaIPtP2A
Date: Thu, 1 Jun 2017 09:44:43 +0000
Message-ID: <20170601094443.jmsxjzdkghtw4wsf@hiutale>
References: <1495178237-22689-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1495178237-22689-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Subject: Re: [PATCH] Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Thu, 01 Jun 2017 09:54:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <06899357B848E3449808EDF6E70C3603@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 19, 2017 at 10:17:17AM +0300, Mikko Rapeli wrote:
> Python function subprocess.call() returns the return value of the
> executed process. If return values are not checked, errors may
> go unnoticed and bad things can happen.
>=20
> Change all callers of subprocess.call() which do not check for
> the return value to use subprocess.check_call() which raises
> CalledProcessError if the subprocess returns with non-zero value.
>=20
> https://docs.python.org/2/library/subprocess.html#using-the-subprocess-mo=
dule
>=20
> All users of the function were found with:
>=20
> $ git grep "subprocess\.call" | \
>   egrep -v 'if.*subprocess\.call|=3D\ +subprocess\.call|return.*subproces=
s\.call'
>=20
> Tested similar patch on top of jethro. Only compile tested core-image-min=
imal
> on poky master branch.

Any comments to this patch?

-Mikko=

