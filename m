Return-Path: <jhofstee@victronenergy.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0113.outbound.protection.outlook.com [104.47.2.113])
	by mail.openembedded.org (Postfix) with ESMTP id 43BE371BF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y3VrNFG6/eAw4FGI5M26p2UAVEjewW90h0h4kbgZPVs=;
	b=S2ME8T644fj94RM83Sk3b489nFby81MTqjywaTbn/tlnC/XfGu8T10ERDVPfhbWuxwBMVBMV9LVqgx9QenoGJTMnmdmIyS7SfVicNEFehb61HoOWSs9IYK2yrLL1Q4gYHNvV+tILdGiwQYHFqZN8GHbDdZ6BqvelMB2ojm+efy4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
Received: from localhost (213.126.8.10) by
	AM0PR0702MB3634.eurprd07.prod.outlook.com (2603:10a6:208:25::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1185.13;
	Mon, 24 Sep 2018 09:08:41 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 11:08:28 +0200
Message-Id: <1537780108-20063-1-git-send-email-jhofstee@victronenergy.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [213.126.8.10]
X-ClientProxiedBy: AM6PR0102CA0019.eurprd01.prod.exchangelabs.com
	(2603:10a6:209:14::32) To AM0PR0702MB3634.eurprd07.prod.outlook.com
	(2603:10a6:208:25::22)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b8b40d-58f1-412e-ebe2-08d621fd5278
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR0702MB3634; 
X-Microsoft-Exchange-Diagnostics: 1; AM0PR0702MB3634;
	3:QPNb0ynp400eZ+WWreOo49OlWXQD/055MnEXsb6X3x34gz6S9PkhSPDwlqAm4EBp2iMu55K0oEpiFtZQs65PNPAq+oqwlBsdRrz+dEvNxXxqFmc/Y4Sg9ufln6kzOfNlAbHOtXIgrMTFlHHEcWIXFe98huT7lkqPtLUZMwIJyhx7LvKA2czegSHgknDeCxXCfWDOalc9g6FpKbOuE/6Kz/IBc9cZh3OdmM+CUiEKiqB8SuHJcp+xSO0eV7QLqX9C;
	25:QNky11A1OMkQLneDIb5hzAAoF0OUbC4vvIpUcxEbEeS91ErODfGbyfk13XZdIp+5HlpzQBFCVUu/lwxgdShMsPIXEgER0E+qrdv7ZS2qUDv8s1qcfWy8MjYgZNudlKV31qGdNlPL+KqfIGLbSDIZdNveET4A2ZfZEidzc5UATWVcFCvI41CjsvGW6rDX0+rPpf1tG5n9lHeRJ0nqcD1RgkIDN6jW9D40srX5DYGcSIOFNGmLnEnnXM4+/XiSyuIGk80KPp1tnsMDbFxgojo/qNmUxEueBdPEdNWKScEpTA686ajSEWCJhzsXcvKmdIvKKlQXABgNyq8rUs7VubgNsg==;
	31:IVTT+YG1boEcx57KTjFZv4YEaihHn+Urz55eFdjaNxbe/liwGXatUnSq/emYytVjmQ8VG46W7rr5CHc5Uj9Fzze27eaeQZvoWoczXocwx4enWgTKZoQugm3x/D+uoHey3qTEm/YDZDzuInbV0RrrsQf0ju6wElj76KzTpUBEu9HM+NdKdki/sMZmIl5SdieojrDHGMlZ65ONSagOykLb31hp9Ee4tVKPG2lbsmnARIA=
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3634:
X-Microsoft-Exchange-Diagnostics: 1; AM0PR0702MB3634;
	20:d7zTyFWRgca9VurJILIEcrUU69/UX4ASX1mgPiPISMw7YiwBRoqe4lMo9hDVBdz460ALqfuQH8SCtik1KnWjz9ANZhRc2QynKP+yCEfzLAlYGJqYVZxAhNRXo/WuEH/3YbdKQXT9ZDfU1Kl5vJm1+NbkdTVM97+6i7nTs78SUCcF+aVrVoTw3Yx4sIhqeoD2iaZARfuDT69ckCk5g5N9GaGdM3/wFS2eRpreYN6Dg/3fuYP5pFQvV7tox8Xwh9Qh;
	4:epsiIAbmojegV5PQ4B/ISqPUyaetoutJR8tTUn8iVl04t9rDBrJ/6gmjD/Kp/ur2YTSjIuF/z7f6lmqKQUAcmwxBgnEl/f/vQU+4zsOyrFu1NSoNwJRiBd3AtQKyVCmylzmR0oY7D4E6axUJ7r7bRnMym4vUGsA82ETJEo7m6HoOb3dV1r3tJnpG74Ldd923ygmyhxYWOzxwL1UwAe+LcJ4pC49v7c6uQhPSjkrTN9UnA+Gzg16SrpIzY7ZsOj0J5Jc8efW6oJfoZ3yb4Ha0WQ==
X-Microsoft-Antispam-PRVS: <AM0PR0702MB363427831BAD9DCAAC13FB30C0170@AM0PR0702MB3634.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231355)(944501410)(52105095)(93006095)(93001095)(3002001)(149066)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(201708071742011)(7699051);
	SRVR:AM0PR0702MB3634; BCL:0; PCL:0; RULEID:;
	SRVR:AM0PR0702MB3634; 
