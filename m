Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id C80A6607DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 21:07:32 +0000 (UTC)
X-AuditID: 0a00029b-de1ff70000000a0a-35-5ad66214a609
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	A1.30.02570.41266DA5; Tue, 17 Apr 2018 16:07:33 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%20]) with mapi
	id 14.03.0301.000; Tue, 17 Apr 2018 16:07:32 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [OE-CORE][sumo][python3] Generated SDK missing sqlite3
Thread-Index: AdPVnHwPMePtm6JKSBC4yynauRDLjQAEquQQAA5LisAAGiCmMAAQf5YAAAbGWYAAChgl8P//usGAgABJwtA=
Date: Tue, 17 Apr 2018 21:07:32 +0000
Message-ID: <655290B7709079438B7932553958E60DA1475E6B@ESS-EX01.essvote.corp.local>
References: <655290B7709079438B7932553958E60DA1475431@ESS-EX01.essvote.corp.local>
	<ae893466-d904-e9e2-005e-a5c750eaf179@xilinx.com>
	<655290B7709079438B7932553958E60DA1475DFB@ESS-EX01.essvote.corp.local>
	<20597063.F8YWRiApNN@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <20597063.F8YWRiApNN@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.33]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsWyRiBPQ1c06VqUwaZV3Ba/1s1ms7jz8x27
	xdVZ4hbzdtg7sHgs3vOSyWPeyUCPcxtXMHrs/fybJYAlissmJTUnsyy1SN8ugStj5cUVjAWv
	uSu2TFzF1MC4kbOLkZNDQsBE4vPemSxdjFwcQgJHGSV+fljACJIQEjjJKPH9rQaIzSZgJHHu
	+iawuIiAoUT3xn6wBmaBx4wSvfOa2UASwgK+Eu/+vmaCKAqQuL3tCDuEnSRx+c9zsDiLgKrE
	yeVnmbsYOTh4BYIkdk1Nh1jcwSTxrGUxE0icU8BZ4vYcA5ByRgExie+n1oC1MguIS9x6Mp8J
	4mgBiSV7zjND2KISLx//YwVplRCQkzh8KxKiXEdiwe5PbBC2tsSyha/BynkFBCVOznzCMoFR
	dBaSqbOQtMxC0jILScsCRpZVjHy5RnqpxcVl+SWpesn5uZsYgZHDxcA0ewdjT1PsIUYBDkYl
	Ht7SqGtRQqyJZcWVuYcYpTlYlMR5A64YRQkJpCeWpGanphakFsUXleakFh9iZOLgBBFcUg2M
	Jmxir3LXRP5Sb9lgmfnqpnDW7OTfWasUEo7Vhdic+iopECNXeXnq/ns35bnbz7w3m7awPzml
	O+jnn6npB7qZ95/9xVupP/ukx4TobXcq3jHfkE3bcPyy7FFRjcs7K4usDE0TfP9u5BHVCLQt
	7wqefK86SE7fvubyAf9yhT1rIrRcGFr/vH+jxFKckWioxVxUnAgAR90IDIICAAA=
Cc: Alejandro Enedino Hernandez
	Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [sumo][python3] Generated SDK missing sqlite3
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
X-List-Received-Date: Tue, 17 Apr 2018 21:07:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a strange luck in hitting those things that work, but aren't the cor=
rect way of doing it.
They always seem to last about 1 version update.  I will make the proper ch=
anges on my side.

Thanks,
Mike

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Tuesday, April 17, 2018 3:22 PM
To: Davis, Michael
Cc: openembedded-core@lists.openembedded.org; Alejandro Enedino Hernandez S=
amaniego; Burton, Ross
Subject: Re: [OE-core] [OE-CORE][sumo][python3] Generated SDK missing sqlit=
e3

Hi Michael,

On Wednesday, 18 April 2018 8:03:43 AM NZST Davis, Michael wrote:
> Actually just recreated it without all my custom cruft in there to=20
> confuse things.
>=20
> I had oe-init-build-env generate a new build dir:
> "source oe-init-build-env  ~/build/test"
>=20
> Added the following to the bottom of the local.conf=20
> TOOLCHAIN_HOST_TASK +=3D " nativesdk-cmake \
>                          nativesdk-python3"
>=20
> Create the sdk:
> " bitbake core-image-minimal -c do_populate_sdk_ext"

I'm afraid this is not the correct way to add items to the eSDK. See:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10600
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9479

I think at the moment what you need is:

SDK_TARGETS +=3D "cmake-native:do_populate_sysroot \
                           python3-native:do_populate_sysroot"


Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre



