Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0059.outbound.protection.outlook.com [104.47.2.59])
	by mail.openembedded.org (Postfix) with ESMTP id 5E11E77272
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 01:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=zGAYJskt9EpNzOU+8gE8WTvRVX9RgAqNKaV2jA4cK3I=;
	b=dshZkepP+BE/xBvH5ksC1c9Tl6C5zwCy+ORu2KEMTX64wsdxpatEpQ4ELL1BRAydBAX4kxPxV+to2W8+rAk+aHNbGT+BkohIeHsvNsPY+iJd4fM/eMeWn25MNZ1ODRIS9eyiD8p7g0zQhqoomRX5+EYed9KuKORMchuB82lUCuU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AM5PR0402MB2820.eurprd04.prod.outlook.com (10.175.41.139) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Wed, 1 Feb 2017 01:28:54 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jan 2017 19:22:09 -0600
Message-ID: <1485912129-4012-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: BN6PR03CA0062.namprd03.prod.outlook.com (10.173.137.24) To
	AM5PR0402MB2820.eurprd04.prod.outlook.com (10.175.41.139)
X-MS-Office365-Filtering-Correlation-Id: 9d7bcc56-d3f7-40a6-135d-08d44a41aff6
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401080);
	SRVR:AM5PR0402MB2820; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2820;
	3:j9zMZ47RXPlJBnxokG5HW5NFiFpWICaZ426UjkNZ6Zkk0cXzOpufBLHgt7ipz2Bkz75v2bCaFVjpDwqso0XiwqL6qfu+tov+Q4brlmY9OeAha9kJwB4YA9NAHzO+ZvqMW+ZO8FzTskX6CxS4ZwAoHy/o6uoDbnWAq565JxHdQeLRZlUZPxRgqNl6kL9kspVKjgMWA2S7qLPuDONiA69xH31uH5ulxxAXEQBpn/dxrvhCJwDMZplyOm2o/FOf8Dtvyxtrz3OHCRvp5Z8GRt+YqVyl18EtlLD1bASEbNwY/nk=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2820;
	25:ghNvZ0GotP2RWylAgQJS/vGoLZVQH+TQDehtTYVdr78NwmdCPN2rHehkBZBpArbSzJFTUMu1GpSUaYpVW7yXS/ZiJdwkDcRiGRXrH1wPE96cftZdkLnTPfCfNG48HGfN/LgeJF8auNRhmbiHc6qswcGGQC43iWjHvMfMynPs+xEtrzjMPZHhU/a1m2iUgSOBF2i1NGA/0pJSV9JGix2//Ui/vawBFVnZxPgqZ+SL+wol4ZXoy1DKjuhBTnPyPuyHvUeK8qwmxg2eSZleADoOWU5TPR8DGubQfGkJdkMUjeGVDhOoVVaxGr/Z65hFRvyRq6K7lZO9F/O9OOUPqaBzD+zZSHfAIa9stqZOkhcM0nexynEqijnjLyxXQxJQB0J4duUWIwOD38Hluy88AQeYrMy6eR7zC345XTvx/nNu+MkedMymu4gWKlLq0CthLOWvn+kqwhvIB3v4dRz8O6EbWDhOkNflOOGcIhUnSsEbisvvDZM8SvkeZGUIk/hgxlvc2wcsKs6xykHbVqc1WuyulECJw3JVZUOrz6fwK/W74kwThpsCbZoQL4CSCHexnNRRibZpkFUXec3AdBFve8O4b1rk3hIPQXlbtuGAn5cgH2q+TokofHn/hMdEUviZ96ZLpfwQoq9RIXSZlWq1mYTucm/2wzs2BDAlporFE7Ve0t7cBtG5qukVDdcgMM3xoF+O
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2820;
	31:0PefT2dDe/3E5mq73wbJWLnGvkFE2fXB2J0n9EDSxAJYXWNAe/ecOwHqnX6vL91SCwes0cnqngkeMjfPs9/KxcOUZnaoP92OvWVDqCWJc6ld5OKVz2I+Lh9K4WcqKHEaIeieza3Hkb13k66ho6FRjMln8KkiHwL8tW/mcAxiiNvkOMn1MaqpB9mnMm5SYX64LWV432fcG4OXOYPizpirConPjnyuCSPKF7JnNjTQ4vZMLFr3kstu82U3vgNgwX64LVmMWoLjS2CVU98rVzfxhw==;
	20:vvxaup0/fCYpSLCqGeQR1lIVGPPnEDq/lbUk22xV7GIdob2Ws7xUYny6s5Eql2BUfoOoiWIpJmtJb4DnB64XpquddZCtAB/DmEt/dlBaVNqp1cdq+1IL+WMlS9IRl9EhM0sMZYPTqR5HQrgQmSLqrZjOWd58mSMxIFBF0B2nvjRuxw8r7KooTDU/auLCeNHQrlJKXVDyKwaqz23dNcF194sPnD20HWkWzyy6nxJvSOlNQFnan/5RKh42Fs40YwQXBCtwKBNJ1Zol1PeuKauF7ZoPHQCFj3pwQndsWFEoGO/Pf4Sd2SNnBalUZ3CQfmfqx5lvsSoP8iBLgXqkpuwtZfRUXC+5B+5MGtmFf0oLUSg8ALrXbagFyaWHontEGwd0P0TgCTh4hbPYpb4Uth8rI5Q5lq636O+likP3PBiuMRnw+RcrpEBIQzW0/PlBW+JMCLbY3S6Xpm1/VDeIfJ4GKYhKqxDxhmL4oRE3+Dyb85aDV95mZoP9EjyT8Mi2C4Dx
