Return-Path: <BLEVINSK@xilinx.com>
X-Greylist: delayed 3602 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Jun 2018 18:31:45 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0062.outbound.protection.outlook.com
	[104.47.37.62])
	by mail.openembedded.org (Postfix) with ESMTP id 618AB74F09
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e1RWtRHYN3LRG+4Vusv9nQ0oKNoZ0ZGREnrq42ntFT0=;
	b=mX+C3FKXtCx4Fp/A8PrkaqVueX3ksfirRkvhVeL1bj5abnpczIB5W0gzjr+7tn+iyigohgnGMz5amtvNETR9MsUVpqNZjnA7+x6Zi2eIjoVEqpL2rVE0xxcLSBBkSBxF4jHKWp6pCRuhBnIPW76vYYd/TsdvQx0GF92Knk5brVI=
Received: from BY2PR02CA0008.namprd02.prod.outlook.com
	(2a01:111:e400:5261::18) by DM2PR0201MB0782.namprd02.prod.outlook.com
	(2a01:111:e400:3c09::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.841.19;
	Fri, 15 Jun 2018 16:58:50 +0000
Received: from BL2NAM02FT028.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::209) by BY2PR02CA0008.outlook.office365.com
	(2a01:111:e400:5261::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.863.16 via
	Frontend Transport; Fri, 15 Jun 2018 16:58:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT028.mail.protection.outlook.com (10.152.77.165) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.863.11
	via Frontend Transport; Fri, 15 Jun 2018 16:58:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40769
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <ben.levinsky@xilinx.com>) id 1fTs3l-0007gr-1I
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2018 09:58:49 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <ben.levinsky@xilinx.com>) id 1fTs3f-0000dm-UL
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2018 09:58:43 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w5FGwhki032540 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 09:58:43 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <ben.levinsky@xilinx.com>) id 1fTs3f-0000dj-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2018 09:58:43 -0700
From: Ben Levinsky <ben.levinsky@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2018 09:58:43 -0700
Message-ID: <1529081923-11864-1-git-send-email-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(396003)(39380400002)(346002)(2980300002)(438002)(189003)(199004)(478600001)(106002)(72206003)(16586007)(36756003)(186003)(26005)(77096007)(1857600001)(6916009)(316002)(356003)(305945005)(51416003)(7696005)(9786002)(2351001)(47776003)(50466002)(426003)(2616005)(476003)(48376002)(44832011)(5660300001)(63266004)(81166006)(81156014)(50226002)(8676002)(486006)(126002)(106466001)(336012)(2906002)(8936002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB0782;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT028;
	1:uA81BtZz2n/eUONmO/F4r4Amqhjf23sZQ6WYtBq4J4jgSogNvuLHsG3j/4D2myP6BPpZtbAc0Lth+Y79uwv0ibNS2E0NtWVVOfHHWckbP1tygSCMaZpnQClTvn/JVJqg
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a2a894d-eff0-4381-6fb7-08d5d2e14455
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM2PR0201MB0782; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0782;
	3:7yHytR76KVYc0MEEEAazJXYJGwFiAh3lVk+NGuJuiWsvrd6+wfr4EpLRjS0YQWQx6a1J6pAdeRXA3oHYYGn0356TJmQ95ALnOOns5sII9hzk5NxIwCUPLIWrar+gVXwh1txn7ZwPZ7FB4tEv02GMdZBcLMGyWJE7SDkKOwmzgUIJcmQ8AYv0/OLaDgrUYNvemibV9F0dJ8HqV5RMIMVSNgpXRu/VQYxnf2T8a0NqdOOMfuly6nkDeOikCeviMyy5OQDnm3P61YHNdv35TMpgyRGac4O5Gn5MM81EE8eAQVR81MyEfKBsZj/D5kOQ5ZSDNyk4oBUrW7EJookRV/Mp9NjP/qNMbbwFsPGcVsZnLfk=;
	25:IKCIwi2joIDXrO+aqJGs2yc/0Nr/xfKLUB1k8khBnKAhoGAFqIU2N+bgHJQeHx866gob5ZAwvf9QlQVNt9eDQrqlu0y1OB/xcelVUt9Z1LuIpJkMme/7Nvq1Yjt9MTSidWWNfaXms192tiAnd6/xQzYDRHbcKGr6JTsl4o/P7QEULSDuvx2iBKWfCMIKLopZjI/SCa2o4Re2aRviEB9TomvegLc0MpO9Ogs5r1BGAaUcpv3Pn261YVvTIdovx0UFWbXfx++XaawA7bXTlJT5U2JsTY69RsvabUFdE7VCUa/F+yfnaBh52IPUK9Mccpj5q85+ZNHu4a8TpvUZT1U/2g==
X-MS-TrafficTypeDiagnostic: DM2PR0201MB0782:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0782;
	31:+BQl327tX/4Zb4nbfwCnlg9ZNvJsqtOX8XWOmsvl4cQrd0Ybyk3aYuf0ipkP2eFo4Apuse1gEEnriNp0Tm/9mYot2V1YOYuhAS/dYZPdR64P66EDX3IaWrquVdrrQPlWrNdSEVnOahHAltCyIo3gHV+vUVIJSlI+p7s6wER6fh/RISBjsolGu9hNGULLVVpsaaNXFDnm53kBnyWcIoxmavcudrHv93FAChBx+YSJkM0=;
	20:qMo9GzyzK8PONgcT/35t6kkgM3YfSHxV+ntqbiBIgIPEU9XzZV4DGZ6MRdiS4079PnicmciEZoLJufR8QnH8exyk4nE8XhZuiUNrRSXN8v1cg9Bg43CEhgcLkBCQerC33uORKVkQbdBvjCZqcmjrgIu4EjYp3klT0uL5GxsEMTSCjbFMYHb4yd1ZnRokR6eDrWrghFiUrL/jtpxM+OMf30bsnKDyIJgS6wQtUH+0cJN80ucxgmU6UqB4Cak7lhiFhpF50DOQORVWnBjGvuy1EVXndYTtH5ub9Ibvs8oUrR7evG0Z8ha2Ikb4SxohvdHKPhGfGiHOQ1uYgaSotebTwWrKhuDkP3tXuJqA7tzMEfhch7Kn5x14ydsG1VilQoKn3EPb8iniM71sGLLEJiGuMn/5JmUQ4Y0sh+Q0gwwdw6Oe70UVUAaiALKs8PT6dZtNSo8S0vzykVAcREolMQFHwokPILYk6HP1gWmo0EZJqSFqC6FxineqvNxGW+rDOcwd
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM2PR0201MB07824BAC8424C2A710F6A550B57C0@DM2PR0201MB0782.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3231254)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DM2PR0201MB0782; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0201MB0782; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0782;
	4:r9EyuPePiM/8IkS5d4TTxnWt2pydTo87eeZoFT6X8DmRuR2nHyjFWbL8BWc+LW/WjFasboPBGo9LySZVEOcsdVxy4xLFNz4G5ycC6v6nH1EgXhF7VYxbP/+J6MPCsWF69JE9J4c+0WTxF03jZQamSzON/963C/bydYpha8DkkhZJfzwG3hVAPjHJkux+8xSajpTAwGu4pDrs1pGKNDw2/2YZRNwWxhhy0u+aa6rrxH7bJI88+XvLSyA4WNAdYOmqYRAS7edXnsFl0r9egOfsth6BvefMwNA5KHpRgkHKgbhtLSla9KDjGoPbA6AnJka8
