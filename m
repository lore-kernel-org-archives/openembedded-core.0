Return-Path: <avinash.reddy.palleti@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4867E7807C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 13:49:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2018 05:49:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,519,1511856000"; d="scan'208";a="27797885"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2018 05:49:46 -0800
Received: from bgsmsx104.gar.corp.intel.com (10.223.4.190) by
	FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Fri, 16 Feb 2018 05:49:37 -0800
Received: from bgsmsx102.gar.corp.intel.com ([169.254.2.13]) by
	BGSMSX104.gar.corp.intel.com ([169.254.5.135]) with mapi id
	14.03.0319.002; Fri, 16 Feb 2018 19:18:29 +0530
From: "Palleti, Avinash Reddy" <avinash.reddy.palleti@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Andrei Gherzan
	<andrei@gherzan.ro>,
	openembedded <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro
Thread-Index: AQHTpxt1xUH5tykUwUugJ0+XYK2etaOmqEyAgABiU6A=
Date: Fri, 16 Feb 2018 13:48:29 +0000
Message-ID: <EBAEBC3AA1B73F4887F286A6723535236597E79C@BGSMSX102.gar.corp.intel.com>
References: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
	<cc978b8d-afa0-5ea2-ba5d-9700bab26fdc@linux.intel.com>
In-Reply-To: <cc978b8d-afa0-5ea2-ba5d-9700bab26fdc@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmFkYjBhMmMtNmVlMS00YmNiLWE5YWQtYjAzYWFkYjZhZTNlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ijg1QkNEamVnbzNKYnhvdGl2SEdQR0dqT204OEpkT1ZFYVB0QVM3TVRwYnc9In0=
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
Subject: Re: Linux firmware for iwlwifi 8000c disappeared in pyro
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
X-List-Received-Date: Fri, 16 Feb 2018 13:49:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 I submitted a fix sometime back,
http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147=
291.html


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Alexander Kanavin
Sent: Friday, February 16, 2018 6:54 PM
To: Andrei Gherzan <andrei@gherzan.ro>; openembedded <openembedded-core@lis=
ts.openembedded.org>
Subject: Re: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro

On 02/16/2018 01:42 PM, Andrei Gherzan wrote:
> This happened because the removal of the 8000c-19 firmware patch in=20
> pyro removes the package completely as well=20
> (http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kerne=
l/linux-firmware/linux-firmware_git.bb?h=3Dpyro&id=3D3e4b382c0c687a76f824cd=
84b478c4f778e15e3e).
> While the patch that ended up in master only removed that specific=20
> firmware=20
> (http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kerne=
l/linux-firmware/linux-firmware_git.bb?id=3D8d2e66817a6e5cea5a0146f2804e703=
402de44dc).
>=20
> Any idea why this happened? Can we bring back the package in pyro as well=
?

This looks like a simple mistake. Prepare (and test :) a patch to correct i=
t, and send it here with [pyro] prefix.

Alex
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

