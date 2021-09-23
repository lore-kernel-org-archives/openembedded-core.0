Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.131])
 by mx.groups.io with SMTP id smtpd.web11.2188.1632388854199752280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 02:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=YSH/n1oU;
 spf=pass (domain: prevas.dk, ip: 40.107.1.131, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kv2imAHTOZvVgeq1P2auxNPZ6ijOXNMurICbE3h49lM8y6nZHWC5iZlVzHpPzipUqwFo5pLZ7u3Aoj+EkS/g5HwM8D4REVuQdRg8Z+CuBYuKLpT+LwJHPEEJ9zfc4TJtDZWaL127z27ajquG7/pf1gqJb5pg1U4HwAKrwNuZyJxzTWXK4oNAPJAPmXVXpHYnnXEUNS9jnG7rjceVaoIe6xApagJ+IkY+Kyz3dA5nbE2o64X2apTdigFtEsvZxLKfRTF9P9ZNmIriaPC9XfNdlG95Q/Ow63auL40RtZx68gUaNXHocaKAJI+k7+h/RO4frRgqBaKAObBLjs7CS8wjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ayxn3C5VA6B33RFtKGePUrsfjIyERIaDv08LYwcUAG0=;
 b=d81aoSTtyWANGyCnL0FGlvCTtR9vB4PZCycr77B8H9l4bsSifQueMaJGf2eQl7aMvwlB4wJJNObASI/LF17lngoxVPgdipPbqG5fIC850Z0s0Jjom6/l5peFBA7vGUtFGDvxZEZwTOStqLV7hd5q1W84UFUdp+tC0unmA0u0WPDliGaYvRi+OjauqFwMMGPFb8oUBGefjaak3I2Kwz8rQ8T7pQX7NoE2hFUjmQeE+v/zZB8/9vOwhGGcAtnGZC0BQnZgike6ejz/GZLrPtajsfrADlyri/gtkd7k5MNrm9UWvxL1jBgnEtsYnif5KkZ8DnHAq3urlv+w8zcjIlshDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ayxn3C5VA6B33RFtKGePUrsfjIyERIaDv08LYwcUAG0=;
 b=YSH/n1oU3cDTuGTwSfhRn5qGTaQNrrLvGxSOTl3MuxZCmhgz484EVyh11M9x6to9rcKBmFzbxfKd4ph7+DjnphCOWS2eVZ0X2mT3IRw0u8nJnKRcy6RYfV5Ro381TngKfZuTLehc1ztY4OVE5ZNJDVBF+m6ldpBS2/EAX/FPMig=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3297.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:182::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 09:20:49 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d9cd:f635:6e73:9bd3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d9cd:f635:6e73:9bd3%3]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 09:20:49 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] kernel.bbclass: remove unnecessary dead code
