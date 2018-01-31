Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id BABBD782EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 16:55:22 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EJAgAW9HFah/eax9VbHQEBBQELAYM/g?=
	=?us-ascii?q?U8EMwqOboxslRiEe4E4A1wKhTuDJxYBAQEBAQEBAQIBAhABAQEIDQkIKC+COCK?=
	=?us-ascii?q?BBDEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQMCNH0BA?=
	=?us-ascii?q?TcBgVCKHQMZmycCiw0BAYMUgwoBAQWEJhiDPAgJAYRRg2yEYINlBIE4gQOFMKQ?=
	=?us-ascii?q?jgkqTFZQ4AkiWdAICAgIJAhEBAQeBPCYNgXYzGiOCfIJGDxAMggh2iVuBNAGBF?=
	=?us-ascii?q?gEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2EJAgAW9HFah/eax9VbHQEBBQELAYM/gU8EMwqOboxslRi?=
	=?us-ascii?q?Ee4E4A1wKhTuDJxYBAQEBAQEBAQIBAhABAQEIDQkIKC+COCKBBDEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQMCNH0BATcBgVCKHQMZmyc?=
	=?us-ascii?q?Ciw0BAYMUgwoBAQWEJhiDPAgJAYRRg2yEYINlBIE4gQOFMKQjgkqTFZQ4AkiWd?=
	=?us-ascii?q?AICAgIJAhEBAQeBPCYNgXYzGiOCfIJGDxAMggh2iVuBNAGBFgEBAQ?=
X-IronPort-AV: E=Sophos;i="5.46,440,1511820000"; d="scan'208";a="79585577"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VaisalaWorks.onmicrosoft.com; s=selector1-vaisala-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=B/C3kpViRkjyA9eqJNSc8jhzoeasGSlWhzw0UpNP2DY=;
	b=vwwC08uZxV2IswvdA28FEQavs7dLCWdnz66R/5qhaDz6reG8GWMsdP+axx9svaNfs2AVNO1s6NK54S0NtBIl3jvPFQ1sMaJr6Nj1l2odv0/APQAjcH+YXpAXZs64E/m0Y2lQRXQc6kFRPMubaFtVje/0oTfO4nnO4CdndLxyBsA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 18:55:10 +0200
Message-Id: <20180131165510.15953-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: DB6P193CA0005.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::15)
	To DB6PR0601MB2536.eurprd06.prod.outlook.com
	(2603:10a6:4:6c::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ba2b1d7-eef1-4bb8-4e92-08d568cb69f3
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:DB6PR0601MB2536; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2536;
	3:1gC9KeZ/9OlYggBISMkyTv/wMoZCfe6LqYOvtPbWiC5Y85cZGphmsCyZ7p/b9/LcCw/TkDn571TxRuZ6dw7Gz6w1dTcq/TqMtjoFXlGkfHm3QSixbOvAHpvJRaAEeYNi6MsZOhAIvvgwuIJ4kIgMhdbhFms2kyzzyHA2DekCkOU2li7jm3LcITjW7WqXifkX+D0oQ6FCOhUpE8Ty0AqpHcAG8WEU8s9fyV5dMmy3QrRL45/ITTf+Qj1qWcNTfBQR;
	25:9fu4wJm9B3RJDGPocFaQcb/nMpM7RyF1WcJ2nA4q61dqETjmksbjKjS0byBh8RZ1gti7fNNVoEM1sigbzrGHmvBV1EIWLmO4FvfTV8OpvCA8RJDykSzm5cqBP0Kle6XQS2hZxJTOHjMuYwvA1CjcGlGPOTzOa1PV3Xj7A/l/wUBWRxGvvDdntxV6TMUrOrRBj/HTlnlBaSPn6VdoiUykb2QxQSZ1dzMJSxrGBTYgufJky9RbjRhgYArtkQGOfxVEdLb5GlREIx6HukGjWqsh0kPPkgqY0MRRk5DL9D4fp7AppSmh5ogTSTXHPrWRY4XsseVFPQHX7DIM1S3Ow5t4jQ==;
	31:JxYShRg1L7fNh2yFccQwBZveLZYRri4F/yl/7oOeKq11eqvzS+a47aJBnO9DJw8Az4VOrocV/8sAqJlukEIwCjpt6YQeEsMF3COFx9luT2ePLBp6qhFKfLAyXnR1PKFl6eEz6kArAU0zUbXuXh0UAxl51H1oCRWOSYJ/XJgsN6znWk4Skl+35h3oJzjcSuHkWTJG2TsX1aOnXqeriVZlw9i7n6PiJchJU4f5T5HX25s=
X-MS-TrafficTypeDiagnostic: DB6PR0601MB2536:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2536;
	20:IB12IdXRh/dKZCnBs/JZN4fLZhmw9onB6o+Nwn5d63pDTegCj4gkvDuGeQ7TkVgOGCL2O6VkqNlXTBc6TlS6caylfYtTuwENMY/SV/xeeNSyBOLAcXmxRlQRT1YzbR5RUl1jN2y5PVyYcGJ0G3oBUHgRiyOdi2OzjUG9HhRpRI0=;
	4:nX+wC2b2gReGhlSBg2RMnEsCnIAlW0aHI48b6mIjaJkmPUQnBkwXvxs67HXN+jNC1RhgWULpLEFNqDsajnsTonxVujjOQ4rLgzcV8M2ksuw8j0ukYUp6MqlaOu2VBe6DjhsyfJ/yYmPOaf9f8WtF48BgHRIdx+jqleNXmKGxP2CGefTDMWV0LwhcdBmzSV8g3gVmolkWXWdq9npbim4x882Gpt2gSyNtXFm16Ld0UvvqoC5bgPHO4Fdwq7VFpvLeHsodCfiRISLF9/+K1V8JKA==
X-Microsoft-Antispam-PRVS: <DB6PR0601MB25367F8B103187F1F9CD01DE81FB0@DB6PR0601MB2536.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231101)(2400082)(944501161)(6041288)(2016111802025)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(6043046)(6072148)(201708071742011);
	SRVR:DB6PR0601MB2536; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2536; 
