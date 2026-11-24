Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24302.1795540706967714861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=G6RUEde1;
 spf=pass (domain: est.tech, ip: 52.101.72.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+wf9aqSVgFU0RNyS8MxiaBEo4c6gDVN+j5MMhgoeRv+J2eT5SsJFbjDi6oZCbwCPSxyntVIT9fFbWrvZMuqeG3Wt0ttugVX4xsmY3ys2mN0ACoH3QjN2iu5W1AWRa7C903vpNy6+6nrYyGUO0hBb0a4BllG0IgYNa21DzNV3BXlDYWGyBrpxo8cLuQbJLKitJTx9Zy2a7xnefSivJtooG5sT+O36t6gts+5zubLmDGFzIqT1sSRdgnc/hRoKXYkeuOIR1Y9KNumj4V2E8oMDNAGSIZ+D4lysq8cpgLI4a5/VG1nuyhuV9q5IIkjE9YBZoFfddOx93qge+W9IatOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVXU8uMclnxeqynRZv6E1i43nw/NHrYvDo/OSl2683M=;
 b=hFTtsivcIacCVDdNWlbZtyXgDoETSiWk/8kDJabqfwMkZRIy14KpCpN0tHbAdKItzwbOAFB2DIKCXol/u7CIMzoV6nZu7Y1STVKKLXlr/I3ox8AQZTwzlwleqmqvRJwHamDKOfl5V/ZdIvQJ4PLHpGQOXUNLSaW0l3GNmn1G/VnIE+bS0XY10YLjzfJItg1Ns1WCJ5bk02A2dsM3r34qljCVRH/eFGoRVqcfrIJ2Fu9ONwrEPc0IH5l48vOJF8kLIpdjZDoTpqzf18jEgZD/ugSJC63F8nX7734ICPIVaG/sUI8fsyxbbMOKMao1WYrsrRvsGYNgu1kAnvJcAs1WRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVXU8uMclnxeqynRZv6E1i43nw/NHrYvDo/OSl2683M=;
 b=G6RUEde1iR9j3rZYEpdGc5JbX28VYG/Vz6MU61DbHav36RA45X45iEbelKQw1EIIc0cEL0DS4ak6qJOOjmdPjgZLej1+TemYJDnwxghTjZfvpOKClPTLswl0M3DWdGtSu+8iax7I2pQB2LNIUEN58LgwZ9RPjgfYF2wvuOvY/w0gaLlG7zjsh+jk+EjzttJYui0h9tN4xFNsNAQ+ClqcmZtH22PRzuSz3UyqizlzaBVBEUrVZfNqLjsKfewVEauw4RfFTP4Af7154+HUhMrbCnacct2wzv/0qMlRJQQ9OyuIuAyxzuPCVBfe/YecQRqzuT8yDyAh3VcOp4dv1iL8kw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:24 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] man-db: Upgrade 2.13.1 -> 2.13.3