X-Forefront-PRVS: 0704670F76
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0201MB0782;
	23:fUpJ+8LwoVpXuxrtxHOwz+7mMhjoF7P03g9co4V?=
	=?us-ascii?Q?TrGBJmEC/aRdNalyMJAhyAeim2c0vPPCkidJRM+xQ45xq8zPFtqD9R8sBIgC?=
	=?us-ascii?Q?PcmbTsIomAYOMZHZHMjS/3N9o6mlAnjLxK0KAvRUeAm9ulPdj80+sj0MQyNm?=
	=?us-ascii?Q?Mzb8udxdSIZdDVLA9ujfpuhQi9I76SlAl2GD1x+kdqmqgsAII8XAuaEwR1qP?=
	=?us-ascii?Q?i45lLgsqFWr64Tm08vOWhc0KY1VVauCZOzivPJJFhnYGVARAjxvGHNtJ2ibI?=
	=?us-ascii?Q?sc2DO3QzR2odQgmEahgZOdqFAEW29yLlYNjKeAwNpjHSajSYwLzKdsZ3c2xK?=
	=?us-ascii?Q?at3t8sLdIDccatWrdraHrVQA7hf8vxJF4C9b1IX3ztP3+LvJJrCkQv1x4oSr?=
	=?us-ascii?Q?cAj1mHXEwe45wA3g/qb2wWKjg8O7OculbzkXyyIIfvfs1wHG2pTGqjo8tCgw?=
	=?us-ascii?Q?hePKqbiVGFfqV3gI0j2hXcNGwvQTz9vczRtA7FF7BXOLNBCDrGwrM8kHd9Rm?=
	=?us-ascii?Q?QHG9o3u7wxuSNSBkzdP8y2HBglIYBpnLaMld2EKwjdH4cd2yXU8SPlINbXYb?=
	=?us-ascii?Q?MLEvl4XoPnkx1A1Nyu2CRNP/EjJMYn37Sf9ynquBKTofwCKEx2OvX9Dc+thD?=
	=?us-ascii?Q?KIsM/+/blfoiRRnUvioM8BqZzIXZOhiCNWog1ZB6OEbrKLsafg3F37POWC+h?=
	=?us-ascii?Q?m8oRNsIbQjvTZB1q6lOQg2ywnQlVNPHNmGcKWEFSMaU0gQTgiILrAz8hQw5z?=
	=?us-ascii?Q?b7X5l1z93joCZpHI+3zVmNRylNM4GjFi2Dq4OcpcvyuKWDI980ZOM3iVmqwQ?=
	=?us-ascii?Q?z7j1JEABv7NSQzK1lUMil8KRYpHLiAW7mG6i09puLzLD2Q4LoCY2wjJSUkYm?=
	=?us-ascii?Q?lj7rXAumFe+14KJvez8w8GYGN0+1cU4Mfwi/5sglHBmG5yj2Igi45aoVbRfA?=
	=?us-ascii?Q?yRhbxLzWpGyDUlnmHSg346mUDrjOsupOQM5EgGkHGl/6V8kJAsseKXPH3Rzz?=
	=?us-ascii?Q?oDskYFpBZ+80//Wc1BIWP7fwgJSr3EceAcNXf6o7JcK5bC7XbO6vJIAlk19p?=
	=?us-ascii?Q?V96VA/3BScbvA1f+J6Wvj5aFhsgxm?=
