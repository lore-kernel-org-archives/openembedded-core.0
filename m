Return-Path: <prvs=21355fe1c=Mikko.Rapeli@bmw.de>
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 1C06B7F7DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1573660970; x=1605196970;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=GlGdSjY9lZpSFpb0mvW2vS9nZmqVd58HI3/C3H/U7JI=;
	b=TeBsZasANEVSDYDGdK5HzxPXb+alURT4mtsX4nY4qFwCtVvxu2IEEnTQ
	i2BPEWjMCK4K3veFhyzGqario2fNJjsqDUD5CeBC6fRXIC4ShsbLx/1aH
	sk79wCFaalojXC7PLFhuO/ID8IdFv3MD7xeQ9RXolZn4y994wRL5Fn5S4 c=;
IronPort-SDR: sNt2azMkM26UMAdS6VtI0FFzQIgTwkvBPbCViNHWjGft+tx3Tyw9krc9WGH5oE63g13WFkzeiI
	41c3VmZBAwOX11qosHmBG5SikDc/vmwPTVx12vvsgKujDR339HZGj3BP6DfJDfbNfOK/B64LQw
	JxbW2VUJujFeKN5Pkq3D+kDWak3944LnurCw2NCQYSaBRojlJJI1ilAopBitWuEz4B0No5X2ac
	hsJRpDbB7TRZXEAUVtwBOpVQfi213JfbkY6ljPOIzAj1v3wlPuhePn3mtiZdKir/SwZZREaiDA
	V6M=
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 13 Nov 2019 17:02:45 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw6.muc with ESMTP/TLS;
	13 Nov 2019 17:02:44 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb6.muc with ESMTP/TLS; 13 Nov 2019 17:02:43 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Wed, 13 Nov 2019 17:02:43 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 13 Nov 2019 17:02:43 +0100
From: <Mikko.Rapeli@bmw.de>
To: <akuster808@gmail.com>
Thread-Topic: [oe] OEDeM minutes clarification regarding stable branch update
	frequency
Thread-Index: AQHVmjvIUDHaMOKVWUeVW80F5Ad5Rw==
Date: Wed, 13 Nov 2019 16:02:43 +0000
Message-ID: <20191113160243.GR2398@hiutale>
References: <ce731d12-a8fc-d90e-a3e2-c7999f8dbf0a@gmail.com>
In-Reply-To: <ce731d12-a8fc-d90e-a3e2-c7999f8dbf0a@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] OEDeM minutes clarification regarding stable branch update frequency
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
X-List-Received-Date: Wed, 13 Nov 2019 16:02:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C6EAE1EEFE719641859DBAD2C29FD28B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 07:48:34AM -0800, akuster808 wrote:
> Hello,
>=20
> Reading through the 2019 OEDeM minutes, I saw a statement regarding a
> more regular update frequency on the stable branches. Based on Richard's
> response I could not tell if it is regarding merge frequency=A0 to
> mainline or more dot releases? Since I was not present at the meeting,
> can someone clarify which one that question was pertaining to or may both=
?

AFAIK, the comment meant more frequent dot releases.

-Mikko=