Date: Thu, 23 Sep 2021 11:20:40 +0200
Message-ID: <20210923092040.283751-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: HE1PR0102CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::14) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
Received: from prevas-ravi.prevas.se (81.216.59.226) by HE1PR0102CA0001.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend Transport; Thu, 23 Sep 2021 09:20:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e962d805-eb83-4131-0ba5-08d97e736ec7
X-MS-TrafficTypeDiagnostic: AM0PR10MB3297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB32975AF9F301E5E8AB6CB6F193A39@AM0PR10MB3297.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mcN2NrwIWCQLOP56HWYrxv5J/tCCK9RazId2+65fK1dxZyWPOKW2oglWCI8VfAH/Tbl7FmO5+vKnF2A4DNQYv3YpVS0mqihYGYWxNoS5f2PjLbCH9/KoSBm8DcFE52pLGol3CQ4GSHXthEl7/WiBnDu9Wqx079anP7HS4Hee/AYHVhwKs+wJj5IUR6nBuImGvkLL0cGuisKMmRvlmJwKBB/VF/tvQc9LrlVJHhZEFpgbTZBUiSDSqvMk1AdEuMYnh2kjMT//nGNP8Gg7EXpoo3D90ydbN6PpU3c4pY/oQf7l5i8etOHI4ilmMxE5eNMNQ7dRH/FBcHkKRX88HMLpHMtiDxC3rePSvpTJkVpRqfCw76PSahdgo2huX3sny3vZch3OnDjXs/pwELSglccU3tp29ii9YZPiILQ2nVIpARHss9McDiP+naZgVAy6ov+a5Zxu40bixO/H3z070VeySAh3ZyA8/DPLYVnDBG2a8sAZaf/0FoLw96gLhlHFXbmqVdU1eQxBIjWJSUI6iJzuKEM5hQyCnk2BuV34bGLq0cQyKGLuVJiEqNxpQYVoWDwdKStMpWunKYyI0v69Bn8tal1/GjVrVZLQPx0cTsPxAhWu/aqL9qBEUamCZIsIJUJcqgfOVM7RiY/6iD8++PRUSh6KdIbZg8ahXFrQUEOhtW+hXPp56TugvjDTB51F+wNS92RsStzoG6uaydtkwO54Pw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(1076003)(956004)(2616005)(36756003)(8676002)(26005)(5660300002)(186003)(6666004)(8976002)(8936002)(86362001)(83380400001)(508600001)(316002)(66476007)(66556008)(44832011)(38350700002)(4326008)(6512007)(66946007)(52116002)(2906002)(6486002)(54906003)(107886003)(6916009)(6506007)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VgfOiUIY6yN5uLf5Oxto04zK9cysQoVRkagYHthVQIjdOcCeC5VdTygF48kP?=
 =?us-ascii?Q?xXfHd5ROGGrfeySamEiTdRjWepftdGKOrBAw4HcZXJDDfAN9kI5snh3kSvBX?=
 =?us-ascii?Q?VbFVSPqxTlRFmj9AuV+0UtItAp44Dph4iVo3++bCoEKBSYjr62z894X74kWy?=
 =?us-ascii?Q?bYxNX7z8FlGIVN/kQUJ3eebWSsFFeyhslTB66pruNMVADLAalAJfoi8qhhJZ?=
 =?us-ascii?Q?4nkArk4c+/OuapQ7P/t9slqBvznDVTAC+JxLpWTukoWQOPfuHFWB8+q2N9D7?=
 =?us-ascii?Q?zZpW1yfv5/22fCAuZy2F0VpdrG2t4bNzwWd6+cQOnQbtFINmLnlsKHfP4Vc7?=
 =?us-ascii?Q?xDp6e+WtJiOH98KlSYovxBDsAUrXn7FVvahhhr9Wlu6E6fu8qR0sgwDSTv1D?=
 =?us-ascii?Q?2SkBTHm2VZyZPI9MHQE2axnbVxU2TUZLiBjm+6x+JGAkfpSIsUC4/UwA1VYC?=
 =?us-ascii?Q?pW77C0zAz2lowKvtiuPK5u0QjDRzbJvERvlv7WSu/RfH+Zw6CeH8WiX5QVtL?=
 =?us-ascii?Q?xXXWAER6wxvWiTG+u4LQVPQxLANWKCWBzEsqpMfQKa5FDWLC7FLeO4ayH1tX?=
 =?us-ascii?Q?xNPltKGVpGcTDVqCCnjlDQE9ZY0h4rh70qN636rp1/EHIAK6XWs1A6PXo/ak?=
 =?us-ascii?Q?gfkfso6xMhlkIbZ8so0zXPJ7W3kgQVmbYE476dBspO4HqrLLQQSdpUmAbOPA?=
 =?us-ascii?Q?t4GTArBceb9bwVStuAyaZlPna92UQmhhwrw7/QOmdwK04cMsBwFlYnhFVBge?=
 =?us-ascii?Q?Eor27BQkvJozdba5IzmXAZ8vMhH6k7Wtbjdh23uZljsVYwCT8Xt7AXjDM/Yq?=
 =?us-ascii?Q?V6/+VGTgmXIQm/lzvAv3RD8TVH3ikIfJ4p5tX+hydKFAkvou61oc5hGmdwKv?=
 =?us-ascii?Q?V2iG+d+OSc2EQHldLgXOM5Zf5cjiZVTk1AsgzqD6dgWnFtOiYiKQekpwFB+k?=
 =?us-ascii?Q?PqfRY0HbWFvstQMx2C/GOwhiK8OmuFL/HWPyJKbV6q6gpI27gb/5Cnm/vhKC?=
 =?us-ascii?Q?jPS1IL7Z1gywc0jy0HaiMYktYIAm+mhkdim0Myx5PclP9NnK18x1ygD2Zm2Z?=
 =?us-ascii?Q?RkAzUZQXSuqJnnncp4+95z0muobSMH1iJPGfSZCYE/AzXeYVUpsEWc062HHH?=
 =?us-ascii?Q?2GIECxU3A9pW2al5AyklAagWbVzvrBbVEcRKwtqdhVfC7Ck8aQTCGYwy8Hsq?=
 =?us-ascii?Q?jDtZLa7j8v9AwdTqpFYThh52HFyA8lc3irGjC0xd3xmgT4z00rDWIjVigp8j?=
 =?us-ascii?Q?BPwp+sSEfxEyutgqipeMrlQ1Axx5n6kLAfZesqW+0iRg9C4D6Dmdpr5ukojf?=
 =?us-ascii?Q?LdX03Ubz3e4PsTrTu71+lnC1?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: e962d805-eb83-4131-0ba5-08d97e736ec7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 09:20:49.7801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsdertKxV+L8/Tk2pPhcq9EYyrdTJfjgOSKVzILzettorShspnkLGyWmkS+hyvOIP9XrslKvwSNp31cdsdoBMK0JKEaZAsBUGRf7O5VxJdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3297
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The grep pattern seems to have been wrong ever since we stopped adding
the -ffile-prefix-map via a patch in commit 20aea61385e, because the
actual upstream gcc produces

  -ffile-prefix-map=3D<old>=3D<new>