X-Microsoft-Antispam-Message-Info: +uwXg38XBtr1g4fiGa8o1CuMGxK+S9PWxldp0LOfhzKZajYNllHUUrGEd7veEgO3kBQQQdmIKByp/X7QBl1ycRxa+oBZKCJUt3Jo2SEFX5b83Fq/9MndFExKpqWFDlFmyZFInEdPFkFITH3m30vjWpzkr4wKo2zLzbbHUd+CFd5vneWi2r5wFRQ0/RmgmxLs
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0782;
	6:FO4SAvXwhvOTXenvXtKTARRSLXSU97EZOLn3AYRi0gKgfWJ6VXCCxJT9yJ5e+dO5ZH0+iCLw7W8iWZcxMGmc8bQmjUpgOrN39CYVgio4tEbaHezLem7Z1TEJDjJn8v6+RDTQNJRaz3SzXZjeY5lI6giATD0Pt549eEYEQtkTbxfGjWLV4Bx6J2tQ59+s4eKl9i7uy5xmGgWrR1/n2i7rp8aY9SXWmyqYcPN5yLKUZEiS3uOURx+Y0jOKv0/3TUUwLXjCdXpftbafFntlLhR8CX79Pv9HtYKP9dN0wx/mV/loxEsn7QrAAtoKD19wscONV7MjIQGbTkBZ4JGIBix4gpXqVMXWh1nW7wnhbEIXS5Jawc17dQ0dveEgJcwgIpkm0NHUVjyw5MGFuqL0BgcYz8iHqutDwz/JDQvAo0SDj6BuLkhM4BxntCxCTbM8Qp4jvPOaXjnNvLlk+5/3C2kBBA==;
	5:u2nmf8dpzppXTeBjgIq6X8QtlWSb5Gcu1t3pRuuPyH4HXYOlyna1gl0UD6yxAdMPxBD0s1kK8Ue8J0uHFjgC7CeUklqDxDj4qrnKQlRS5lHG629P92SdZ5GjQtRdcILHNTSULgs70+5/hSrdNpQOb6cIfhHcpcEBkYk1lTV8yAI=;
	24:HMh6+ek3HDEFUhfXXk0UoZSpSbz2ZN/vOQ6bsHZH5zA/SifmjpkVyLQnbdjivzlw17oK29V/f1iqPPVVT/tNA/7nW5kS/t5HpQtiSqAG7g0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB0782;
	7:i7vnx3sEKqg7KTxp/DXlCqV+kCBlzNSKR8srdxhiul8oK2VMxE2ERmssM7peWZdsGA2ykezcBDd4nP7cjJnNljIAxISYDyVBAiUKSCrfePP+xNEElWd0oXWdqpR4t1wGZTvBHU/6AA3XpyAo82tPOMsYYDgo3Y+zTAG5nOL5uFWsv2gn+9zyiqU1OCA9GwQGuPWQu7XhRQa2bhx+lRevSrze4DlIxkhHv2yTLbSyWI1aLoSpdastiRyHe90aCmYH
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2018 16:58:49.6998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2a894d-eff0-4381-6fb7-08d5d2e14455
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB0782
Subject: [PATCH] runqemu: Allow the user to specity DTB
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
X-List-Received-Date: Fri, 15 Jun 2018 18:31:45 -0000
Content-Type: text/plain

In some cirsumstances the user doesn't want to supply a kernel, rootFS
to QEMU, but only a DTB.

Allow users to specify dtb for supply via the QB_DTB option
to QEMU.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0b6daf2..075b3b9 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -604,7 +604,9 @@ class BaseConfig(object):
         if not os.path.exists(self.kernel):
             raise RunQemuError("KERNEL %s not found" % self.kernel)
 
+    def check_dtb(self):
         dtb = self.get('QB_DTB')
+        deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
         if dtb:
             cmd_match = "%s/%s" % (deploy_dir_image, dtb)
             cmd_startswith = "%s/%s*" % (deploy_dir_image, dtb)
@@ -674,6 +676,7 @@ class BaseConfig(object):
         self.check_rootfs()
         self.check_ovmf()
         self.check_kernel()
+        self.check_dtb()
         self.check_biosdir()
         self.check_mem()
         self.check_tcpserial()
-- 
2.7.4


