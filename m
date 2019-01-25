Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 151358 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 27 Jan 2019 14:10:13 UTC
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730074.outbound.protection.outlook.com [40.107.73.74])
	by mail.openembedded.org (Postfix) with ESMTP id D69537C322
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=h5tvAC6PdBU/NrDGqH/8pEmfXs3B36RAmq/NNNccMNw=;
	b=urlVURcVteIQDX5glgc9Ro8fGBBZ7RHIZ1XOoifw417rt9PWMSDp2E5VfyPX86MciBY1jaxnscLzhJ5uCufFmjpIIo/T6aGnw6aA31/di8zyzpprA9Z9YXPh3dTG2iCfMDzd/MjS+oMgxyyybrEA1FXcYADkbsqjtqDHqs3FDq4=
Received: from SN4PR0201CA0015.namprd02.prod.outlook.com
	(2603:10b6:803:2b::25) by DM6PR02MB4329.namprd02.prod.outlook.com
	(2603:10b6:5:2a::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.16;
	Fri, 25 Jan 2019 19:53:17 +0000
Received: from BL2NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by SN4PR0201CA0015.outlook.office365.com
	(2603:10b6:803:2b::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1537.26 via
	Frontend Transport; Fri, 25 Jan 2019 19:53:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT035.mail.protection.outlook.com (10.152.77.157) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 25 Jan 2019 19:53:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46504
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gn7XQ-000069-Em
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2019 11:53:16 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gn7XL-0006ct-Az
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2019 11:53:11 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x0PJr4P8014340; Fri, 25 Jan 2019 11:53:05 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gn7XE-0006bl-Og; Fri, 25 Jan 2019 11:53:04 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jan 2019 11:53:02 -0800
Message-ID: <1548445982-25182-4-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(189003)(199004)(476003)(126002)(2616005)(486006)(356004)(48376002)(50466002)(76176011)(106002)(4326008)(316002)(8936002)(54906003)(478600001)(2906002)(107886003)(6916009)(16586007)(50226002)(106466001)(2351001)(8676002)(77096007)(36756003)(81166006)(81156014)(47776003)(51416003)(63266004)(14444005)(7696005)(26005)(446003)(426003)(36386004)(305945005)(186003)(11346002)(336012)(9786002)(107986001)(2004002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4329; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT035;
	1:QyWleo6zezRrtfR492+mEJswgE2Ri+2voBSzF9xGpttxI8j+pfCQmHNhIZ40hzQnkrVAf2YrFDVNuNyovdUhZOjYM9tHNB7G1QnATuArYE2X6eMugQWMHe1KE4bRrs3X9wHFJjUBW9XfkdUDgfR7nw==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2de582b-5d12-48c0-73b2-08d682febfe8
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:DM6PR02MB4329; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4329;
	3:PRHOkPHXYnXNa0c5T1Y7o7wzV4pRFYoVB0r1FB4nXmNHKDVUyguCod7hi1Qpgm0/5/G2bAHdgWudBptXQ+OKy5qaLfY+UhbOoIvOozhLWLfuJkXCiTrZz2LwjK9jejoWvFOZ89skCcoC3Z3B4HjELCw8PjuOwPl1kz8PHBJQNa5+vhKfeeLhNDs59ScHR4EDm1eGdqk7QQShvHdwXeJggsHyPE5/v/pBeACgLq8o1GMBQTjL2X6S1DkkeAjSl5mW5JSG0oxi1f0BJzrQHxAwywBw/P3idlE7NHxch+ZXD3m1LhdF9PsQRibk6dU1qSYp/2FFo+9Rd5lVK+zz3yly+X2c8PmRHQMPQSI7NprMTKC24Z+ZqUDH7RRXlIwPUa4e;
	25:4fYYNpvbphDC/EeUPE4wvVbQNxgrrn3NafmERP/jEDDI50mGDCPKGBEJZ1bUq1pwIHmjggHZksMgve7H346X1Ph3VqDTIgbOpDiZT5HJO5xQqRsWIYo8eAlvkCjJmdRQ2aF/LWI8NKHE1ZA09yQGHDy6OjgBBGPwwU3ev+fYFlTgaFOTs4hGk32qG1LktFo1v/0hx4q1LeqqBHigO9nsSJfw0GNen83fzpx/RZQGy9KneHwDgttIGIdzG6QsAQSvM5Uvbg2AaDJYrVl32x7XC6z7hgeobONfgJeRYTNHm8RDmtScUyfO2qxsyluy3aEjRoOm1aCN1WblyqUCuP60fQ==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4329:|DM6PR02MB4329:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4329;
	31:kFn85J6h/VOp8WEneowfm04VMp5szdJVdZu4jpzfAUZeV88ai9idw6dL3rxa4odvO+U+kRkMn5lgTZsm3a/HocJ5e8jQ65jbqYx8FhXJp8ouWHe6lIsmVjH7mRAe+Q7oHTIrmPmIfE2bhK7WyGyrow3NmWk6EnSWd3C2L/q1Yh51FIBhn4iIoC/gs02/nUdGamq0E6E76mS9T8seGAR1oeBlz9CfqNSaqROf1opxM0A=;
	20:x7yE9Cdc8HBay7RGEHhUw66kWfGOPFLlDMIBf9qrIA4sjyfDQZeKGvbMt/u7vYREINeUK6bcpljUjZGaP6y9UkLYrwT0MXntTaYy+Z9RtPCA+uCiVu7PIvifjwsEgyKvHeOkktbR4Gn5zA/ERKStMIxSGA+YbQEvKgW1a1qXEYgkZXz2Kvy3YvqVJxiC0hhroa3JDbUAPahzEmGilBEbOdha3SUGQXcgrfY4QK//udktxZRGHw/F/FdsTrVUtyBsFBSJ1OM1NAiANVrnLmBFNMuCKazMFIirsHR7erUhUBslFqluUjjMlIxAHS+2oT7qoD1r05+xZmSyA4PLHkqa011hg1hi2osebHYU6oW7wM3QXy2NarfoaOKXgq0mPcCK86RWB4QInSE4z5OoQ4Q0z9KNfHsq5W1gDef6qzgrwWPrwuOT091Zc/pFxJXhGU1hgTYF+ljuJdyWQQ4++Sr5d4nQ4ZnWWVdsCgd9rZ6w029iGixESWREJYS8WMyW7O8U
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB43294AB2D51EC6703751C45FB09B0@DM6PR02MB4329.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4329;
	4:miW/2OLprzWXU4q8YhUZxZsDxBUs4F1zdvHTbJwrRJh3UBqP4vwXz58likLFUnQUs7IC6juXrEiyeAVv6VjsZjDHR68XhT/BCWzQIe7f0TEQFNzoEiL1k7CB8b0VdztButk41Yk5ONds8J1bRojucy8lQdKVqqeK5C+DVJUiboWStn3eY6ZWs6d92r41j7B2Is63yxiKyHIs4o5hjoqPvAD+yqF8FHot4Wh8yujEum7g5QAeXGIT5nXlodRIgjvltOLdr2TD0SG+eG/6ItvSYar9zhUUs16tFpPNusg1UkcdlBpDcUl7fbQV0OzTCjIB
X-Forefront-PRVS: 0928072091
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4329;
	23:Zn7EaW5BA3CNldeKxDUvKc7XfOFdFs604cKDXGKsj?=
	=?us-ascii?Q?4VHIkn5j7fe/7f2wyzUYgiA3rB/Vm1W3/uqogvfrb6EtQjARC73FsxrHgvSK?=
	=?us-ascii?Q?r1B2DfiYE2gRnlbx2Esx3CjKq9cZh/VsMn7/MRyglQ5nBxZE9qlOl8tLkENV?=
	=?us-ascii?Q?STZmfoyy+QmGuYpsgQaUXI7SVUu3xtZOsiZG6MC492u6CgiaXVaejL+kFt0s?=
	=?us-ascii?Q?2nscp8iS7Z4p/Y2HooJxt62K+HZBtvLZgQ8RRbCDsJNgsBQihZu0Y2w8jXd7?=
	=?us-ascii?Q?u9snRB5r1RSehV5qz4tmdvu9C5BnB41r9R8FUs3KcrJSOhKPM8pItKIArbad?=
	=?us-ascii?Q?luU7Pzm6lqlNgOC5+X5GIlCsAhxivPwXGvhrJ3RF70Ja14f018rz6tYVw3/i?=
	=?us-ascii?Q?UCFuJFad2PDbXGaOTXhWHlLdUSPzozpVirV0fvZ6+Gzthw+zql6g8w5EOpI5?=
	=?us-ascii?Q?EQvDn35AYnyvm/3Y4bbZahkfsk+qSKms8slnDLIpOIJYTvmxiOFpxyd0gknA?=
	=?us-ascii?Q?Gc3gvhwcM/wg/UJc3on+FkH1pMEW421r4zKUS2hc1hLeV66ZKlVbxWco8dEE?=
	=?us-ascii?Q?EBXq/HHosV2Pm1O8oV6WGj4J8TfdopiMECoyLvGs8R8MeaUA4fz11YZsEcKJ?=
	=?us-ascii?Q?M1wdKWgpyfK9PqKdAV2ZOlfxbiuymRGcEeuFChy43PTxP3TxBoKAjG6etzX2?=
	=?us-ascii?Q?DKrHhkUD33xmnvoE9IuGX+RmRSz57vZkzizNa+eFu39sSY8HscEePcTweR4d?=
	=?us-ascii?Q?t0pXCoJKTqaIOAGH2JzKZEDNtKxYdsca5pzhwrE2ClHAcoebvo1C+ju8GtTk?=
	=?us-ascii?Q?PSpo+PITG3NWlAwqSuidcxxV7p1SGh4xINWJa3gvQ5SGkqbfvzG4eP5th3bd?=
	=?us-ascii?Q?YvTRcMP+IUSsLkGnbObMOciwjZLU2WFlkAIhyfPjjEranDeI00szI2JGXbuV?=
	=?us-ascii?Q?L3c6JtyPPTUHvXBFKGZN5aksGqWUuPGjg13J0ySopFqNoMCRE1F9uIl27RXj?=
	=?us-ascii?Q?M9maZlxJHFVUKyM4WZdovi907tXb4mfTvxdb+jRnHQEVfax8f/4HoMMz0QXR?=
	=?us-ascii?Q?AS/Wb8XnIPGlUwRe7ApwzD+ULvQ5wN7qla9c2eoOmT9Tk0XEtC8r2OosH9Ai?=
	=?us-ascii?Q?QCyVLAnCN0=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZYtwjYUj2GftZ79r/JuMSXl0CWc2Jfmfxxn2oXxTfbHJAJc5Px7K76c0lIbSTuBUvO4n/Bwn5JbLufRhKMNRuc66nWRaDmCsh1IfnksUtmlUjBwmkc0atycwKF1jiWnQ1PoIptuVPoDsDld6LOix8OVaYyRGS+FqnhaKSVTPG3OWNGmZtF8v2KZ9D3XAaqiYhruxSESoqpAA12GqgQVP4oB3vioFqYwppzu5ZfD0SMGLpy/VqBro62TXI39+EaQIl3JH9T+z1h/fLMYNR6xQwambRIbA0ApiqxPAzLW+uehbXvmpDh2WjNN7kngaPRYA2mq957Owa9r0hGdMuCsz9ZQK+DGVdtkUm2/V3kSRBip3GCW3cBYDpU854AVDXz15WG4kZl7XJv0yxPz/ekZVkdwSNpDn1h9430s77y1OjOo=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4329;
	6:2/hngQOGWMs7dVTnGVKrG2hCU1smAq9CAqbH44Gy9AOfSnoqa/215BtpYZqoomkbRRqCWNKU0ojgqr+H0Z2k0opE/BbcAfAH/z09DSJCw3vXKulznULQgP+Cw95eaYjtFB/ujr39Uv+8EfoGFu9dFlkQMVmNUbMr86pCToDA+ZGu8jB/R2YwaKdUDbiWaT5onK5IMfPLdvPS7W2IPakbOpu/55PbJuyLRtNvT1MyIGePzMlDzcaPusZQV1+6vi7kfsneT9z1UBAicbEDtxoc6414Z32ms/MM7qdlFghRHMkWe84Ju1x5FORVNyd1GYrHZkfrKu9QxGKBobYOq4ByRv8u5nerIIzgAhdVDVeYXt9SQqd9IyV2znDpMkQU66LTmJAprCRG0jNw46BsqWD+MDe8J8h7YcWOh1Kg9cbvifDKn7VnVJu5H63kyau4vIsjXLxGffDtmzWu3x8Ip/mkHA==;
	5:crtsTnl/Sg31WK5bpLVQjOxcT19HsaCzE39I1eTJF9+D/alcg3cGKF1rR7gbowPnn23yQO1infQV7pLmhzpThlBkDUprf8psumfxwCwwfW5pwDa9xmJ/weEOfT+dp6H1I8RKnZ1merdlEBXV+S5ELCC0UQsBJu+EkiJuLyLTzZygzfqhfv7fdI42NFq18qGXn7TD/y1IcDbYwpRoO3KV7Q==;
	7:R2umGOq+v9iO8R0P0+NNnmyHPTVaevlCrJyPevWZIRocM8iWQGH99KhuN/kQ/2XKdbzVxftpY5OXVGnWn3RabZtF1s8UcORTkeLK15xvNHVQClt9FW7w6p4/MQe4EHC1YVumP6sunBs1otmPZM393w==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2019 19:53:17.0055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2de582b-5d12-48c0-73b2-08d682febfe8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4329
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4329;
	23:VNj1lwAJTvj8Pke+v5XHxBvPDfjEQxD93Vssj8zK3Y7LlDGBsKJmEkGyQrj9yVP18Gv4Gu2fwvySkoXgf4x1sEODjW15bnn3VetoIA6fhjek2gEO1CQFwZEvh7SWrNcXYlJsiazaVX7e38+E7T2Xzw==
X-OriginatorOrg: xilinx.com
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH v2 3/3] devtool: provide support for devtool menuconfig command.
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
X-List-Received-Date: Sun, 27 Jan 2019 14:10:14 -0000
Content-Type: text/plain

All packages that support the menuconfig task will be able to run devtool
menuconfig command. This would allow the user to modify the current
configure options and create a config fragment which can be added to a
recipe using devtool finish.

1. The patch checks if devtool menuconfig command is called for a valid
package.
2. It checks for oe-local-files dir within source and creates one
if needed, this directory is needed to store the final generated config
fragment so that devtool finish can update the recipe.
3. Menuconfig command is called for users to make necessary changes. After
saving the changes, diffconfig command is run to generate the fragment.

Syntax:
	devtool menuconfig <package name>
	 Ex: devtool menuconfig linux-yocto

The config fragment is saved as devtool-fragment.cfg within
oe-local-files dir.

	Ex: <workspace_path>/sources/linux-yocto/oe-local-files/devtool-fragment.cfg

Run devtool finish to update the recipe by appending the config fragment
to SRC_URI and place a copy of the fragment within the layer where the
recipe resides.
	Ex: devtool finish linux-yocto meta

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/menuconfig.py | 80 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 scripts/lib/devtool/menuconfig.py

diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
new file mode 100644
index 0000000..38133db
--- /dev/null
+++ b/scripts/lib/devtool/menuconfig.py
@@ -0,0 +1,80 @@
+# OpenEmbedded Development tool - menuconfig command plugin
+#
+# Copyright (C) 2018 Xilinx
+# Written by: Chandana Kalluri <ckalluri@xilinx.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+"""Devtool menuconfig plugin"""
+
+import os
+import bb
+import logging
+import argparse
+import re
+import glob
+from devtool import setup_tinfoil, parse_recipe, DevtoolError, standard, exec_build_env_command
+
+logger = logging.getLogger('devtool')
+
+def menuconfig(args, config, basepath, workspace):
+    """Entry point for the devtool 'menuconfig' subcommand"""
+
+    rd = "" 
+    kconfigpath = ""
+    pn_src = ""
+    localfilesdir = ""
+    workspace_dir = ""
+    tinfoil = setup_tinfoil(basepath=basepath)
+    try:
+      rd = parse_recipe(config, tinfoil, args.component, appends=True, filter_workspace=False)
+      if not rd:
+         return 1
+
+      pn =  rd.getVar('PN', True)
+      if pn not in workspace:
+         raise DevtoolError("Run devtool modify before calling menuconfig for %s" %pn)
+
+      if not rd.getVarFlag('do_menuconfig','task'):
+         raise DevtoolError("This package does not support menuconfig option")
+
+      workspace_dir = os.path.join(basepath,'workspace/sources')
+      kconfigpath = rd.getVar('B')
+      pn_src = os.path.join(workspace_dir,pn)
+
+      #add check to see if oe_local_files exists or not
+      localfilesdir = os.path.join(pn_src,'oe-local-files') 
+      if not os.path.exists(localfilesdir):
+          bb.utils.mkdirhier(localfilesdir)
+          #Add gitignore to ensure source tree is clean
+          gitignorefile = os.path.join(localfilesdir,'.gitignore')
+          with open(gitignorefile, 'w') as f:
+                  f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n')
+                  f.write('*\n')
+
+    finally:
+      tinfoil.shutdown()
+
+    logger.info('Launching menuconfig')
+    exec_build_env_command(config.init_path, basepath, 'bitbake -c menuconfig %s' % pn, watch=True) 
+    fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
+    res = standard._create_kconfig_diff(pn_src,rd,fragment)
+
+    return 0
+
+def register_commands(subparsers, context):
+    """register devtool subcommands from this plugin"""
+    parser_menuconfig = subparsers.add_parser('menuconfig',help='allows altering the system component configuration', description='launches the make menuconfig command, allows user to make changes to configuration. creates a config fragment', group='advanced') 
+    parser_menuconfig.add_argument('component', help='compenent to alter config')
+    parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
-- 
2.7.4


