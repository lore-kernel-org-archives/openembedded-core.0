Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 11517 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 07:18:50 UTC
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720063.outbound.protection.outlook.com [40.107.72.63])
	by mail.openembedded.org (Postfix) with ESMTP id 1398C60273
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2oqXHWXS7dJWpCO/NtIISMTrCFeiOB2AzyPcxkkx2O8=;
	b=49GQmondESKHSQx4rQ6JXWLa75kG6f3UgA4m5dcomNQxcWMUJjGWo8AGaqoQIlYggw2nxqTktzZLMol2n79YVDyM2Zm32IS2bIygU92BgW0pUEiCsO+PUe9oeOwk85zjvMiMGKvvdhqbl4pdwbfCts91RYzXHdpTFNYwTSBn/bw=
Received: from BYAPR02CA0033.namprd02.prod.outlook.com (2603:10b6:a02:ee::46)
	by DM6PR02MB4330.namprd02.prod.outlook.com (2603:10b6:5:2a::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1404.17;
	Wed, 5 Dec 2018 00:37:25 +0000
Received: from SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::204) by BYAPR02CA0033.outlook.office365.com
	(2603:10b6:a02:ee::46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1382.22 via
	Frontend Transport; Wed, 5 Dec 2018 00:37:25 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT052.mail.protection.outlook.com (10.152.72.146) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1404.17
	via Frontend Transport; Wed, 5 Dec 2018 00:37:24 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53677
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gULBr-00004z-EZ
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 16:37:23 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gULBm-0007rA-2W
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 16:37:18 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wB50bBFQ007373; Tue, 4 Dec 2018 16:37:11 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gULBe-0007qa-Lu; Tue, 04 Dec 2018 16:37:10 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 16:37:04 -0800
Message-ID: <1543970227-15416-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(189003)(199004)(50226002)(36756003)(426003)(6916009)(5660300001)(51416003)(7696005)(8936002)(81156014)(36386004)(316002)(48376002)(356004)(50466002)(54906003)(107886003)(106002)(4326008)(6666004)(8676002)(81166006)(63266004)(486006)(16586007)(186003)(476003)(77096007)(26005)(2351001)(126002)(9786002)(14444005)(2906002)(106466001)(2616005)(47776003)(478600001)(305945005)(336012)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4330; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT052;
	1:D4W4MuoXhbTQhmCsE+c6dNJSVULjgyOWIVUxwNKKkx1tpwjYSe183WvraDH3O85sCCLOQhymIp85rora+hxK6zWK0jEsn4CJugxS7+/KXbsgo/5DQfTZe8bxWgKQw0Rl
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ca7a968-bb6d-44b4-18b0-08d65a49d369
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:DM6PR02MB4330; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	3:XYFl+cB3lOG7RsjVAdj1Brw78hbOdN/dL/a7XuE2qDjS6jB076THupTR5Vpt7S/btNQl8C8cJWxn1xqeOK/rsxU7tA+wruOaUwHSLd/AtxyORiSyFAqwZVaJUz53B1z1GKXSso7729ZEZtL12AJWhhH2OuhKtdao04lYw/5IVs8zmQhojiwxsiTBLA+QxS+KmYULq7ODwv14yvkT92d/YtIWqLEnYEem4miWzAS2OeWDEMV8/qhb+kDMmEOp2gS4LND2MiOJo6QrcxjelsF1Z4bOC2GhtjVkEphFp+bU7DiQ9t0qGN2cMYzymsdXCn+FcYKwNqkqIx4OBJX1TQxH+oVP0rI2SRTdZhDkK2/7R4M=;
	25:AiC6xtJCL7CKvSp637P/mYcOvKzszi/PeBZPcx9GJrtjzlRgiR0Man2rOzHt24oCSmCh3XVjWwbvpkKnNvcfbUv+WsNvYib38B3MPw4Avr3UH8KWHQfWCgy3xvACYlVhHJvuxBCanFRJhN5o5pYh/c0RY3Ftbaae5kVT0ZHWXbcANZYSSF9lEAYL7UHE77rMsus0XyZ/rcQdAQMMFBI/Pvb5OUJfGWVzFQGvwS4gYXVgCbnjE8Ky+vCLbwrMVkHVD+zvm1S+tF0WTCo4VOzbxx0n0VkWGVRNscha2ywLPrKHwNGQmZsdvrGqkxde9Ne7QUNwDDUMrhNwiZAfNDbHKQ==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4330:|DM6PR02MB4330:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	31:Ur4gKNdU/BWI5VwIIx+IglHlUe/dQVwMHhsEb72e8Qbo6dyTdM7o3w6/V8uuyfHHz+BJtu6DieDzLzPUAZkMZbMOkJudvqsLbMZqKIMOxAkCLTswbUKcW2J5H0TpuOoh+CWlNJ1tnndEkGjr8Dyp7I0ShKOYxYNDV2L9yZMy0jZJMVsexhcoYD6rlXd0fEUxL2CtTPucnsta5HpxmYS0j5Nz2b7M0fzXSoQ8BnLA6Ak=;
	20:M58N+od7cdbWCC1tcqJDJppRF9QNVtsNlaUjPbI8hZUPSC90tUbXqqgQbuYlpI1F8x9sO/gqqAV6ZEkJZQ2/YB+RKAaljdEiw2nVm8LUmtg4wJqBvFkUO+qGj/m+K0Il4JIJSN357JJOTzUsVoep3BWTDWe10rSKct0xtzxVUjpRatlOdYxve8OteAyXDsdgK6l8QVKtxMa65/GjmFehiN/xEO+reB7/ojXJuG+MjZmAYkIcjNrEo3Ih3kaMtwMcgswFHSxiXJTow+3jdi2pjxsIkjdhohqUuBX+t/2sbhM8p88M1wByqi7TbQAh5j4YklyZdI2Xg+i5shWJOo6gj+RZMf/KjC2RHMAJjFtKw4T9ckuGxzHhi5wpAu2ChcXdrxTmB1xJpR72dc6hPuYsy1awras/MQ79oXjLmNb50NwzZs3BlEDsglWGZmaR6fSvLnTUsxwMw7J4qul8mmhdxcbQ6TGo3mApr7VogN9IyHoW9TZaQ1UyohXfCLelk+1q
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB43305F5961772A25FF7E40F9B0A80@DM6PR02MB4330.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231455)(999002)(944501518)(52105112)(10201501046)(93006095)(93004095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR02MB4330; BCL:0; PCL:0; RULEID:; SRVR:DM6PR02MB4330; 
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	4:3FzUM2X7mUBUpjAHOyDNQ/yHWcDwbGUeKzLa2WGxe1HjvjIm4PUqymMZUPNle5sgRstrEhacrEd6MA2OuPOPGgDEN5jra7myCJxxmOWrc5E6cwVx9fC9q7z5tXenuznAuewKV5C0bxMgQJBWrPSBDNF3diac1qbRK7XfL8SpfcIotXhWX4OKDV9LO2hAvIIdLpqY4nJ75VEdrEBOOr0sWwpfPQgEuSPpbPCHxXXaXxepwX8pFSoFx4GT47Q2Y2gueTGsyo5lpA9hnehUQrOYeQ==
X-Forefront-PRVS: 08770259B4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4330;
	23:/h3fBKTDqFAkPXSHi5gVRfO7Ik9OOpfAh8bt2hVxs?=
	=?us-ascii?Q?kfc9zFQl/MNGR87MqaW2Y+PIsiprhaQtEXb3LV0QcWwfmi9Ngkq2OEIXSxs0?=
	=?us-ascii?Q?Ujj0gfSewqGvujUVbkSTsoVkaLaDat8IT1PeRQGc35k9slilZTX/kISodaMZ?=
	=?us-ascii?Q?SyCP7jMdAxUpbab2yV6OPZbQ74SjB1MzNfOHT9pL27Gp5k277PNmjG3c4cTL?=
	=?us-ascii?Q?gI2CFaXdkeT63StetlTdPES3jEXM984L8LuefgnufQx+Ks/IRGqUBfnbicw/?=
	=?us-ascii?Q?59I4ICGdo/m5wdbTGoxo5/0mEoriU3r/HUa7IaDSck1Wl85sl/cnOFgVfhrM?=
	=?us-ascii?Q?IUtlaK4fMJe30/cg5yFUbCEkR9z67Vx5dExVfy9h/AQwZBZ2EDXVx4vrDZpc?=
	=?us-ascii?Q?0fNBYhHy99C4Mrj4mQO1tVL1Uysov8JFj+WysGi/1Bu6mAxRjdfeEOInqrAF?=
	=?us-ascii?Q?Mo2pOL+KZnJ5hTlsj4xBGZRtFV60O8gbcpS6TGPY+jK+F887RAmGjk1x3t3b?=
	=?us-ascii?Q?9OP9C1WhzoTjP/zWWYNzeYpKvgnWFrAFxHuewKvnh/eZB3vKAe9HpU4NsbJI?=
	=?us-ascii?Q?IN/JwL5BNLqlKohWHPIFCN7FDhIhvYZgFDOteEBH1DwujPYxfX++DNxo41z+?=
	=?us-ascii?Q?h86dplfVAFDh9qjFpSrPngcPrk5Y+PjtcegIcE5TyRoh6EYl6dxcyznziZ4f?=
	=?us-ascii?Q?YhP7UgZErBNvcfoBLqr0l6boDXFgJM/b5pyBUHogBE6TA1Z0j6Q1RLcrR7xs?=
	=?us-ascii?Q?LVgE0qYt47bS3I84OoQ2U0D+5rVGYF6cVkp1eZJriRibLCHDD7HQeCw6wh3Z?=
	=?us-ascii?Q?SbwJ4iGR0mHbLVsbcufzDarfEypO7GcYdqX37zzNYAENMK2hKMtJwSfhBBDJ?=
	=?us-ascii?Q?ybjAOW1lwcDVN6/1Qx/N1wEX2+907zS70E6QQAmVdpD4c+CHQ4suiX05Dzxz?=
	=?us-ascii?Q?DMnlXuaCoLy5ZJPAtv/cZ/GitNIlKiQdvcR+tif8DiG9rqMYsuR1eTfdhADl?=
	=?us-ascii?Q?LhLWVNbEPvOEKrXvBaoXd1j5d2NHpttE9oKHdCEDB0aNjHATrzYqgoSrK4ra?=
	=?us-ascii?Q?th9Af6FE6VCDjipRE5ukX9u0qxWykIB7IrefVvdPxdMtRJdwA=3D=3D?=
X-Microsoft-Antispam-Message-Info: 64mCjX62JQEZJ4ejvaWyi0UvGeepps0tv00zVf+i/pSnF1I6w/oEqRbbgGaqIMbWzfGThm6+AyhPCyApREWBqR7uTVM9UULJTAtUHpuFUg4IvDQn/5eL5bgjSEgxIDOBqEeTSy5XNPwFjfJU5X856v08REbeum8Gp8LpN/yPaAQuhkk5cl2nveWswb0IfvTrontXqqIE+zGRT5BwVfDeCEFdkmxXgDM6nJpIhEweDltGC/JihDS7V+ARnbDfwXY4Z2nbYQPPX4rnUztbNDAII+7+ZuorOMegiU0GmFOs4+LLsKJqlf4cnB9d9JYosJ33pZdn2r90drKYaau3RDOHxf0YFPFv4U6HYg68radOwBo=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	6:h2SbyRc1VZQSqOSeHK+yGhgc9aM72XGxwEBaiblxrSX0W4oLVDHXF1GMyAr/Gf18TTDNuS1yoH+x8bGg9yZWl3LOXomPI6mMr58s8WoKm+BaCBXkdhF1mAtv2nT6tLyK24R7oeXFAceieuELAi3T/C98U3mhn4vEscWWFeUqEz+oT7dKr10qoXPSbcK6xi7GHLKEzcQHZezbdHCf2oNkA9VKnJk4oUIHtgrRWBLKincm0wQvHhndzD4gXWnkrwzRCRiYF1MGlyJz8ftR+eixsxRUHzInTlPID625/+BabgnxqhjkW5MqnS6qG8Wdgv4/o4PRmhHdpIzW+ZfQe7t1zLU9XDQ5sZ+ZIueF/gIKFE9TWjusPAJ8eZgDd0IXgz3O1s3pJcg0TFqzyktT1wCyf9UAdQbPO/YRegj6GC1pcuMp3tlZ1fzjCjGSoq5TZ3oytMltEp5jUbjszSTPT6pi+g==;
	5:t9rDS4UDrZ7HyGvpPF6BAu9AwsgZ8aJmmy/W9F5P2tUgURcFgV+dumgBYPIieZBc4lUp2aFHKsdWJVeMGJ4zfaiwcc41y3K6tSTTp9wAVxM/TgprcDulSVYyz4NXyWKaE76i7rS28QYgOSBwAfK/4OSQaD7faOJftIM7NKY5H8A=;
	7:kuqzFmlCq29kWyqRbokNG+7R26zVJusS2AMkwUyEb53CPojXyl3x6LeOsqdUduZnV4A3OSS8qNRuAb5KPanU2eZZu8J87M9hJ7aqA2r7tVlt20Yb5zSEIcKlahEbo56EuLDg0Eu+bnpRgYeGmAht3w==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2018 00:37:24.1121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca7a968-bb6d-44b4-18b0-08d65a49d369
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4330
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4330;
	23:lKGObgOtDJcRk5lgeoSMbjXW83jFACrxUJL3J0AqvG6XGWsxALgsaO2v/ALzHTxwFqMUueQr+NE2dolBFCkC6lamxXMjs8DkuIFjtEkRYuagIi4n2CoBYpe//niUezfXv9vLQaSrFFHWw/O/xBFz2A==
X-OriginatorOrg: xilinx.com
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH 0/3] Devtool: provide easy means of reconfiguring the kernel
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
X-List-Received-Date: Wed, 05 Dec 2018 07:18:51 -0000
Content-Type: text/plain

