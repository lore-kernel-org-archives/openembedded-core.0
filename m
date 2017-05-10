Return-Path: <mirza.krak@endian.se>
X-Greylist: delayed 5552 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 May 2017 11:09:52 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0090.outbound.protection.outlook.com [104.47.0.90])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC0F71ABD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=endiantech.onmicrosoft.com; s=selector1-endian-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WWKkS3xSpsbjzxhj0JL8Tp4BCuaJlTKp/5bXkH/w/rE=;
	b=ee/Pmp3FPju14EWaINucEV1O6SgXrgZ2VoeKH8b35d4XMFLDWn35JnMx9k3S85skFbit8jTVleOzDFE5UCWxCojXknSFfd0Dfrzsuz2jtCc+T+s6pnB+1Xx0WNqQn8ZI3d1jpLR+UxdVlV+CdohTnJ32oblTEBsTvo+FrcZIqtU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=endian.se;
Received: from localhost.localdomain (212.116.75.34) by
	VI1PR0601MB2286.eurprd06.prod.outlook.com (10.173.82.17) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.11; Wed, 10 May 2017 09:37:19 +0000
From: Mirza Krak <mirza.krak@endian.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 May 2017 11:37:05 +0200
Message-ID: <20170510093705.12171-1-mirza.krak@endian.se>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-Originating-IP: [212.116.75.34]
X-ClientProxiedBy: VI1PR0701CA0034.eurprd07.prod.outlook.com (10.173.77.20) To
	VI1PR0601MB2286.eurprd06.prod.outlook.com (10.173.82.17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8de2025-1e83-4de2-4775-08d497882778
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:VI1PR0601MB2286; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2286;
	3:D6zHI1AEM+ClzkFt9cSU14jRt1tFkjdaqHLHeqJikt1Wq1MglUWVa09rl4adta1rSh+1TrBurUV5G+cSbhQuAMmXrrpNMUqD2calajLjZ6jZNCvQ/qp/S0PwmqtyTeok779ZYi23yhFd5DecwoXA8wLxQap6TIIRBXmjJLNBhb9V1B8wbinGXWYZ22H5T83wRlJS+X+yrWgLp2LaC+o3FBxoW2DSvnQNhlxj+GhrnZgTXWdcT6RjjqqAge6yxvvDE9xuZLLANnxq+20fPxs+4lcVq4SphxUNpoQ+mbicbdmqIBuKLZAexhIWyUV+zwB6;
	25:EuJv6iCNJvmeQWoTV2FI3v+ucUzfAs/LxWls9WW0BzJhapy4qAIcm2+ab1Z1crLbv+6WzIyNB3ImfZkxyVmK4Bt9s33g5hEMnU6joQcu+5tjWCNsIzYYpSSiJocmPSNpJlFxIPYWUiIGPEHpoQlqzx9i4gpC7khRlzwKsDlUVwOwb4smeePnpatwIYyQdutphmWh9AZxzTa+cKLFg4N4Tmu1yv40TGHE8akaPNx/OBAQUBPU2Jgv8mIYXefRb0DjdbQQ4kbJj5AUTD8wqAioB1kBCWhOkyZO4k2MXzLxdyq0CXRFi6c7qgV6akXcIX92KfGRzBAbmVh5XxtqXEGiWEoiD7WLgIYMMoQireO6Nmc42vB3E3LZMSjMhZqqd0FVqgoAjifDg8mLciggVB1YU8pVgEsYAPbVgN5qdOqOvW5DdEptZsUh19deil/pSxi61T1VPd9p7bAf3Y96MQpCNP3vuDstVJy8q8Bbq7yGSlI=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2286;
	31:hRUtZPiu/WSReK++MlmZvNi2NW7ch5WDhY7eseiNiVhvQ4thy+9SxpVoBxp1NBtGcQe+e7jMedbZxwt84zYWbufn8aXoCxrmR4wVkCV4nuXgp1Ia1EAIpdffzUjS6Y3OPdEoKWLCLAF/Rp/FCSCwBG0iE7bq6NRYMbujCHx2CRIYjl31Tysq4yjZtpcZowxlupFUeeoFK8kM3BwxVtb6J2o8knacp1i17hn7A78SK7U=
X-Microsoft-Antispam-PRVS: <VI1PR0601MB2286924E2B2D01834CC461A69BEC0@VI1PR0601MB2286.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123560025)(20161123562025)(2016111802025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(20161123564025)(6043046)(6072148);
	SRVR:VI1PR0601MB2286; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0601MB2286; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2286;
	4:m+a1MuFiBh73fdAY49YsbzIBjLDsIY8NH7OtiW6uqjh/W3Y5Ap1opR0YzKl5Tc1yMZ0m90djSJcOP4x6TdWDr5BCASvYV7UMPY3Q6o0rL9FzS9VnCqTPYDkuYelM9pzqrhYpZWNNnF7MtIQYeeZLJKk5eASkQ/BPphx5vW4C6/+d9PO6Us729fAlT4Eqa15OBWBUQBE2tUWX1hwuA4EGP9Kc3wOPSvD2c9qMpG5sZPsWEpskn1UaRFsvQPN1yrPjgIlAdLZJXMwNTMQE2JGAypMW1IQIFgr/GIlidKaPihtwWp+/eEfDOqLwFV+MsroaOGGM5jJZyAhwPJI9gNUrUOhsEaZEdSiX1pESUMubYiqo4koBey0qDGWmoybPZOPVR628WuP3N/O4AdDWVYYgY00TWyN0VQF4GW4PY1m4Vz+R1OHQwld2NQrEZCqWzHwJA9COKTEbvoIBLSxfyra33LFKfO5Aqi7En8Rr2EP4JuViB7xg5oS/uho+6dZsmOcPb7sM95knjlaLSlB722vlCAoObdRjTmiE0VVAQUJavu4y59m7Xjq9QRkFg0jKos/aiRA2XulIZDLyIPuU4YHSX/s7iSr55MEkebqAFvw6XkvLXmCEP0adZ9zDc+gTsFkopXTCl9sClD6BqXAVqRNx3tvts87gw2nlCskH6Viy9k2CRoXdBegY3Q7Kn/SePnqYLWUcsVjL2PTDL1JZhEPU3/u4NRWhXHMO6O0ecuV7QDgrQltO3wqtKK0WbWIreFGuIfW+zpMjbsFtfJppeosW6Koj6T5dL4viZzHRc2ez4KcSAZwZGVb8ufiOdd5na+q8dSYR0DVTWBw4iBiKPa41qA==
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6069001)(39410400002)(39830400002)(39450400003)(39400400002)(50466002)(33646002)(66066001)(53936002)(50226002)(1076002)(48376002)(54906002)(6916009)(6512007)(305945005)(6666003)(42186005)(86362001)(36756003)(189998001)(5003940100001)(110136004)(38730400002)(107886003)(478600001)(6116002)(25786009)(6486002)(81166006)(74482002)(2351001)(4326008)(3846002)(5660300001)(8676002)(47776003)(2906002)(7736002)(6506006)(50986999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0601MB2286;
	H:localhost.localdomain; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0601MB2286;
	23:fH00vqMKucHv0KXa4w/VJWEGD2eXXuzKbV19cbi?=
	=?us-ascii?Q?4dnpwxztLt6ymqppFBBzNaM1GI+ndwmaweyZ4v7za+PXs9rVTcKAA0L525KB?=
	=?us-ascii?Q?Yv1zukWMGhUJpytpgTZJIwFqgibF2EZVhNl3yWN0n7QcGO9toRyUEgVqh6yP?=
	=?us-ascii?Q?KQjE12JXPPiOkTf92CNMO9xaN4R4h+FEYw/NAuv/0D7uG8j/L9igoy7xdkNP?=
	=?us-ascii?Q?AOgyOSDFKzDuVYRPWOmhg9ZHdfn5oPwsnF3QKBJM1V/5E+ISuYSrkYn8RBYC?=
	=?us-ascii?Q?k6Fi55kuTnAlCD/U6Vh28JfrR4UxqXPfn8jurTVzi6i/r5QPsAd7Hr39Jm45?=
	=?us-ascii?Q?hs4qL5PgphXg7ukFs1Mtw5rCPHnBVqeRzLi427dT8ttFkmJqKwXIYSikxFiH?=
	=?us-ascii?Q?TLDKPg5TbMvwmsSWoQRwX3hoGTwxvjW52wDO75volOXQ4gjcLvnYaKFxFYB3?=
	=?us-ascii?Q?2Pa5S4POaHXxlPw8Si031t9qVMAI42YGvAKUzhIaxrAzB/JlHNt7VUmL14AX?=
	=?us-ascii?Q?AeCPL+n0l8KCLLivc6yUQHnFcTCXQ6Zy4/XCw2fMCtHcNAF38SsF82Ynk9v7?=
	=?us-ascii?Q?2wsVcJ180J/GncYSIvVOLHkIiEgFZ9G9tU9y+C03dak4aP+rM0/dBBkugAYB?=
	=?us-ascii?Q?9rvIINHdRP16sm5vgD5fWh8E2rFB8p9VW7zLu38REU/A00aON70JKZv1lD9H?=
	=?us-ascii?Q?C8MEJPcAOhuFldGlb6Nkq6BYkT0u3SDntQp4sftU6W9fAmbTY8JN7Kv+xct6?=
	=?us-ascii?Q?2CsQIndsBW8GopMmcBFbcNUa49HdydrcDMOpOJlFgOlHqBmM363KJKM/MJ3M?=
	=?us-ascii?Q?vG1I9TM+pu8PyZfb7qbwneVJObbfgNIAEK1XKU06hj9W9x23X9DYlBrEDSfI?=
	=?us-ascii?Q?SNYrjcYLHj6KmtbJR525cRf28yGhoVHuT7C/p5CkpJLdv2aVMM/Qa2gLFsWc?=
	=?us-ascii?Q?6er8zuV6TDuO6jArjReEOSaZhnHYiVRrmJJtn7lmbjuA942t40KVOGkJlgiu?=
	=?us-ascii?Q?xZROj01oNt0DJu/QbUJ53rFCDFrn7oeqz2HuR50tYEJ5WCvmbtdP1W3KFX0I?=
	=?us-ascii?Q?cMRXGuCIrgVBPV1SSSL/4ZjPKszVG?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2286;
	6:3CXFYhslrdSuUWygGtH/PdEmWuKETON5m+1eOOJhp8dsLXtzDuowu8q+b8X3sEJXeacqaH+N4HOSveUqu9lTpgxD7uW4lBXjKZOPKkTinSwTg3JLfmK1phQ3ht9KtBzVyKZqr719CBoMKWsQEN0SLKzx2BBWMXIy0vmtlLYIHSmLTfqNDTs6uj9xMInhUE2wSzg90L9HWQ8BEiBhhmyxYOT9sCdZjGPlgXctW27te2umdkn3om2qxNYjYuopoTzof6XRDr8ZLalGeZOUMZWkYV1LqrlEWLSvKcV2OK1Ix8X85r7sDzvXzysMW/Jby1QtFsMDovTD/npu4XPYHhDQacEUVy+wIf8thl6hlL0RomUCGocC+CiDtBuNPeSj+a7qhcIwXFnrGPZ4AN9/FnL82gfpO8kR0NXZP+MopZpgwJ3T97LRleWtANNmB9Wb+1+NIUS69NhuY2iST1JUTXETXpDG8X6o0ZjMGAeI6AqckaCpiD0f1pv1JAiis4sBRy48uPhcn8qyH1k/9ii5DgmyjA==;
	5:sV2QYVAeMgkd/fQ6DwAz7OpXOFKoxnxcy9Kg9KNX22EmlElmuNhv3nW57AV2fpMUHo017jIag9U47Hw9ILcmjS3/hsd8QXrmQXqnO53GelMcJo6b7SXeIm4n/2PHqSo9rMJOrDkgER4k6zxZl+ZzBw==;
	24:D2EIwZL5yM4BJ5RnDjuHcryBMElKmI/dkaj7rgEr5lLRXKSQIluWjBPkWDZA9sVtbOHtn98tu7B5pKTU9pF1OGbOC91THZbU+ZBhC3j9vyw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0601MB2286;
	7:8N3B4yZeWrtu08oWF/bL79REldKZefHEQDanqY+3SlcKtAHnYgIP56XEdPJbG+BjBreB9t7AACNquxan2+oi84EYR4XbKv8tIkDo7mG7e/dReYQh8IsSz57JCMnbsRgnZzdo8CyqAN3FEjSNOU0ZXRb5Bri2DlkChvfY0hPNbmC4aO9aHOyPKMWwLbtB1WYs8bpwse6/x2pvbYqnW/xW+hKxo1l6IOab+E77/R8qCciSKEJDcyLt2ctTC+fFUm/6DwQhh8QuxxiAY8OIP3MuVpedKrWSiJI9gthqhubGlsA3qgbNC4H7ZTZvQj82+n4bwU4zXr9R7qwVuEmOyQAaow==
X-OriginatorOrg: endian.se
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2017 09:37:19.7661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2286
Cc: Mirza Krak <mirza.krak@endian.se>
Subject: [meta-oe][morty][PATCH 1/1] openssl-native: Compile with -fPIC
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
X-List-Received-Date: Wed, 10 May 2017 11:09:53 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

Fixes
| /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32 against undefined symbol `OPENSSL_ia32cap_P' can not be used when making a shared object; recompile with -fPIC
| /usr/bin/ld: final link failed: Bad value

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0a19e72081771fca8ed94fb2a2a8996fd3dce00c)
Signed-off-by: Mirza Krak <mirza.krak@endian.se>
---

I hit the same compiler error as in above commit message when running on morty branch. 

I simply cherry-picked that fix in to morty branch. I looked in the git log of oe-core and it seems to me that it shall be ok to do that?

 meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
index 9a7cdedd05..b6fb126349 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
@@ -5,6 +5,7 @@ require openssl.inc
 DEPENDS += "cryptodev-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+CFLAG_append_class-native = " -fPIC"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
 
-- 
2.12.2


