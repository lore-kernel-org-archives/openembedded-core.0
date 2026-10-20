Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6593.1792500385043992225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=YF8Jt2Pi;
 spf=pass (domain: est.tech, ip: 52.101.66.41, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tf5NODc2fK9rw87CAK+b4TvPbIt10ESyg7koQS/beIO4XuUFVeLwB6BP9D/w2bq78U7Hw8xfSpcsn0K7sSSwNHBiSbJg6iH8Xe60NJfSnrAGeD4Zf2irGFhRpstzaiZ3w3/YYwjCdTi114bM14ziHzzQrUxBOrAEYWfZNkTGtX9RKWpeP7/uBy0kHXPqtSLuwbAIdEpkeST/aYhfC5SLLI5/NdffPY/5S3saVLzdVkOzLi9M3BDVinjWiZQ7XkECPFDSgF3oowM17Q1SgR2xfZqeMgdSBiD4P49wqhjmTkCDZF4lDaK+DBLdo+0fAJIR7Pc5UjHpkFpQb3JFmTFDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp/4IJZiWCNsG/x1gRBnFGTVEO3/urheW4GXcCFsj+o=;
 b=WS2N29U3/Xi5QACDa7546x6HDbExUZFq7hHaty8xZT7Q+cX3n8A2fNm4oh0QUWQlIjmGZmOP2zR/nSBrm8PAgHjEG36buj++J4Jzt5va/nLytr7VxS2L873nhWmwttHsC51EPVkYZIei79WQ57O7spmG9hI+pu/P8lYkj7/evXJ1pQvRJc+Hbp3bWcSmEl3YRl6DLr6NG/JXjYu4MaKyBA4+BUdTRhpZMd2L47Hzv8lg1OSo2hVsZezIEl108lp2r8Y2C1vIyv1rLhovHUhlueIk9bfzY+OpA6B3dYN3YrRxm+68Ar5Y+MjxNLbVptnPuVT40icCoUPVnWFMV69/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp/4IJZiWCNsG/x1gRBnFGTVEO3/urheW4GXcCFsj+o=;
 b=YF8Jt2PibiWSUAuP0FaeCdOMm5a12GQz4up7deI1NRn8OWDMdWk7xagw4Kxut1fq6IAD6oSfVDsOn3diL/PkkN1NzVaZ1nY/WB928iDG3SzD+3kSQ7bNRhwkwRxHuXxxZTh4F+6sPFvByaK+EnPuiaWUnATiTFlJO/nXjBuODL2fBGAFF/aYbrEiu9GrwLnknUnYKDA2l5WwhVOxNNXz6ATRfuatDr/hew2kzR2ESJl9zT4us3jrhl/ogqlPHUJlI368rfKqiiy/MQ2uuSqYgQrYiQS9IMC4gRSkIpXbspkHvOp0XmKWTlrIBdhgJFNlc7ExtEuCcdChMqenpI8FlA==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM4P189MB3641.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 12:46:21 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 12:46:20 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libsoup: add ptest support
Thread-Topic: [OE-core][PATCH v3] libsoup: add ptest support
Thread-Index: AQHdW9SdcO32GYOPZ0WTdGfBb6VPlLcGE8OjgABVMMQ=
Date: Tue, 20 Oct 2026 12:46:20 +0000
Message-ID: <PA3P189MB32392D0F3C24886C713DD1E3FE672@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20261014085044.14497-1-pratik.farkase@est.tech>
 <20261014120737.24575-1-pratik.farkase@est.tech>
 <18DEF3F6676C6093.2594042@lists.openembedded.org>
 <DM9HRC455YBZ.1G64O77PEY811@bootlin.com>
In-Reply-To: <DM9HRC455YBZ.1G64O77PEY811@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|AM4P189MB3641:EE_
x-ms-office365-filtering-correlation-id: c13b30f0-d6a1-499a-eb5b-08df2ea82460
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261009223327099003|261009221727099003|261009223027099003|261009221227099003|261009220027099003|10067099003|56012099006|22082099003|18002099003|38070700021|13003099007|4143699003|11063799006;
x-microsoft-antispam-message-info: LYtss57i1P9Hx+QHM6ORfQTJsDYZLEJD4CgMfNIQijANNZpAW9VreR+nh+GTLnm/7dwuZwrj7VTCeTBE+sDccCIfL/O1GpfjWOh8sXEf0Y8eBZ/A6hwfmEon2rLKhpan+HkwOLVy/lb40yvhW+7G4sFgcT2mzgMjtnV9F/ev2mmUunvc3GyzHJ08JmM37YtoBto/eVgZQc0v2F7xm2uixPLq3wcd5gxkNj1bZcP24KyZ87/kVZLpi/c3MftlCpgmzDOQLxuXkFkD+/i1z9O7Qn4ek1KHWmarZ/ebdT/fcpsVUqhM90Yu+j5TqCXk9E3mugl/xbh+q/nz83MO5FpFITFnSKm6NJWHzwe32RKiKWTRGbOsnR/CjpsYcFYeNGHzkZ1SRUDU7uR0JFq5XE8JFSYZFShitydMe915Ym64VMrtlKbmqiUY+O8Ds4BkctNEgek4NPR1Xy7Baw5r8tHEe/akF1Gnb0OMzAuSIRxbqfSRlJKwHeZs4b4gD58lGJAMIkchRcwZx7tDDGyUOJV1ZlzWkXtOc08aQjKlu53SwLET0KURubRawG7t1d7FV35qmBLFzRrOh3prO+OPyBkNZRiaqigmwkTujIOkwEoB8hHvCX2LZN0SrT3q+XxD03ny0mfPQDkFBbq3AK9DN2TV7yw55R0yCYofqjOUvgANWx4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261009223327099003)(261009221727099003)(261009223027099003)(261009221227099003)(261009220027099003)(10067099003)(56012099006)(22082099003)(18002099003)(38070700021)(13003099007)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rct5YrxRKoXtQZWNvdCjCm2UX44+XLisAwsjfMZDbrTm7kLBoHIEWq+S3i2g?=
 =?us-ascii?Q?iKKCL+dEeW3MuWNqgqswlFpSgb1RPZ8gunNp26ywdmgtkKkcvuxt+/nMZkQz?=
 =?us-ascii?Q?JF4n6+gODYXx7gJ/MVxpuIVMDLJXa+KcI5iQCY4AOnPaRYQ1NxCh1WZFJEWp?=
 =?us-ascii?Q?f4rJPXW1R43Kltf2RvOc4RGrYQYXckV9OJxKDdYj4v2sUOVB+Ayfch7pA27Y?=
 =?us-ascii?Q?ixPfeSD5c1kcRf3ZIMPnMxY+g57yGHhvNdSGIb0FpTb+wbtHv5y1WBtHXvlz?=
 =?us-ascii?Q?WJYPG++Sr820n4/D1xHjJVhXYH8m1O8pe5s1ez3+Tn53LfNfcuHZN0qKvq3d?=
 =?us-ascii?Q?qGR7aBp1Qm4TjH8ybhnRtZuuCwlJk9Lck2zMlDqw9//MWh1wQFxx0d/Qh+NH?=
 =?us-ascii?Q?SdxrCZVNEzbvDolPyTcqmtOMvlxtWvuhXPasuakqjtQHgybJCJ/4IZ6u44RR?=
 =?us-ascii?Q?xROBuPWxYc/qmQoTDObPN0d8NsIBxsHyH2L3Q9myrB5YPTJQkyrNAQD/5Bbd?=
 =?us-ascii?Q?eL9BmoWlQ7nESBK0sr5IHzW55MkSNggC4Q2PkQ4TkTWTBckyF3YAwDizO+kD?=
 =?us-ascii?Q?eZ35zi4zKMkhSjQhbdI4UK7yNCTRWE/AIsF3nW764niC4kq3oUgto9C7mLEw?=
 =?us-ascii?Q?3mQCRvcewwM0yResdoiuaYXgX7oPf31lBlk/810A0TGyfJr62piygJ12ESAq?=
 =?us-ascii?Q?nifxM7oxP12OS/kxsXyHQ+k96uf3TZL6LTsvQg+pkmF+6vw+SaHxRc29843X?=
 =?us-ascii?Q?G7OVVYcBghYVkzFiLhnv6/bZBwNYaSwoyGO+5QS5fjT+hWBkKBcF5g58aTZh?=
 =?us-ascii?Q?r5RzIGpYjoKVc4fy3xPsQ83hzkhwtrIrgjiqW+W6Gv9PW+v5DVrZAOH0HbKu?=
 =?us-ascii?Q?Ij3qoqPoGeinfsvzaMWhjScFI7j1TUUntQQPzRA7uroOkf1wJW2z2SIm0ZAG?=
 =?us-ascii?Q?29KXSVzdp5bFc0KKQ/zIhDJBRxh4yAb47USK1lKPptX2jgI0xvJQhVPfcMA9?=
 =?us-ascii?Q?Jcksk2R4GPwvSU7k0bLO9Wylxp3LXKwPr3SaIW/tA6PHJj0NWT9Myjpha8dL?=
 =?us-ascii?Q?L2RB4oSpJGm3AqvGHhy5tCLRE6DHL115sRCwimDgNDPl5I/fMd+n3gybgS/q?=
 =?us-ascii?Q?Au7ydYax1iyoDh9Av1aRU+Kx7hRIjheLdBMXIzdAV/aPAtET7x4YihMgPWef?=
 =?us-ascii?Q?zLO+fsmpUirm5c2trbS7t/EFnJDg24TtdqPZwVPBuxNPVVLwnGaMEZY7VqMC?=
 =?us-ascii?Q?m5PiY3Mz+RBKs42Fdi7b0ngMlbwqF7mS6g7vCd0+m42BsRGgVoJvwG9H5gE2?=
 =?us-ascii?Q?1hPdM1Ud5d49yByafNQpKB/412iL57rHsOIkqRX+YSmnDNtfxNun2/IH7rB2?=
 =?us-ascii?Q?+zYnfK/TVS0Xu7H4gXzYEH2rsj03vqpBHEZJ20sYq90QUBRMhKGJRe/SIptH?=
 =?us-ascii?Q?g8LXLpc5Z3cI3Xk7LWNYvHHqF/7R4BUlBP0QRBfftNua3HlY3MwcIcrkzPMY?=
 =?us-ascii?Q?tr4YounRPph/5QeH2NbfGrV2FnYpesdTeyNrFVJUYS9oM96W1kR9MNsqqWGt?=
 =?us-ascii?Q?XBR5CaVKK7csBoB63hE8R0A73WldWtaogx0+Hxv3CeTx/KAFP/bwj2BBVAso?=
 =?us-ascii?Q?BgvzqBuw9dQr0tyT2m+VugdK/6zhv3Gexp45t6gupJrXq24J3IDb/m2qsuun?=
 =?us-ascii?Q?L7chHM1+GuLV8xVDOrVk66C/7KqFgz0NGmAibrFYsey0msEK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c13b30f0-d6a1-499a-eb5b-08df2ea82460
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 12:46:20.9357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1CcRdYsIjmw+SWXNpunqsm75AhASbomwCkwOSKpuP0OSOBbbKTg1XaTBiRScZxvuaiS7M1KurH8kRruY+2QWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 12:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248278

