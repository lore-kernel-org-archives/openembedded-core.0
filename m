Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 10785 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 26 Jan 2019 03:26:47 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800079.outbound.protection.outlook.com [40.107.80.79])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7D67C3DD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=c+eMqth3HuX4wlPVFg5M33AbB0fMuhWKzyJI200MrzU=;
	b=O53hGsH27yyD2qXgOcg/y41lq6TtnJqFZmeXV9bSI55SM18foCGlkIdmPhxi0ODbWyvTReZ0+3KxvBrCWCFeVgwqEPH26t+WgBRmx3gzF8YezSbtxF47torHHNzEZkL5orony2RwwDKqZAgL2pvonJopx3ndMkjxLHnEcTMsQrc=
Received: from DM6PR02CA0036.namprd02.prod.outlook.com (2603:10b6:5:1c::49) by
	BYAPR02MB4325.namprd02.prod.outlook.com (2603:10b6:a03:56::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.18; Fri, 25 Jan 2019 19:53:17 +0000
Received: from BL2NAM02FT017.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by DM6PR02CA0036.outlook.office365.com
	(2603:10b6:5:1c::49) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1558.17 via
	Frontend Transport; Fri, 25 Jan 2019 19:53:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT017.mail.protection.outlook.com (10.152.77.174) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 25 Jan 2019 19:53:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gn7XQ-0007sN-GF
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2019 11:53:16 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gn7XL-0006ct-CU
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2019 11:53:11 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x0PJr44x014338; Fri, 25 Jan 2019 11:53:04 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gn7XE-0006bl-J7; Fri, 25 Jan 2019 11:53:04 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jan 2019 11:52:59 -0800
Message-ID: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(54534003)(189003)(199004)(51416003)(4326008)(16586007)(186003)(54906003)(107886003)(6916009)(316002)(478600001)(8936002)(106466001)(126002)(50466002)(426003)(50226002)(106002)(47776003)(36756003)(6666004)(356004)(14444005)(26005)(77096007)(305945005)(7696005)(2906002)(9786002)(63266004)(8676002)(36386004)(81166006)(81156014)(476003)(2616005)(486006)(2351001)(48376002)(336012)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4325; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT017;
	1:vcd3PzR0cfkYseWxceksHIZ6FezAvpD/7WRITuKZ7JQ3X0Y6mwW2Lel+Oq9+rN77eLZoipmqRsOaJOaab6HDWy6akGxdlXFxxWCqp7VEdUaGb7F8/rVBKYT6kqoiiCOuvhnCQeFsld0zImFbJGSGiw==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26238f10-a2e2-425d-f978-08d682febffc
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BYAPR02MB4325; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4325;
	3:zbL7DoDVlBzWXHrcktuZlu587iM6shNuteTZCsOTMqnmxWwbY0sei9hcJS7n/rHCVixvhmilVpfQymgf4MhzX4dgtZ03/+EV4kC2U0/6WD6JvRtq9eHFq9DiNZGJq1Ob+g8/NSmTtjLPQk6Htg7v7e4VQGWUg+EOzG/gf3sp6QwUhBaQAyT81QRg4nPCJF55sNzcP7R+iVGsvqFV1KpQbFS01mrZMyz9y/OPfz10ZorAJJp8U4C8FBX+slSmNvG3olssx9XlDvogP7sxyIpB9khmXcWXeUSP/X06vnEkiK8+pRDJWfoXdXaJVv5NW09Pk5eEQxGu80oyeWcwx3hmI1Thu2GcrqkYMrAg/wcfVt0f7lqLTNXejWZu79+mqmje;
	25:ZfbIRhDN2ElQrM/UMTIvkp2h/S714bueecPqZ3fAjzg/jJvtVHWFOIcguFN+jQZClhwBSnib85LzJC6EBaK66/L8qjFkjbxO6rFoG3CIUDxcDdtRKVTkFP6x3Nt8ubZZPRONPlSzjAibF032hwDtHaMLou1R8ddvoRBM24ItRgM4hM2TDjHvlbZVtqStmQP3b5Y51lwP8NKboPc7Yn/5/0wOxisTaxW7f2XqOynZzkp+6cw+fu0fBD9E4GuOLuZsPxaQGOac2vrIu/fn6VYMymPWiE7suDJbl+BTzS61leNMOURNZskfEhAGfm9lBRFSDaH6y6nfoGriPRS7dQ6t9A==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4325:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4325;
	31:CDeBIXILND6svyXxECF9LfP41xXYnQYBTcm/SJTKz02OQkekSbfQ9H7DZdj8Tqni+KrknCE7/hHdNEq9HwGsv2/xsJP5p8j7DikbEh2lM66m8VWj5rpK5t5iHrBkSmG/Ax6EWqhIKJSQT/5E7wSdiuVlr9TjLlcKItjxvP7HPGjCSlaJ2DMaC/mtxcyFLsdaUy9ikWRsrw4j1gWl8yZgTiuloS9sU34JOyYL8tUaZhU=;
	20:L59p8FyYAoTURnTTvhO/MpX3m+OhSICTRxs5JOHRy0Ir0UVcaVAeXiW1bhwRYpAyU0KM12plqyfbAG/LiKcBYnyV/JZEAhvEOmtfiPNIzv7Wg866zfP/oAxgePzrZrKOjVHPlMFM1kXA2KnHt7OnOwVEoSvpFnOTVujJQB1XPD14Ep+POsouvF/RCSAgVHMHUVZzrz9jhlWSSxCXv4e5PkdOr5ahNg3EM1nvz6neEECn71oGtrVA/niX4ycAP9IBO2iP5Au7Oe0V+0nostRRJ0ylSNHv7tmOYouSoxCYxOIJHE6EUu7ml+SLrH5CUc6arwY0muA5TZyrZYCslcKpvnuZ6oTRT0TJdHZn8S50IBk1HJ+ktVcptWUkLAq8HbjRCVVw0wEkaa5wsQOG51k3DihWeG15PJ3wmNuso9389dZ3MV+HcGBN/bYaiI1KkT/Hc7vFGLC7Y35k8PoKUP2TLF6w5w7o5h3Iavhn6TzhTC9QeBfulNZTZcGiwrGh1zWD
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB432549A8EFD508225BD394EAB09B0@BYAPR02MB4325.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4325;
	4:vjGozys/mwA0bnIHCcAlQhWKsj752BNq+diwNk63kiqZed0GUxdjNZi9Fa5nIDZnZp0Biqxrh8/Yawsl8evZbsPfASkCQoRr5Yazd/nAIVzpI4IbmH37gzXmqaguPqpZ3xNXhvyjkLCogjHL0jeJM4FRhmG4Vd8lgi77Zg+VvZvueDJGHg3PrFAoWvPgRhPen/7v0Ym0pYENQJcTDGWvawqEAzHWOYBm+TVwNLCF0tCNYot7NwHSPWYtfoJTqS/Qn4Fxau5zXn2zKK/ZwS1ZzRljUVnKBJV2ui7fddNSyic4/6x1VJVM/fuAshm42Yb5
X-Forefront-PRVS: 0928072091
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4325;
	23:hw/O3XUoAEfS3bLGbqnySn8e5AXHCa17sP8hTjOBK?=
	=?us-ascii?Q?ifiCzTV/2stPYs3NQ+yy1h2DD9K+PZtXwBgvHfESUPEOu+WzJr074S3pl8qe?=
	=?us-ascii?Q?VV4nrzT2NirEpJlSsBR68EptsdFWVbzS6uSq+wa/zLfPSycy/5/WXGEYdNaW?=
	=?us-ascii?Q?XnzcDtXgpBfMBWyooa5RDBU04H2zeDHs6HiTjtR0p2EGqlE2qC2egDXHSrNG?=
	=?us-ascii?Q?ANmRMoJwQj7sXm0CGj66PXSb/7xPJpajK4l0KthUa9zyMtAHYaLcPHvePlQr?=
	=?us-ascii?Q?weafGAbkDLPavIsc3tQiNjIQRRHne1AWODQMtejyIVjtizDRB9WCnOz7epsJ?=
	=?us-ascii?Q?CI2jxCAuL0/YxPKywwRKq7RQ+nPFK5QT5qIzO5Msz5hLyQFEdh1NfkXLxhEz?=
	=?us-ascii?Q?AsmafquUGxG3hdgZWV6wBV8sj3AYEprgCk1mHsPRa2S5f2a0VMo4uE0hiMQc?=
	=?us-ascii?Q?YdIxlPEmLzuZsmnA8iM3whwb7yRv5SNNoxPVGiDbB0W5fc4NZyXDxTiHT07l?=
	=?us-ascii?Q?Z2UAa/jiBZpk86bSua3spm+oMpLaDH78QGYXxHdkooKdCECLKt1qo0MyekTj?=
	=?us-ascii?Q?4o97BjqoC8MeeYWDbprpY4kBWxmMoWZQ6dCxltjkeptv2jq+qhXyLljI61vf?=
	=?us-ascii?Q?lF/LuM+35in/qE6Be3Mbp5CaIzIW9TkYTwk5qU9JiFqgJb136sX5uBf3jAx3?=
	=?us-ascii?Q?UmhtNfTP0Puw6F2U5Cy5rwv6TtwNHviCfyNRhXVFmkPFmZFChalW39jaYQTM?=
	=?us-ascii?Q?Ba/WGRprnwdpYzHz/YdnSsaW4LjQca64LUFlUPtDYnpe/lEKJW6kpUcY4NKC?=
	=?us-ascii?Q?j+qwqxuzcPrrtQNPxezyxI030CRxYsnwul7h69eooS/9SK4T/uXw4vHrQfcb?=
	=?us-ascii?Q?6n4jV7zxsOBhDnmcGU/iOlH2z1RvNbwunR1pfec5dlqupM8RaLsfDNsqM3qZ?=
	=?us-ascii?Q?oGQxxMgOygW44Sy/T1HmExd0gjtItpttNPBvwnfedEYH1YGfeoeAitITiQq8?=
	=?us-ascii?Q?19mfLTP62+DQ2Zq6x9vozZdvno5bPX8p9fg7yaFxud3UICUshTwoI5qv+E7f?=
	=?us-ascii?Q?9z6fLQ=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nw0PuXaB0xRwRp1eWXqymYfdlj1rBGyYtLj0Bv18yCiA1HxpCiF5ngJTZL+S6lcoaej2Ns9oaPjEDa+ZXIA4LIeIVO6bxFsPy2+NUp4XHV87IC3nKwxeYi+hBCCg5hM242ejPP+ae5LkoSskZK2LSeLyF7EDb0GwGMgsVEYn/vTFdkwgOZC3u+TdnzHNMccZA+q0LS8WZMKP3AT9yJ+cT0jevbN2bCtQoB0p6QRYpIRm2WBSZ0KoV0iaDwtvH5cuduRLP8xLGGcZkcA97PtKZGKwbwlaxUvyU2MD+/wwDUpEjtZImEkWz3PTIG0UW0KLJcY9882OXNF33aTuJ9SXVapWOnMM7lDE9rRfIp9hV4zHCKUp6zHub/N1HFH4EpoeZFVt2k+ra2d09YHL4K3/8dYaYQRMppw5TgEpFpNQHL0=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4325;
	6:HxFkzOGebx4wWbmXa2wVfzLJ8DaIq1dm1Z9tIpLgwgGx3g8ZQIa7Mz3Ac5mANU8NLt2duEM/4VXBuvk9FvuZquFXBWPWQuxwIX6LZBqkie6xeyu5t9U11IBKIZJsCtad7Y2T+CQil4fb91XwWBuHEQY6+hGKEMRJK9kjdo2ehDpNkZ0CqUCSXH5maVQRrH69L4v0YXhowQhuoPOUj3CXOf/S07PgRYfZjYB6H50B+3rkoG6EqfN3wyRfROxuOEic26G2GKvO1xBcoQ+uTjHLpWCnHUD1FkNcub0VvwUeD2keoZZsInLFR3TehABlTv23bvKPt4PGSkhbGtJJBkyohxYGBfIObQU9E/9nGMfli7RtH/2+Tyv7ZvyoI3ZIBHBSFwOttDef2q0Xc0YPdDM9Cl6alT223rPBvCAj9xXCi1NsC42YG+TnT/jL5XtIPENHacsdBhV9FsdnsJtWme70EQ==;
	5:qd4rc55U9HFNDynK+i+xdZXo3VTETMQ1gmMLYM/kRMRR95WI2vSOxBuczNarhQiKKIVExmsV7+Yc50z7voA3dK0fU2XsFvGXjkt/juE2uF8dbCzyG/jyJUHwNjj2b2viWFGpwG2kdB2wlfUbq+HwcjEh1sZrPcO8+PEFV9lwz+5WT1yLLGDMFYGs10mZoM19sVziN0q57UGFvIn5hs8DJQ==;
	7:L212GxUgdC2ElC1aLpH/irNpqJhxTnBUEuOqZBiz7qNbQLlynRSptqegcwWNg0kSZSPIjoGReopERbyBeTGyWyIvTCyK3byvf5AIDVaTXemJ9MJkHi2G98SwHwW1tAE5nJkD5RIDXn45M8IS2DYFQA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2019 19:53:17.0432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26238f10-a2e2-425d-f978-08d682febffc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4325
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH v2 0/3] Devtool: provide easy means of reconfiguring
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
X-List-Received-Date: Sat, 26 Jan 2019 03:26:48 -0000
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
    
---                                                                                                                   
changelog v2    
1. Add a check to verify the set kernel version by user and kernel version                                            
present in work-shared before creating hard links to workspace.    
2. Add a check to verify the set kernel version by user and kernel version                                            
present in workspace do not match, when placing a copy of kernel-source    
from workspace to work-shared. 
Sai Hari Chandana Kalluri (3):
  devtool modify: Update devtool modify to copy source from work-shared
    if     its already downloaded.
  devtool modify: Create a copy of kernel source within work-shared if
    not     present
  devtool: provide support for devtool menuconfig command.

Sai Hari Chandana Kalluri (3):
  devtool modify: Update devtool modify to copy source from work-shared
    if     its already downloaded.
  devtool modify: Create a copy of kernel source within work-shared if
    not     present
  devtool: provide support for devtool menuconfig command.

 scripts/lib/devtool/menuconfig.py |  80 +++++++++++++++++++
 scripts/lib/devtool/standard.py   | 162 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 237 insertions(+), 5 deletions(-)
 create mode 100644 scripts/lib/devtool/menuconfig.py

-- 
2.7.4