X-Microsoft-Antispam-PRVS: <AM5PR0402MB2820141A042809D9F6B79857E24D0@AM5PR0402MB2820.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(20161123558024)(6072148);
	SRVR:AM5PR0402MB2820; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2820; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2820;
	4:0RlGAHpDXSKjfKU0yte1CzRr2HIeNkoByL5KqbwvTF7HDmbXyA/9977zxJFjvojRftBPyWGjDVf33nRpfwgmzbnK3DEH0S0laNEsKi5oZL9Jm9wAjYMr9lUVWMI3L7BaGjCuLOko3a+H92+v9oMKW+CNyxPrWYVtcAOQjrdj1T0pQasqcsgffpewcEjf6Ybe4R3tQ0BkduPYeGxD8Dfb3Vp2IHlzhehz8nK4I3vP64TnenJeWx1PoPWfBqA3fi75dciHDM6enEfy9oOqLEzottf1DpXRkrg2AiYptMr0bZQDDnIuOYIr0OZE3bDFGVucWDZgRdamLJSfPewvGoVm+FPe9IQFp+/8vNPDJNR/d87bnQJuLFYcVuhWyjr0LnFVRzGxe6MyQagpEVvdGPxqWaDwHQ+Y7gXUFj0JU2ynW6W5L4hYZrukOGT9zaSb7+KevnGUneBUMIFQYzL0d2nBpqCIYNDWT44LXBCbBpBtsoOeJ+2VlsQQMMO3e5cW9gsSQPxtlINYI00+WaCy/dFeRTxYtcXXaiazj4hYXAlDOO3VoBu8WsukGQMiDOQNJM1Xd2k1m3Au7W6FXGyJOYUYHaZlvQOJToZgsBYnq9p2uZuacowzJ1riqq3O/Mga6P23Vx8iKQHU3YiyREG323eQZQLh8pJECIuViZn0dsw6XIgu9ZlMMpltzq1m2a291ZxC9oP4j0WPamOAbWYcdmQQ8A==
