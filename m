Return-Path: <urs.fassler@bbv.ch>
X-Greylist: delayed 915 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Feb 2016 12:47:37 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0062.outbound.protection.outlook.com [157.56.112.62])
	by mail.openembedded.org (Postfix) with ESMTP id B3F226FFDA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=aTM7pFCrqAn8l8MqHFaFqPWie2uye+VDLBFZFx/u+hs=;
	b=Qa90bSuAfIZEQ2pVHN3EEn+T1+rcWX2C9jxUtal7bYrk7kBAfqLloKoBchij4HwxfhLjLFPrJq8iwLnslxCy+dItY68bux6B5z1e8fhZLN8tnl6DpI0K1f46k33OwJVjU5j+UKVf+sslhvzNx0OhuYzyuwPIdBGi7m1i7sQCOCg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=bbv.ch;
Received: from talon.bbv.intern (46.140.25.6) by
	AMSPR03MB017.eurprd03.prod.outlook.com (10.242.79.145) with Microsoft
	SMTP Server (TLS) id 15.1.396.15; Mon, 8 Feb 2016 12:32:21 +0000
From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Feb 2016 13:31:58 +0100
Message-ID: <1454934718-9034-1-git-send-email-urs.fassler@bbv.ch>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [46.140.25.6]
X-ClientProxiedBy: DB5PR03CA0026.eurprd03.prod.outlook.com (25.162.150.36) To
	AMSPR03MB017.eurprd03.prod.outlook.com (10.242.79.145)
X-Microsoft-Exchange-Diagnostics: 1; AMSPR03MB017;
	2:fKqYyyAtwo7WvvLYHtTSvNcZdPxL6BwxAeiOPnOT1uILu5jcbvTKgZRJkmO5InTDtfqOcdZkU61JaSRdjWKs81DoZWtBWh+ASdBgtiLjrBK5WIxk3M6b3a7hZzcTQEiZn0GDjqww1Y9FJRRhzQWeqw==;
	3:5J5hJuJ5WV5YeyZDPm5/EoLrHe6RQ8oDFGMkxgZdKBjLG5EL92qzG92iFGY40pGOXauuwICmCCdwyA/Kv5sowF3WL8V1uYd7mT0IxbemQfsMgqESUIn8VC6RFK4bsXX3;
	25:/svYMUMncpHqhH314b4HLJCOcsqi9HWVd0NqDsTVR0zBoUtZZcyApavWeNwyx5Z+GCVzVHgUX+TDjabs5HuFQZp/tVg1oPjDWQREHiFnsPpXZYwO44c25GG3GQWCr0zW1PRfToY5zGzbXs65uPZ7vignEg+setlq8lgF/XayGuYQV0WA/sp5AjOa8ChD1JuLJQ37Vu/RnFrO0VCs4EDbZfeTOI7mCq9J2UmB+zWPkfECYj3KQs3R3eT1uOavp/oog2PhDteomk+ZDl00b8Q63/EwNiJzLjayMR/HkqoCMyJ+MnPxajcpVnIB6fE/ATW6
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AMSPR03MB017;
X-MS-Office365-Filtering-Correlation-Id: 6d71ebd5-868a-4d1f-f135-08d33083e421
X-Microsoft-Antispam-PRVS: <AMSPR03MB017649B77E602B07AA8DB138FD50@AMSPR03MB017.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:AMSPR03MB017; BCL:0; PCL:0; RULEID:; SRVR:AMSPR03MB017; 
X-Microsoft-Exchange-Diagnostics: 1; AMSPR03MB017;
	4:H0NH1u2kH6b1ei6b8Uomw0U8xjdwrqkmd5Sqo+dJpInN9lZj6ksjuYKYkPwDc+7wXOOsyQwgpugZC5rphXQ/QFNMIGOGJayCqrFhs5o2vTx8/Yd5QXLPDG5oeoD372URq2ooS3vKR2yE7WNiZnMPetb+R6wl2DQMRKpMRR7q5dxrdxG9FAA1bXjlqdzCFX0hp7chp/m9sEVB3xeXm+IsTCwW1nAssU1qkA/+3pV7N3avk+jIkF53zx5WjslHv2NquDsTTxPMlsZxIwS6+URhnbyTUGIRlA/TxJH+ghJXn20HEqDQAElBq58yD/V/fBr6dtpKESDfZtbL6PHVBpoImlFOw5ZTwWs37RciGR8NCLjyTpK+LcqZIaTazMxkvGHs