Date: Tue, 24 Nov 2026 18:18:05 +0100
Message-ID: <20261124171807.74394-10-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0021.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: 10bd50a8-0a0d-450b-3946-08df4a4ef26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: G4LGqOzi4okBlYd6Jy8goscoaFK/r8RmodVwuvrxOMyz52STAmdJnPBVwy9nrT03mCSpdx+TFZjnHL+oNUG8H5JRZ5DcgbhKsnM8LJe9FNhMNghMuzaxL3j5lcGsi2F5E+LASAhz+pxqQSXwf9VjpF+gCqZ6FAfxfsY0AVNG1P7u2/lcDf7JLaHc9nW8iq7UNFdq/2UF8VwKFbj5aOd3908wFooecFG2dK8nryJrSB2NS11vHbuXv46pknvhPYZiZI1Bn8zGDCI3FMdmAFM55/YqZY4Se6pC0lJiJ578gpWnz4FqDrUEjGD7MSo7P7msdc1WJc/KIEdkCvLb3kGhedo3uWAJ6zq/L/9Hpr4zO7Ht1ho7/M1axxxICNIlI5kf+SVul9N3rWr6+tB8wSIH1s/tYke+v5ZJvEJmBAp2nOPsmzXkySrCaEFN/hrq9YZfN/2vjEU0gw5r3PanWCSRVnS24lutdbfvC14fZ1CCT7oAtECXRZDs+gEKk5vwYLrFurrb9Z+gPJW9dDD1KVvWIhClwTV83Sa7I+etO2cggT+diU69DS0Yh+d0puQxjEYH6gQG4O60rX74oVJ/NuqQuXnTOk0rjnFpWbWVdJ17CMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hf6yM8KP/PlB+61YZz29rOZmmZB11AVh7y3PtxygYDpjKBNTUJXJFtO+71ZQ?=
 =?us-ascii?Q?1jyb+a3cFbqmmslYDmn7h235i6H3JN/k+8QVuLnAyGq+Yro1JYHB3vS1ORqK?=
 =?us-ascii?Q?Vajupv8VFwTaNGfollZ9Iz9owHCbwheJJX8uFlT39sJp+oy2YQ2N8eGjVgNU?=
 =?us-ascii?Q?gBddvmpYLkcO2+OHBnOB6hQsdiO4YGD23ge8m0skReLOGrrghpNmM8l9mG3t?=
 =?us-ascii?Q?c8XfCj3QyfPkrxODR2bV7V94KZfIRrBzwVkzK0lokCj2wkwyyAypXdIcWxJP?=
 =?us-ascii?Q?x0jayzCOMfsy2M9OPvCWJTPg7EptsAF6sPTn5CzsxGrghF84+U/5xDPByMoL?=
 =?us-ascii?Q?TkBkE6qCG6ZREOSuOwM5Ju0P7LKfWBLRVvFg0Z2NDHNGGYgY+ucMHyG3rRla?=
 =?us-ascii?Q?VZ1LfFObqE3ZzHh+b3F55L7TM3SIfZ8+gwcuYFIBbCDkeQX7FUyBUGmFlvZr?=
 =?us-ascii?Q?SHDcXddQZSmK+kYisFoSn5c6sVvzzd3QPacEr59saY680IPVOHT/iOFKEWmQ?=
 =?us-ascii?Q?4lyW141duBbMDaVIR3OTqwOozeAMMmtra0b7kRANRyDKtjl318xzXCd0Dtc4?=
 =?us-ascii?Q?M37/kqybtw0kayh8aL+HCOdt39b3HpsJd/lFq56VUFcNWXrjab1QbjPKC2R7?=
 =?us-ascii?Q?0dZ0u27SrBfJzgYcDmeDaPFrwBM6W9LvcSNn8Iy3tH65bbjoh53nmp4PDh+L?=
 =?us-ascii?Q?+beAnlV4u0zNoCX1idHH/aWvmpJb97cMRhzQLal8tSQf7vfgdcnjkgwjm+qG?=
 =?us-ascii?Q?nhMkepLMXMZZqCNbur/rRmYvfN9B57LlQvWLWfAABKdKb+wUj/kDjMmVkM4X?=
 =?us-ascii?Q?3401skvZd65FQfvcQHKY699ImdRvZDGvovZr28Y12C3ORofviZm80e0sZ9CR?=
 =?us-ascii?Q?bOAXqmjSaOtv9wEBAikgB6W5L/DpF7GPmy4Ys+imUBXFcYktwqDJt0LzTZjF?=
 =?us-ascii?Q?eIMCBESpEpn4Dn9t46MTIc9vBqY+KHCxZl5/QqHQvGhw/OhGyNXQxW3rc+CY?=
 =?us-ascii?Q?2rcPzpeEkw6+4N/AES15zFvy8UdF6RnN91D579f4UFlRt6Ro8qNw09FA1p9B?=
 =?us-ascii?Q?a3oE5UI8qQOznHQP9Igfkn4ipCz/o2dIWRkyd3mco3Ovpabg+iR8Em/PqOWJ?=
 =?us-ascii?Q?fUp1LSQH2iQc5L1tWIxu2b1OeDTb6GNeJOoBH0LoY+jS1NiTCytY+mBURpo7?=
 =?us-ascii?Q?1wsDD3JDnhy2huzUd/NDwNGhsQQGpy5SRp5n+jpx1flepIvFayJIqIrhwtD7?=
 =?us-ascii?Q?fmprtuzgTrNWo9YjqAEck8kPZv6V6lFgA5rH7mdzj4Tmnqr1mnLDq/OmCmnX?=
 =?us-ascii?Q?zMBSwpWnenmOVQUkpgj2c+cat0J/vJxlwrNCeH1xZThIob/1tyze5ZchN5Uq?=
 =?us-ascii?Q?cIYGXM84yrKNhgju43ty+kk4vopUa1NtqV1vFWFQyu63Hvt2t7MjP9KUhKBv?=
 =?us-ascii?Q?LxG2SVrjIDge6KQIoqXxUC8k9rfu9j5eheeYxRCg1Sd3c733ojMcK3QqyUjQ?=
 =?us-ascii?Q?pmjEWem/aLhPxxpIXGzxYZCGeDmEx59FLP/W0a7NXFOGtaNac8KLRfdvYMLL?=
 =?us-ascii?Q?6H+JqL7SrSQfwMQKaAzC0ME1njuD7KX/yoRRGhQLijrzpDAIVLx8nADD/0QX?=
 =?us-ascii?Q?2loy5Y+Jehjc787EDOegFkOhjSD5lfPFLZn6zr16+CP9CRHFH556mdcLSA/J?=
 =?us-ascii?Q?ir7pREOZnQ0ArYWaD12EdP4yGfDaWfXk3FVwnVeFbMMxUY78FXDFsqiEXYXQ?=
 =?us-ascii?Q?mPe/FHTtKQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bd50a8-0a0d-450b-3946-08df4a4ef26f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:24.6853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvvuS4S2vZ8j2/0B/alSnXZldhhO5xEf9hv7pFmM+2SqpJr/WZM3/WkgKsZBeMTpcDsubXuc9XMmVwHoU1EOHmpDDJ+i0lZEnLdylYxMkdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251061
