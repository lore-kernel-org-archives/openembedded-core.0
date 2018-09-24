Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 8289 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Sep 2018 19:03:00 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0091.outbound.protection.outlook.com [104.47.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 941A479261
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 19:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VMTIcOZtTmCV1v37yCiHfgv5tWra9KAQoSTsVEELeAI=;
	b=sGkAQngjSfJau8rRpNFxlrYtfAb0t65Sq4qGZgdzbRjb4a83qYHznl/V61C843BnY2dT60HKIwe+ZqN0uVz53DGMWR+c+oLvLpeT0GDx63FFTDra4Zh87+C2BrWYSZMuSWpYLBjXiTRXGSiKganyVtwxiPRiRJJvtDn+yFHhp54=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
Received: from localhost (2001:1c01:3b04:4900:8da0:c385:7971:a200) by
	VI1PR0702MB3647.eurprd07.prod.outlook.com (2603:10a6:803:3::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1164.15;
	Mon, 24 Sep 2018 16:29:56 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 18:29:38 +0200
Message-Id: <1537806578-16616-1-git-send-email-jhofstee@victronenergy.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [2001:1c01:3b04:4900:8da0:c385:7971:a200]
X-ClientProxiedBy: HE1PR05CA0209.eurprd05.prod.outlook.com
	(2603:10a6:3:f9::33) To VI1PR0702MB3647.eurprd07.prod.outlook.com
	(2603:10a6:803:3::29)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00a37180-0088-4fe1-8911-08d6223af6fd
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0702MB3647; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0702MB3647;
	3:YsKfMREJTxIjNp5GMNuu1jiPcs+FYQaiCGXYvuQMD6Mq7Mix/tZn9KPBDBtLnQLnEmOvB3BS2M6wY+N1M6sueRCYvfQ06jyXo1qlmMzlVeDiEIIjsU3KIZDnfZT4PoLQ2Z1aTjawAEpKl4UdJMlFibTvuOhWG7Vmv11mJgAlQAjM6POdXLzPU2hu7Jp1VYDOI6Qle0SMDsZQQfjmd193Cid096kfVXVFz13gdd0gv6iVEfD5Rehl8WgLAkgdRq7z;
	25:FJLGPe95KPv8KpXBUpHgfT9HQw3Lz74GqEVKcuG4dB3+kaVOXtOqUZkszeV0a7xGL/N2Wrgvu2qwQBiUPLOMv72cMUNeqfFoS83WyEYBMJP076ljreWQbLJkOU5Q0oMvKpDl9AQ0EctZ+FSCEj7ED5o0SVdMJ7ECrDlFlx7PO1voBud7ykPpXHNtcjS+NukHOe/90yt5hTVrRSaNm4OBDuMWwWu8WTWIVIbAMvWHZxookLxmddHUmAHb1XA8XRfxYgAIEaLeOnOgoBDgNqugAInCgCc19uHEf36apv+P3cTj248Z8+O0e127Vtsj5ODU38bPCBLuBCby7vP3gMQrNQ==;
	31:i+sAButH82jrGnOWmTtQo8AScrD4Plr6v9rETPa+3n2S7wEgYHfhprGOYz1DDcjwZq9bur1HnHTvZd22NRET2RibLBzC1HQgLkl34k+UTzOaW/bK5QHg/893C3ZLwb2izbUfZIdT6PQZsHlcctyhu/50+bLzh/tiGoe9f14t2A3jJLue/MzYnV9WOnAsKwr5oqqRL5w3KaRoZvHxF6qonM/jIxfdx60YVCsnm01jXtg=
X-MS-TrafficTypeDiagnostic: VI1PR0702MB3647:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0702MB3647;
	20:Ndh6kfu2QY5c57ebcMsDKEzJImRWTyMIdiI6CCSfLBBQ9sFT1zgIGillnvH6JmT8BzxsFWXOMpj0msLVb9e1hy3AUNqt6MjmY+Z5U0BpzOdBmDhLs0aPSaKsZNkXaWXeyd1ecdRLoq+u8Uieq5OFjIEuc9fI90U8nv9cxP1O8rrgh7FOqHIF+gqAWS/hOa56wXWXOJWv1HcDpcwIo24hzZimAFnzQUVM3wkLuZIXuNdDoHWECHtLe/O/PibbN25m;
	4:BQUIPPTOeFCxE/MtsiIVN93RbePXxF+fAnkM4oAHfdXXoOZLJ9d8fwHHBFgs+1rvGeTLoS45lvLeP/n5Y2gHbDgH0539+zaULG2d8uRw9xRvGVkkb77whqhl1eAR/0OhLhJ9ojKpK4d1v5XB5uB41PUiIwIxdoHnqySFihveIKzQgu0kGlllozJcuL73zSsXkK69biDfRLvmNHvi/jlO5lYN0Eywp6OAvOnnPdQRCwq8dsN4HeJ/jpcYQ2UsapImSla06D94e9JstLViEWzBVA==
X-Microsoft-Antispam-PRVS: <VI1PR0702MB3647B18AA894A7E5049EE4AFC0170@VI1PR0702MB3647.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231355)(944501410)(52105095)(149066)(150027)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(201708071742011)(7699051);
	SRVR:VI1PR0702MB3647; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0702MB3647; 
X-Forefront-PRVS: 0805EC9467
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(136003)(346002)(396003)(39850400004)(366004)(376002)(189003)(199004)(2616005)(86362001)(106356001)(25786009)(16526019)(107886003)(47776003)(53936002)(4326008)(2906002)(97736004)(36756003)(7736002)(476003)(6486002)(50466002)(68736007)(386003)(5660300001)(6116002)(316002)(6916009)(6666003)(48376002)(2351001)(8936002)(50226002)(575784001)(305945005)(81156014)(105586002)(81166006)(51416003)(186003)(8676002)(46003)(76506005)(52116002)(486006)(52396003)(16586007)(1857600001)(478600001)(6496006)(2361001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0702MB3647; H:localhost;
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0702MB3647;
	23:FDcS6t570XlynN0qWK5joaWvnxLzjYnBj4aC6s0?=
	=?us-ascii?Q?sKRHU/JZxb7S1CeTWAsVoNDEmPXcABldqkgNH4a/DXuXRXBtCTHWlVHVPfgc?=
	=?us-ascii?Q?75y5nFXvZHj4lHnxy/wgrbie5v0XL4QWv7zBBBlVL5Ypc3czx8qXtAUYCKxe?=
	=?us-ascii?Q?lNtOnxnM8qxv/s+trptYTOzJPiSwuUMQ1J4r1laC7FyqSExxe28XWeYHJLXA?=
	=?us-ascii?Q?sfaUJvBZuj3arF0KBkRplu9t0bCR/ES20xbKqhgm7qLaVaB0F7XpUdN2v2uK?=
	=?us-ascii?Q?hWK5JZqIjesr2CBEjG65xMXDrAhU1x+iBdts/g57QRFvUQvZBQcZZla/SGkk?=
	=?us-ascii?Q?MEUDTR6AWe2MVKZUwnjSzp92bkJPeNHKD9RAFDJz6xZMbfghU5NVvZ5F1VA2?=
	=?us-ascii?Q?1pGRJNO7A9IQV2hmal9+mPBRIPv22sZz/VfoqZk1x6i2gx2AdOOCfEYQvn+i?=
	=?us-ascii?Q?gArI5nn2bxJGuBdDa5iWVRtrQc4BBq2hBn0vUPbR/x9ifBhuDZRuMK2yOi+g?=
	=?us-ascii?Q?smysJm5cbvBgot3Z3G6lWjLDcSvVlOhmt/YTEYcFbFVXfDcIJFE5MMYoM7GW?=
	=?us-ascii?Q?1Br7am2X6Nr1djawrOAbdl2h8jHxWOI3DgcEM7a/q2h548M3fQLJbCXZMKeM?=
	=?us-ascii?Q?ij06Z+jtALyeFBsUVX3EuOmOeWkqTbmGYtj1F8rUyIm93dzC/eeXrGev7Vdm?=
	=?us-ascii?Q?nV8O7D1Jc1HLzNTztS3FRocJjK3ksX7xkiUVkGmNhFz7ZQTFN//QSEt4z9A/?=
	=?us-ascii?Q?WV6gVaFd90fQgYtviBk2SNfvSfVpN/FiA+DuBfaxbiO6KJ4QNLe1JYW3SwVj?=
	=?us-ascii?Q?DD6LButZc2vpIUN/tNfzGcGGFd5KjgJxywkuvjJWN5q4kmh06gIirjoien/7?=
	=?us-ascii?Q?phvtb1qVWmduWhSmFR82T//os2pLJ4u4NkWa2BqBf/X1a/Muk+BRb0/wxdGe?=
	=?us-ascii?Q?Wu2NW5te+j6nnd90WXFbx3yKNRrhPperQw/xH/O9xi0KYtvGjVPoW/tzBx7F?=
	=?us-ascii?Q?pKxcID6XzHoZxX0WwVN8evZKOYrx2blWuW4Wsw4TTD0BC14+Hz0lj5+pZfgz?=
	=?us-ascii?Q?E+nWWDkfmyETCRWvS3gH73Zoe67ZyP3zRIY79LwSZsliCdPm2Sktc0cMtyvz?=
	=?us-ascii?Q?qcugK9f2eJFq4lwCV9ndb9qdFKVkbNI1UgYLl3kI1PDEsR/UqpInL5UyWKjr?=
	=?us-ascii?Q?e7mEH5v9Qrh9/nfgMWxPVSD5ahwGbmfSRJpZ0?=
X-Microsoft-Antispam-Message-Info: 1fXGw0AaUPT3VMAO64qukh79ElK8s83KcY2heO5D1+xSVLkFx0Rmm5OFSxA7Kl70Wf73REWN04zQ6K2o39yKcs7v5IK87TvRx6+UlyA/dKNoD20o9B64Rlixhki0jKJi232ioo+pUU2yDd5GWlWfQvVzRD98Yg6/w1dB7NRZmXKKX0AAHlUWirV13pQcNVGeb4cHWsFrrVYcwjpeP7F5D5ysosiRblB1r7ytW9q88oGEjQ8THtjOCqT8ocY+iHco+UVf7KOWffpsr6aMYvexbJbvKaNJX+/ht98Lx/pPV8ElpwFyBDl0ehXcKn+pEnsATS/ycGO9Kd/N6NxsCDHS85prDdnV3qjnspeDpEIgR2o=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0702MB3647;
	6:D8yzjdfIhQxks6Cgo91EzI72f0BHxJDock175Wh9SaykloSAXhoWk2y6eH70kwTkTDIyQL+slA2hQGApkdthBViQ51JFnaQvKna93zPcNTv27iu1uZjFsOHp3R98/Loql5/ULb/IgDYYCJeHg7P6v5Bym+et3uKctPBeL05RR9K0Tl1fqLjsifcY042g8AA+TlZBFsFNKsoxKP5MSIwtsseRrYEF646PMmKZjFJPZ/C3VOmlnpKh/RuzOjuR2yNfMkRJ+1lour1VJvzEbEsTH98Rt6f6PLfwIsi8oYta7ivDcehIT8jAqOKdWFvLtAgi28PPuN7+JdDGUyIhF1InMr4F4P1d5qvqxiEcdXxXi5ByEY8gTtr7UL0YOwNSzwvtTqelA0d2t3iw15HV0XDLO/twtJXmG3RrwkXiV0RWXsiIvw5OFTePyrq7lcpktz5guuhJO/xfuKADUYX2Px45uw==;
	5:VjV9x/B8CzYcmW08YMlJymMrOTuXYaB3cHoRGPJyqLQCmPCkjEpEG+zFVqznuyGqcqlGvouROjgpQ3QeTU0xNLcUYU4gY+bDIBiLqt953tPfOIiaAbMfQE7wCueDyrzmRi7qHD2RO60vjB4DDsZhTGN8kn1XbhU0OMK6E4cd40g=;
	7:fnmbl0oOOYnyrgNaHMyjvHWYlR6qZgXX+pGf9zxnkgZpOsChxvD9Kvr8A2kgiLQ75LTAcM2aENpmcmzWAxhc+SgDPcHBK895KCJTLHG6NMMgQmBOFe06qUntgNujHDhF/wJanzqrCJzSVWazQRyq97XeeQDUuOaFZ9feiPeyRSrORkA+9HX+0jyI18i4qRn7BpUsouKtyXVS2fEJj/o7ChU/MXMDYRq3BKm4mGHk5E4Vo4ovfDpjUrHlcdlQARs5
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2018 16:29:56.4731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a37180-0088-4fe1-8911-08d6223af6fd
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0702MB3647
Subject: [PATCH v2] bash: 4.4.18 -> 4.4.23
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
X-List-Received-Date: Mon, 24 Sep 2018 19:03:01 -0000
Content-Type: text/plain

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
v2: add patch subject prefix
---
 meta/recipes-extended/bash/bash_4.4.18.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_4.4.18.bb b/meta/recipes-extended/bash/bash_4.4.18.bb
index b338acd..8fa0978 100644
--- a/meta/recipes-extended/bash/bash_4.4.18.bb
+++ b/meta/recipes-extended/bash/bash_4.4.18.bb
@@ -5,6 +5,11 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-019;apply=yes;striplevel=0;name=patch019 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-020;apply=yes;striplevel=0;name=patch020 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-021;apply=yes;striplevel=0;name=patch021 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-022;apply=yes;striplevel=0;name=patch022 \
+           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-023;apply=yes;striplevel=0;name=patch023 \
            file://execute_cmd.patch;striplevel=0 \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
@@ -19,6 +24,17 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
 SRC_URI[tarball.md5sum] = "518e2c187cc11a17040f0915dddce54e"
 SRC_URI[tarball.sha256sum] = "604d9eec5e4ed5fd2180ee44dd756ddca92e0b6aa4217bbab2b6227380317f23"
 
+SRC_URI[patch019.md5sum] = "8f43e1d277b02f3319a34c1cd4a4ff3e"
+SRC_URI[patch019.sha256sum] = "27170d6edfe8819835407fdc08b401d2e161b1400fe9d0c5317a51104c89c11e"
+SRC_URI[patch020.md5sum] = "5217ff08c444446ec306dce60437c288"
+SRC_URI[patch020.sha256sum] = "1840e2cbf26ba822913662f74037594ed562361485390c52813b38156c99522c"
+SRC_URI[patch021.md5sum] = "282c7d9b38da8005d25b4f816328a2f4"
+SRC_URI[patch021.sha256sum] = "bd8f59054a763ec1c64179ad5cb607f558708a317c2bdb22b814e3da456374c1"
+SRC_URI[patch022.md5sum] = "0b709c9d7f8e6cf267a8b863efb899f7"
+SRC_URI[patch022.sha256sum] = "45331f0936e36ab91bfe44b936e33ed8a1b1848fa896e8a1d0f2ef74f297cb79"
+SRC_URI[patch023.md5sum] = "fe2e0ca4cf9409ff0e9428e1236f983e"
+SRC_URI[patch023.sha256sum] = "4fec236f3fbd3d0c47b893fdfa9122142a474f6ef66c20ffb6c0f4864dd591b6"
+
 DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
-- 
2.7.4