X-Forefront-PRVS: 084674B2CF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(2906002)(50986999)(19580405001)(42186005)(229853001)(92566002)(86362001)(40100003)(19580395003)(87976001)(2351001)(50226001)(5004730100002)(50466002)(33646002)(3846002)(6116002)(450100001)(66066001)(77096005)(4326007)(586003)(1096002)(5008740100001)(5001960100002)(110136002)(36756003)(23676002)(189998001)(122386002)(5820100001)(47776003)(74482002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR03MB017; H:talon.bbv.intern;
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; AMSPR03MB017;
	23:DE47IipplLgrsec73wAn5ROs9NARSKOFlkvRZxMYKf86HbjAzR3OOjKffnzI4XWkeN4M/AU40IHAtfBnqCVDqkeF/ANB++icVhcY43b3ryVNR/kpPfDE5NP6VdlIFIjot/id9BqCBCDYxy4BJLcxQ+qf6/+0WQyeSHE9j98mnsiYUjD9PLWzxSuWd/0jmKIU2zFJcmxdttHVQr7rnLl/krKDkYHJ+LmCYzjkIZWYZw2Voc+9E+QKRAYlDR0NJW7uy5tGwsQvO6ZXc1w3r/4B+aWMkbxJMFxEPJkssLegE3k2ue2ZFpFEwPbd70ePWd9BySFXY5+AFGEzffL7jAFFCAakYbVNxw0bRdLVhKss2tDHnkIqJ5kMTVQEbAQG1I/Xgpnn7zdE0d19+SXFg59r0m7G7qSdLDqH/0s97GD7pVWr4DYo8s7nXSHA+Z9X8IjeYEXnLGuK2H1k62b22P2Onch5Mrr5oSgiScmkLlPknidNPwsuQslBEKR6HxAb4IaUaY6HJh8vxvlvr6BCTGVIAT+gB4rMRawX0OzoSUlSaxsm4VtAoha47ku9eXp4Oo62NeMNW2z4AL/HzaWMCNU0Kvc5LsHcRF4VmmxAaexJAMMYkPLrGBbDcWG7TWgswmwc0/4YZhO7RxbxqSLOnu6DEBh8DFuBwLwWlDljxWjdXzzE18HhZvUznp8/VKdJ+2mK4px2BVDDZrxKixa/rxI1aQbvSbfQu08Ba9G8MvKDGdThXIRWH/hR0v1FhrPaTEVrEaVeA+CmBoXBZ005cebN52nshSze/sJgRO+Zo/A+GjSszrI1D+Hh/RoTb3yXIsFC3rbz2AFK00TRpb+ajK2zNKEPcV7ZxJ84r/J4z9+W2OtbkmiQ7zV6JU+9yx9CBo+mJVT2u/3hxqdvlAHvPPkfRu6D/PuXhgl8+DSs7gCWSi4=
X-Microsoft-Exchange-Diagnostics: 1; AMSPR03MB017;
	5:gfa8allzlwLCT+KfSC5hfH4+Oe/xVE93Kwn7m5dGDY/kbiB4RWpzOczDqmpEjvq4o2dxYB5yCpVGXk9eXk7po0cq2iy6HbIAONhgFjKtHpAtQHeddolKXKLL+iuAdnzvRDRA5DxrLWuRmmSMHcIfww==;
	24:roLTxseXe3eqpXPC2A18dyz89yRcYMTO9qd1DMVMrLlZeYOUNwZ4j3NcfRR2GtwN1ScimJ1K31pgNqvj2LP4zcjJzMF+CCEsZHCA3gMPbjE=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2016 12:32:21.3154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR03MB017
Subject: [PATCH] initrdscripts: fix mmc device as install target
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
X-List-Received-Date: Mon, 08 Feb 2016 12:47:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Installing from USB to an internal SD Card did not work with Linux 4.4 in Yocto jethro. With this patch, consistent names are used for the paritions.

Signed-off-by: Urs Fässler <urs.fassler@bbv.ch>
---
 meta/recipes-core/initrdscripts/files/init-install.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index f9e9768..1925d90 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -141,7 +141,7 @@ swap_start=$((rootfs_end))
 # 2) they are detected asynchronously (need rootwait)
 rootwait=""
 part_prefix=""
-if [ ! "${device#mmcblk}" = "${device}" ]; then
+if [ ! "${device#/dev/mmcblk}" = "${device}" ]; then
     part_prefix="p"
     rootwait="rootwait"
 fi
@@ -211,13 +211,13 @@ echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
     if [ $grub_version -ne 0 ] ; then
-        boot_uuid=$(blkid -o value -s UUID ${device}2)
-        swap_part_uuid=$(blkid -o value -s PARTUUID ${device}4)
+        boot_uuid=$(blkid -o value -s UUID ${bootfs})
+        swap_part_uuid=$(blkid -o value -s PARTUUID ${swap})
         bootdev="UUID=$boot_uuid"
         swapdev=/dev/disk/by-partuuid/$swap_part_uuid
     else
-        bootdev=${device}2
-        swapdev=${device}4
+        bootdev=${bootfs}
+        swapdev=${swap}
     fi
     echo "$swapdev                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
     echo "$bootdev              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
@@ -234,8 +234,8 @@ mount $bootfs /boot
 echo "Preparing boot partition..."
 if [ -f /etc/grub.d/00_header -a $grub_version -ne 0 ] ; then
     echo "Preparing custom grub2 menu..."
-    root_part_uuid=$(blkid -o value -s PARTUUID ${device}3)
-    boot_uuid=$(blkid -o value -s UUID ${device}2)
+    root_part_uuid=$(blkid -o value -s PARTUUID ${rootfs})
+    boot_uuid=$(blkid -o value -s UUID ${bootfs})
     GRUBCFG="/boot/grub/grub.cfg"
     mkdir -p $(dirname $GRUBCFG)
     cat >$GRUBCFG <<_EOF
-- 
2.1.4


