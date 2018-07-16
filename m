Return-Path: <prvs=72899bf67=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 92A5E771B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 22:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531781421; x=1563317421;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=W6t2+OHBZ9uImDSfxKRz8rnKgCArs2rwZjA5u0Cbalk=;
	b=Xm159FwwHwk4zggdhXHeashYkmuxRD6no01NO1q/vp0zOwosOrKEKg3A
	zYNO1VNHiqAplnROKLJjxX0h8td3IEmuqL1vJGh9NEtW02xjKfhm7f9Bj
	Eu16RW659msQ3km1KXEPxpXEZD9hmMLm1BNBJxW1+T8YmnpKAf6hbs8l6
	NWdaKKEXzjsEgDhXuJD5C/rSqDXjXKyj04oByuMRShIL9Vu65sHTlZ93i
	7XHM8HzG8C/ni5t2xkeg0jzYSTKYg4oxOFeyfS96lutoJs39PZ41GAXNm
	2RLpbArPEW8JwWBpZFM2ZvUM9Ec2oEjx6+EnPBnMGvLlut6ouHTdcxqXV Q==;
X-IronPort-AV: E=Sophos;i="5.51,363,1526313600"; d="scan'208";a="87343616"
Received: from mail-co1nam04lp0047.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([216.32.181.47])
	by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2018 06:50:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=h80F6tw7FUFpMZ5ARQNx9U5I7wgOLWqMofvUyU3wG/M=;
	b=lXpkZ0XQoyp26Z6sfjaVFXNVQ+nXnmNlZk1rC7Km2R/n10SB6Wy+LGh7obYZ8KewLEepiz2a1d5rYxF+amK/FUJQKrvt+HMw4cSvTx+KtZO21LQJQiNjVB1TQKL3G/oFRSwDpiu+G5fOy2iRiAjgpQ0QibH9ROkT5aySqRTGPhY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0394.namprd04.prod.outlook.com (2603:10b6:3:9d::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Mon, 16 Jul 2018 22:50:18 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 15:50:09 -0700
Message-Id: <20180716225009.3403-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO1PR15CA0075.namprd15.prod.outlook.com
	(2603:10b6:101:20::19) To DM5PR04MB0394.namprd04.prod.outlook.com
	(2603:10b6:3:9d::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 626ec7e4-061f-4c71-ae65-08d5eb6e812c
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0394; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	3:ZBR9W192jcHh5tBYTGKRpa1/Jy3c99/ySo95pj0ib/g2UZ0eQibr7gm7EH/Hv7jp9Tdvr8SrQUvZEgsithChre3y1YK1FsyYcPITWuLRoBCg7FzdOxmylq7H8nzKwAhPmVQ/civbzeFs3sml96AV4KC6Lx/Md7HSCnieFHo/6EIulcdfehUgvYJiEz+BoNEBQEPkpwPnuG2jPEYzMZmbZki6ARt1d2BT5xx5I6WV9q37mj0JXbcXYUHWY45wXzUn;
	25:p2lka/JIAf8LOWyYmk3v8Rakgg5XfGLuCQbJzaYm1zU7woM8uuTfl7gVKu+XjV7qifRExVJVjDn8JyB8tchimcPTycGQ8naXEajRsVTuVdz5HTEOCeZVDNioOYxgp6zdJZCbtEb7IPtRZIZr9zI4nJ6rAFO0rIffk3Mq9hq1GAPjdAVXNpNgFU0H9zjTIFy/MX78h5VmQ+MydmtlQJyJMLJCuiCQRcwxdpEyERP2/ma7S3fEp6kihfMWehQUO1RFiKlGmWBF/37ARujCzWmf6iI4iRaaUbGO+RCuxPD8BEUbaxTPSXk7urmA3bs9CkEVh4CzlXawbQ8xRo23M4gz7A==;
	31:7QfDB9gad9BplVcsbmOwiDgp7ggmzwzjcLh7CEMFso/yqZjbWIsv9Hpk3Q5aRInqUH2AfDn+Qj92b8Ajpit4QqeSeZJOKQbvnQ9XYaiiXuhyCCSulsaBm/e8EwTmjOhlNUOHZ8U7LtmzjOlV84pKLM6wj8Rf8lz9R0rkRL5yM+BNtQ1mXPqBvWXmMMtxpA4Swjjf7RwzxwYhCH8iaHfXM6tMko7n8lAFPEd4KCzGEwA=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0394:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	20:tOdXe9hMEXLHDvRTrFd6VyQvTvaSaV3xsM1nBxsXoxllamNJS6+U2380G9a6PvenYdeGUuTX056vjE0mfLX+n0RQH7Mec3WJiXzFeIlptcx01X0xs2Vfmrmld4aTlK0bJLagOpLAPl/n4bYgRNgCK9trgHbV9tzE++iwdmwOOiZdtHYcORtKBDQXmouJX8E32qSXI8xoXQMdVnthAApLeMejMzAW49kb+q2KC4MH2TwDfu8K6UF4DyXHijkKkvCNcZtp6xnSoylGvkE7nyGfBCtrm8NVy9N0JlmZttP/mnKFwBE7KFLjIecYGqVSpJd1CWD1o/k6iSsnLsK/ru/NcpLHscvqKR/t6QbKle5X7kF6/r43O9vRlTmYRtnkvtaqxDP1XR+00G9GnI8hwQi3K2F7K44GV4P/yig2ZlQFDJO85Wasylv9lf9ChWoIB87eJsstvJRxz3mDXoNexasmvFMnOW9e0qt7LeRPrATDoAEkECRLIG5WhO+NqzMVE7eK;
	4:FgGkzki8aO7DVca/sui848dihWNaGHxQg4NRXxhkdavXGd3cLGKHz8urQhJLUuMnUjF7nHqwjc58uoFcYY9PNCXHuv9tUl6B0T8mtJkxdYgw8e2nIgI3HPeKafsMMXveileMAVY36Qi01kT84DjsiDiG10IkN27QbpHRQoolcHkbWGOP+aZmsb8fog5w3fSrrwuJsKtxT7SdUxAJcBrqOx/V1exFJ+yhPFtvaRbsNBIyaAifrxyBjEhaIeS7rX+kXuBz4L9+xmmdfAeW20tUHw==
X-Microsoft-Antispam-PRVS: <DM5PR04MB039446EB96C34E6DE0C4FF0B905D0@DM5PR04MB0394.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0394; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0394; 
X-Forefront-PRVS: 073515755F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(396003)(366004)(376002)(39860400002)(199004)(189003)(47776003)(26005)(6116002)(186003)(39060400002)(44832011)(97736004)(53936002)(3846002)(86362001)(1857600001)(14444005)(66066001)(16526019)(4326008)(6916009)(386003)(6506007)(486006)(1076002)(5660300001)(956004)(52116002)(476003)(51416003)(2616005)(8676002)(81166006)(7736002)(36756003)(105586002)(50226002)(48376002)(8936002)(6666003)(81156014)(316002)(72206003)(305945005)(16586007)(2361001)(6486002)(25786009)(68736007)(6512007)(106356001)(2906002)(50466002)(2351001)(478600001)(2004002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0394;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0394;
	23:7Cr0z2oj33kwNBwbQU2986fJR0fmcBH2poCOljkIN?=
	=?us-ascii?Q?W+O8tKftpXqghgFLhUyRYmP/pPbHBaTpXxYPLwH2C/0cdbGeRzmxIwH1OEkq?=
	=?us-ascii?Q?Hqy1VH5RITtHyl6OI70zKsemFDHGSAm8kFCxgWXNd4z/SPk8AfsScNHkunNS?=
	=?us-ascii?Q?JG+67R6PPkys+O/yj3x7LD1vah49zgu3NJlYxnIeehCBmI3ErRjjAus3Bjsu?=
	=?us-ascii?Q?cmSOqNDQ5Oofj5vTR3RN9a9juJBNgv2mqMvqSeedZ/L/iNnunzTHFYxL+B1l?=
	=?us-ascii?Q?kVdx7VKiACY/158aXyC+YBvnS44SG7EU8LhcfExCVRSWHgAWh/Rg25uZYDRL?=
	=?us-ascii?Q?t69yRW54de1VU+z7C3cfzA8gudnIZhZUm8RDTFIpoOcevfjNTq7oI9nAOy5h?=
	=?us-ascii?Q?kMs4IQzKfntIEftcwRntmmwJ9w/uD+qkIYrlAt3cRkpHmk70DOtvTtz5kQ8r?=
	=?us-ascii?Q?lgka1v7j7zPbKOm3gEuG4YmUyKCCIVluAxKLzIuL9EQKXiIODzDQ8Vs5bCxY?=
	=?us-ascii?Q?oAtks5ibgRFm3sicSM5BO89L/QgIGwGdT9XF8x57nRz0AwCaBfiI0URI/rdT?=
	=?us-ascii?Q?4OOLrrkARrnnxm2RKraqfAzGX9eyYGGCs4eSLS5Fo961+zjtT+Ul7xTER59a?=
	=?us-ascii?Q?iVfGuuJzKI6ead8mTaNLufgXD4txJyhSKQOSgC2jWDE6OQy/WCa8Q4VcDI0z?=
	=?us-ascii?Q?a8fa/xtYudC3wRUwQgNgtRznc/0bEMaUgOy1uquDAitp+Zcd8/RCDc9wjeb2?=
	=?us-ascii?Q?6KdPUPX07Zs5KeRJctjlHe6f4L+Yx3U9fDGt1wjoPqOLw/X2/McEZwHLN7Ow?=
	=?us-ascii?Q?aWSJ1XSCtRYESGIDq3uX6JIci9tUpQF40sLugAIvP5ls048zuO7qkC5muEjl?=
	=?us-ascii?Q?hT51cehOO28YQtrxQqhGVtgl4umadiUGPtK8UOJEHr22ddUGWA8bgHA+EhCk?=
	=?us-ascii?Q?hjqOYkkDFWYQD5Atq3/0PuX2w165zh3BAw6rqd4WEtarY/Bij/mtKD+QhSxd?=
	=?us-ascii?Q?IDHwnNNt8YQ2p+d9jLJ1hd8BgbPTc8jmD6SXFo4tIkbk5oBAwlf20HbO6Cmw?=
	=?us-ascii?Q?1+cyohWLUO/7Q8vRRtKQSd1IV4TLvgaB5MvqwuXFUPC/9d1odXRJhkC9NvQH?=
	=?us-ascii?Q?0lQWqs3JuXsQZsyzko0nSm5PBO/49DYEJUBe5PQJjKKcKGqtPbxQoZ9MIDqq?=
	=?us-ascii?Q?67zNY41C+8zQrRBBDRCPVBDWf8Xb+lc51mKT6O6QCAu5pdmwE+i74bI/vbYy?=
	=?us-ascii?Q?KQkwnH6K5kovDSA7bJoc4I0YbsNjDM8WPScKQIU1pEDJ4hdKeiKKPFUWgA1T?=
	=?us-ascii?B?UT09?=
X-Microsoft-Antispam-Message-Info: VRxAJrI9h5iGbN0dNkZT+bZ9gPZe0wkfq3DfdX6oxjKJ8ocePT1jCmnevm3AlG2eq6bFVUa0vtkQGV8HJ3P04Y8N8MLudKCd21uMuGTwaPAno5DYbm/ZgtLBZ8bmsV6phJlxF/aaUgdIB56omtyd7oyZEXe3pt9GWpqoXETlV8Tj1RQgmjCej/rYUGA7VkmqAR7882LsrZNsBMYOxKRQ1XIYXlF/nSlDIhBRSn/rwAzwRi16B8wbiFhPY2dNVTTgVUkwQGAZVigExvrwoc8XSCwDe2OGA5G29EOLh3bHmLVWmseqULYbRbGreV8RgEILOpX5HzEUmdUmdaa7tmoTXIae+2Ab66M2nC+2x8bSehs=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	6:2t96pgmuQQGIQ4DxnvwXRvfconeZGPus+tMefvbNaCri2WGnB+26RbOevUNdL6JCBfMtB79yAPzlWrku6GnQZgJiKOuG/HJaYqOQ+FWQFyCoQFMgB8zp+IVYmV1FCrMnRkA1+RvNiPCJxbxYTph+GXiyJ5abcQdUjfKWmPsTGaVFFPXYKvAK3OeIx+BC+INX7eElTiEWz/WgGxD9NY4btHNFpgjzLyB5418usmnbxJ6UJpxN6Y2XM1DTlY/JCK1m9V7OQKAHKmPI/UaN55cFtj7O7gFnnXhgYRWElPlcpkL5O2Y0jGwNBNojju23yR+3XcrEVh2Fat43O37bpH+fwDJSp7qd70mM5fsdJrS4QXemjkIpBF0OMFRSI7Tw3DqAxjWGJf/fHDDHEl3xqsjosBTv72H+5rX0NJzIacBW1PlUyBhpg+jmfKeVILFvxfHrZ57bcX9h8MH0RHXhcqub2g==;
	5:MG+yeRwltBu/BQdmLx+wzsxhMqD6HoBiOZzpI5ycJDxA8oFAYASH0jQwdW5Z9jIkYdKMDMU9g7RNrIduWNYJKC35FhgbRDTqoqRUGnGDCe+KG54dh4xi3XcmoMAT5b7Ni10HWA9byPA2o33IDN0SV/a8N1nnKCdHsdYH/WeoxB0=;
	24:VFA46rKWTIO5iX1xH8YXUTnR/jqihyMiXxM4ebVMfr1aC7vG+kLtLMej83ZFeIZccAw3RaFPx+8pxjgiGNNxs+LLsT0Sv2Pefe/PlbEspcw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	7:oPtgabZsklvA2PPqth5In5hhvcDiSdsa2s9hKSG1r4ktPkPkgV1A/KKN8zgHd/pcCy5GQKKpb9cCy5JKrxtkcfmHH8HU31gkDzbpu2Hax665Or0Yk8TwKbJZtp9gsxo/m+cvHYOttc0yU5T+hgmwQ7HUq/QWMZvVOdecRFQxRYp74LuXzM/4Bqq2KZhmHb6rvI8DodG57FlwrYaxJzlPEQnuipjSQiJfE6wCr0HMV/8yqWAE6zdvtDSb4+/xTcUD;
	20:lGVKOviOjHWtCbSLZefoqAZVCTA/jN7FVJuKcBGLZpTcxqL1Hl4mYRMIVdHe4WyPdftpTGpDaa4zpVfoJVNMNSN0I8m14yM4ito4ZzVm2NBbTwn57EIUJnFNOuoKijpPfX9liAdhHHIRBDG4ZZhnG1xD/jmdmV7XNtD7kqpIt9k=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2018 22:50:18.5489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 626ec7e4-061f-4c71-ae65-08d5eb6e812c
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0394
Subject: [PATCH] systemd: Enable coredump if it is in PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 Jul 2018 22:50:19 -0000
Content-Type: text/plain

Previously if coredump was enabled in PACKAGECONFIG the user would still
need to modify the conf file to enable it. Now the config will be
enabled if coredump is enalbed in the PACKAGECONFIG.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../systemd/systemd/coredump.conf             | 21 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb      |  5 +++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/coredump.conf

diff --git a/meta/recipes-core/systemd/systemd/coredump.conf b/meta/recipes-core/systemd/systemd/coredump.conf
new file mode 100644
index 0000000000..4cbc19cdc5
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/coredump.conf
@@ -0,0 +1,21 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU Lesser General Public License as published by
+#  the Free Software Foundation; either version 2.1 of the License, or
+#  (at your option) any later version.
+#
+# Entries in this file show the compile time defaults.
+# You can change settings by editing this file.
+# Defaults can be restored by simply deleting this file.
+#
+# See coredump.conf(5) for details.
+
+[Coredump]
+Storage=external
+Compress=yes
+ProcessSizeMax=2G
+ExternalSizeMax=2G
+#JournalSizeMax=767M
+#MaxUse=
+#KeepFree=
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 3efca33e73..db2848fd65 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -276,6 +276,11 @@ do_install() {
 			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
 		fi
 	fi
+
+  # If coredump was enalbed, enable it in the config
+  if ${@bb.utils.contains('PACKAGECONFIG', 'coredump', 'true', 'false', d)}; then
+    install -Dm 0755 ${FILE_DIRNAME}/${BPN}/coredump.conf ${D}${sysconfdir}/systemd/
+  fi
 }
 
 
-- 
2.17.1


