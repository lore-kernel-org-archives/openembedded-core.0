Return-Path: <Ben.Guan@cn.bosch.com>
X-Greylist: delayed 23414 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Dec 2017 08:12:17 UTC
Received: from smtp6-v.fe.bosch.de (smtp6-v.fe.bosch.de [139.15.237.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC79B786EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 08:12:17 +0000 (UTC)
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id D9C85D8009E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 09:09:40 +0100 (CET)
Received: from FE-MBX2038.de.bosch.com (vsgw24.fe.internet.bosch.com
	[10.4.98.24])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id E257E1B80731
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 09:12:17 +0100 (CET)
Received: from SGPMBX1024.APAC.bosch.com (10.187.56.74) by
	FE-MBX2038.de.bosch.com (10.3.231.48) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1034.26; Wed, 6 Dec 2017 09:12:16 +0100
Received: from SGPMBX1024.APAC.bosch.com ([fe80::cc15:fcae:2d92:acc0]) by
	SGPMBX1024.APAC.bosch.com ([fe80::cc15:fcae:2d92:acc0%17]) with mapi id
	15.00.1236.000; Wed, 6 Dec 2017 16:12:14 +0800
From: "GUAN Ben (ST-FIR/ENG1-Zhu)" <Ben.Guan@cn.bosch.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: How to add group for multiple recipes
Thread-Index: AdNuaevA+9tqv6t3Tdqly4iy1vT6ow==
Date: Wed, 6 Dec 2017 08:12:14 +0000
Message-ID: <86cb51797fed46e7a8fc40606f317a2c@SGPMBX1024.APAC.bosch.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.54.142.76]
MIME-Version: 1.0
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-23510.005
X-TMASE-MatchedRID: W46EYm5LvvDD5Q7f7wyexLMsPmSZxbpk81qlqotKQQGCsBeCv8CM/QaT
	alM8C773AUytxV89UzwrgaInFEE2wSVqTewNlt0eE0Q83A2vD+smlwEyKUIIaKMwTtKsxxEao8W
	MkQWv6iVj9cVL65YctQ1fA1QHegDv3QfwsVk0UbtuRXh7bFKB7u2s9pWrWoE4S0CW138hw3f/CN
	ZYT4CwKUFBBaian+jRH8FerAT0dJY=
Cc: "Jonas Mark \(ST-FIR/ENG1\)" <Mark.Jonas@de.bosch.com>
Subject: How to add group for multiple recipes
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
X-List-Received-Date: Wed, 06 Dec 2017 08:12:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

In oe-core, there are some default groups provided by recipe "base-passwd".=
 Any other recipes could refer to these groups when they want to create a n=
ew user.=20

Now we have a requirement: there are several recipes which create their own=
 users, and they shall belongs to a common group. How could we add this gro=
up? It seems that groups or users created in a recipe are only visible to t=
he same recipe. Other recipes cannot refer to them (e.g. using chown/chgrp)=
.

We already tried to add a recipe which only generates the group and added t=
his to DEPENDS of the other recipes. But it seem as if the group was not ge=
nerated in time. When the other recipes ran, the group was not there. But t=
he final image contained the group.=20

Best regards

Ben GUAN
ST-FIR/ENG1-Zhu =20


