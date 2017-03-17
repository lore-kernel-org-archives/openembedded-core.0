Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 210436FFFB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 21:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 674EB2E4D4;
	Fri, 17 Mar 2017 22:32:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id m791hyrB4YdL; Fri, 17 Mar 2017 22:32:22 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 83BE12E3F2;
	Fri, 17 Mar 2017 22:32:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D2FA1A06D;
	Fri, 17 Mar 2017 22:32:22 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 111E71A069;
	Fri, 17 Mar 2017 22:32:22 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 17 Mar 2017 22:32:22 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 04FD8105A;
	Fri, 17 Mar 2017 22:32:22 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 17 Mar 2017 22:32:22 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 17 Mar 2017 22:32:21 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 17 Mar 2017 22:32:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: brian avery <brian.avery@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/1] gen-lockedsig-cache: catch os.link error V2
Thread-Index: AQHSn1kDEqva4yMRoE2dlKbJlTYPQKGZi9Ig
Date: Fri, 17 Mar 2017 21:32:21 +0000
Message-ID: <2585804f225c47279417a3859f6cc305@XBOX02.axis.com>
References: <cover.1489754655.git.brian.avery@intel.com>
In-Reply-To: <cover.1489754655.git.brian.avery@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 0/1] gen-lockedsig-cache: catch os.link error V2
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
X-List-Received-Date: Fri, 17 Mar 2017 21:32:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> brian avery
> Sent: den 17 mars 2017 13:50
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/1] gen-lockedsig-cache: catch os.link error V=
2
>=20
> If your sstate-cache directory is on a different filesystem from the
> one your build is on, gen-lockedsig-cache fails which causes the esdk
> creation to fail. This catches the hard link failure and does a copy in
> those cases.
>=20
> This is a V2 because I took a copy/paste shortcut when I sent in the
> last one and that went as well as I should have expected. This one is
> sent from the machine it was tested on... My bad :(.

Do not make the "V2" part of the subject, make it part of the PATCH=20
prefix, e.g.:

  [PATCH v2 0/1] gen-lockedsig-cache: catch os.link error

Otherwise it will become part of the commit message where it does not=20
make any sense (since there obviously is no V1 committed...)

> -brian

//Peter


