Return-Path: <prvs=068970028=Mikko.Rapeli@bmw.de>
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id DAF267D2BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1561122099; x=1592658099;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=cOoAdDafHB7IwN4Qj3bbSQemCIA385DdhKQsnryDwFI=;
	b=aYPQlkneJnI0ZqouAymAQU3Qv73poDpNNMA6zzoRNTeMSvXLstFyjkCF
	AdIWMdVlGI7ASD9wKlyzfdpHzfE7Fxhtj3/aNh6/zMoRANxwbbfZ7e7m1
	DnvorIzrptN+LY9a8LR6Tfr7S+Gdjw9juGoJliTVHJaZo4VLevYGeHxWW M=;
IronPort-SDR: l1KDQ+qUO2R/irXd+pMYckOYSuGzanSYCoobIi6T65mpqIeLDT1IUFEweZlmA27GHOBOqUBpcW
	fVDp8y+mjZzvSF6+aK6HypE2p13NngLHVnQQ1hNK4L1+S9DvWZMZjyaXyakBD1U71mDsZkn1i1
	GHcCaIcwGiSa1DOl8aeo2f2FEJ96uMOTrIU23eRSu0rmpqzneClSZz28jOjINHRuYyluQvnlhJ
	6ZT/5Gf2uL6HxNzw4YTa5atrtYaHy2diED5kfVUHBJDF/3y637DV11yHoIFR9ajAzAUS2bR8qs
	lmE=
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 21 Jun 2019 15:01:31 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw1.muc with ESMTP/TLS;
	21 Jun 2019 15:01:30 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb2.muc with ESMTP/TLS; 21 Jun 2019 15:01:30 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Fri, 21 Jun 2019 15:01:30 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Fri, 21 Jun 2019 15:01:30 +0200
From: <Mikko.Rapeli@bmw.de>
To: <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/4] cve-update-db: New recipe to update CVE
	database
Thread-Index: AQHVKCEF/7FR1WB9kkiS/l8PQE4K9Kal6BoAgAAI/QA=
Date: Fri, 21 Jun 2019 13:01:30 +0000
Message-ID: <20190621130128.GU3459@hiutale>
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
	<CAJTo0LZNdM8zb7E4r++zWY44RC2y2PebWsA4CBY7c6CGA-FfQg@mail.gmail.com>
In-Reply-To: <CAJTo0LZNdM8zb7E4r++zWY44RC2y2PebWsA4CBY7c6CGA-FfQg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.33]
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
X-List-Received-Date: Fri, 21 Jun 2019 13:01:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3F4CEE26A2BF1547B4664B1615B0A619@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 01:29:18PM +0100, Burton, Ross wrote:
> On Fri, 21 Jun 2019 at 12:11, <Mikko.Rapeli@bmw.de> wrote:
> > This adds python3 urllib3 (python3-urllib3 in Debian) to build environm=
ent
> > dependencies. It's the first user of urllib3 in poky, AFAIK. Maybe
> > documentation could be updated too, e.g.
> > https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#b=
rief-build-system-packages
>=20
> Somehow I didn't notice it, thanks.
>=20
> Pierre, can you rewrite this to use standard library instead of urllib3?

Also, the CVE db is updated using this custom task without link to
do_fetch, which means a fetchall task would not update the database for
off line NO_NETWORK builds.

Could the task be added as dependency to do_fetch() or are there some other
side effects?

-Mikko=