and not

  -ffile-prefix-map=3D<old=3Dnew>

Besides, these *-prefix-map options are already used when building the
kernel due to the setting of KERNEL_CC, and the kernel build system
itself also probes for and uses at least -fmacro-prefix-map (hence
taking care of __FILE__ etc., but not necessarily things that go in
.debug_info sections).

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/classes/kernel.bbclass | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d13c38fb02..4acec1877e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -322,15 +322,6 @@ python do_devshell:prepend () {
=20
 addtask bundle_initramfs after do_install before do_deploy
=20
-get_cc_option () {
-		# Check if KERNEL_CC supports the option "file-prefix-map".
-		# This option allows us to build images with __FILE__ values that do not
-		# contain the host build path.
-		if ${KERNEL_CC} -Q --help=3Djoined | grep -q "\-ffile-prefix-map=3D<old=
=3Dnew>"; then
-			echo "-ffile-prefix-map=3D${S}=3D/kernel-source/"
-		fi
-}
-
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if [ "${BUILD_REPRODUCIBLE_BINARIES}" =3D "1" ]; then
@@ -361,9 +352,8 @@ kernel_do_compile() {
 		copy_initramfs
 		use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IM=
AGE_NAME}.cpio
 	fi
-	cc_extra=3D$(get_cc_option)
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_=
LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${typeformake} CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" ${KERN=
EL_EXTRA_ARGS} $use_alternate_initrd
 	done
 	# vmlinux.gz is not built by kernel
 	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
@@ -390,8 +380,7 @@ do_compile_kernelmodules() {
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
-		cc_extra=3D$(get_cc_option)
-		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC=3D"${KERNEL_CC} $cc_extra=
 " LD=3D"${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+		oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC=3D"${KERNEL_CC}" LD=3D"${=
KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
=20
 		# Module.symvers gets updated during the=20
 		# building of the kernel modules. We need to
--=20
2.31.1

