Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 67080 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 15 Dec 2018 03:27:52 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800087.outbound.protection.outlook.com [40.107.80.87])
	by mail.openembedded.org (Postfix) with ESMTP id 93B037BDA1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 03:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YMT131b2kk+FwUDtujD8jwKQ2ZwZZCScOMIxKInahLM=;
	b=l/aAFVuCvacJMI+1W5X1LnFPaMZ9TD/VJ6NmgemZhMJOuE4hnQSbTKDYJDhUvUW8xlMZlO2OiIxvDQsFeZkvRE/U4d/YBjf8TSycjQWszgcGcymvPlNB0ka/qJArafADv0s9knvdhc00J1rveMHdcnm96vyT6zBB5kP3Dw7gi94=
Received: from BYAPR02CA0012.namprd02.prod.outlook.com (2603:10b6:a02:ee::25)
	by BN7PR02MB5217.namprd02.prod.outlook.com (2603:10b6:408:2a::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.19;
	Sat, 15 Dec 2018 00:39:41 +0000
Received: from BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by BYAPR02CA0012.outlook.office365.com
	(2603:10b6:a02:ee::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1425.19 via
	Frontend Transport; Sat, 15 Dec 2018 00:39:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT050.mail.protection.outlook.com (10.152.77.101) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1446.11
	via Frontend Transport; Sat, 15 Dec 2018 00:39:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1gXxzX-0006SY-Ma
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2018 16:39:39 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1gXxzS-0003Xe-Iq
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2018 16:39:34 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wBF0dSVV012790; Fri, 14 Dec 2018 16:39:29 -0800
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1gXxzM-0003Wu-Q4; Fri, 14 Dec 2018 16:39:28 -0800
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2018 16:39:22 -0800
Message-ID: <1544834362-5755-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.5
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(199004)(189003)(305945005)(476003)(14444005)(126002)(486006)(2616005)(44832011)(5660300001)(2906002)(6666004)(478600001)(72206003)(356004)(47776003)(36386004)(2351001)(4326008)(9786002)(106002)(316002)(54906003)(16586007)(6916009)(8676002)(8936002)(81166006)(81156014)(50226002)(36756003)(48376002)(107886003)(50466002)(77096007)(26005)(186003)(7696005)(336012)(51416003)(426003)(106466001)(63266004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5217; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT050;
	1:zYUw/zTODnwVUE+RD9BCBWZkiXiUb1x+zYgqfyYBngI+n4oW/r11zZtjK448BS+2Ns+r5vHL7eKdNJ7tQkQMeKywI3D14MIPUDYiTxN8XLrZXswWSWb49Vi/6iPS0reX
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e41f077-93b0-4575-651f-08d66225cc99
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BN7PR02MB5217; 
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5217;
	3:6qpoH+o+2O777/nCUcEE3B+29SziTnROa684idbJ9hs8iLS/+WZkzmKI5fGyYpO+m5nbnIdHy3OF5/D7wD2ocBqKAW1rsMrcWcICLphoRZmtJCU1kEgvL5Gj7thUnRTkjiDBQWa1g8n2HWFr+EzDbMAOfOx173cBmqOemVvfyRrmcTVOL7UthXPoyeWsplNxb8lRs1fnQ+Y00h/PBveG2rABs9CeJdaI5X9BNFnuq/j36Buf+EiFt1WBKe7TjnSUSqOPwqwwv9vvfTNyoCkcM9y8sRiYst8u8bld5d4bc/NXNmv39WPTUB9i9K3t48HhaKL3K4D7nVejJ8AR3cnP//4//OMic+xDPc6zFmnUyYI=;
	25:nz1Lmyb8bSv+KA2dz+OghaBx8EJkeC4frN3wDOS/3K4rGR+0S7qwRkYn4hxujUbw2XMFVqKCMoRQrcpd1ZJrPTxO4K4cGia2Yge8hJfcaJQ/n1QwidwCtAQEHcTpYxzA1mHmVNVLq4+O7Gr1E5drvyi5DkLjSR/weZ6DDzotMQ/ks7CiLJhcKZYDYy4BLbt2+0YaHdGHLsDgE/5FOXGRC1lIlMhf8hgxdeKNz1fnHnffQAQSSqm1CTvGn3JBZQHauhmyNNqLjApUQ833vQ9K/orlweL9qnjuEoTRiQpMZJWOFRRFnBqtsvPVxI5hFeDWmictZNXyQAyUZm5h7BLuAg==
X-MS-TrafficTypeDiagnostic: BN7PR02MB5217:|BN7PR02MB5217:
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5217;
	31:lYKny4P+UUZwqZEXW0QRnjCyoYtKCJgeJDHXNZQA690SGQ42QxoYVwaZ2SrxIM/Q9Zhz7StN9+qVg0B36m9ryAQAw+8m3l6Pxq5Crw26c9COIpApSW0gJtJwKjARLoj7cRsSayR94SFnVwa/p5zvflp1oOVF6VvZuf14DRBcqoqoO8VzMWipDvnzAd/6zognTKzTmb0uwT4kXO54I39Lar2V1FBEXTjLGI+7aTdS7ok=;
	20:F0lUSmtV0MKM0r4zJb1qWJWShmGaQcHralYMBEa4iSODTT2/OLRVC8adi6s2bZttRjq2dml2ofVMalpAUoNm5iLR0NlgneJayo98wCTK+z9VGYBfeH7iEo9/OaZWhg70gv2NpUZWJ0IdI0ekMqX0Nn5nfEzVB5fFIwn2LRIE+UMNWH5TkFw11gPomJo/+6FQT35UnUHfHwWJ7mO1vjKwjueD1IlImgrHKJVpCqIFvnHG/g5xPVSMLnTQvEQuysavQWtzVrxvwBWyYmJHkUXzI2cxqoNIuJ2Kb10yM4ew/GblYt1zxsVmiNBV4xVLzaV6Ko/NYsTNXd/NDPj2oaTfnrM9e+P+Y+zP4u4sTBd+vaQEOcC0Ge80r5FJ21sJm/DsjlzYSLNv+TQ+AMR7JniTVUNDVtlDl3o1o1B1O7aMT59LxIxVrfwWy79wqNrqv5YwKmjbxenaN28kqEUScpItrvC0JNY2J85tEwyMn5LP8Q99oJIrR6uPiMyNOzBzIjM5
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN7PR02MB52176B941E6E536419921FD9AFA20@BN7PR02MB5217.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:BN7PR02MB5217; BCL:0; PCL:0; RULEID:; SRVR:BN7PR02MB5217; 
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5217;
	4:hKXUvLbWFwcUnOfYGH6DsEH+Rmv8vkHngpQCxWUXanHCqfvLMDDvB262LbbvqIbtPxz1fmWsklwZDSJpgEmjPXaYkZ5uHhu8IBHiKtn5XvH9jOGg81uJEhG1ETwIpR8ZZMGTjrxwtCU/p1LzKXRFlTYLRn5lhCwlEMdm5GaEEiq+gotSGoSZwM+5fTs7WWgVUXBvyGdFzoc1qNAQfYSWuTmooQwRNLLSyFkd0YmmCEBf96xrSeyt/SVRajWq8H4hcnbAV6pMNGRVYi6MRQZ6Eg==
X-Forefront-PRVS: 088751B4D4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN7PR02MB5217;
	23:1a++0t18LQKdCNKhCZTjwmVh1syceMROrglMRRL9R?=
	=?us-ascii?Q?ESeYSATP3YlBuhxqEsL4of9SQG3SdpM1l2Clc3jPsNEI9ir+BHk13pGYu5Qe?=
	=?us-ascii?Q?U0eX32ySNzCTlmODZtUt74ZABMdUqbj2AWeW029bvxoCBm37PlK+l2K7woTu?=
	=?us-ascii?Q?y263066RbGqEWcBT2xjZ+AVzF132KzOO0/CAcpFdJ1GC0XNmWWjYrcHvggDG?=
	=?us-ascii?Q?jT+czYRkF1L4F2SbHjXtHYAeZjHX54hO8B6IfgPwRl3FyKFelLePwtr4LORQ?=
	=?us-ascii?Q?HaGruDbXw3Tv7U4ZaFDEHMeh0HSfiDiUYN8DSN+EwvhXFX9TzNu5uRPDgU18?=
	=?us-ascii?Q?q/tvFjemsVGeLFmp3+hTwNEXS6AvQAOA86FnDQETAXq9fLgWDX8+aKVPlynv?=
	=?us-ascii?Q?jU3fSU1LFyGBfKKjed0oLBa6qgO3yKLb3vh1cfROwWtY/LxD7siLN+SYpl4n?=
	=?us-ascii?Q?YQ4g2Yu7s0zjYGGIpaDeuNrCylx1VwwTsu/RZcVSmkcrzhJyZAPmaGJR1xoE?=
	=?us-ascii?Q?zZl/8wGNY1Fvt39le7KxP+LNpzJ/3Evk6Vu1XN7xnWU2e1jtN7HT1g61vCX2?=
	=?us-ascii?Q?zAULEBopCX56PDcluwr9ctpNNrTaYuaGo+VlRvdXFbmbj/QhWFZqai8mbvps?=
	=?us-ascii?Q?kvJrQ8aP7S/YXL3QJhpQ9+8UlcR3QXS+2hNFtTdHw3z0x9pHnx096r81tHVO?=
	=?us-ascii?Q?hxWmen4YigRMjsylZt9bkysPkCe+9w2yKcg1B7/xYsQCHKsNvX8YdTg0Q7TF?=
	=?us-ascii?Q?27Qy0cnSBKoihudbpIWVfJx6OdzbTRH4AMCKCHa6R36HNYAfDPaLAPrs8Ieg?=
	=?us-ascii?Q?WtAJc3+Hb7nR2tvSFjUgGLYu/vNl4O/YFBHGvs3cICnshAfQmkXv8IhlivEV?=
	=?us-ascii?Q?+RCEcUJGS0wlPXrivNRJV92dtfNz6sNM4fmFN/4CrBZq93/5kXispOb+oZZF?=
	=?us-ascii?Q?tw2nEdLq9hS84YAjGJUpAvG4Kg12I0p1lTKLz1Vnegcjg6IomoEAluYJPRDh?=
	=?us-ascii?Q?B2BGhDXLcMUDQicTEr5bgNcOrDJbD8+Uy4naKSfA87LmVhxjrdce7ybM+5IR?=
	=?us-ascii?Q?HeFfMtVNJD8h0w7+4ER8Vtuh5taP15Y6Ev0Emg11aBrGWBxhcHGpO7c+GdzG?=
	=?us-ascii?Q?YL5t7Qww5o=3D?=
X-Microsoft-Antispam-Message-Info: 8R34FBoPZEOP2tTF9sNWORdfs/Du+L6FsZCtmMCKYSJ+xQbkHOJwDTnpuLo024svBnEAzG2STgh9ngVb+wKsBcOoUGkyFHO5C/+T3+U/UBoKvS8t0XKJ/lI/ARFE9JK79F7cpklMxa68VmU9Qvz0DBFzFw/MJn2dd8DBSS6z1hpNcAh8FUchERNIDCKpwW6kbKu4SjRfTmneXKnbWeAvGTdx12GnXPjuvBvHJTdSvpLmXWmCpYH6FlAIN+mnxMAa3y3nNqoH1EF3A913/3hd/vsIR1TVPqA1WwIl4IRBKJ811ZBBtOkUlHZLW/agsCJh
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5217;
	6:xOQwSuThKAZ8OpAEs4Eax0WfLqR9LuAgCK8hCvrmQLpMOyeALIAXwM3Wl6AklmTUYPp+odis6Nn2Q+D0Ynjx/vuIo1pkBGx+M59KebNtPVjknoaCEYwqjBSKkZGT2A2Fe/MfWLlhDB+Yz6NjUq9GEiBZFpnX1wuem9PNFnQxYYGEW1Jkfev1jIYeqiqGkptk1OZYUteTtAF0KI80zELpG7Qs/yazdHgSb0CJNOEif/7Lz/N8hT2YXVCwuatcLGu+eBq2aH48CTL5ZQsDiGq4xeJv0zKsuRWE8OvrlroINwYMYkeD7ue5TLuTGeYF++nbBLZCi0TEhtyK3Zw0wQfQftWPo+pSEDu2qfKNzqPuB/Pl8Dvs7bK5zPCAR2ntQ1NDgpJ2d7SZXAKxKHJgjMYen5Q++d40NqRUmaSab0LVv8MhaVgshVFJBVQUgs7YlcgxcvCOnmw20s3Civ1XI00gLA==;
	5:ZPn1eedR7Xt9lBLxOiZ15HA76NFTEwfsIozi1naW0wf4KQDaML6hpDfUiZykgAQ1bPg2NGS8i501MWPRo/QIC0qj8vJ/nufIuNehO91rm5A2sOVt3snZLNT1zm3VyQEbZSIJmWBYRER6c/5gg3QsYZZklyL7tBRjz5sB+h+fH3Q=;
	7:hZiDN757HWJoZF/tH47tvqRob2EwRVwrdxvmp0ep0uhJvB9W8stJ0TqVREgRcph3epZ2WC1vpIrAw5FypaFYyUwZ7Mq/c7EdYWosIH0xHOSuNdNGN7MHfpmFhTkvixjCr0uYQvMiC6qRGnzTCzIWLA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2018 00:39:40.3076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e41f077-93b0-4575-651f-08d66225cc99
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5217
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5217;
	23:0vvv8TyIDUdjxJoH7Kv0wgFuM3PTZ2hGyeAFb+XLir3yNlEVdL/ntHgU03+zQpRyVixEdbbpsBYHRM7Yjx/4RBVv7lNq6qAJlBXLEgMmHFAHKGIkfoB3gOUIe5Wu2Xf0dZn7yXAAUkURZTgd/KN6gA==
X-OriginatorOrg: xilinx.com
Subject: [PATCH] Support kmeta directory usage with devtool modify/finish
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
X-List-Received-Date: Sat, 15 Dec 2018 03:27:52 -0000
Content-Type: text/plain

When using Kmeta directories, devtool finish will add every single file
in the directory to the bbappend. This is because in the current
implementation, the get_recipe_local_files function treats the kmeta
directory like a file. Modifying the function to loop through the
provided directories and return all included files instead of just the
top level directory. This will enable correct file to file comparison
when determing which files are new/changed and need to be added to the
bbappend.

Adding an extra check in devtool-source.bbclass to not copy the cfg file
if its already included somewhere in the kmeta directory

Also during 'modify', when moving necessary files in the kmeta directory
from the workdir to oe-local-files, the dangling parent directories are
left behind.  This in itself is not an issue as the temporary devtool
workspace is automatically deleted, but this causes an incorrect include
directory to be added in kernel-yocto.bbclass.  Changing the order of
the if statements to catch the correct conditional. This is safe to do
as when not in the devtool context, there will be no oe-local-files
directory.

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/devtool-source.bbclass | 6 ++++--
 meta/classes/kernel-yocto.bbclass   | 4 ++--
 meta/lib/oe/recipeutils.py          | 9 ++++++++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 1372e32..a811000 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -103,8 +103,10 @@ python devtool_post_unpack() {
                 for l in sccfile:
                     line = l.split()
                     if line and line[0] in ('kconf', 'patch'):
-                        local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
-                        shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
+                        cfg = os.path.join(os.path.dirname(local_files[key]), line[-1])
+                        if not cfg in local_files.values():
+                            local_files[line[-1]] = cfg
+                            shutil.copy2(cfg, workdir)
                 sccfile.close()
 
     # Ignore local files with subdir={BP}
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 496c8a7..2f556ca 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -138,10 +138,10 @@ do_kernel_metadata() {
 	for f in ${feat_dirs}; do
 		if [ -d "${WORKDIR}/$f/meta" ]; then
 			includes="$includes -I${WORKDIR}/$f/kernel-meta"
-	        elif [ -d "${WORKDIR}/$f" ]; then
-			includes="$includes -I${WORKDIR}/$f"
 		elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
 			includes="$includes -I${WORKDIR}/../oe-local-files/$f"
+	        elif [ -d "${WORKDIR}/$f" ]; then
+			includes="$includes -I${WORKDIR}/$f"
 		fi
 	done
 	for s in ${sccs} ${patches}; do
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 9c99164..e63f7ae 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -480,7 +480,14 @@ def get_recipe_local_files(d, patches=False, archives=False):
                     unpack = fetch.ud[uri].parm.get('unpack', True)
                     if unpack:
                         continue
-            ret[fname] = localpath
+            if os.path.isdir(localpath):
+                for root, dirs, files in os.walk(localpath):
+                    for fname in files:
+                        fileabspath = os.path.join(root,fname)
+                        srcdir = os.path.dirname(localpath)
+                        ret[os.path.relpath(fileabspath,srcdir)] = fileabspath
+            else:
+                ret[fname] = localpath
     return ret
 
 
-- 
2.7.5