X-Forefront-PRVS: 0205EDCD76
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(39840400002)(39860400002)(39450400003)(39850400002)(39410400002)(189002)(199003)(4326007)(5660300001)(81166006)(110136003)(97736004)(2351001)(50226002)(101416001)(68736007)(2906002)(81156014)(36756003)(38730400001)(50466002)(66066001)(48376002)(6486002)(47776003)(189998001)(575784001)(8676002)(86362001)(92566002)(6506006)(6666003)(6916009)(6512007)(42186005)(25786008)(305945005)(53936002)(105586002)(450100001)(3846002)(5003940100001)(50986999)(7736002)(33646002)(106356001)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2820;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2820;
	23:hgoBnq4RX+wSPFfuOysGy4y2D3m1tMkk1yNp6ZQ?=
	=?us-ascii?Q?P340GLb7VPJ4HMEko6e0mucwohH2ZuotWAwFluEvQX0AEi3tVpCckQkPtfrb?=
	=?us-ascii?Q?zC6INmPEOHMmFOiKN0iUHbDJEjdoGRJj77oaOLUYScgnkFtsXHhO8mSYVb4P?=
	=?us-ascii?Q?I20lcJ4zIniv/uLYNovFQeaVfUhs5aV+9yXtjiZpMUhI4qJCYQilCF5dhYDJ?=
	=?us-ascii?Q?zDU4DPMK0ulAcsvA0MVZUBhwvIQ9t/mcMT0zNI6LBks7dAQuldFMGQW+ZVP3?=
	=?us-ascii?Q?bFpJ3Ycsa2MBXqfBmX7jndMjwQBbTtcXeroBE9KfYvcNyC73XouTzcXFBN8b?=
	=?us-ascii?Q?njg4/qDnBKNEAo5y5mmtTaZ4bXUMwkw6AvKJyV436ZZK6V7inxLlekD6TG6L?=
	=?us-ascii?Q?G9nk9bp263VE9Uif4EjElPkh0lm1ItsfS7jjkrYy9QpvSym4MWuZdeP2+VTJ?=
	=?us-ascii?Q?HvHOcGmPnBF4sCl+5aZj/vmyDN0nAc/ntBC3Fh3gfdCVLgqAdZ1PbG57bdwn?=
	=?us-ascii?Q?/HVzp+GXR+7mgan+pS0D/ARnzHKTWWqVeSj+AhqOIQ059LpLoRz+2HkF6FTf?=
	=?us-ascii?Q?+dwCM3XeJEkiUCvjvOp3D4AXHwY+Luq0YHDO0Y0mcCOIHMJufIrbbu0OFRWh?=
	=?us-ascii?Q?GVaROhlPgw3CY8T6Rck9E8wfAOBYhgkJ/sDDvLUILZQr0IYH6Hl60P9XS6wf?=
	=?us-ascii?Q?a3zoZTbomVaeC9/FidyMvOKZi7LwzwHPvkbrXjYfO0INweR1BX+3ZFl+ToeC?=
	=?us-ascii?Q?8XxkzbEXXmqJqLTspoWSJasOffUmHXmK7+a9x6luoFSkHr0fPN7nlEeghd0j?=
	=?us-ascii?Q?J/aqzPejq5KmLDvYCN3VPwZOPCmmKbuA3uJsQc4QJJDTgmha4T+URpJBZfH3?=
	=?us-ascii?Q?nNN1r14WaJHrab5e1WgC36Z+coE69kgJvQuQfy17qRwG9q5gqaC/S4JPzw3+?=
	=?us-ascii?Q?utClnwaNUbc55BSJTHhKxc50rDChP3hLdXfXfTCk0EIiBBsCrjQYJgoxZsaP?=
	=?us-ascii?Q?7GE6ac6j0U3m1N4Cvkb6CRsARXkg+eoo9dtnVdEYlaBd1bDXyVyT3vHAxTfa?=
	=?us-ascii?Q?9/jwfVk0w0PiADXWLYQcpeErV0QT1M4H4Dz/SPayz2yxZUa+ZZJcU5janFRC?=
	=?us-ascii?Q?9fV5wFzgxnA5DeDXlobjvLO/ppDWhiBH/mn5YWdmqIEwEDQib3KswF8v6ul4?=
	=?us-ascii?Q?5LeX9UPj7RW3QsPopg9A4NhR8S6kr8+sFpOZ6LWWXFApqum3vKyMmwaz2yA?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2820;
	6:YcX3teVoOrONaECH02pQWPg6VUUflJP/cRfsngpI2dgN38jak25Uv4cRyxpJQG88DzY9zZuRpWOPhIOoakIYwDV155y/dhPS9YvnhXIKYVyb3265Ni+605ImZ/JwXG2m3QphWjS+QMEUGOHfp9zAEuvKefB0L2+gPusRxQIJNyXQ8PxNkiSAvyGifppjvM/7burtJz7WLqoLhdtbM2o7P1Kq+Ehg1FNeg7YpvXM/DYIyF1T8yOUA+FVckdSMTLL+ZlXUN7mc+RyVp6cj2c6tYpFiPfZSjjGK7kIBPZV/kzp/45NgKliKyr1AvSPEnMdXAn2PKedTVaKklGnZxudZL+wQv3xw23Z7rxENrXJoHS/+U+C82qPsCGlp/g9ikkNT0sbHqCls6I+d1pCEuszWVHq+bbE3o3YyOSvVUBKIJYgzvcXN6or4Yu4kYrdkCICI;
	5:mqotvf8UlypL0TZcUXE7a0qenILF/+HizpRRVAbdabWQTdJSBnJGtgryQ5KvsYXLpgFY+T6gFzdWfPuC6fu+/TFMfSGVHohBg6A9Sisv2ukTxqhXTzTrttMh5x6PO3aZx9p7YZMfx1AovsjWW4VoZg==;
	24:pUmbliUL3dR8mzvfl39LP0HLtq3ZDTrVJDIvSslTsXv+fspvFkvMQuc/Ev+EYp4g8wjOZMlmFUawBGsspDOoLzV4XshFOwIW4NQ5Ounvwdw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2820;
	7:sK5H0TI30wKwxBAgV/AGD76FjCb+y21lZSQ8BOZfmbtA/iX924aBcyM9+ETG+WshmDFQvOQlsD9U5EoxTbWyC0OhKATwHEtuGmZ0id6t8tvaMvuR7HDs56nCNzd7NpmJKNpIBFeow+MX7t4RHiXEIWIla9+NxSXCgqQRW4ceL311s3WP6cjL26G1+jyIjgw5ADRGwjkgDwuOLzaPconXzA7REuXmEdRUql/3VeTXpcUeWB6yxvE0x8GqxZBGZEQOpbndU9Z70q/zgP6zvg5F1Sq2KTMizw0NqN2+7WgGg86dggipsJHTl4A/slnCCRPJWKf9mUlQqUWNfSVLOThS5vcLzNmInRKtQ67wMT++GqTPuXklcyE0LNqZFNUQJBbCnJyIwMH4dpIFDNJXr2myrg9S/AJvboq3doFs+oHd0UemE2yzxw4C850R7MFx3c0mUVpFfWBPAY1RZH0baDoD8x5nndK3LauHwTQnaSR6agPCqstOnOAmCCNbsPyfJ0i8vJbTpiQF9AAJc8B0C35i58Q3qz5i0q5UHtl0lAOpnymI064gHjx+mzTWqjxzB5QH
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2017 01:28:54.6337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2820
Subject: [PATCH v2] xserver-xorg: Fix X server 1.19 crash
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
X-List-Received-Date: Wed, 01 Feb 2017 01:44:57 -0000
Content-Type: text/plain

Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of
useSIGIO option:

