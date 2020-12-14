Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.38638.1607967803507600035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 09:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=XTcx2eNZ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1607967803;
  x=1639503803;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=3+jC/bkyZtd2uSNQ8ChLjOn1Bn1vWCy2Rkv0bzORyws=;
  b=XTcx2eNZBLz0zUXvZ7Jh8Gc0i+L/ZRyFAHzN/BakzxfRU/qU6tJv52/T
   LSY17U79cy082ghsf9ZKPwTz+f9yK79ovy2IIlci1hC+kDAZJlab4YCb7
   8heUm2ExaSKmXsBMm9pEpzR5IUa4RXQtR0rDR++BIEue+0HvLzUxY2dCG
   bXFk38bKPSKKzICVftMwGGYKTQMjZEW8VYuLLa/dyiVpfC313Ty8cyQmv
   wGlMIBIFUAOqVM/JZfQ6yeBFhj1SkEnyUsa9f/YQQatWsPQlU94Nb+VdV
   RWLIB6S7phNQ5tk0sINF/xtosRUxROEm3Es/XzS0BUTETc6qS742QLOcg
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Subject: How to create a directory in multiple packages?
Thread-Topic: How to create a directory in multiple packages?
Thread-Index: AdbSQJc4B4k2YOYSQY+O793Rgwk5dA==
Date: Mon, 14 Dec 2020 17:43:18 +0000
Message-ID: <9f740ac720f742ab869a15de54cf865e@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Say we have a recipe that creates an empty /etc/foo directory. Now we=20
want to add a new file in that directory /etc/foo/bar and package it as=20
${PN}-bar. This means the creation of the /etc/foo directory is moved=20
from the ${PN} package to the ${PN}-bar package. Is there any way to=20
make ${PN} continue to create an empty /etc/foo, or is the only=20
alternative to introduce an /etc/foo/.dummy and package it in ${PN}?

//Peter