Content-Type: text/plain; charset="utf-8"

NEWS: https://gitlab.com/man-db/man-db/-/blob/2.13.3/NEWS.md

License-Update:  Remove references to old FSF postal address [1]

[1] https://gitlab.com/man-db/man-db/-/commit/d51620d25cc1a3d30f41483fabda9=
feaa562f2a4

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../man-db/{man-db_2.13.1.bb =3D> man-db_2.13.3.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.13.1.bb =3D> man-db_2.13.3.b=
b} (89%)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.1.bb b/meta/recipes-e=
xtended/man-db/man-db_2.13.3.bb
similarity index 89%
rename from meta/recipes-extended/man-db/man-db_2.13.1.bb
rename to meta/recipes-extended/man-db/man-db_2.13.3.bb
index 7fcad2ed4b..6a5c039535 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.3.bb
@@ -3,14 +3,14 @@ HOMEPAGE =3D "http://man-db.nongnu.org/"
 DESCRIPTION =3D "man-db is an implementation of the standard Unix document=
ation system accessed using the man command. It uses a Berkeley DB database=
 in place of the traditional flat-text whatis databases."
 LICENSE =3D "GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e44046=
4 \
-                    file://docs/COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263 \
-                    file://docs/COPYING.LIB;md5=3D4fbd65380cdd255951079008=
b364516c \
-                   "
+                    file://docs/COPYING.GPLv2;md5=3D570a9b3749dd0463a17788=
03b12a6dce \
+                    file://docs/COPYING.LIB;md5=3D4bf661c1e3793e55c8d1051b=
c5e0ae21 \
+                    "
=20
 SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            "
-SRC_URI[sha256sum] =3D "8afebb6f7eb6bb8542929458841f5c7e6f240e30c86358c1fb=
cefbea076c87d9"
+SRC_URI[sha256sum] =3D "7c10ac705433c740af91264fc29eee471090ead63a408541ab=
9736284a8c9deb"
=20
 DEPENDS =3D "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} +=3D "base-passwd"
