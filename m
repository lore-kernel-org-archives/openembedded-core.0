Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0046.outbound.protection.outlook.com [104.47.32.46])
	by mail.openembedded.org (Postfix) with ESMTP id 65E5E71D9F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+NA15ln1UqLTrDz2INRS5fEVOXa/WNLzQ68R25bKHkk=;
	b=b/AOWrOLAZP5d6whiAUnx3YqoOLO/cZOLiEhZtxsU7BBzZb4mHLe2xCdq/J0ZH35sJd2LOBjnopIXO0VK/jMq5TrcCIuVR9loXgglb7cIpbp8ubopdpKSmuYOxO0fc5iWC3RB4pSuz6tir45KUadB0dEBP1IhqC/wlSLgakxox4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	BN6PR01MB2673.prod.exchangelabs.com (10.172.195.11) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1005.10; Thu, 6 Apr 2017 19:44:06 +0000
From: Martin Kelly <martin@xevo.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Apr 2017 12:48:39 -0700
Message-ID: <1491508119-2650-1-git-send-email-martin@xevo.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR18CA0003.namprd18.prod.outlook.com (10.173.238.141) To
	BN6PR01MB2673.prod.exchangelabs.com (10.172.195.11)
X-MS-Office365-Filtering-Correlation-Id: ccaf2306-5f94-49a9-4a91-08d47d25496b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:BN6PR01MB2673; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2673;
	3:doXFS/5294Ib8q5x6lfsI9GTAV5UPS6Xe2GjbPgKsdt4eklTKAEEdiXxUpFLbjd6ixXTyoB28TpBtXglBTdXIQL34VL0q0sJpffUSTHJOY5Fn0cvMkDyQA8NjqZynYzhH9AyMBQgqNCaIi/5e2fCpyfd+4hFheA5AurWSF6fWmLtX716MU/rDdBTcCod3m7kgSZcpQDvvha1RKT2isjgrrW1M5ifBQlXd0AEqCDtBDEp6jOe9NEd4iDM1qmMaJHoaee50RgzHquibg7BclJjRSNeSrIois2vRKWVV1lCctp3Tu6anKXhT+MsBvi42dM2nUEPvb5VL1fQw0vAodbgYg==;
	25:6wSVTwzfsBkoQxaH9kArgS0faF6m/3raHYZoEUGfjHNZMcTCDeuuzAIN0qVhnqoPlRuIW6X3StqEhbDXNAL30LkQPP8ktz7e4xlUZ2v58iRag0udcqwJrYy8FCVi+9R3zV3k0VQ0/yXN0z7TXbc9gZJe8HTl3VtswsBi9tdrj/MkB9Icpzpag04H1noeUf71U/qctlobGeQWe8LBaZ0gHIxGNGK45TH3ss03i3Wc/P420LGWeCoOCCceIXI8IPs+N0n4SSTuS2qXtBPQvG9NZbfP5Cw8WhnzgtdlYYvyFaiMuGF3n/9x7rH1tn6xQeEwOc5PXHsio5hSynB+DzY483PIGglNgWSNy6gdUi0dsmM8OebgqWqsEl3aPYHtog3E4PiWp56cpAeS3YXo3RRIoKQU1jtlLtuek5+NPZ3fyYrv62ROfCswgU+ObNA9ixZRD9Rh9wEbbY/+KcejCrAv3A==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2673;
	31:QW8+eydxsYviL4tSClLs3PVabqOflgbpHb0XUsgUYCPee6vJlMLbfHwz8aDvVq+H3aqHZcYTfkc08OaFmifKncxNScC7jtUo3crt1JUiAxT8a4rdeC1y9an+E02auO6fZ5dAy/X/WM+Go9rh7EHBH3jwrXIw9FSWAm7h8DrryvndUZ2S5XVNlGKfzNk1Dxa81S2X6XAwqNG4UajjAe1V8RhduPsOZWZwXHguemgtfYbl8HDkIkLh+09PtKbIuDcP;
	20:CQ8Od2h4k142HunNUcgtFCxQXZ6JTWzGy2B046liPaM7+Oz1N2t0zdzQ61j2YvJf3F5NUFU+FixS0sTeBaKVq5YiG/7TAPHHFHsV4dLgKGvOtm3StRnblH16f92GNy6SlnHV7zav99w4K9FTncAJSYwZnIT71Ig+/8OCiTniq7WemqZoZsn9ZEL+IMv5dUrT93oo+x2OqSd2yyRhIqZ8rij/MbvpX0ZDRIdRkJWm6VH78gdnB1o9LFgNDog6qpGxLiK4NnKoX69LbICYTWn0e++VDmA+YTBwhenihb52QpfcYjs/ng88LRTJvEtwSeZjMRGNDAipwqC/Zw3BEulclg==