Hi Mathieu,

It's quite interesting we are catching these flaky tests now rather than mo=
re re-work later. Tests are expected to fail to some extent for riscv64 ARC=
H due to slower TCG emulation (growing area). Let's keep testing more on th=
e autobuilder. I have sent a v4 correcting the failures from v3.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, October 20, 2026 9:36 AM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] libsoup: add ptest support

On Fri Oct 16, 2026 at 10:05 AM CEST, Mathieu Dubois-Briand via lists.opene=
mbedded.org wrote:
> On Wed Oct 14, 2026 at 2:07 PM CEST, Pratik Farkase wrote:
>> Build the installed-tests via the meson tests/installed_tests options
>> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
>> DISTRO_FEATURES) and run them under ptest with
>> gnome-desktop-testing-runner.
>>
>> Tested on qemux86-64 with ptest-runner.
>>
>> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
>> ---
>
> Hi Pratik,
>
> Thanks, it's much better now. Still, I do note some intermittent
> failures.
>
> Failed ptests:
> {'libsoup': ['libsoup-3.0/multithread-test.test']}
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4725
>
> Failed ptests:
> {'libsoup': ['libsoup-3.0/http2-test.test']}
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/26031
>
> I believe we can keep it in testing for a bit of time and see which test
> fails and how often, then decide if it gets merged or not. But we will
> probably need a bit more work in there.
>
> Thanks,
> Mathieu

Hi Pratik,

So after a few days, here is the situation:

{'libsoup': ['libsoup-3.0/multithread-test.test']}
2 occurrences, 1 qemuarm64-musl-ptest, 1 qemuarm64-ptest
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1400
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4725

{'libsoup': ['libsoup-3.0/http2-test.test']}
8 occurences, all on qemuriscv64-ptest
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2603
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2614
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2615
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2616
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2618
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2621
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2625
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2626

So I believe this will need a bit more work to make these tests a bit
more stable, I'm sorry.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

