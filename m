Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com [68.232.133.110])
 by mx.groups.io with SMTP id smtpd.web11.5311.1592479730826652709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 04:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=bn5sEmfz;
 spf=pass (domain: bmw.de, ip: 68.232.133.110, mailfrom: prvs=431bfba97=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1592479731; x=1624015731;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/1Pbduq7WJ6b+LGMZMVUtLYTd5H+f7oi2Akcn2xzXTo=;
  b=bn5sEmfzjIcNOqE2E1n79NeHlcdRIS2/B8X6dNbUcM8IYu6TP3RJTgEV
   xTP0dXfVfvG982fiCu3At2AEgl5u+sKeXKNh9TAvjBHVOafcju6fIC0SP
   nUGm1h6nvCiD5ONMJW7VLmrnopz3oXK91fjDpB9ZfkaawZ60MABn/hEiZ
   I=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 18 Jun 2020 13:28:45 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw3.muc with ESMTP/TLS;
 18 Jun 2020 13:28:28 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp) ([160.48.96.46])
 by esabb4.muc with ESMTP/TLS; 18 Jun 2020 13:28:26 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10j.europe.bmw.corp
 (160.48.96.46) with Microsoft SMTP Server (TLS;
 Thu, 18 Jun 2020 13:28:26 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Thu,
 18 Jun 2020 13:28:26 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <Awais_Belal@mentor.com>
CC: <pbarker@konsulko.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for environment-setup beforehand
Thread-Topic: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for
 environment-setup beforehand
Thread-Index: AQHWROifRftvJyOgsEGsvY4gFx2ae6jd3uOAgAAD0YCAACQzAIAAFOmA
Date: Thu, 18 Jun 2020 11:28:26 +0000
Message-ID: <20200618112825.GV108868@korppu>
References: <20200617204739.22441-1-awais_belal@mentor.com>
 <CAM9ZRVvciD5BRLYnimK1AN9_BGZ8J8oK=keywSv2EGbOkwjK+Q@mail.gmail.com>
 <20200618080401.GS108868@korppu> <1592475214481.69521@mentor.com>
In-Reply-To: <1592475214481.69521@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <454ABC3FD395AC48878F12D6E5BAED7C@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 18, 2020 at 10:13:34AM +0000, Belal, Awais wrote:
> > I'd change the script to run with bash and "set -euo pipefail" to captu=
re
> > errors like this early.
>=20
> The toolchain-shar-relocate script comes in through the replacement of SD=
K_PRE_INSTALL_COMMAND in toolchain-shar-extract so it cannot decide to use =
bash itself. Also, I don't think it would be a good idea to introduce a spe=
cific shell binding for such scripts.

I've come to the conclusion over the last 20 years that only way to maintai=
n
sanity with shell scripts is "set -euxo pipefail" right after #!/bin/bash :=
)

Might work with other shells too but on Linux (build) systems bash is alway=
s there.
Tiny embedded targets are a different story...

But you decide which path to take in this case.

Cheers,

-Mikko=
