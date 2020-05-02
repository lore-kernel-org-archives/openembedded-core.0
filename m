Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.8283.1588436846368579991
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 09:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=FI1lu4gn;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1119; q=dns/txt; s=axis-central1;
  t=1588436846; x=1619972846;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=nj+4sDy4YgZyZonStONxQBhhPmNCrBvQdzuBVY8Umg8=;
  b=FI1lu4gn1fCqpMl9v9N/oSkHTTUmFvxQ62ht2EMCAqSd8ySb7upS+3Tj
   0hJRty+APrTxGMuKUK6l34VVs1MluPx+/NF0P+/782zr+ORdOAiG+nRfL
   n4aS8YF4320PP4iFcNf4IlV6QLia5YZxlPd4K92n1ApyIfaQjtt+65Rfz
   2RJLpMi4F09jQOJ06B10ktnVeQac+exVan4Juk8kR1u8RkbAhAm3G3zb3
   W2c/PKXQxaECRU5xF7iv2NxwS4iXPAUYSQqrozXre9Wgxd1MBrqf7cKTn
   YqsvQ5AnFczaj7GadIVvNgvswV3tufDJ2+2obO9H+c23uCQ/CRA+8UHGI
   Q==;
IronPort-SDR: 56UZvTeRBC1ZqSB6tPXu0UgC4ge0jBhdOFO4oTlPP9k/QZcbKOGnNzuyaoiNd5XnK13pdqHHMV
 zyk2qU1ArQa6hXCFm8kAgKUYs98WOcBRGe0a+G0omUVs0nn6z81Uw2HiUhoq8e9S04fJjyRN85
 R2RO9Gnm8zkkZ6tlBLqEIZxIk2ngosC9g6WbaaTCvWmYasactOsj/r0sA/XrTZOXPd30TqqJZQ
 MuzG2PT01bLgxqfZ+TEctCQ8uytwEr6XpKYiZ4pIPF4m6NpJvCqkY0SfBDhOXxviiUIG5Ld0SS
 ieI=
X-IronPort-AV: E=Sophos;i="5.73,343,1583190000"; 
   d="scan'208";a="8091066"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Subject: Failure when generating image with latest OE-Core
Thread-Topic: Failure when generating image with latest OE-Core
Thread-Index: AdYgnokoBlYXr3hfQ7m1x9gIEqBGdA==
Date: Sat, 2 May 2020 16:27:18 +0000
Message-ID: <0a65790cfa0f43659d0cec942d729b1a@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

After upgrading to the latest master of OE-Core, I get the following=20
error when building an image:

DNF version: 4.2.21
cachedir: <image workdir>/rootfs/var/cache/dnf
Added oe-repo repo from <image workdir>/oe-rootfs-repo
User-Agent: falling back to 'libdnf': could not detect OS or basearch
repo: using cache for: oe-repo
oe-repo: using metadata from Sat 02 May 2020 04:04:01 PM UTC.
Excludes in dnf.conf: rng-tools, shared-mime-info, udev-hwdb
--> Starting dependency resolution
History database cannot be created: <image workdir>/rootfs/var/lib/dnf/hist=
ory.sqlite. Error: SQLite error on ":memory:": Executing an SQL statement f=
ailed: no such column: 1.2
---> Package <internal package> <version> will be installed
History database cannot be created: <image workdir>/rootfs/var/lib/dnf/hist=
ory.sqlite. Error: SQLite error on ":memory:": Executing an SQL statement f=
ailed: no such column: 1.2
Error: SQLite error on ":memory:": Executing an SQL statement failed: no su=
ch column: 1.2

I assume it is related to the recent rpm/dnf update.=20
Any ideas on what's going on?

//Peter

