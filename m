Return-Path: <anoo@linux.ibm.com>
X-Greylist: delayed 5595 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jul 2018 19:29:49 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail.openembedded.org (Postfix) with ESMTP id 04B306E616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 19:29:49 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6UHmnDh137498 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 13:56:35 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2kj5sv4na4-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 13:56:35 -0400
Received: from localhost
	by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<anoo@linux.ibm.com>; Mon, 30 Jul 2018 13:56:34 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
	by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 30 Jul 2018 13:56:31 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
	[9.57.199.110])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	w6UHuUik11076000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 30 Jul 2018 17:56:30 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36EF7AE060;
	Mon, 30 Jul 2018 13:55:39 -0400 (EDT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2A4FAE05C;
	Mon, 30 Jul 2018 13:55:38 -0400 (EDT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 30 Jul 2018 13:55:38 -0400 (EDT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 12:56:29 -0500
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20180730173250.13844.96887@do.openembedded.org>
References: <20180730173250.13844.96887@do.openembedded.org>
X-TM-AS-GCONF: 00
x-cbid: 18073017-0064-0000-0000-0000033190EC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009458; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000266; SDB=6.01068159; UDB=6.00549080;
	IPR=6.00846265; 
	MB=3.00022408; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-30 17:56:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18073017-0065-0000-0000-00003A1F7B38
Message-Id: <1532973389-30163-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807300192
Subject: [PATCH v2] mtd-utils: Revert "Return correct error number in ubi_get_vol_in"
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
X-List-Received-Date: Mon, 30 Jul 2018 19:29:50 -0000

Add mtd-utils upstream patch that fixes a regression on the
mtd-utils tools such as ubinfo.

Details of the issue which affects mtd-utils 2.0.1 and 2.0.2:
http://lists.infradead.org/pipermail/linux-mtd/2018-June/081562.html

Upstream-Status: Accepted [http://git.infradead.org/mtd-utils.git/commit/0f833ac73ad631248826386e2918d8571ecf0347]

Signed-off-by: Adriana Kobylak <anoo@linux.ibm.com>
---
 ...rn-correct-error-number-in-ubi_get_vol_in.patch | 92 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch
new file mode 100644
index 0000000..4ece56b
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch
@@ -0,0 +1,92 @@
+From 0f833ac73ad631248826386e2918d8571ecf0347 Mon Sep 17 00:00:00 2001
+From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+Date: Sat, 9 Jun 2018 16:45:22 +0200
+Subject: [PATCH] Revert "Return correct error number in ubi_get_vol_info1"
+
+This reverts commit dede98ffb706676309488d7cc660f569548d5930.
+
+The original commit tried to fix a descrepancy between the implementation
+and the documentation by making the implementation comply.
+
+When making the change, it was overlooked, that ubinfo and ubirename were
+written against the implementation instead of the behaviour specified by
+the documentation. So were further internal functions like
+ubi_get_vol_info1_nm which further breaks ubirmvol.
+
+A report with an outline of a resulting problem can be read on
+the mailing list:
+
+http://lists.infradead.org/pipermail/linux-mtd/2018-June/081562.html
+
+From the report:
+
+steps to reproduce: have mtd-utils 2.0.1 or 2.0.2
+
+0. make a bunch of ubi volumes in sequential order
+
+ubimkvol /dev/ubi0 -s 64KiB -N test1
+ubimkvol /dev/ubi0 -s 64KiB -N test2
+ubimkvol /dev/ubi0 -s 64KiB -N test3
+ubimkvol /dev/ubi0 -s 64KiB -N test4
+..
+
+1. delete the test1 volume, making a hole in the volume table
+
+ubirmvol /dev/ubi0 -N test1
+
+2. try an affected tool (i.e. "ubirmvol /dev/ubi0 -N test4" )
+
+ |root at mr24:/# ubirmvol /dev/ubi0 -N test4
+ |ubirmvol: error!: cannot find UBI volume "test4"
+ |         error 19 (No such device)
+
+or "ubinfo -a"
+
+ | root at mr24:/# ubinfo -a
+ | UBI version:                    1
+ | Count of UBI devices:           1
+ | UBI control device major/minor: 10:59
+ | Present UBI devices:            ubi0
+ |
+ | ubi0
+ | Volumes count:                           11
+ | Logical eraseblock size:                 15872 bytes, 15.5 KiB
+ | Total amount of logical eraseblocks:     1952 (30982144 bytes, 29.5 MiB)
+ | Amount of available logical eraseblocks: 75 (1190400 bytes, 1.1 MiB)
+ | Maximum count of volumes                 92
+ | Count of bad physical eraseblocks:       0
+ | Count of reserved physical eraseblocks:  40
+ | Current maximum erase counter value:     984
+ | Minimum input/output unit size:          512 bytes
+ | Character device major/minor:            251:0
+ | ubinfo: error!: libubi failed to probe volume 5 on ubi0
+ |        error 19 (No such device)
+ | Present volumes:                         0, 1, 2, 3, 4root at mr24:/#
+
+Reported-by: Christian Lamparter <chunkeey@gmail.com>
+Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+Upstream-Status: Accepted [http://git.infradead.org/mtd-utils.git/commit/0f833ac73ad631248826386e2918d8571ecf0347]
+---
+ lib/libubi.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/lib/libubi.c b/lib/libubi.c
+index b50e68a..978b433 100644
+--- a/lib/libubi.c
++++ b/lib/libubi.c
+@@ -1240,11 +1240,8 @@ int ubi_get_vol_info1(libubi_t desc, int dev_num, int vol_id,
+ 	info->dev_num = dev_num;
+ 	info->vol_id = vol_id;
+ 
+-	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor)) {
+-		if (errno == ENOENT)
+-			errno = ENODEV;
++	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor))
+ 		return -1;
+-	}
+ 
+ 	ret = vol_read_data(lib->vol_type, dev_num, vol_id, buf, 50);
+ 	if (ret < 0)
+-- 
+2.14.4
+
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 97a3e0c..f53c6c1 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -15,6 +15,7 @@ PV = "2.0.2+${SRCPV}"
 SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+           file://0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch \
 "
 
 S = "${WORKDIR}/git/"
-- 
1.8.3.1