X-Forefront-PRVS: 0805EC9467
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(366004)(396003)(39850400004)(136003)(376002)(346002)(189003)(199004)(478600001)(8936002)(7736002)(305945005)(50226002)(68736007)(52116002)(51416003)(1857600001)(81166006)(81156014)(36756003)(76506005)(16526019)(575784001)(386003)(86362001)(186003)(106356001)(26005)(2616005)(956004)(2351001)(316002)(16586007)(6486002)(53936002)(2906002)(2361001)(6666003)(6496006)(476003)(105586002)(486006)(5660300001)(97736004)(4326008)(47776003)(48376002)(66066001)(107886003)(50466002)(6916009)(6116002)(3846002)(25786009)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR0702MB3634; H:localhost;
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM0PR0702MB3634;
	23:biOsnVTQSTIb6Sid1S0peU77fPpzlmhmBcS3z3M?=
	=?us-ascii?Q?BfQ5Tq+1GYej+9qWuT9N+nqMQdSazWHJAFaultirWsJYOvUpXgZ3i7pDG5Xo?=
	=?us-ascii?Q?uT/bHXzWf9XCngv7ueEa8HmRF4Ww++39JMDAVgT322Z9WvgrWA31VTM7HWhv?=
	=?us-ascii?Q?uGq9ckjMHZ/ZLniLXAjXItFgTB4Ez2HAtYs1FbeMT2ZUjqS/nZMOOFN7St/h?=
	=?us-ascii?Q?NPt+S8QxJgvjXdBzF6sOLelsskZTJrg2LIavTbec1oXQsiJ8lqe/LZcxWITR?=
	=?us-ascii?Q?/62cxFUpRCy2nBQFed+yyv191v1smHRRzFZyme0Tzm1VRc8vzA+AxDetkkzR?=
	=?us-ascii?Q?zXIXk8ItQObRFUM2rlpc3pWZQV72xPx8xdeWfs70d9cKHMKgNcTK/eYOj7Jc?=
	=?us-ascii?Q?9mapHPYQ22PrZCb7YBdHTCoD+kYQ8dtZ5bdEZHScL1x2d/cBAJeEUWLn9eqN?=
	=?us-ascii?Q?NiAqsVlPK8lPT6f5oIJoy0raymViE9daDlIE922SZchRt8HGro46D3O0/G9F?=
	=?us-ascii?Q?vpba/s9jW2g9qNYeujrQBJ7VIkV6BfJUB9zW01uX+6onzA03Z4Yaus4S3H6U?=
	=?us-ascii?Q?K0HBsIWUf9uP9zMIGHnFq8Odr4cjjETa5Bz2TXiCenA+pUupcjZ1Y0uUZdGm?=
	=?us-ascii?Q?okNaxymtMIcAOCQ0n3BEE6vDWfWTPTfo2NAF6d/OdT866TUgJlgFwxLwr79n?=
	=?us-ascii?Q?4kd0r/d7zgyRmex9kJB4NE1pgEQNeLcIBRi9HsQyHZKiyFpNuYNgVaw3mKYp?=
	=?us-ascii?Q?1xg0Mo/j0oA4Hz+PW8YnqDpPXoJg0ge3gk2dePpAGbPQdyjoNQ7+TuFXhl/3?=
	=?us-ascii?Q?FmkYBMCVgj4lSledMRDn4fjOJd6SF2+pnEo0tbrd1AaLTg/znjD/DUdZeyT+?=
	=?us-ascii?Q?iVnWJlwo+M+5tH6QkeLjyGRQ6XCtfMUcBEwQEI8lxhVDL5Tsyn1s8n2w0ZbO?=
	=?us-ascii?Q?2KLQgWJk1yS+Zyq64ginduP5Q27rg0/j5EierlRVAPeCBjbQFIM1v8sug3va?=
	=?us-ascii?Q?Fk+NFWdk0T7Vgiv9xNlqBkKvL8KNmqVK8SGcxB8564+mUR8CfjPzlxdvYZ6Z?=
	=?us-ascii?Q?eyMmzlD5clxb5vtupdzVKD9mj+M/vWoTTha7OmTdcsoFQgf2/oeNJ6LKxMTT?=
	=?us-ascii?Q?K3lae6sP1icJv1u+TPvPf8swQkoaZT9ZCjxMGnMr9SxvEC8nQf/qQCCdvaoQ?=
	=?us-ascii?Q?e0IHgvmFMQeXi3xd/+foqzXqc7/9tXhKeka+lZYS2TpawGoQ67pWFHcb3hfa?=
	=?us-ascii?Q?js5NqlheRM+ZPC+nebQg=3D?=
