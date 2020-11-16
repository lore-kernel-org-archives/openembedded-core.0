Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web08.36047.1605539692052107612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 07:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=b3GrmC/R;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=613; q=dns/txt; s=iport;
  t=1605539692; x=1606749292;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tnBdABLH73XR4Nubr4L2JyXgDndFI3e6UjuvjVhkSv8=;
  b=b3GrmC/RTh6U4jBapihik3gJ5nm8hIFJxGkP8MkiKZisglHwQhmqSPMq
   ZqwcAS+4m++kPs3B0ho+Is8fjy7XMG4ffcEUFn4oWU7CkVuWAMvgZGJxX
   X/WgP20IW3ieXbMXmzSCHdcjJuhlEAKvsMWtlCnaOrbJlP8gKdIR5J51K
   8=;
X-IPAS-Result: =?us-ascii?q?A0CnCADSlrJffYsNJK1iHgEBCxIMQIVGLxggsgILAQEBD?=
 =?us-ascii?q?QEBLQIEAQGESgKCHgIlOBMCAwEBAQMCAwEBAQEFAQEBAgEGBBQBAYZIhXMGe?=
 =?us-ascii?q?RACAQghJQ8jJQIEDoYyr0d0gTSKP4E4jUAbgUE/g241PoQ+hXYEnEKbbAogg?=
 =?us-ascii?q?k2bFSKDB55ytCUCERWBMzghgVlwFYMlTxcCDZxogSsCBgoBAQMJfIw7AYEQA?=
 =?us-ascii?q?QE?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,482,1596499200"; 
   d="scan'208";a="591047498"
Received: from alln-core-6.cisco.com ([173.36.13.139])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 16 Nov 2020 15:14:51 +0000
Received: from XCH-ALN-004.cisco.com (xch-aln-004.cisco.com [173.36.7.14])
	by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 0AGFEpfc027074
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 16 Nov 2020 15:14:51 GMT
Received: from xch-aln-004.cisco.com (173.36.7.14) by XCH-ALN-004.cisco.com
 (173.36.7.14) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Nov
 2020 09:14:50 -0600
Received: from xch-aln-004.cisco.com ([173.36.7.14]) by XCH-ALN-004.cisco.com
 ([173.36.7.14]) with mapi id 15.00.1497.000; Mon, 16 Nov 2020 09:14:50 -0600
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        "Denys Zagorui -X (dzagorui -
 GLOBALLOGIC INC at Cisco)" <dzagorui@cisco.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for arm64
Thread-Topic: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for
 arm64
Thread-Index: AQHWrejRVNz5C+744kaUUDNWNcIlOamwE3FkgA+MDTSAC1rm0Q==
Date: Mon, 16 Nov 2020 15:14:50 +0000
Message-ID: <1605539690406.1214@cisco.com>
References: <20201029114052.23141-1-dzagorui@cisco.com>,<CADkTA4OGBOtnMD=t1xppe-5quLow8uPf99ZHknrSnPLAQKkoDA@mail.gmail.com>,<1642C502B17F26A6.28917@lists.openembedded.org>,<1645CE4049F0E4CD.31324@lists.openembedded.org>
In-Reply-To: <1645CE4049F0E4CD.31324@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [173.38.209.11]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.14, xch-aln-004.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=0A=
> > > .vdso-offsets.h.cmd contains command that was used to produce vdso-of=
fsets.h.=0A=
> > > It breaks reproducibility because it has an absolute path in it. Ther=
e is no=0A=
> > > any value to package such files so it can be dropped.=0A=
> > >=0A=
> >=0A=
> > Have you confirmed that an on-target 'make scripts prepare' property=0A=
> > regenerates the file without triggering and oldconfig ?=0A=
> >=0A=
> > Otherwise, the change looks fine to me.=0A=
> >=0A=
> > Bruce=0A=
>=0A=
> Yes, confirmed that oldconfig wont be triggered.=0A=
>=0A=
> Thanks,=0A=
> Denys=0A=
=0A=
ping=0A=
