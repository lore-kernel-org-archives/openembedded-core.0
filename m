Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web09.10706.1610465611157492085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 07:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=iL9S5off;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=639237214=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1610465611; x=1642001611;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=d0wQTo6dR4G0ScmadiVOCllPzleTE4FKtNvr4CVCeaM=;
  b=iL9S5offmh/q4C/O7q9sLnfnAwKVwdpcfTPSxo1JHrMRP+SmT93x3pfq
   Hbe+4NUEmzHwcxVXhCrLjMwL0l3TWzY1FmEGKhPPXnFiFRMshihFruVkq
   JoMney/zYCDuUcUJj8vKlp9K+myx9ZDJ6YuPNmu1mvPNz+2s3bfnoIxoZ
   4=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 12 Jan 2021 16:33:27 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
 12 Jan 2021 16:33:27 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb5.muc with ESMTP/TLS; 12 Jan 2021 16:33:27 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Tue, 12 Jan 2021 16:33:27 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Tue,
 12 Jan 2021 16:33:27 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <wangmy@cn.fujitsu.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] binutils: upgrade 2.35 -> 2.35.1
Thread-Topic: [OE-core] [PATCH] binutils: upgrade 2.35 -> 2.35.1
Thread-Index: AQHW6JfYrNGqbInMZkepZtaqH0N4+6okDpWA
Date: Tue, 12 Jan 2021 15:33:27 +0000
Message-ID: <X/3BRVxDbCncYdSV@korppu>
References: <1610424117-18134-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1610424117-18134-1-git-send-email-wangmy@cn.fujitsu.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8DF4D8207621AF46972DE64246F86993@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

Would be nice to know a bit more of the update, e.g. a changelog summary
and wether API/ABI changes are in it.

It's important to know if the patch is also needed in stable branches.

Cheers,

-Mikko=
