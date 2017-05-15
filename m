Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C798D71C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 09:01:24 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dABsb-00030o-Qz from Awais_Belal@mentor.com ;
	Mon, 15 May 2017 02:01:26 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Mon, 15 May 2017 10:01:22 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Mon, 15 May 2017 10:01:22 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] autogen: fix autoopts script generation to
	handle shebang
Thread-Index: AQHSyyf1Z+lHkWIXCkGvAcE6jL5+q6Hwqu4AgARxwIk=
Date: Mon, 15 May 2017 09:01:22 +0000
Message-ID: <1494838882617.45509@mentor.com>
References: <20170512135918.25150-1-awais_belal@mentor.com>,
	<b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
In-Reply-To: <b3b3d45f-7209-2ba2-a299-5da723ea5008@linux.intel.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH] autogen: fix autoopts script generation to handle shebang
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
X-List-Received-Date: Mon, 15 May 2017 09:01:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Isn't this backwards? And why is PERL set twice in a row?=0A=
=0A=
Really did not get the first question. Regarding PERL being set twice, I am=
 just trying to manipulate it to the actual host binary, is there a better =
way? 'which perl' or 'env perl' will only point to the symlink under HOSTTO=
OLS.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Alexander Kanavin <alexander.ka=
navin@linux.intel.com>=0A=
Sent: Friday, May 12, 2017 7:06 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] autogen: fix autoopts script generation to h=
andle shebang=0A=
=0A=
On 05/12/2017 04:59 PM, Awais Belal wrote:=0A=
> +-        *perl ) echo '#!/usr/bin/env perl'=0A=
> ++        *perl )  PERL=3D`which perl`=0A=
> ++                 PERL=3D`readlink -f ${PERL}`=0A=
> ++                 echo '#!' ${PERL}=0A=
=0A=
Isn't this backwards? And why is PERL set twice in a row?=0A=
=0A=
=0A=
Alex=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

