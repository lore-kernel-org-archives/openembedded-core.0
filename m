Return-Path: <mkelly@xevo.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0058.outbound.protection.outlook.com [104.47.36.58])
	by mail.openembedded.org (Postfix) with ESMTP id 296D77847B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LduLv09RwF//orzCYc0o9fFE2b0g9/khqHY5I9YXaAI=;
	b=e/U+SEJ/kDpAFvxL5Yldn0ncUF8fPYfq/HBd1Uo3ull2m3kHwY1UietkdtG5TuEdYGhfGS7F4lTV5z0k+YF+iL003lM4zRXCOjtoJNIk24isa4wT4YFAdylJh7ZIZnLtKeL+fhk7ClHecWzKrVhy1Ii+7QNTipveyP0YzS3D6u0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	BN6PR0101MB2929.prod.exchangelabs.com (10.174.87.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Tue, 6 Feb 2018 19:17:52 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 11:17:24 -0800
Message-Id: <20180206191724.12620-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR04CA0035.namprd04.prod.outlook.com (10.172.163.21) To
	BN6PR0101MB2929.prod.exchangelabs.com (10.174.87.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf02c25c-ccc1-431b-fd61-08d56d9651c7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:BN6PR0101MB2929; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	3:Ic0CE/Ktskv8anZ8iPdbfMCS1pyDRm8qNxC991kAHaz+HFp42QFFiENMhQlmd7B+Te50g9yTtFJ7Yti5JnODU5XsP5CHcpmrStXuAUl4W2AGXtu1EqB7Q11s7MgRDzc/oAitGTlHOijSi8LG0FJA5niECWgbDOc6ACr6GEOC6FdxhzIn3BiackTo0sohUmd2RnXGkIrWTy+CQjXXiYRWmVsGFOLnHo/Ht0195alIe0fjY7hKYcOcz+/khFLapL95;
	25:iCDNOg0185x8WLLz0kdo/kpW5uAKGEzbWa+OfgMjTotEkH3/GvcBtwX1q6JuG/wEp5B2+9gVJeG0LLWbksdcJM3E8vALNlPz3Icldhp1YeFEXwcNs3cwZJ6JRbseV3olPzqL6PyIP0n3REda7h+ZpwRFTeu8VAtj0bqJCWm29gCf4BjFMLRexxFcRhsPrwt7FYfGlXAXgig1V4xLuFIYdtP4IVf39A4pYAkXp7P9Mvgvj6l+v79sbK5RpRnlsWKWioJT4RfrJJ/HTckOgh6mSk5/mKxrVLtGEoLOvYVlQQ2gPH6pHwCWCb/8B2u5TtFRp+04jDRcejtJHJVhtXpxXw==;
	31:D0nOEVv4W1UOX7cq/eZcl+af+vHZpRIMW0nBIEtVSqH7UYr87am0ygTAI4MilyK5twwYNmQMMLeWK4b1CUzeln8Z9zBI0NQa3wlCA6CdXUtaIE438dtV7mX4PKU+IyBsVYHt3GIoRKqAKvhrmPgx0Pjnz3wyJgOfcIacmmqyko1jEpunE+gZYByB4gOOZ9szT0Ubph7T3/3ozq0urL5IRqq0yucXQDeMUATVtITuMB4=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2929:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	20:GQG2PDM4Ekr/FTjbybgJQi1o1TiFW0KLjaw9BfB6SV4ZnW/fz4g8TP+ChkJBHQuLk4N+e8F94+Z+p/e/vS4gNsF0TjzzrmgO2BXB18HupcxxcaJ2V+sabDXvLGDdG1+PgthtsgtCLLS3RfutB1BTT0HWynIh/3lhke6UcKnDL6WJ8NgdduF4Xz7+OJtCoTwRP/bXC2wBOkBxPiN012T8OwItasfUxIr+s54DwIROfmnSLhphLUrUy2YuSjrXPEv7xSDfcjFh04e1pJDSIF8RF4eygatt4pUdk2XvH1HuPbRDRMf8Mv6ebN6p67ohdLX0rKLmLvcUdrnSIcKf4xO50s0tiTSgKUEklzh/wHJNKFNcM4KSRs9F3tezexfGwLpFOEKVDwnffiJJQovm2WTJ3NmdcZHanl00qOZjtdHhPes=;
	4:f5bXoB6YtoBaJP6ziciLSNzb+NfbOThqisxf/D1RXa4DYYQibaDmviWRH0/TDreR3zveVjcIOcE76PKTVv8aMoxCTyuF5GI01lb6eDfbD9QqYI2HeKMCtsrgzTAis9gSnulYaUfW1XvgTBgA9EpGth8gHPVYGk/CTnhulTkTNJdqK6Ne3xIQYegFnKDsrCGgMaftINLxYJCyQx359eRQ0epmER5PdDCad/sPfsFivFURzFwRb2ZGkHsW/68ZzNMfkjdZ2qeLluOM0V59uPt3tYuZQkDbJYeW6zEJgxSJnWWFxWJwVBAi6XhpdEdJyx9XquNrRwS+dnhLZvMBeeRjAmHnyS8k2N6fPoo1l+yKzGev6zh70wzkyeH5VGE4KalE
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2929EDCE179F3F66AF77CAEDABFD0@BN6PR0101MB2929.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(192374486261705)(85827821059158)(228905959029699); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231101)(2400082)(944501161)(3002001)(6041288)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2929; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR0101MB2929; 
X-Forefront-PRVS: 0575F81B58
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39840400004)(366004)(39380400002)(376002)(396003)(189003)(199004)(1857600001)(68736007)(6916009)(6486002)(6666003)(81166006)(50226002)(386003)(66066001)(5660300001)(8936002)(26005)(59450400001)(51416003)(52116002)(2351001)(106356001)(81156014)(7696005)(8676002)(2906002)(36756003)(16586007)(316002)(105586002)(47776003)(2361001)(86362001)(575784001)(186003)(54906003)(16526019)(4326008)(50466002)(53936002)(305945005)(39060400002)(7736002)(478600001)(25786009)(107886003)(48376002)(6116002)(3846002)(97736004)(1076002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2929;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR0101MB2929;
	23:4QgvnuHMMci9iYdR6Zl6NFLBE4GijDEgoQrWS37?=
	=?us-ascii?Q?l4HqfV9ciArA56jgZB4XgwcpRMH5B+6CLKC5Xwev6uB+6poM8PcUIHBiC5a5?=
	=?us-ascii?Q?WcEh28QeX1h1kFaBVY6wR8gp8Cio8aOH7YwkvCryG1qqrviawUKkJBQMxC/l?=
	=?us-ascii?Q?1hihmvGY1VE2mp4y4izqoQSADKb2l1EEG3NvBSbJq6X9XUha9/Nbt0aGK9K3?=
	=?us-ascii?Q?sE5qesxHCCfrTyb73A34p52bzxBgt+hQj2HpgHQ45m4A6COM5CL3N32cktNG?=
	=?us-ascii?Q?BnkcUEJCMMLL8T+yl22Wx17CuQu68exnH59xCzcKimuoIoNiXDGaAgDElCGO?=
	=?us-ascii?Q?vWoITtLhr+C2mSK4HHdR16ehb3HE9m11kPLiyiIu1T5F3MqnYI9rQaC46lV/?=
	=?us-ascii?Q?BdrgRpkdCAD+2rVAu9EskvQCiyw0V8PkWxgmlU4ZmaoBjI3Y9yQK/AtHZyQG?=
	=?us-ascii?Q?fQpDHCKPGT/l0gmCQ3Qoj9GQHLkfPVpwzVg3C6otOlbu6xnFperY1UzGRZHy?=
	=?us-ascii?Q?7VLfGs1NdMeVEI8SPOodHCG/NafalhPaCq//Fg8hDYwQiFU1cLi98Tzzk9O5?=
	=?us-ascii?Q?8SNDX6TUbajB5WvQy65oeEg8RKRT99SrNkrYCaSyD1k7N1ROkDp9bk/vD9p4?=
	=?us-ascii?Q?zWP5C+zMpp0EyBVFv80pfYTdabWUbjPkXEkKAvNidnbDncq/D+HD/fNUriVL?=
	=?us-ascii?Q?64Zmsnf/bhopinE9Jjv3/dXSdbUNZf2P8GD43Bj8E1X+gBUBxYtvfVbm9wHz?=
	=?us-ascii?Q?xxeZd2+RcTFU9SMvNHf4FsH8ga1puGoRYM0M7dsjCCj8OtDyArbKdce1lOj/?=
	=?us-ascii?Q?R243gjFNlI4G+0yCl1HtH0QRSzwkSxBqoMo2zHKBwYM9X/70uA1vLMmevU3C?=
	=?us-ascii?Q?A+kgJOvoF1GQ2l/1NFfsq/mkhsbIlJAcMhdx3TRi5awu+cHemk4jAqXdqa3m?=
	=?us-ascii?Q?Qph3t8pbeX49EK3wG9+UGr6gDn+vnWnkaQynQ11QhPGPrQj+rsdPZ2qXD2h5?=
	=?us-ascii?Q?UHoYqIMQY3Yyw7u/Tgv7hlwjfSRr5+ZBHmx11Xbd8PSJrgGxxbwn7jLmK1CG?=
	=?us-ascii?Q?y2l+KMQz8Lsnr+fAY4WPmImN3HxIIcW6MZJV46sOv6SUHJLO/C4zhqQrnnAh?=
	=?us-ascii?Q?8/ilFIJzkJ60TBMOXkTLxbgWwaITDSE8lviDlXi7kgDbbf2k68FBs/4OD7ty?=
	=?us-ascii?Q?dp5YCMVEfkiHj5EL2d10L4N4JuoNSxLeO2YuDHAzuq3GQx6Mu/IDrjMbx1w?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2929;
	6:J9CVHFNHDpmKLIDVXVomdfs+7gJMRsmcChM6qLBEH+jnjtW/VymqDCKDjR/JPLDC9ruGmk1pMlckkp2cXwsFtNdGcNQBZRxOb6lIfvq6R0+n9WjQc3LbWN0z2TO4AkTeiqL3/q2cF/BJygJG2LdWpIB8KdzgAtFf+dhyxQdru5vC0z5fb73y9EJ+DazHI8PRI0vypf5EnwltNhd/NQb60+UsUaojS7zeAYDIWWk3y7pn9PpF+2MgJ7jo8wOE6OPUxcFP2uEiDHzX6G2Ms0VSQU560iHYyBUWgmYsEAMfb/YcJVvKuts0B3ODEYzoVNnSS2HfYDhNOroBEjLTHGKg6howyYjQXWvkuYCJpG2LVnI=;
	5:x2CEyv6ft6HV3GusJz4OFiZcyu6v4LVHhW5dI1GKoSL/d+a+qbXZ18fYxDkziSCf8sywhp0x6nrjQiRQMMTw7H5R1Shqe44zXYE82os5aoVXdLAPnsrJxjkJ0D4wlAdZEalDpSBARbhRGNnur/mDVfmZL3Q/SylZfWXVX8k7NyM=;
	24:3VdhEoOGBjqI2ibmsz2WkVH4YwZ2dG0qtr68AVUcHcXgai2guh5MDEgzVrNwe/9LBDpUghYvur8DJi7DlOmT+soNObLTtFy4dMbnX5kiYn8=;
	7:qPGJxERGdUeLTzOkEg386/lOAxW9ioXdyKhDPKymYpP0QFwJl4QzmA8Uk5owFx1uKrLp7wUMOV3UKG9yBW/IFgCtTK5Nkcqb3jldBUFvKOg4WxAuH9yKrddeO+/IVEPdu3rprYcnDvVy9YPgcc6gg8UFGGID4R+HBxc/IRmQlVvVX+mmBEOwRvI1ruhcOJE2RhdV4fKW4M37mpvMHgLKeav4KvbYgeN9DMF+976C6yZTI1to158eGAR0leVWNzxn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2018 19:17:52.2844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf02c25c-ccc1-431b-fd61-08d56d9651c7
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2929
Subject: [pyro][PATCH] distutils-base.bbclass: Do not use -pie with hardening
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
X-List-Received-Date: Tue, 06 Feb 2018 19:33:00 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

Fix build when PIE is turned on. It tries to build
.so file using -pie and -shared flags together because
its doing compile and link in same step CFLAGS and LDFLAGS
are combined and does not work, ending in errors e.g.

| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-musleabi/python-pygpgme/0.3-r0/recipe-sysroot/usr/l
ib/Scrt1.o: In function `_start_c':
| /usr/src/debug/musl/1.1.16+gitAUTOINC+179766aa2e-r0/git/crt/crt1.c:17: undefined reference to `main'
| collect2: error: ld returned 1 exit status

This error while cryptic is due to the fact that we are
building a shared library but also pass -pie flag to the link
step after specify LDHSARED ( which is -shared linker flags )

we can not use -pie when doing shared libs. This is true for all the python
modules inheriting setup tools

Disable the pie flags thusly for all modules using setuptools since
this setting is done in setuptools makefiles which are then used
during module compiles

Backport notes:
In master, this commit is reverted in master in favor of using GCCPIE =
"--enable-default-pie" in security_flags.inc. However, backporting that change
introduces many merge conflicts and will be a serious maintenance issue, so I
think it's safest to just backport this small change, which fixes build failures
in python-cffi and likely other recipes.

For completeness, this is the list of commits in OE-core master that will
supersede this change:

- 1c7e195c94764d680a12a49b870f04cd58860f81
  "gcc: Introduce a knob to configure gcc to default to PIE"
- e93765ffb5718b0fce84f0b8123963176dea95e4
  "security_flags.inc: Delete pinnings for SECURITY_NO_PIE_CFLAGS"
- fcfe6d4ab4460f8358e13023022a5e909941ca93
  distutils,setuptools: Delete use of SECURITY_NO_PIE_CFLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/distutils-common-base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 824a1b68b1..fa733c672c 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -11,3 +11,5 @@ FILES_${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.11.0


