Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 414 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Aug 2016 09:40:13 UTC
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2D765CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 09:40:13 +0000 (UTC)
Received: from [85.158.137.35] by server-12.bemta-3.messagelabs.com id
	04/40-09160-F52D6B75; Fri, 19 Aug 2016 09:33:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRWlGSWpSXmKPExsVyU6Zrom78pW3
	hBvN/C1rc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBnrHr5lLGhmqpg14zJbA+Mlxi5GLg4hgU2M
	EmvOX2WDcPYySjx9dYqli5GTg03ATGLXq3XsILaIQJTEzV3PwGxhAR2Jk182MEHEDSWm/3vOA
	mHrSUz9tZwRxGYRUJWYu20pM4jNK+AqsW5TB5jNKCAr8aVxNZjNLCAucevJfLA5EgICEkv2nG
	eGsEUlXj7+xwphG0hsXbqPBcJWkPjRewqqxlri34O7TBBzdCQW7P7EBmFrSyxb+Bpqr6DEyZl
	PWCYwCs9Csm4WkpZZSFpmIWlZwMiyilGjOLWoLLVI19BIL6koMz2jJDcxM0fX0MBYLze1uDgx
	PTUnMalYLzk/dxMjMAIYgGAH46tu50OMkhxMSqK8v/S3hQvxJeWnVGYkFmfEF5XmpBYfYpTh4
	FCS4OW7CJQTLEpNT61Iy8wBxiJMWoKDR0mE9/YFoDRvcUFibnFmOkTqFKMux4Ift9cyCbHk5e
	elSonzXgQpEgApyijNgxsBSwuXGGWlhHkZgY4S4ilILcrNLEGVf8UozsGoJMy7DGQKT2ZeCdy
	mV0BHMAEdwcu/BeSIkkSElFQDY2V+QWnpTkFmzopXL4VnfhMM8P7beL4navrVqHPKx5IElY/+
	4b51/fdUHqn3E103Poq4eFrgiejmg0e7tk4vNbKK67+WUXNi0k/DvXmLWX387r5+9lCncbvTk
	8+/hFI3G15fs32b9wTditbl8/r6Tk3uCup2T67/pqW5869Lbz4jZ2Hg1kbOHCWW4oxEQy3mou
	JEAHilVvsGAwAA
X-Env-Sender: andrew.goodbody@cambrionix.com
X-Msg-Ref: server-5.tower-134.messagelabs.com!1471599198!44276152!2
X-Originating-IP: [217.28.138.145]
X-StarScan-Received: 
X-StarScan-Version: 8.84; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24924 invoked from network); 19 Aug 2016 09:33:19 -0000
Received: from smtp.hs20.net (HELO outlook.hs20.net) (217.28.138.145)
	by server-5.tower-134.messagelabs.com with AES256-SHA256 encrypted SMTP;
	19 Aug 2016 09:33:19 -0000
Received: from SEHSTE15D2BE2.hs20.net (172.18.251.29) by
	SEHSTE15D2BE5.hs20.net (172.18.251.32) with Microsoft SMTP Server (TLS)
	id 15.0.1178.4; Fri, 19 Aug 2016 10:33:18 +0100
Received: from SEHSTE15D2BE2.hs20.net ([fe80::84cd:cdd2:84c4:a64a]) by
	SEHSTE15D2BE2.hs20.net ([fe80::84cd:cdd2:84c4:a64a%21]) with mapi id
	15.00.1178.000; Fri, 19 Aug 2016 10:33:18 +0100
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Build of u-boot with gold is broken
Thread-Index: AdH5VjLhAuTAF19QS3yoE/njm4xwfA==
Date: Fri, 19 Aug 2016 09:33:17 +0000
Message-ID: <cf64ae59ea584fb18975ca5f33464981@SEHSTE15D2BE2.hs20.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [46.17.166.30]
x-exclaimer-md-config: 266e7a57-cddd-49fd-bdea-19bca6d40303
MIME-Version: 1.0
Subject: Build of u-boot with gold is broken
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
X-List-Received-Date: Fri, 19 Aug 2016 09:40:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

It looks like the recent change to meta/recipes-bsp/u-boot/u-boot.inc to en=
able out of tree builds for u-boot does not work with gold.
The sed at line 70 fails as it is being executed in an empty build director=
y and so there is no config.mk.

Andrew

