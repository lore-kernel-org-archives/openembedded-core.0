Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0142.outbound.protection.outlook.com [157.56.110.142])
	by mail.openembedded.org (Postfix) with ESMTP id B43C560557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:30:10 +0000 (UTC)
Received: from CH1PR03CA005.namprd03.prod.outlook.com (10.255.156.150) by
	BY1PR0301MB1176.namprd03.prod.outlook.com (10.160.195.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.231.21; Fri, 21 Aug 2015 14:30:09 +0000
Received: from BL2FFO11FD024.protection.gbl (10.255.156.132) by
	CH1PR03CA005.outlook.office365.com (10.255.156.150) with Microsoft SMTP
	Server (TLS) id 15.1.231.21 via Frontend Transport;
	Fri, 21 Aug 2015 14:30:09 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD024.mail.protection.outlook.com (10.173.161.103) with
	Microsoft SMTP Server (TLS) id 15.1.249.14 via Frontend Transport;
	Fri, 21 Aug 2015 14:30:08 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7LEU6Ms014027;
	Fri, 21 Aug 2015 07:30:06 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 22:29:52 +0800
Message-ID: <1440167394-20065-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD024;
	1:WQU1UxHoReQ6ed2s5vAdm9TBKhVvqLaU96/PsB6/L+UjTe/cSOrjdkCSb//+MqcTxzAytffp6hQ0JBlCE6I4VSFKI8h1CI5SwaGXyWlBgPyBkzofbVixQ2Oto9iY1jpw6c961sxl8EklZ38lSzUb9g0y0fyDuiG8Iat1485AqmjHFzBUKW6/Dk8ifenwhZD2d+SAt1s+2uv+mRtqpHhjtpU2g0pL1XTwPYBiplG5fAG9Whg6oow/nnzzgc/Cxof1CIFaYULTAtkSBhfPjpLf44LE4qv+YW6fL2QxD9N96eSq+VzF5lzRkuf1WkMnCwboPklKHoB3/kmytvaKhs4VLo1s9goxarW/+/nhCOZTUTmvvlwWo+9n9a10TSdaGwbO3RRFBreflU4Vr97V7pgCoQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(3050300001)(199003)(189002)(5001830100001)(68736005)(81156007)(92566002)(5001960100002)(4001540100001)(87936001)(189998001)(77096005)(110136002)(46102003)(5001860100001)(97736004)(86362001)(450100001)(229853001)(2351001)(36756003)(50226001)(5003940100001)(33646002)(104016003)(105606002)(106466001)(107886002)(48376002)(77156002)(47776003)(5001920100001)(50986999)(69596002)(64706001)(50466002)(6806004)(62966003)(5007970100001)(85426001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1176;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	2:MWcIkVdm6J512vScpHyphddjI5Tn69jM03kRVu/MUMlU1ag3uUkQJMhZFj/hh6NOtkN9VgnNVkGT+YslffK7GwIqO6aLmWl+vzccWkrGOOzGX73B6+edMX5drLK//IUWVIUoeDhJxHU24hK8IUOaIkua5Q6CCVHZh2hqVJSirEE=;
	3:xgvN+sUKdtxiECJfDI5ixBZFzBTxpLGHFASuFO88p1FwqSktML4yuV02ahpZWQf85fRI0UYz+8ddhSATQFTg3OmX1Vi0/W2Qb3ci3nynTtXfLF3MSN52B23uqvtnm192HOviiRO7LVZq5UI8gHy8UluiFW6TMxu6MWZKZnKIPmG5JCKmxSP9WPxYpWlkh0X7mvafSA6iKWptYjdexEsXN+SalIexxldk6KArWnreKBA=;
	25:oUXsZmfEDfkODotiAf3H+/J9aSnBdGLu8ey+uNquo8+TOgwJ5K/TPwiSEQs9UZLthd/fNpg2PkGLHYsah6VWrs6hiC0MlDncjhXE5BnIfSK0zgxRHhRHz6TDFOhtRvwku+aE5/ELZvojrG9GcTUmjv/8e9nB0U2nREUX3pJ2BUr7z6LzYaozRdtLauT26hH1Tr0GCF6UKn9ON18dIdPZpRvVeCic2wbuoou+JKan+srCg2ZTICTZE1xr6HLdB0asZz4OAKbBYUbDs9szCo1vzg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1176;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	20:hkVD+Hj7IlnDOQm0e0PgCO5b99Gr9nDdwOwZ/g7RVNBoD3k073L3saNVPKhe2mQGk6powOgAwL64C2Sb/Ri6lM5V4S/hp/ZAzwhq+MuFow1iPi7oQP9KvAtgz8u+sIzuAmMUEADCvyk+9Xb4IUelLg1gseJgSSVU7DustzkxJDrQGADh2hyaQWcwiZC7JZOMsxchbXQ521RDfyCjm2VkYCUsOJ9MpVFiVIOFfZcMBQ7NXDmVRO2Lb+ZOMnlK8iQzPbZVOCG9zD3h4M7m3Dx5rSF6LyM1qxXLy8Oav8gsjsAsdP+rs8cMirrRiujlzr4/+8eaL4PnQZDM2u1y/q6HGCtJusQNeSIetnzRYUTDGtU=;
	4:PX0njNqDz9u02QKDOVsjLNHxfpDI2tbUuTX4tsRPto3jdrH9ecrRedvMi5oilOp6LuyvzGIKUIl5/rck8R1YfMiT/j7uXMWne5OhrPpxq0EI7gAz604YlsYNFXajdduPLeEDY6IoqnnnAh4yHANU/AJxBSihK6YK8tZG2qQI6sNLcNRWC2FjA9SF+D+rX7HDYB4PmKu2LXgi6bph2Xnk3bwYVdCCiqJ87z/XPvF/sJwCdzw9rLvUwyoNRvTppHobeaYoLiz8EVYBdLKZ+rV5g9P33jd4X+pTHgeF5zacPTQ3YUUUJxPyrmF/WpTUtccW
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1176414B7488C39B77E0D2EB86650@BY1PR0301MB1176.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:BY1PR0301MB1176; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1176; 
X-Forefront-PRVS: 067553F396
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1176;
	23:W7YT6amHjFA2dXswPpstK0BklWBXnNHlnumdSSG?=
	=?us-ascii?Q?1Oc6kqzvmmmQXvIvNBkeGTT96jtveT5wq6vQULCe/F4MQh5PJ8V6JrIJbvZi?=
	=?us-ascii?Q?WI95MPGqTEcuxtnz7dVoOPxYxyU5mE04Djl4O2hGB7S0BFlxtShdD/6iZ1bs?=
	=?us-ascii?Q?cZGvDnZVZGsmd6dd7x9ScfpSxSCdECIDKROMCg7ul9hUxsz3ylKJE4dqzubp?=
	=?us-ascii?Q?iZRjWJP2Ue/3yNaaRMtUMrIucsqBQpw9qjobXkOcdFIkJoMjIk7mKM38R3Io?=
	=?us-ascii?Q?ntkOKJotAkRvvJy6SwZgGSFOWr7sec8jiq8mmJgGOKy6o6WFYpoq69k6mL/0?=
	=?us-ascii?Q?gsbQT/HTQxlsosBnYcnsdYREFsxC15Ylxhqbt7PHepLHo0dES72jNkSWmBoM?=
	=?us-ascii?Q?lkE5juM0GQ5lpnfZnAjAWU+6+d4sgdOfWNIMiV/CWrkqHa/zas/fMi9nmNlf?=
	=?us-ascii?Q?kZyXyeAAQ5YxerSRZYNVywOmsevIDbT5fCrDiEbxjsEYLdEuDn0PEGzvWKSG?=
	=?us-ascii?Q?4mEqEYwz6dNA4SzFTfsD1wOldvlwxUPT7sO+F8IKvPN28PeNsWAOVZPNJ3El?=
	=?us-ascii?Q?9+acphlTDkYxOAKqBhfHyYH4fAqCgWBYNMOd2TV/fDsO0QtIhpqfrOZFD9Qx?=
	=?us-ascii?Q?SJABfN5wcsu2Y5VAFuYOjGkvdeai4cU0Ke5AU8G6zKtz0hW6jdMm+kFHb5Pb?=
	=?us-ascii?Q?1aRRQIQ2oJ1jogqg+qGpR0JOJvRmcDe4dJZvWiOtLJpSrtCt1LH4fLhIug0K?=
	=?us-ascii?Q?OdOB6CxFRKGeeWBBSFVq5hL9urNzAZ8627GHx4HmMKk4GkutKRvGytHwV/UQ?=
	=?us-ascii?Q?QJ/RtRhvF5iahES1relq1dBf7RDSG6YoPyf3FCLVkhOI9E8LI4dpwMs0eosb?=
	=?us-ascii?Q?M1isMZI+iddE43L2iPRYbONtFcJE4kgSDHtSU8Pay6kfE1hQ6jMNDkR/Xeo9?=
	=?us-ascii?Q?yVgg9PaSDzvuQDEXJZLzSKfVbmtsN89+0XNiXoye2QgNZ3U34yLwsBe32azW?=
	=?us-ascii?Q?usu682KEpA5+aT8D86FspbA/aeTAl+042gtOIiiw3BHWG5sK7nm4Q8TNNpoz?=
	=?us-ascii?Q?0YcHkEBJ7t7cTZ1slSjRhCbQSWbCzWNwZoTlLSbmiSQD6s/n7TWpy1zj2kIH?=
	=?us-ascii?Q?SCXdT0CFtQk6nl0d65JFMknWYlh6UsnduyS5+8ldrNyOuvZdM6PX9f9yGjja?=
	=?us-ascii?Q?uH0MLUcG/SD1pcuAmdXQ7GfK/bmzvrmF6/9oz?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	5:8yVqqvZCyuxNC9xBOllvJsIgXqKT0cgaG6EHR6PP/cmNsJzxl05G93QfBWGUFONfPW3xTH7R+DXAcZsaHWDO+aI9NOqU0s1chJuGxwN4Lku/rRho8Vu8V8s6/SyPDMHaerNvTkngaTNAUOSwL7Acpg==;
	24:5xPQle/uFT8STP4iWlZKyNguhtXS2DRTFDnJqo9c4I+431Soo3s82SAFfyLgaomqhdLQyFp9DaHVrZ9yCPEFEKM5GqlNXVq+m2K3s6VDB3A=;
	20:8v8SvEnocV06E0LEfk5ruN8OIlpZhWkOGgdJHSRM5YVEGjFQW7SpAtCUHqJyombHbBm119RPTujCDb/gj6pCmg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2015 14:30:08.6111 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1176
Subject: [poky][PATCH v4 0/2] gstreamer1.0: Add patches for Gstreamer 1.4.5
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
X-List-Received-Date: Fri, 21 Aug 2015 14:30:15 -0000
Content-Type: text/plain

Fix sticky events haven't been sent out when active track reach EOS

Fix QoS/lateness checking if subclass implements prepare/prepare_list vfuncs


Yuqing Zhu (2):
  gstreamer1.0: Fix ticky events haven't been sent out when active track
    reach EOS
  gstreamer1.0: Fix QoS/lateness checking if subclass implements    
    prepare/prepare_list vfuncs

 ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 +++++++++
 ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.4.5.bb                |   2 +
 3 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch

-- 
1.9.1


