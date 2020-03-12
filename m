Return-Path: <prvs=333343292=Mikko.Rapeli@bmw.de>
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id ECFB860B4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1584016463; x=1615552463;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=JjaCOziRxOnj7UhCRIG3w92XO5hlkK1AqiGEGenZ/DM=;
	b=mae/+fmO9sgdeXpkwtCYwAWlaqFg9kiv/miHIIFTpvy/aqpOh912gryQ
	GCRJv45IEEQoVdltHTiltCXwTumhEyhuk1JULRLfzsBTWPQEO75e9WZ/r
	JRXD/okXqQztuIZN3Gqa1uo9p5EvYfVG7HJdGzmvKrGpOPGX8SYJsLlf9 c=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 12 Mar 2020 13:34:20 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw1.muc with ESMTP/TLS;
	12 Mar 2020 13:34:19 +0100
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb5.muc with ESMTP/TLS; 12 Mar 2020 13:34:19 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Thu, 12 Mar 2020 13:34:19 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 12 Mar 2020 13:34:19 +0100
From: <Mikko.Rapeli@bmw.de>
To: <anuj.mittal@intel.com>
Thread-Topic: [OE-core] [PATCH] [zeus] aspell: CVE-2019-20433
Thread-Index: AQHV+E/63kZ9JBBQ50+WAdtzEWjdnKhE0TSAgAACgAA=
Date: Thu, 12 Mar 2020 12:34:19 +0000
Message-ID: <20200312123418.GR104502@korppu>
References: <20200312092322.28506-1-stefan.ghinea@windriver.com>
	<67257554ffe08ac11b8f1cf3da115ba5a7e35fbd.camel@intel.com>
In-Reply-To: <67257554ffe08ac11b8f1cf3da115ba5a7e35fbd.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [zeus] aspell: CVE-2019-20433
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
X-List-Received-Date: Thu, 12 Mar 2020 12:34:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F9DB537CA4B2E44ABD4B401A2A2036DF@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2020 at 12:25:21PM +0000, Mittal, Anuj wrote:
> It looks like this is changing the API. I wonder if this would need any
> other change or break something elsewhere in OE-core, meta-oe?
>=20
> http://aspell.net/buffer-overread-ucs.txt

Debian classified issues as minor and fixed only by updating
to 0.60.8:

https://security-tracker.debian.org/tracker/CVE-2019-20433

https://metadata.ftp-master.debian.org/changelogs//main/a/aspell/aspell_0.6=
0.8-1_changelog

Maybe whitelist for stable branches and update to new version on master?

Cheers,

-Mikko=

