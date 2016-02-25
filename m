Return-Path: <prvs=8563a89e7=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 21300772F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:09:44 +0000 (UTC)
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 Feb 2016 15:09:44 +0100
Received: from unknown (HELO esabb1.muc) ([160.50.100.31]) by esagw4.muc with
	ESMTP/TLS; 25 Feb 2016 15:09:43 +0100
Received: from smuch51a.muc (HELO SMUCH51A.europe.bmw.corp) ([160.46.137.115])
	by esabb1.muc with ESMTP/TLS; 25 Feb 2016 15:09:43 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH51A.europe.bmw.corp ([160.46.137.115]) with mapi id 14.03.0248.002;
	Thu, 25 Feb 2016 15:09:43 +0100
From: <Mikko.Rapeli@bmw.de>
To: <mariano.lopez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Add initial capability to check CVEs for
	recipes
Thread-Index: AQHRb8YPTPKRB7zS1kqsvPG9SjQg2J88n/SAgAAQYICAAAu0AA==
Date: Thu, 25 Feb 2016 14:09:42 +0000
Message-ID: <20160225140942.GE6210@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
	<20160225132748.GD6210@loska>
In-Reply-To: <20160225132748.GD6210@loska>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.99]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Thu, 25 Feb 2016 14:09:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E7002833535DE498A4CDE3EEC9BCB11@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

For openssh there must be some bugs or tunings needed to match the version
numbers used in CVE to ones in yocto. openssh-6.6p1 has zero matches
with the check but I think there are several:

downloads/CVE_CHECK$ grep openssh *xml| grep 6\.6\:p1
nvdcve-2.0-2016.xml:        <cpe-lang:fact-ref name=3D"cpe:/a:openbsd:opens=
sh:6.6:p1"/>
nvdcve-2.0-2016.xml:      <vuln:product>cpe:/a:openbsd:openssh:6.6:p1</vuln=
:product>
nvdcve-2.0-2016.xml:        <cpe-lang:fact-ref name=3D"cpe:/a:openbsd:opens=
sh:6.6:p1"/>
nvdcve-2.0-2016.xml:      <vuln:product>cpe:/a:openbsd:openssh:6.6:p1</vuln=
:product>

How should these tunings be made?

-Mikko=