X-Microsoft-Antispam-PRVS: <BN6PR01MB267310EB054F75B8043BC5A2AB0D0@BN6PR01MB2673.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(6041248)(201703131423075)(201703061421075)(20161123562025)(20161123564025)(20161123555025)(20161123560025)(6072148);
	SRVR:BN6PR01MB2673; BCL:0; PCL:0; RULEID:; SRVR:BN6PR01MB2673; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2673;
	4:o4l44KjXmmTYn3cBdsc2Ae2nXjoC3S2dtPb1F37HUqwuShyIav1d/KQWsGSIOVzgTD0C+RFh4hFr6fbFP8GFhyqerB6kA+g6Vc5UL8JD18eNWazp679c4tsHAneptq15ZcdJmobzFKU76iCAwZlt5iAX2qSlr3QQTtXEukN1PGQh3V/zq2Ywx3zFNyIavJJVS7Kn/KOn+CNst3ijSFrSzNgYQf6JsnqsjKJzms7cHXRN7yPe4NSGbqlDiXWAbGveCDXMMPnPtpR9csUnQllOiW8m7J8MfnmCPS1czm5lWEPPXMPuR8kaCzVeo2RhGI763TP1YrMsau1xlOTBokavrBWMt9EW/nZ1UUIVeGaJfcOJs1lBlryzKDxZybksjIP1pCYXlOPw7VPJvDPaue9BY3NFj+Qa9JE1hxtZx1uCOHshfHJkH3+asoX+7vPF0xRzdCSevSJpkoSLoebsJKAmPELY9kcC+JDnhtb9Zmo3+TOKgTmJUJVeYhuVvQojlMvX3LD2tsnLX0di33amBaKiWob3U2yoR4/l1eze+EK2Tyed3LWXdsHXIcgHqcRM/FRRLRdb9d7aTMLYSBBW3kruUkZ1Bvn79sbx5h39MDaH/9uleRWiCSeSyxxkFz635mXCdPbjoFt5IZ2+ZlBXHwP3O6nq0pMCnyIQbVA5Vke/otg=
