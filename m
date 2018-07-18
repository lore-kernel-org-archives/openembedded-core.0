Return-Path: <prvs=730c0c5bd=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 1A8327899F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 22:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531954400; x=1563490400;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=eIBmySdHNVIu39Gb4e+ic3OaYLC7wz+G53xVxni+gyo=;
	b=RA+2OzgUOTliFcM74uOpHEd3dUGfyUofcq6jiTCdcPHDLnnW0+gkfvh4
	23C1z92uaFm/CeRTAdk2i75HoncsZek1xGflStiqI3Ku/x1uly0hNYtUU
	2Q6l14ut1KFsb5Lpbs4ja8fA+mBj+/N6JrmssmUh3oMQdOEzAVzn4sc36
	rViz3QB3O5MqZHL3l9bNnrK9mxOgcTBacIzbM53Y+R8rB9sC6R/CSMO8j
	ta8vu0U/an98y1+I25Lv4XjaRvk15SY0sFBReX0wBNU/a9lki56Np6vuh
	I3Sc2lX5r3hftr5FB+AnqfPyEvFRz7XiusDHyXzfWXIWyCypPPEtVVqY/ w==;
X-IronPort-AV: E=Sophos;i="5.51,371,1526313600"; d="scan'208";a="87617635"
Received: from mail-by2nam01lp0177.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([216.32.181.177])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jul 2018 06:53:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3GsAw7RzzMeWscRpVR8w2tfSTOe3UjyL6lDEFI2G8eE=;
	b=Qxf3aGAyOetnYgd4NRiY4vamiZcXH2wsGd59xi96hLd/ysCQnE0ePP43ID76i1rgcAPEUBd/WO3fQf7jGZS95sGgoQWPELqNvT8NfaPTwXB9lE/2A+GQre1JRliW3FNSifpNeQJq0Vvk6t6DeExh5uTja3Ea0jh7Of1fw6yTacY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	MWHPR04MB0398.namprd04.prod.outlook.com (2603:10b6:300:70::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Wed, 18 Jul 2018 22:53:19 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2018 15:53:04 -0700
Message-Id: <20180718225304.28673-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR02CA0059.namprd02.prod.outlook.com
	(2603:10b6:a03:54::36) To MWHPR04MB0398.namprd04.prod.outlook.com
	(2603:10b6:300:70::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3577a4e2-e4bf-49d9-42fd-08d5ed014192
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0398; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	3:eDSkAyvwLfJlIRdLDI52Vjxn0zfZA93RwH0ZIuTjS3OLeMWHfswmIW7+CTEorFnLAeE9ZFnRf7wIC/sk/EWwnJz17QRU1OSi13u66GRrDt+5z62qhHYNo2bFXwMaZhKc3PWEjHodmewWZfyXoSmDGcdjcIp3KKt3yiKRk/QreAP3ySya8J/B9wljWwgg7j3rzkex1Z/LW8SrwBSwke7SfdK24OSn4nnO2/UwgO6ay6orGvIOJWlLQi1TjRQYzlF9;
	25:ohrxvOPlRwwqfifGLAhB9JSFpp4qNtOzfBr2PAMcBxNZosW9Z2KNzwelYOfZtGxfF4hLW+NR5jabmStsPL8hLWldp7KvsyeY+62TRcoF3/MO3auZ+c4tRdsGCkQwb0uXeAPLhJyM448BwFA706i3KNkvttXCAJH9z49CIkF9PdEzzwQjt5UsuLKEEg54ym0Ne2LtJYZXARCui6u+P3Kr3xoLQF21moATwnfjA4FgBPoVspwJrGoVrfDCaSF49Y0dm8rwbHRaDvwGiqAlL8fndQWBlXM03PDiE3FMLqEox3V6ymHALrGk4v91H4Svl3k8i8YZ/b4PE4JJslKyuHqUog==;
	31:AKpuloJgIHNYiQA4sMyuKWCY4aGKtpAuvCmauv0f0lUpBt4Ztv2VB8wGZdBQz8Y3k7VX8a+fETHuh+CXi7iQpER7+SIT8gYYm079uOPQhj6TeQ3WcTr9a4ZNDHZ8RjqPmwlLe5Qlyfp3+bP5IER8wBSqhFXDHBS/WpLSLopzdD5y5iNEGQ8Mr/Itq3TaRqUA2nbQ1tKcZCqeB6ff+FMs6lzx0k+2kE1axie0Fpt+/Ak=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0398:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	20:Y+TIR9aJymIKOLH5MDWiOwnMVGmwTFYUBYC3kzKE5UfU/WPkZ7QPYAxfYEhLoAa6BBb2X0cwhSqRJDQVLgHzhtdTmuHYxZVeUxnJ3fNu7SB3RTSJFYsXs9+ISINlAt/dcjl/JZIrKv7AP7c3ahp6Y1BGO5DXOrtEueSj8aFPEbOPvNHlFv//ZYi1ep6vUEj/MSWI7bb+/dLJVuG/8PqmRT9+TMMnd8gCoIn34mMi/rnbZNyibTop81joxEEn/fKvKhvSCwItdrw8udroFBe1ZERdAyE4DVncXk6OPLourNvJp2RUgF2RJrXd9Q71CLOjqYuqd9zGI/ufQYsXw09hMKWF0h08tVPOZbL6ZIovmNKnOxkuThbGvhTueRW7f8VGCbGGp/dIXp75nYYWV+Vyo/aliMYU1jhSCKdNOVxGgtVHv8aI1zmjRFa3wDE9T8HOG2c+edePP4XkwOFZH1cl1vBmnTzLQeDmd7iNBozD4L11G8ljZvwfgv59fvRFqtpS;
	4:YkVQc9e3an9D9p9Xc84v0G1k0dDtZLDKTMAqnzAuDMKf3MRSt3XVG0SfBndThLDj0Hvvf2fLFfc8s0QnMLkcTsefzQ0w2MmOoufjjhDKgHIM2hoEXHsCDdAcRMiwWKhwa2WQFfdz0N0/fYmr+vBg8H6DyyM1SXqpG9g5eNYgqajaIGfujVDpllouPJ1+u25Wfkvu4ZFob9U/i9Hd5YnZMS4J+lCQDcaKEhdLx6YhPPuHMP3v+YuVvRNX7S9h4hbmSqozfnLyopwQk4DP/5T8Bg==
X-Microsoft-Antispam-PRVS: <MWHPR04MB0398A22C7C8697DBAFE22CE090530@MWHPR04MB0398.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231311)(944501410)(52105095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB0398; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0398; 
X-Forefront-PRVS: 0737B96801
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(199004)(6666003)(105586002)(1076002)(16586007)(86362001)(8676002)(3846002)(2906002)(72206003)(51416003)(316002)(6916009)(66066001)(50226002)(8936002)(106356001)(2361001)(6486002)(6116002)(52116002)(47776003)(81156014)(478600001)(6512007)(5660300001)(7736002)(186003)(48376002)(26005)(305945005)(68736007)(25786009)(44832011)(81166006)(53936002)(50466002)(36756003)(486006)(2616005)(2351001)(476003)(14444005)(386003)(956004)(6506007)(16526019)(39060400002)(97736004)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0398;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0398;
	23:4dQp7Rl9TBvEepSbRmkRHyeCpk/caVGC4c343a1Xp?=
	=?us-ascii?Q?Nuw4kA1Na7MUL4L7HNkEzwZuuYq0uQw2uykDaUTqno40ISJQGnD/Xl2C2RBZ?=
	=?us-ascii?Q?EDWxi447CsjQeqM5QCoBQDLF3Tt/KovdDUEEIHc+KT2nSOyudvrBcQvmmruv?=
	=?us-ascii?Q?C5ETFSZTjYt/CbjowU+KvXVXXd1Dwb2BYMqDfLkkMiWF7oEMc6RfP3hqK1Am?=
	=?us-ascii?Q?Vv38r88Iylr+BebHuo7yZDNIvSse34XY3Lk3jQ9jfLKDqbbRIb8IDE9qfYfC?=
	=?us-ascii?Q?ba/3sP+QAU8LQ40oEYOMgt8Zzeso8TFuOjM/HIiV0OSBZhFHyzsu8Aw2kcrQ?=
	=?us-ascii?Q?HhiFHH8JE4SRB4iC/wgBzvf0t1gJu/sYiiaAcS7poSjelee2raDadcq0qEPC?=
	=?us-ascii?Q?cHCScvrnqQfyPFnYv47F0OhcNFhlrz1KVOR1N27s65r7eAEhrXLC0rm9t5LP?=
	=?us-ascii?Q?3WOcasNiBigO0frQbzYMW6/JCchyrz/3ufsgYKaRz02nIxgGAtyLqM0e31/u?=
	=?us-ascii?Q?QfzQksCecySaxSQH+WN7KnZjFEMstpVqNik1ruIc01jD6tQImlFU80dewgah?=
	=?us-ascii?Q?H6rD6vai2U6WeQ8AIFzSbzN78r0ruwBRJhKeuB3s99JZKIhQpAH6BCgurGes?=
	=?us-ascii?Q?3aOI78GG1FBdikWhqWgSKJoTIACgAxlhDu0GOD7gBbzwn3RKD7v0NBzjd+fq?=
	=?us-ascii?Q?xppuRHz4J5QfRomn8nCkgAQDlWEqLIusgQjI7bhAZTi5Ay3SImCSONMYfLEu?=
	=?us-ascii?Q?mJRkXkpEa89KEuHLw4Ef2m0iNPmpdl0d74dNTyoK6e/0uIzX6B9i/j6e4SfZ?=
	=?us-ascii?Q?STEmnVV0CkH4laMajPU986JxZkwcA94TODDptwc5jO9606uW84sMxbN08e+f?=
	=?us-ascii?Q?3l1qrwmjgbIU2eVvIpMgW38Cjh8ZVpdCSIjFiKPuKsGDB89eVCeVWKr7upRb?=
	=?us-ascii?Q?QG1aGvTFfbCgKympVxsqdPut5GRJE6p+uPApcJrnp5UFqBNiKGR2CCJ3oaIH?=
	=?us-ascii?Q?eeESngs3kISy/FpZnTZQcT9AxMnhrurgOte8tuFRiAddVUkepQQG6sceVtlR?=
	=?us-ascii?Q?yQKoLZiKFA0vxCpqtfTWOwSHDH45oLG53ViAyttzVUxGrduEnTx/ITGszjlZ?=
	=?us-ascii?Q?ZENFuiBPOdz7nSX+SQON8Ev7VuVzIZSm4wBru0B0YgOCHcQEc8Fle77tC5vs?=
	=?us-ascii?Q?rmjt6yLVwdxH4tk4yZcj3evF3Irs9W2sY7YV6SMbQX3b19FeY28ruS0seL3v?=
	=?us-ascii?Q?FS7Lcd02Wz3irnhSRQ=3D?=
X-Microsoft-Antispam-Message-Info: luPIRsdnBWzI0SH5xbCJdxOVEEoV2GNAFJZyai6xGaOL4dXoBCwIHb6/32lVd3b6REDL0K/nTTJYF+kL7B0wbALw6g3BSw4i/7mjukUVpWPbwFfMBlaI5knlvnA1tDxozUp1UDkMK/GMCEBfC3dUvmmuveMp/ThJ8aH94hCBDLHgtBXgY0kUsknxR9CgOEozhzNosgv4y4bC+absuS9WPbXziXxJEXdsZsxKgBhpgH7HUreZjePih85WYx60tnb7mW9CCh8k1h58vNzcvz1u51UUrl+p4jdkk/AZqYC33ZbPQcXjSOxxILthz789UC1Vk22svixidmR4Yz0B3jywoQB80/TqW3GGiLeEkc6PYQA=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	6:qWZlggusAto5/oZTi0lmJ5j7ydlog4DSMZ4YqDECvx8uo92HMj2CVm4IH7ojjCjXKIFYmbfi29aQHj16u1kiPSJJkiEAVyBSKbiF3HWPHaEvTetfu5MBL6MUVJfB2Y27BqA/vyRgdJDXbnhAdwHvD66WTaGiwPTi2MC4UgACFG1IHHFsdJybg5u3eDqy7+jtbtBZq4Xz3R8MdxinyLWY4uY4V5fW2HBVduKs/G7c9LCIraB4d6tmRbVhF03JhSKQlHOmnHZAGQmZwhENxL1iPJG+0i00tAoaCcTy/rXSsz4sBnPB667XnbMG0ROmEke8XJ6DDr+EDgMGSvQ4syOcsFNlPLbVYdkPdwmGK2FMURn1GUoxGaYH6G/fVXknIrlRDbv7X2UMrmUEjQ2M7njSFXhQzT5P1W34Bl8PVONHH4kTgBgHLVSpO6dEsqsoSZ/GqTDTytW/vRj8kAS1j0y45A==;
	5:AwvF2oJN/CHEYqgttZSe9GSQRJC030ywjxkyTtGj5HsraKMMc8z9bZp1UxfJ2TEvEWGDJmehgf5Imt3YpfVZCc3nthky/zcIf2NFG0R2gJMqtR+Uu92UuJajZHxChlsDGsc4+ZRAgQoEnaV74tSdMvAP2bDjVgkiRkk0gsfYpio=;
	24:37b2VkFSo9UgB/0KuqIvPWbDF8eNrBdfifpPHNtQ2JpY82ILNDY/nKLX7kpa76T5IR1GzqSa9ifBGg6NBcevYeCo16VFjmpFEbdKf+QpFd0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	7:N9NnkLARmqY8CyZsHENr4I0ONdLsltWaOvVMrV3Gx77WrlXhzXTQc1g17oqMJnVitbE5p8lJo2ful5OULbMEYtfCwK54EZlJqpAY03gZnio9QCK209EpYWZEJFvR2fo7XFkNKLjKIB9Y08ow5vnjtIn/AeyvEhO/tEftVa0Xau8WYJRDvycyxCodJOtkwAeItyAFTIjU/qgfIqHsy/kQClMs4X+Kp08bCcr3X+uLZpxCX/r9qAwg4ZATJcXuOpNM;
	20:PIihl+bHqUTA2KyO5PMOG+Yp32mRvjWFSvHIvAWNesajLkT4F5aPoacJYOu4ddILBBtgKS6rXfKP+Z9IqGpTkEVslZ4rpB4npXqteVAv9fahWBAX5GLI16LIFVnSFEw04dwsX6WBHfem1n1CwYBbHTMoXgdIBn5vGmAphooEDW4=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2018 22:53:19.1446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3577a4e2-e4bf-49d9-42fd-08d5ed014192
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0398
Subject: [PATCH v2] systemd: Allow custom coredump config options
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
X-List-Received-Date: Wed, 18 Jul 2018 22:53:19 -0000
Content-Type: text/plain

If the user has enabled coredump let's allow them to customise the
config options.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 7822548993..a625d060a9 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -279,6 +279,18 @@ do_install() {
 			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
 		fi
 	fi
+
+  # If coredump was enabled, enable it in the config.
+  # This just sets the default, but can be used to customise the values.
+  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
+    sed 's|#Storage.*|Storage=external|g' -i ${D}${sysconfdir}/systemd/coredump.conf
+    sed 's|#Compress.*|Compress=yes|g' -i ${D}${sysconfdir}/systemd/coredump.conf
+    sed 's|#ProcessSizeMax.*|ProcessSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
+    sed 's|#ExternalSizeMax.*|ExternalSizeMax=2G|g' -i ${D}${sysconfdir}/systemd/coredump.conf
+    sed 's|#JournalSizeMax.*|JournalSizeMax=767M|g' -i ${D}${sysconfdir}/systemd/coredump.conf
+    sed 's|#MaxUse.*|MaxUse=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
+    sed 's|#KeepFree.*|KeepFree=|g' -i ${D}${sysconfdir}/systemd/coredump.conf
+  fi
 }
 
 
-- 
2.17.1


