Return-Path: <prvs=157cabe6c=Mikko.Rapeli@bmw.de>
Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com
	[68.232.133.201])
	by mail.openembedded.org (Postfix) with ESMTP id 6C62B90009
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 05:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1568786056; x=1600322056;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=AaAoNiO8ALnUa7+zxq2j7XZzG56pcWZTGcjRZ7aW7Y4=;
	b=E7gf4XYbPfqjRv0eOSA3FITPyV4cyhfi+3fKegyxHW6vXw/5SxkNoPPJ
	dD5qIJcdck5oQPjvU/fRkUEG7lX6POsK5oyqMJfxtYSaKeHIi3PG7LgqX
	Ki4TMThKuJUmIR1m44vgIW/a4uvAZu478CB4gVr/6o0DqJEXHiq90ODS/ A=;
IronPort-SDR: 321ebWOj+b3E4LJP+YAs81PJerTFVNc1eimzWL5Yjz1BQHYMoaSY072vSsccvgLMaKY8XdbE9m
	r0MtkHfByTnzkNOKKLD2QiRJYmqDvJbXS5LMrvO4jNNsSrX5VSGUCJ4OPvcrt402DllRHgIaQc
	HnnuBcITsBtwMk3SKCvlhLRSVZaB+tCqfdnUEXSkKN8KFIl3wEDdi01a30fDFWfWzrmwUwIwVK
	sx6sYM5DGOl7+nvWG25QE/Q3x9pHO5vNgYwNRKL4Twb3acgMybCZYeKEdtUQdaUQySQM1zLXTW
	A08=
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 18 Sep 2019 07:54:14 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw4.muc with ESMTP/TLS;
	18 Sep 2019 07:54:13 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb2.muc with ESMTP/TLS; 18 Sep 2019 07:54:13 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Wed, 18 Sep 2019 07:54:13 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 18 Sep 2019 07:54:13 +0200
From: <Mikko.Rapeli@bmw.de>
To: <muislam@microsoft.com>
Thread-Topic: [OE-core] [thud][PATCH v4] gcc:  CVE fix for gcc <CVE-2019-15847>
Thread-Index: AQHVbaKAMYz98HJYkUOhh/MzKff5TacwzjCA
Date: Wed, 18 Sep 2019 05:54:13 +0000
Message-ID: <20190918055408.GM6154@hiutale>
References: <20190917215408.18288-1-muislam@microsoft.com>
In-Reply-To: <20190917215408.18288-1-muislam@microsoft.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.34]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH v4] gcc: CVE fix for gcc <CVE-2019-15847>
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
X-List-Received-Date: Wed, 18 Sep 2019 05:54:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79AB3F1B97EC53498B3FA9B0D406A3D3@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Looks ok, though I would consider updating to point releases or latest
versions of the gcc-8 stable tree, where these patches are already backport=
ed
by upstream developers. The 8.3 update does not have this CVE patch, but
a lot of bug fixes which should be useful for gcc 8 users.

Reviewed-by: Mikko Rapeli <mikko.rapeli@bmw.de>

-Mikko=

