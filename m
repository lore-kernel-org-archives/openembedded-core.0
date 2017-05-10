Return-Path: <prvs=2303b14298=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 95A4E71A8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 15:34:05 +0000 (UTC)
X-AuditID: 0a00029b-723ff70000003f55-a1-591332ee313b
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	34.52.16213.EE233195; Wed, 10 May 2017 10:34:06 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 May 2017 10:34:06 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC PATCH 00/10] Add openssl 1.1
Thread-Index: AQHSyZefJriOROMie0iYjBQbJx3PdaHtqNpwgABYZID//6zXUA==
Date: Wed, 10 May 2017 15:34:05 +0000
Message-ID: <655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
In-Reply-To: <7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWyRiBPQ/edkXCkwcEFyhb/H29js7jz8x27
	A5PHvJOBHuc2rmAMYIritklKLCkLzkzP07dL4M64+KiDveAKb0XPAdcGxhncXYycHBICJhIb
	d15h6mLk4hASOMoosWzXfmYIZxajxKLORhaQKjYBI4lz1zcxgiREBKYwSvw9NpcRJCEsYCFx
	bP4rdhBbRMBS4sX2Q4wQtpPElXfXgZo5OFgEVCXuP9MCCfMKBEn82HydEWLBMUaJxwuugdVz
	CjhLNFz8BraMUUBM4vupNUwgNrOAuMStJ/OZIE4VkFiy5zwzhC0q8fLxP1YIW07iXVMbK0S9
	jsSC3Z/YIGxtiWULXzNDLBaUODnzCcsERpFZSMbOQtIyC0nLLCQtCxhZVjHy5RrppRYXl+WX
	pOol5+duYgTGABcD0+wdjHsmOBxiFOBgVOLhvcAnHCnEmlhWXJl7iFGag0VJnPfZSuZIIYH0
	xJLU7NTUgtSi+KLSnNTiQ4xMHJyHGCU4uKREilPzUlKLEktLMuJBcRVfDIwsqQbGsM486f8h
	+xO31GUe99+odHSC8765Uyvm2MV7L7RIqpvepfrG85/xnd/xgZ+dpzZJfX2Vu3jt9Cn/tE4W
	x7nO1pp904m//LdKzZojeww05d/WXOFTaS107Ps2hW2v57OK8Loft6NXKT6rnnBSpqns/PpW
	6UCHVcqe6U1cC6xXNb7sTnBaOf+pEktxRqKhFnNRcSIANHJon30CAAA=
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 15:34:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sitting on 2.3 wouldn't be too much an issue for me, but I can't speak for =
others that may be in the same situation.
Do these patches / new versions require 1.1.0 or break backwards compatibil=
ity with 1.0.2?
It would be nice if it could be handled by the PREFFERED_VERSION/PREFERRERE=
D_PROVIDER.



-----Original Message-----
From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]=20
Sent: Wednesday, May 10, 2017 10:16 AM
To: Davis, Michael; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC PATCH 00/10] Add openssl 1.1

On 05/10/2017 06:02 PM, Davis, Michael wrote:
> Won't this cause a lot of issues for those of us that require FIPS?
> I don't think 1.1 is expected to get FIPS support for some time.

https://www.openssl.org/blog/blog/2016/07/20/fips/#comment-3277656289
"There's been a delay on starting due to a priority focus on finishing=20
the TLS 1.3 implementation; we're still waiting on a final TLS 1.3 spec.

Schedule estimates are difficult, not only because we haven't actually=20
started yet but because the FIPS 140 validation process is notoriously=20
unpredictable. Based on the first five open source based validations I=20
would be surprised to see a final approved validation in less than two=20
years after we start, but my prognostications have been wrong before."


Would you be okay with staying on yocto 2.3 release until this is=20
resolved? Otherwise, this can be delayed somewhat, but "we haven't=20
started yet; we have no idea how long it's gonna take; probably two=20
years or more" does not seem like a reasonable ask. There are other=20
users of oe-core, who do not care about FIPS, and at the same time do=20
want to have 1.1.

Alex


