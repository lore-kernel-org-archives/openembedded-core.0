Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A3CA3785D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 1DEED2E21D;
	Wed, 13 Sep 2017 13:26:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gm9tz-Ja2nus; Wed, 13 Sep 2017 13:26:38 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 30B642E104;
	Wed, 13 Sep 2017 13:26:38 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F82C1E06C;
	Wed, 13 Sep 2017 13:26:38 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01A2E1E06A;
	Wed, 13 Sep 2017 13:26:38 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 13 Sep 2017 13:26:37 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id E6617DCE;
	Wed, 13 Sep 2017 13:26:37 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 13 Sep 2017 13:26:37 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 13 Sep 2017 13:26:37 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1263.000; Wed, 13 Sep 2017 13:26:37 +0200
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] externalsrc.bbclass: Avoid symlink clashes
	for virtclasses
Thread-Index: AQHTLIG88IvNPFUwKkG7d5puA81a6Q==
Date: Wed, 13 Sep 2017 11:26:36 +0000
Message-ID: <1505301996590.67336@axis.com>
References: <20170828145816.17208-1-olani@axis.com>	 ,
	<20170828145816.17208-2-olani@axis.com>
	<1505215422363.98035@axis.com>,
	<1505299304.18640.40.camel@linuxfoundation.org>
In-Reply-To: <1505299304.18640.40.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 2/2] externalsrc.bbclass: Avoid symlink clashes	for virtclasses
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
X-List-Received-Date: Wed, 13 Sep 2017 11:26:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

________________________________________=0A=
> From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
> Sent: Wednesday, September 13, 2017 12:41=0A=
>=0A=
>On Tue, 2017-09-12 at 11:23 +0000, Ola x Nilsson wrote:=0A=
>> I noticed that the preceding commit has been merged.=0A=
>>  Is there some problem with this one?=0A=
>=0A=
> Its not something I can describe easily, more a gut feeling that is=0A=
> shared by some others I've talked to.=0A=
>=0A=
> Basically externalsrc is turning into an ever more complicated pile of=0A=
> corner cases and it worries me a lot. I can't help thinking we really=0A=
> want to simplify and streamline this, not add more complexity to it.=0A=
=0A=
Can't argue with that.=0A=
=0A=
/Ola=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=

