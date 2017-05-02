Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0062.outbound.protection.outlook.com [104.47.32.62])
	by mail.openembedded.org (Postfix) with ESMTP id 619FE60557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 19:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HxAjYGP0KsovuaaGvVbhhjtjTeguhSnzI7pTlRUbNiE=;
	b=uAOyMXjGggNY2gdp82wUI6O4VGqZ6B+AbPUJImATLmt5Q6shwwA28DcNIpjU23Z19VgWB6MbTxod67S7eversTqYDV7T/CXul4myxEsRNywQFriGUaTF8wxSt1AGwLlPUrOfI4CHwO72higVETL81viBODeKQS8EshW1dLhytFw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	BN6PR01MB2675.prod.exchangelabs.com (10.172.195.13) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1061.12; Tue, 2 May 2017 19:15:51 +0000
From: Martin Kelly <mkelly@xevo.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 May 2017 12:20:13 -0700
Message-ID: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY1PR0801CA0072.namprd08.prod.outlook.com (10.166.203.40)
	To BN6PR01MB2675.prod.exchangelabs.com (10.172.195.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcc44cc9-7366-43c8-0aa0-08d4918fa67e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR01MB2675; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2675;
	3:cFU2K1/qH6tSdyJa5NcJAa35mBbEASI4Srs+GiMdkhfG5mp33PnAxyY+jLHp9E43DYzX4psZbJr+bnBxdzxjimlLpJJspelYOU5xLzD4DEbLRCAETmYHyxn9bGsVbKl4pcdidMr7F6UEWhpurViWRL08U4U4C6e6WhOjr9x1zL9xncDA3y93PNDuG88SS0RNdzF91vthGbaoppGcciJ0DcgUPZ2DP6yYc9dDq9y6nw7npTSFj8aAzaMPlMCAEAoQQ6i9pPlON0HimcV0ielqGWaf1YPV7FozEH9CLLfk9fKDfoqPOFKoK7Mb0xWAsebXSsOn9hwbxwxaE7ZVWpkE/g==;
	25:G49OqjfeOMc3TR+DjbdPBmoapnnHIhfbuL2rEgV+MJEdc4d5LhdzmWXa28iS6eqHvu27Kr9k6fnCRxU4xuu7IaYXkVGz+/t4haYGrRYV1oPMMctzWY+ddMpjOik7q5MEv14tTC5w+Jt7OMAw6hXd8iJ8gYq1zTj93rl1MrjaB09+TGKbvgplYY7PXTT/CP+adt012K6Lq47cjzS3tPfFTXTJfDPH30yz4enM0XRdqEqlwIdpP7iP4MDy0bCsfHGnUJ0idCn1QEunCWnqNZ9vrjxFs0FdRbf44gU94TKgTDB8mLdWiWQBWPw7ZF30SO4DGDQ8ofQT/Du2wwl88WbaT7gBUBrn+1eVjdLZSNOtTD5nsin2cfZJJCVxGD9KmdJneT37SH8qn+PTtjy3t6vrTmQN/oqxo6ARJ7nPvt+nsiTkDz2TFb4rvS4AywXukHNu
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2675;
	31:9PMLXdODG/ZCm/aEKJyWI0Cc/BO2W2VQkYT+sZlVYMXjqnZRNWRgMQQ2CGe8x113Y+C9aET3n5Iztj+bBiXSqgt3f+fbbRTr20VLJbFwaT94tnp2ufe1FvFQwKoDGUW+Kvq2+eb4VFoY3ZU7ojufIghBKMcv8dVZLySAiyXCUQcEWWeFaegJFKNTiFEYsL8TSPxTH6hOi0r0AMDNbTa18lPlj/ho5CYjbc5Z/Q/Z6VjI3RWIF9d+H7N8rBYbkMUP;
	20:yjMkBKM3tv4XVPjcFNcH1kN/o8HbPyIk4CUjcgwTKSwVsBChBlXA+bhEv1xB32Pp1kCH5WNxRlihIzDLwpVhWWahIRBMJbPiaSecE3Yfw8KDJTDIixdOsM2UJ4fw1uuHb7wqx9cnx/A1id0lTbnzk1t1Nn8eYXDdDfNW4XUEnDLmnMaoFu6Sd8CfKGSeheZths5EslV/TcHjnQd0SSv9FmzZECZeeKizi/lyL3qN+MLdHL2aacnB3IsN2PPtDy+YdrVNbj9VQhVuaojHUadU6s87GZCpTyFUO8YHtHzWPzTh4i421ciqPNNb1fQcKyBVJQ3ygjv1BH6d0AqVpWQMBA==
X-Microsoft-Antispam-PRVS: <BN6PR01MB2675B89F4A8652A44628747AAB170@BN6PR01MB2675.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(20161123562025)(20161123560025)(20161123555025)(6072148);
	SRVR:BN6PR01MB2675; BCL:0; PCL:0; RULEID:; SRVR:BN6PR01MB2675; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2675;
	4:15DJHVZ3y2FX/mPWWXOEHUBtPCAiz4sastbZp0goMto/j7cVCt5j4yTQSWNPF6Kui3REQYJhoc133rg6rgx/CvsmK+oAhFjHQ9TK0TFHnrjrJ49vQmysS2Mu9hwa6AUX/2iY4lcMzjVaE8a9m/YmaBUyCLZLJ5wNk3zP1Rh3ivdgw+h1olEbJ4AKqGY3pj6smRSRSqXD3RBRiC9LHEiR4rQBpLmTX6KJIzY0JJhAbOylUePlZ7bljoZgs3RgxsacFOahPBYJNISVr28Ts/ncPNx+THwU6Zrwjx5KigBz22toNAxTHEMaLwE4za3TPBHDci7BYB638DLaJ1ZShSg9eURdWhJs69P3ed4altrqH/VFwNN9HNG3HSAVUqCJ1gY0kKd5NkqQGj+EhVn6kpU2URvHD+rtc3LrNrE+spU0yPqaCBeSO8+NIhlU9IWT2pROdJNrSjVMFoXgxzgTSQjjwNU9OBnTc4VJS/Fzs46pmp7d6ReTCK1Sw0wEgMEWvqUmzX0u2gc500STOL1ePQiAhDcF7or5eDcd3ThucOiUEUUIBRsCLC+LObXLqMxUYsHpymGhz9FrFHvxR17e/5GbIL8zNy6suUK44LM1OBCmrNSyl48T91HuoCW3qIqyaT1zyP4j+/JpiFtM3SM4zRqcl4OokLSTITf+mhjP2k0QLm6m2DBngNxEeEw7Sp6eJpMrSzcP0YbJJH2yN6bdGtIvO4SvgdM6zOkQOgbXQ3wB60DI7nN/l5WMHns3HdLYaXvfGKAsHBm33HizDj686IR8RA==
X-Forefront-PRVS: 02951C14DC
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39830400002)(39400400002)(39410400002)(305945005)(42186005)(33646002)(53416004)(7736002)(189998001)(5660300001)(5003940100001)(3846002)(47776003)(66066001)(50986999)(6116002)(6916009)(54906002)(478600001)(6306002)(6512007)(2351001)(36756003)(2906002)(6666003)(86362001)(53936002)(110136004)(25786009)(107886003)(81166006)(50466002)(48376002)(6506006)(6486002)(38730400002)(4326008)(50226002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR01MB2675;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR01MB2675;
	23:mJ+/lOW6pU+qgRJ+gpRTEdI3o7SHV0jq0NxEWA0Q3?=
	=?us-ascii?Q?AmT1PK9UIr3UTacaK6gyo22AUr20/wQf0lHw8WXNYMgWK5zzi6tKMS10z/VY?=
	=?us-ascii?Q?9L2JW4fmJsEkLFFafWfo8n7Yzj32rxUeCp4OVXqFbvXBdo+85x+ypL4VHSwl?=
	=?us-ascii?Q?3C084owevq+fs0rn9Tho+kgUQ0A9TwEhtSNCarhogEjBh3KH6jM0pmfad6kW?=
	=?us-ascii?Q?hK27mIqIiVrUVXeSVoC/XWhw4agVISu6Lf88rp3+Kvuj9Efiep5fyEoOI/Yr?=
	=?us-ascii?Q?RiiECRBbsXX+T2+AxQS5+KGgFBfUopvwz1O7r9A6LTsst58dx94AX75GDBMw?=
	=?us-ascii?Q?x4AD9To80G0pDXz6sP6LnP95umnD8FrR7JobAapF2hbfE3QeWMNg07GQ/bSf?=
	=?us-ascii?Q?gKxaoEM+Lg8B4meAkx6hWrzluWmbkME5hMiR08+NTvb65XT2etFsbZeRFwut?=
	=?us-ascii?Q?C4VfAnlpe00MOCk5kzqU3t6ULc6RoZzeGlumwThK4+4N0e8kE2mNwOgu/7RS?=
	=?us-ascii?Q?pUQeM9ViDWiM67rXB1sUClIe/5YBGKXXrzCYuJKQj99fySOR34IT5fTq0DN0?=
	=?us-ascii?Q?wDGC0kquRZuucsRnwlXyY9/k+uqzvp8OFPU+LMZZOyqCEcVexWzWAniPPfQd?=
	=?us-ascii?Q?ZZFU7NF1nSUKRUI/TwQ8WrxjvD2fuwgM3Rp2tP0sltz2L/RmKjLQ4E9Jkxje?=
	=?us-ascii?Q?3pZSsRxiNuA5P4e9I0NQBmAycjFnCRoUj4cn+8/6msqsvc9c0ARluHrmO5MV?=
	=?us-ascii?Q?hZaYgSIw2ckgMYWv5OxR2t2fn24243KD2sQ9DdFloi2kjk4RcNpdYiJGSDHt?=
	=?us-ascii?Q?5A9N8HQ7u+FfShxnB7axhOty1Mcw1zH+4kFFbfGj5kv6gsQSmsGB7prVz+CO?=
	=?us-ascii?Q?vZaa22Yf84UcSKwlycTPLFXv6E+rVOb0JFVfxfhV8jkFpRPCB6IBAXyOg0gk?=
	=?us-ascii?Q?1CGatjZ+w9fh5qip4ywZ6aOkRFeR8ODw9MjLDeTASuaGqU2lMm/E38NiOVSJ?=
	=?us-ascii?Q?OPs42scBiVY0zaKCORpTs9es+zq0+Edk8qN2tF9tgXi5/+VYrw6ypFHpyork?=
	=?us-ascii?Q?xApjUU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2675;
	6:Opqb6I112d06ksiMPxEpDeJg+1fZ/+/4tiRbuU0/7t3upAVOYSy0oBocRwoBAZ4s9N0ioJkZXxWgSpsspwwiZkgxOl69CNj/zQ77A9LMALB53r4yqkpPQ6oJ2hca6llZyjrZL9AZLPxwtRomzYYCpKbTyQy9exhlBbPv/jBFFNJPYh+o7vsheVAJ4dDytqSmInsIMZJZCrZcqQif5qQPnbUWd5X+xXE9KblB7XN5zBw1hVODNgMu0lAzuopNCY7ndwliL5TVuIm9DOhMKXu35ybFroqe5Kq5jGmiS3qxrLFgVeX6BMTj01a6J/I1rq8q6w4Pb/bDxLNj6/PmuVqqA63hPtXMmusW9QWLBh+C6DgqzJ+t4+zbVJn+JXuhEQqOS27zCLgttPK6luVkzVhQ0S/zpdMZeftwXyAYOptvkmvDA9GRWEf1Kdb1mvW4R/pR7SUvrJXEUN8oOC/xEitTN/4nknEBup3lgpAlKIFDb+VImWLkHTNsHhBw1JjRzqbj5DjmqKGYmRM/z8qXw6YPTQ==;
	5:ITPcr7GeR4Ahy877Uxe78FdewcTNP+FHK4SuivPid2qI347gXV6lr+cXTG5OHPdY5RnlzJ/VSBfmRkilxLYjHsGtkq0JSWwHzM0t7yrA70XhRqWUmF9UiQ/WyCHuFPubUcaZfGIQDz46MbQCiIJmXA==;
	24:TD35ftVgGASkvzNjGY9lj8qcX7otHJ7yM2LfbMq9pXmTvdKWHZCre+XxoY8EV85g/it/TtWoXUrSoZcgIT+1DczjoapR/eA6mwyYAdNI7Gw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2675;
	7:kNdK4+8r9VdZGT5KGtTZYfOdgv/WoXQzkWX/BoLEYFOnEDg+ge+J7FEQD7bnzpjRQUCtnR8QFsg9gdpvMgjVR70n7I9Yjj2okRX9FaTvsKqCaZ2U4IiUamu9GH40+PVS7jRBFgfxEFqcls3SI6W9tNDQw/VOIwevHQmoJYniwwD25VHgtbDBl1zh0+py49BizfOiEfo1QoQCHPIx8bNkTd+km5kKlarqv1xZRMpbNhjYVGfPm14uGV545lcCXCL7Gn/bSzOLZNcZPF/YKd/KJaLoT3zN3KRwlNsK/pXk4Fll0W74gjdKLHATgLba1qFBwA/M25PxHI8oRe3BCLp56Q==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2017 19:15:51.7764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2675
Cc: Joshua G Lock <joshua.g.lock@intel.com>
Subject: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Tue, 02 May 2017 19:49:56 -0000
Content-Type: text/plain

Currently, the qemu CPUs for are specified as generic, but the built
artifacts are not. For example, we build x86-64 artifacts targeting
core2duo but run them in qemu with generic qemu/kvm CPUs. This causes
some packages that take advantage of the host architecture to crash
because they try to use CPU features not advertised by qemu. As an
example, Qt uses ssse3. When artifacts linked against Qt and built
targeting core2duo attempt to run on a generic qemu/kvm CPU, we get
the following crash:

Incompatible processor. This Qt build requires the following features:
     ssse3

We could fix this by making packages like Qt not take advantage of CPU
features. However, we will probably keep facing similar issues over
time, so it's better to resolve them in a more enduring way.

Fix this by making the qemu -cpu arguments match the built artifacts.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---

I sent this to poky@yoctoproject.org but it should have gone to OE-core,
so I'm resending it now to restart the discussion on the right mailing
list. There were some comments about it in a previous mail thread on the
poky mailing list:

https://lists.yoctoproject.org/pipermail/poky/2017-April/010956.html

 meta/conf/machine/include/qemuboot-x86.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 06ac983..acd03a1 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -1,12 +1,12 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
 QB_SYSTEM_NAME_x86 = "qemu-system-i386"
-QB_CPU_x86 = "-cpu qemu32"
-QB_CPU_KVM_x86 = "-cpu kvm32"
+QB_CPU_x86 = "-cpu pentium2"
+QB_CPU_KVM_x86 = "-cpu pentium2"
 
 QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
 QB_CPU_x86-64 = "-cpu core2duo"
-QB_CPU_KVM_x86-64 = "-cpu kvm64"
+QB_CPU_KVM_x86-64 = "-cpu core2duo"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
-- 
2.7.4