This patch series provides support for the user to run menuconfig command in the 
devtool flow. This would allow the user to modify the current configurations and 
generate a config fragment to update the recipe using devtool finish. Devtool
menuconfig command will work on all packages that contain menuconfig as a task.

1. The implementation checks if devtool menuconfig command is called for a valid
package.
2. It checks for oe-local-files dir within source and creates one if
needed, this directory is needed to store the final generated config fragment so
that devtool finish can update the recipe.
3. Menuconfig command is called for users to make necessary changes. After
saving the changes, diffconfig command is run to generate the fragment.

Currently, when the user runs devtool modify command, it checks out the entire
source tree which is a bit of an over head in time and space. This patch series
also provides a way to create a copy(hard links) of the kernel source, if
present, from work-shared to workspace to be more efficient .

Also, if the kernel source is not present in the staging kernel dir and the user
fetches the source tree in workspace using devtool modify, then this patch
series creates a copy of source from workspace to work-shared. This is
necessary for packages that may use the kernel source.

[YOCTO #10416]

Sai Hari Chandana Kalluri (3):
  devtool modify: Update devtool modify to copy source from work-shared
    if     its already downloaded.
  devtool modify: Create a copy of kernel source within work-shared if
    not     present
  devtool: provide support for devtool menuconfig command.

 scripts/lib/devtool/menuconfig.py |  80 +++++++++++++++++++++++
 scripts/lib/devtool/standard.py   | 134 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 209 insertions(+), 5 deletions(-)
 create mode 100644 scripts/lib/devtool/menuconfig.py

-- 
2.7.4


