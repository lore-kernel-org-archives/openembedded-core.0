Return-Path: <prvs=219fd49cd=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id D9F097F365
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1574177844; x=1605713844;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=zMuNo3l9q/wQPO3ICr2cf29zHY1oPwzvL+aFJ4HcuQg=;
	b=B/J+7zSNt2j6vkDCSEIQfb8X+h6hS88orLZYD2N9vAlQ3G/kkKJhdzvX
	aGMbrmXVCQIAt0N4Fycl+LV7UZJj7jc5jPg+m3OsQIX8EXq4Qd15nj3qK
	rTqxR4n/iHnDmGTA37SsWwUWbkhjCjniUnJI83pucJHW9yCB0diPgaXDO A=;
IronPort-SDR: jJIsEMESFD0634yh0+9eYpjbZiN804/+1Jm+sA5fTCqP+MUkXKsDhA+wQK1AGpnz02fcRKUK1B
	QUQHBj/iLzfq6Mcfkv14DYltNucL0g7iCLZ8GN/7aHPmY9AeVbMT2JpbNrZIror46jHEuu6c/o
	QeaHtFQlUbs2nZ9eD2XuhdaF5YHlDIJmf4Y2GwSVu5Y9cKNrV+8KzMV2XvDGp87oWx3NSL9d6O
	7BDBlJQbW7os6SXj96jkZTF4eQTRU7FVZg25b+awXibjJYA+xLOajA3ilbGGYoGq6k6AkZOca1
	vy0=
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 19 Nov 2019 16:37:23 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw6.muc with ESMTP/TLS;
	19 Nov 2019 16:37:22 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb3.muc with ESMTP/TLS; 19 Nov 2019 16:37:22 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Tue, 19 Nov 2019 16:37:22 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Tue, 19 Nov 2019 16:37:22 +0100
From: <Mikko.Rapeli@bmw.de>
To: <nick83ola@gmail.com>
Thread-Topic: [OE-core] Oe-core: python and BBCLASSEXTEND = "native nativesdk"
Thread-Index: AQHVnu0VqTBVIEGA+0enzSMM2y5McaeSj9oA
Date: Tue, 19 Nov 2019 15:37:22 +0000
Message-ID: <20191119153722.GG3527@hiutale>
References: <CABPh3UNv+RcyrU8crvf4PAU--s-trBgBYj0-Er5eHan9_Gy6RQ@mail.gmail.com>
In-Reply-To: <CABPh3UNv+RcyrU8crvf4PAU--s-trBgBYj0-Er5eHan9_Gy6RQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Oe-core: python and BBCLASSEXTEND = "native nativesdk"
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
X-List-Received-Date: Tue, 19 Nov 2019 15:37:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E03559C046928741BCE671C2F8ADAFD1@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 19, 2019 at 03:21:22PM +0000, nick83ola wrote:
> Dear Openembedded developer,
>=20
> a lot of python recipes need to add the
>=20
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> To the recipe to build the native version of the package.
> Wouldn't be better to add it to the pythonnative.bbclass by default?

I agree to this. I have lots of bbappends which only add BBCLASSEXTEND =3D =
"native nativesdk".

This would not mean that python recipes would all compile or work on native=
 or nativesdk
target, but quite a few of them would work out of the box.

-Mikko=