X-Forefront-PRVS: 02698DF457
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39400400002)(5660300001)(6916009)(50466002)(53936002)(6666003)(189998001)(2351001)(6512007)(107886003)(110136004)(33646002)(53416004)(50986999)(2906002)(42186005)(5003940100001)(38730400002)(305945005)(6116002)(3846002)(4326008)(36756003)(50226002)(25786009)(8676002)(81166006)(66066001)(7736002)(6486002)(47776003)(6506006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR01MB2673;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2673;
	23:ccPsXPI1tJyFZnsNVuZI8OFe7rpgvVJJKEPrONtCTSYzAi6jV/kH2VOCOsXsLM4MC5poBTWwftX1ez2hCRATYGm/CEBCbIfIdEmES8QA+w5FfG75HaPlGuAxQ41V466KavfgKQUB7vk/znnFYay1uCzPHAk6nueO4JFwNskk03O+zR+7fcxzXvkYeQXxlodN148w+EBU3dLWLUd9T4WKkJ61VgMm3kLs8MFU25K1g7ZEbbDhpebLekYjbooo5+TL3MTM/H5A8QAquMxM+rhE/kOUSqMb99cX7LK7whWKwFh6FcYPcRglGh1CH/cKLosRzjR0QPat5pgbESqUlrAez33rTYh1+xzt1uX8b4rR6drXcplwS5b0u9FLEtWvKH7JDqee2cZFJEk4jApkW+//j4eEg3Xb/d0vxrhGwzsKFwMDNBgT5bcg3iXJGTo45CbUcOz+y/tKvBkA+Ia89GTrtFUI4YyIRoEXLoN9mLiioeX19qtLbeCBSCq4SX1E18KXaLpTT4WzcSxQVu8Vy9+kE3G39jYKRB9N3iZV0BmUfU7MKq1gCBVgTHcJa/jNfsHksPtVPhdmRjkFR9hnAYhaXMYf9tWfjxnTUJHdjAuwl59AatPoDP1jW5U0T3I2J8STMHbrZPOUzYZm8OyP2W9YJonGzpnuFH26xkdRmaN59zKIVetmFSu8OvXWIbJ/O/WfcYIv/nznL/guWwkg5Rh7PXgu9lVNM8HqDuFLEoTfXe+TVXbBsyDtepGYcBCUftCED/JgLxf9l/AK41CsZnfEwppsZipZXOOWHwNQRf7LK6iIdQu9rLg3XUB87NFCJg+bDwP5nSsYzVN/pYigCBkh49IegRnxYOWHbpAk8w6KhG0NTSkHkESmjbEKvFWbW3KstN44grViLdzgpkwrHzrzwg==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2673;
	6:lHp1NZGtjK6/UZ95pDJis7rFL+i04ecpmkRxOhln/0i+UXz51j2LZe1JaeppjjTEkyaI1TzwvgYlWcNK4syeE8RRo9mFjOOArldw5+vx4ao18d3kxDYKz5lCNpezflYNFQaMaqOJZcxfcNHuQoUNfpWKS8BpmZWTS3SODwMfZ/doANQWHF/BDpF6m5CN1T1UPxb1IdyEwdU6C7nzsfwvpYo8lVeq5NHr1/KLU7PfrBldLUr9R6ltpaNxmgz6zrp53F4uxyLj/ikTO6d+B5SMeWunnRSffU3ujG7lu9fNTs8FXjrmym0UVddjgtRzXWHWVqUssnBkUJwiouNGp4/qSShcvrcumly+LWcLZIzVimmeoPdcVKkMNBZ/AsIgas6aLh20qCbAJEqThLENcL50pg==;
	5:5N4j+LH8HwRd/CmKyz8zJ2zuqFmdwGp1LE1sCVCpw2Ze1h4v8w3shIr3kGRWQ/X90Gnm1K6MPdXkcLndr5gC5l6yKlDej09g06l6HR3bAM6dN26b33Fai3jB8z8pcQSvsznK7cTBW+2M35LbPq/DEQ==;
	24:ydSHE0nDQzXXJIfQlpXgzGR+5OBaZpJwtdZESqWyAPGtnmlIREfWOtrTJKEoBQmrnhR3X1jIqQvQTWa2KeM9wu/DoSSmQXq6/BBS7dojfaM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR01MB2673;
	7:8QPUO3mJd8B6L6mRe8lTq81r0LaE30dckXtZmQlFMNOT2G/tVnvXQMnugml9y/sh8QqaYS6hKEqXaSMXfR1dc4JdUMx6J6a7AN+hFi7Plaktxkg8KRBoMRZvFK/K1l00aVG/SGUV8BgvrPQ2kVTdEsuVxxdx3dpLQY9epbY3euMRC9vvElcBew0j1QrU6blCl8iM+7nEpj27RZFypswvARIkpibpnO0XJ3qn+0tIVOreP5uiU9GiwdKq/kheCgwthGH4uLPSoz/G6uTRguJ7VY7Gi7SOiqWUwCiUbFNVc03OngmpLxTf+B2DQb5xw3e/dAWpNJYVJwL+UWhEGhW8Bw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2017 19:44:06.1689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2673
Subject: [PATCH] qemu: use python2.7 instead of python2
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
X-List-Received-Date: Thu, 06 Apr 2017 19:44:08 -0000
Content-Type: text/plain

From: Martin Kelly <mkelly@xevo.com>

meta/conf/bitbake.conf puts python2.7 into the HOSTTOOLS variable but not
python2, so only python2.7 is guaranteed. In addition, on some distros -- such
as Amazon Linux -- /usr/bin/python2 doesn't exist but python2.7 does. So, use
python2.7 for the --python= argument in the qemu configure step.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 383cc64..0e1411a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,7 +29,7 @@ EXTRA_OECONF = " \
     --with-system-pixman \
     --extra-cflags='${CFLAGS}' \
     "
-EXTRA_OECONF_append_class-native = " --python=${USRBINPATH}/python2"
+EXTRA_OECONF_append_class-native = " --python=${USRBINPATH}/python2.7"
 
 EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
-- 
2.1.4