xfree86 SIGIO support is reworked to use internal versions of
OsBlockSIGIO and OsReleaseSIGIO

The check for useSIGIO is no longer needed.

Upstream-Status: Pending

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../0003-Remove-check-for-useSIGIO-option.patch    | 47 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.19.1.bb            |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
new file mode 100644
index 0000000..beed6cb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
@@ -0,0 +1,47 @@
+From cf407b16cd65ad6e26a9c8e5984e163409a5c0f7 Mon Sep 17 00:00:00 2001
+From: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
+Date: Mon, 30 Jan 2017 16:32:06 -0600
+Subject: [PATCH] Remove check for useSIGIO option
+
+Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of useSIGIO
+option.
+
+As the xfree86 SIGIO support is reworked to use internal versions of OsBlockSIGIO
+and OsReleaseSIGIO.
+
+No longer the check for useSIGIO is needed
+
+Upstream-Status: Pending
+
+Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
+---
+ hw/xfree86/os-support/shared/sigio.c | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/hw/xfree86/os-support/shared/sigio.c b/hw/xfree86/os-support/shared/sigio.c
+index 884a71c..be76498 100644
+--- a/hw/xfree86/os-support/shared/sigio.c
++++ b/hw/xfree86/os-support/shared/sigio.c
+@@ -185,9 +185,6 @@ xf86InstallSIGIOHandler(int fd, void (*f) (int, void *), void *closure)
+     int i;
+     int installed = FALSE;
+ 
+-    if (!xf86Info.useSIGIO)
+-        return 0;
+-
+     for (i = 0; i < MAX_FUNCS; i++) {
+         if (!xf86SigIOFuncs[i].f) {
+             if (xf86IsPipe(fd))
+@@ -256,9 +253,6 @@ xf86RemoveSIGIOHandler(int fd)
+     int max;
+     int ret;
+ 
+-    if (!xf86Info.useSIGIO)
+-        return 0;
+-
+     max = 0;
+     ret = 0;
+     for (i = 0; i < MAX_FUNCS; i++) {
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
index 987a2be..5a657e0 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
@@ -3,6 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
             file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
+            file://0003-Remove-check-for-useSIGIO-option.patch \
             "
 SRC_URI[md5sum] = "caa8ee7b2950abbf734347d137529fb6"
 SRC_URI[sha256sum] = "79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb"
-- 
1.9.1


