Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.39615.1608557414255191054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 05:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Sm4ETJRZ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608557414;
  x=1640093414;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IcqzKYAxpbQdzilqgE01jh6+rKHGCyLQSZOaGqyL++U=;
  b=Sm4ETJRZ/eEsNGT8s8jSDcNoMYeSOQLsk3WQ8QpuxmctY5/ZAcd2Dgi9
   XxrI3S32+PTmhUjNrEJRaOER1RcwEny7uP/zHpnHRi/jiw/mw08MtKY9b
   B/GDp3tdJg10/BbNyXxGU6e3CPsEJCLZ6ffmYrS5NLrfu0kmgTQXyBU7G
   icA2VcwRzmsG8ORMFHs6i0DGXcGFs/MLmzXupXXlR8A7FAjkBR/uE5xkh
   qS7NCQjYI4VR2G/cPVHS3ucRXd2MxEyiTTZzT6lAnn7iCaZ5syNuAN/Lt
   dkXqapaXLE1zHgHZZtQPDXYA/JkGnUOxIzdyGkzVYWqhBUMXzkEeGwQz2
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
CC: Anuj Mittal <anuj.mittal@intel.com>, Steve Sakoman <steve@sakoman.com>
Subject: Process for backports
Thread-Topic: Process for backports
Thread-Index: AdbXnKtm+a/764B0TJWzKfDpKztmvw==
Date: Mon, 21 Dec 2020 13:30:12 +0000
Message-ID: <6a47db6d94714b2f9d306d540218c7c9@XBOX03.axis.com>
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

I thought the process for backporting changes in OE-Core was:

master -> gatesgarth -> dunfell -> ...

However, I just noticed that the latest Gatesgarth release (24.0.1)=20
is still at 2020b of timezone, whereas Dunfell (23.0.4) has 2020d.
Am I missing something here, or is this just a miss in communication?

//Peter