X-Forefront-PRVS: 056929CBB8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(39380400002)(346002)(366004)(396003)(376002)(189003)(199004)(59450400001)(6486002)(26005)(16526019)(36756003)(7696005)(81166006)(51416003)(97736004)(86362001)(52116002)(53936002)(316002)(8676002)(81156014)(16586007)(69596002)(186003)(6116002)(48376002)(1076002)(66066001)(305945005)(47776003)(50466002)(3846002)(105586002)(2361001)(5660300001)(107886003)(25786009)(68736007)(106356001)(6666003)(7736002)(386003)(6916009)(2906002)(478600001)(50226002)(4326008)(2351001)(53416004)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2536;
	H:ThinkStation.vaisala.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0601MB2536;
	23:z7HyA/npmlZgcwlHhzKwHddq866UNKkUGYkU7IE?=
	=?us-ascii?Q?RsaxZepyyPXWU15hzAGfN6F7AufiQ9omffJnOHSVC44haYfePHq9li+YnZW+?=
	=?us-ascii?Q?iG7/IWrtruawAno6sxfhKsT4BNJlhNye8joa0eIO2tA4BLQeGUuEjbo3KCzN?=
	=?us-ascii?Q?LSb2yLkQuxbHfGOAGKDXHIFej0Z6jvLpKS1idxSfZNaJgBwu4m0YzCp2/iUm?=
	=?us-ascii?Q?5ScX8Xw8zp+/5TPKEYw47pIhNXIYwRqoO5KATP29gm7gtFJE2+2mDQ6V36qF?=
	=?us-ascii?Q?6X/gJbR85QDoXxHpkGevXKLvf5WyU5HzX08hi59nA7BnUdv4+AtPmmpnZ8Hs?=
	=?us-ascii?Q?ErjRX3X8dzcqfmbgtUeATUZiQhFmv/QvnGHYo1Xr9Vb+Gn5jj1b2K91wN8f+?=
	=?us-ascii?Q?cE7tjYPCoz/yktiICfQOFTexymz2v5UpKJ6g1nj7CS8SKqftRzJ8SjK/sK3A?=
	=?us-ascii?Q?rmdZUrjhkaEg3VNjku07jl9rxTXPf6VmhFc13tifeCuFo4y7bOBOsdPlqxqS?=
	=?us-ascii?Q?d5/VJm5uXflB2SJZLQUePNOWL32ogqfWEw4OQZ3uG3h6coWKP7tA1UYuBP+f?=
	=?us-ascii?Q?TgtGCqLm771bgu5gwivB8psBulf0BaRw++XnU6zXm3mldKNkrg3IC78mUMI0?=
	=?us-ascii?Q?miOWOrx333ZRBllFDSN+3BL3nL615SbFYXpeoy5Nsy5HGBjG5gN6thQxV3L/?=
	=?us-ascii?Q?/rMrzO6shwZU9+tce6Z+PhCX4bc2gCZqqct6uUiQK7d2oCGrsWsu54FRZa2b?=
	=?us-ascii?Q?D9VHHvt1xhIc3QbvRR+nrPayYIVgJmwgDG5bD4Xd3almdqLD8Yfum0QCM6sa?=
	=?us-ascii?Q?HG+2K8aOW+FQPpM//Cy0W33bM1G5xCoNvPbuKKR2ofvjTtOHVwNtl0/sjqPW?=
	=?us-ascii?Q?3jEeiBQm/Qkp8LSly2BY8Bs3/48u6YLJJcDEy+NctWynOxpcP++P7r+MRsvk?=
	=?us-ascii?Q?3QmLM1VMEeE8z88ej6CP50Ai/YEzDQ+IykTDWifpXoAtA1Yz7hfTqI1YTpvx?=
	=?us-ascii?Q?U3sYHVnTy8kT9RooVeFpREPhlnHnPyzxqdv4fPvrlPUTFQZGOj1uDJ5M8vOu?=
	=?us-ascii?Q?JaGqHc5qH3UPY7rA2UjMj4B40Ep8Kwcws78C3YHj7e7Czn6cm5Ud1DhDv6u+?=
	=?us-ascii?Q?4PwHdi1kR5XX8yX57uOfnsUamD6isu3wUstGGvhCig+C+nwaoVWAENFRwyBD?=
	=?us-ascii?Q?zNaBzZ70JQbo4pmY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0601MB2536;
	6:2WnUfaCfNUJ3WgFfJ5U1ff6aNjKWYTMyDcFY+K+VurLTYqNNSMCloiT43QUuKMu9p4X/2U6fBTX6bva+3M4BJBAI4KAWyD0yEWsk51hpIYywFNdGh3vy6K3poi6tlv032l92zgzjWQkHPBkMoUA4/O95Da+py7qjuwwhf393F+u6VXR+9GXcWbFXF4a8FW8WbFR71B7lw+xgC4+aamDKzGcSEeeayWoA6tngn7hV3jnQu7Jd1RTN3vik65pQ0JrlCpiG3JMjGXeoPaOe+CaAgloeA0gCLq6c57UtCIUvFpG/4Vu9dkCffL90/ukU5Vn8MvdG4xMfypYIjwhz6DVDFQWeK4q+alPlL6Hnrqc1NJw=;
	5:YjhtJ2QUEUGB1bx+tIdYgTB8lE9puh7QOw16d00g1LVrUapdl2yAuFXHoRBc4ddAvK9bc8Rfc4+wYa4ePNh9VtUuPfZN/zUGh0AN5BBLHhtSgy4eI31dQ37nZYgp7MXiKatnRFR8/CsQFwbFHHID7m+so0GVpeinaOsVAw2cjI8=;
	24:g+xkjip2OFuG+0A4YapS+MVT1b0YXeyJ+ipy8YaHNm1ketR215AwrH0gJRF70W7e/ie+NK1/CKHHF0RUxEusn+hx5XT8MUY0v7kaWkwkuaI=;
	7:cpI7Z4dLoNHAgfYth5GQj+p6pbMSn+Lqhl0cYtpKydD86vtwbi3pyvk6J+d6snHG8TQ1z64ua7P7s3+jBtntZ/S54kvdlJPi5wWueQX7ElkA+1VTQMG1pi3qiW1R/6Vk0NkahS4Ol8jjHnOlY0f3WO6GO3LXxTX3j1a619OfY1PUC6Y6ivVPWF7mkKLSmVOFcCxYkQ+0JLvOhpFZuidIQHebFhljsH8tBqhg7kIN+5n0awFQQKTd9sT7T82Ij06W
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2018 16:55:20.5964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba2b1d7-eef1-4bb8-4e92-08d568cb69f3
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2536
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] bitbake.conf: Add xattr to DISTRO_FEATURES_NATIVE
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
X-List-Received-Date: Wed, 31 Jan 2018 16:55:24 -0000
Content-Type: text/plain

Commit db1f1adace58763c35774e3fdfeaac5c3ca646fd disabled 'xattr' from
DISTRO_FEATURES when native packages are built, whereas for target
packages it was retained. This changed eg. mtd-utils-native to build
without extended attributes (capabilities) support from there on.

Thus even setcap was called succesfully for a binary during pkg_postinst
on build host, the capabilities did not exist on target rootfs due to
now xattr-less host-side mkfs utility.

Adding xattr to DISTRO_FEATURES_NATIVE restores previous behaviour,
fixing the discontinuity in capability propagation to target
device rootfs.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93afb13166..411d7cf6f5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -808,7 +808,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?= "x11 ipv6"
+DISTRO_FEATURES_NATIVE ?= "x11 ipv6 xattr"
 DISTRO_FEATURES_NATIVESDK ?= "x11 libc-charsets libc-locales libc-locale-code"
 
 # Normally target distro features will not be applied to native builds:
-- 
2.11.0