X-Microsoft-Antispam-Message-Info: sQpVmJEknhCC401cQxyx7YSB713SOgBmxuPzJZeYKBxvYnS5hqX9DJTjg0ySROBHUNY/EdEup2nDQEf6d4e6v7RIG3nMla8QTenpA11AfashTa2qRvaLZhFBfXDuEQyeDFzCT1wLxCBD0CCQmmBh7gevVwuqWhB8UESm7zzlmoj8BVY9xScVQoYkbcqfacVw+y3bOL7Rsgw4B8fPitgLUEfSgk90LGylhmqx73L8ObzT5jA0IdgDb7Yp9FFDyhnQMpYQdTf9+D9p3dO01GSqgqHZqzlG7oGl1BH8pb9P9d7lZ5l0EhtP1obc/9YvqI3hNGUCgzEHPWZU+uIfgjB/+62qESY8oi/PMR7/Nl/NLUs=
X-Microsoft-Exchange-Diagnostics: 1; AM0PR0702MB3634;
	6:1ryfhGjhJUX4gruKQShkeUkt3YW86RlnM+Q7+GXkf0nyUS4snef4bhiiwsAr+HaaDW77MC2eKoUJY6FoJ4kd1z9Xum+BNbtyC8NM06S5M1wSPvWfkTDSvXSu+EF2potealaj+tPFOuSgjkJUDeuYJYXRRJ6ryIimZua2wLf7iWPPPh7AMy+UlXpmWqOouJZ5i1SgafPAeqE4UkLlRgiwXmIAW0IzuCHqBgwPMeEVHFDmVDwSOxcyYcZ4frUeLkahF4KmevZS/Mi/33ZwWshcKaIGLTWcGu58EouaoFchNMwEYlBx/yO16PUwaCNgvzEO+Y1Ah7BVBbysvdqGSaFaJy33rsRmY2FTz1/Rk66uRvf+l9qHS2sI0RXs+UYjHjP+15ZmHQFYRKB6PacUejY6UnuC4xxneI3YHmkafH49G+0vcLHIdMEa5VfROk75Pm4jjRfQPwDdGJoVhaU5PN2IgA==;
	5:NMs/coVuPf0Gm+bPXCZvsEKxTo4l2EsoTLeEiWfig6YX0ZcuTVKqUvBoBOn+y+pzxCKzGqwPM12gphwqbnjGNImFnXJGhLgYPljZwHD+buCasZWI+7s5MqLx85ZcxfMVDrSoyz7ck7lzAh/Egktl6GAE/TfUD7+YUDlTm11Ufqw=;
	7:4iN1ldGUSU1LayFSihhJ5zAZlEVQ70UJK52ICGKKlmik7HHfepFyau6wNFQBbPmpf62REvP9nU5wcn7PRv1EsYV0CUsI7TTtq/TFSdXJKwBWGFdue6iiaIwHYkia+l03HctlQkrAx/LMLSSBTLskWNam1QHErq+paPGtp81nImmZxWnzCs3UD7o+RAwNP5mlxS/oynyF96CFQ5vibnTwnoPJzmoVU0oD3ctsXtogohoLdmBgwNwy58MniZd+tFlI
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2018 09:08:41.1861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b8b40d-58f1-412e-ebe2-08d621fd5278
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0702MB3634
Subject: [PATCH] bash: 4.4.18 -> 4.4.23
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
X-List-Received-Date: Mon, 24 Sep 2018 22:38:27 -0000
Content-Type: text/plain

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
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


