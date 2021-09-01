Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.209.1630522165613140979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 11:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OZyWNyT7;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4878a39683=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 181HvbUC024023
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Sep 2021 18:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=PieC0IcMzOQYwD7/ASJW0QP5vFJ4MWmG6pVG7auxDVo=;
 b=OZyWNyT7B2IrW6R/gcYpArM/b2IIYqEtIpeWBxORe4J821T+NSUy6Hku6JxiGiMeitNN
 H3q8bfF8g78hen3Rp7v86NwQDjzW32pFlm+wep9cuqDuRbcEFEJcTtePohhh5b08h6T+
 6FKmW2kzFAuE1iDeXgQKOIicInvrayltsVm2xgQY1FxX1GCLyYdMTgVe6htGRZ1DzvT+
 uD/HBIXtlu5QHzqoeBUZNyEfcZEEDvXO4DlhUr2P0GZroi5sErBb9RwQRIdYnah+M4ZL
 cv8qyaCYyHkNOSGN0v7BnJudOcCKBMr6h0oFvwCpjc9zTKAWgnZW+VUOHkimGXGSqbi+ FQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 3atdx4826t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 18:49:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4UczlXoTMjYjNrq8fid99bdBrKRUBDpN7tMnvf5znOs+wX4EdKnXb6GvzK7gpTALuvJ5VI6wg1ipkivWAUN7wdclbwDzvGuO8qxqcPyNbOs2DE8EcOU5jQHMw7jI1DPK3QQi++SkkL41d3O/eMmjxA1a3CPmaM9IqaDJIY7SqTwc8TA+iePiN3o7gl31x+GYRhCQmu7H2k4bmsduRzVhK8RgBo7759yJOlDEvmw7M9x+Y5sowsLHrklkOQcZxKQ9cBysU3VnG3ErP1imh94LZJER/0U0clnaBiIoRFXVUyKh2NW3nDkoM75CpUe6rRje9RgyuegWfN6LLmVX9BHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PieC0IcMzOQYwD7/ASJW0QP5vFJ4MWmG6pVG7auxDVo=;
 b=IEiKv+KEtEwjOQ14FWxb1/RedBqKXK7TfFjgRWVrEbXOSFZCnoWKZp29wvcwbr9eCPJ9ziqqBfFc6dY6GiaJWD4/KHqsXTQzK6/RgqKY5MU9fNup+PvMvTZDkUh5vTsNPuGZisekHOOMnwpn2uAxrf8+eUvY2cqqOrp8tgNCxjLc3zBU3lkpFEOil1tqQGLxxLL9yiWcs/ycDUcJhw8X5n5IvldbHGQtBERVvOxPbMcWkYRMVJ89PIedS6T3Oxk6+9jn+cgsjtWBd4VNnsac97GALppvlyMOb3n3ZC4rkDLumK4a2a4zDxIzpRYst+hZfl1atEotUrAFcs5pJpG2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3221.namprd11.prod.outlook.com (2603:10b6:a03:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 18:49:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 18:49:20 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] bluez5: fix CVE-2021-3658
Date: Wed,  1 Sep 2021 14:45:45 -0400
Message-Id: <20210901184545.788299-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: MN2PR01CA0006.prod.exchangelabs.com (2603:10b6:208:10c::19)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by MN2PR01CA0006.prod.exchangelabs.com (2603:10b6:208:10c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 18:49:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1bb719a-fd14-4775-b1cf-08d96d79358a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3221:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3221F59A0D020B34A25211B79FCD9@BYAPR11MB3221.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+AF9eHZa4C9ia7HRnl4+EpE6+Z7ZR7Omf8/srDreJqS8z161omLrux+/Xvmag6vi+L0KTgN/xi+JmvRaKQCDnLzZT0BUH+AimiJ/j4WydnBTZp5z3BmgdcSkEiYdlULxODYtNeuCFmlfy9xWbwvlk3ZonfyOw6e3VkxmZY/Wlfl/yBHDRr6CMzLf5ADXajjUB9vuayVVe5qMVP7Tlt3iMTuYoBjoic4T0Grqv+jRnSzUdBZY3Y2Q714b22Dv4i6M4nJhun1dS7EB42YHjGjbrrYBPCxH6xeg5WeJfZKGyl1vVMnNnCcAtRMrdRamSPkaHw02aLksdn+ENuqe1OLET1Rw2L4FkDuvh1I63L6yE6QXqTUxwAVH84m0X2le+ij8Fcxx5Bf/Ji0zbgdam0X3+PoBBVu7mpCnvRIPReXpoyitCl7FK+RTjiWGHl6o3MCmx1wb8i1AfNsYpVVhU31RLFklkrpW6q3q42Z18Mj2nLSNVOxpkOCJEQat01YgRLm2tEakCHSET8+QgtQXKtnM4acfbe5rBA7n3+yMxWtM7vzHrOZIzrg51U4E20a8zfVFdBloOPkKYbwufFNsGuYbgergXYPvI7mR9eqyVto6h6p/nrmZKJRVynDVVHm9nFiQS5AeusMesEfXCEljNE8UV517QfP/tYycoDPO146UCjNDzBMSpikXse8MfpaVjrwcfzh5wCkNmonrVHuVwZIVyuOAnvVl/92jbuc38zDPIxs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(376002)(136003)(44832011)(66946007)(6666004)(83380400001)(316002)(86362001)(2906002)(6486002)(1076003)(2616005)(6512007)(5660300002)(186003)(36756003)(66476007)(66556008)(6916009)(38100700002)(8936002)(52116002)(6506007)(478600001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hm41HCjDcoHaVX7N59AwlgrFZg0iobTLp4teSJpTOtC09h+wXs5fxH2pdvEv?=
 =?us-ascii?Q?E/IkGaH+QCer2iLZft73X6syZIEnPBgkbogRbs5eXqyYKe9bGCCWqoRh/UNH?=
 =?us-ascii?Q?DY23JjmRPA4mKnFTXCFzKCVWTw1f7SIG1uimXUvPbsoneoM22NEKRpofNMrW?=
 =?us-ascii?Q?JBOgVY6BFRyttqIzTR5OkarQzt2h8oq4kxbwN3GTc3hf3c6xrNOWtPTSUW8X?=
 =?us-ascii?Q?iTl87+BC+BpyVKqfEcyL/uG9dY4qLj03ssQ2FqBc2fXBGcAAS7DXjVYpI1T4?=
 =?us-ascii?Q?KdiF6ksxeJeFhxy8YN+dXdO8Dr8UVQClGMi8pyzWJRVGJrVVw25hlLlQr1JC?=
 =?us-ascii?Q?jzmzCbjU689mJXqRO1qJjLfiadBcdMdaGYNgQS8OwLvpQEqeJ0cxQGtZMr0D?=
 =?us-ascii?Q?t67oC61LS9gUlyJx1ze5kxDfL5hmY/38VcTq7W1BKvRJhI5WWHNEo4cbUAl1?=
 =?us-ascii?Q?91D7IjDAM0XJVIbpUVWv5/XGYQ26qKWcbimFSW0/9sx4R4hQLA64SVOb+wA7?=
 =?us-ascii?Q?iaiJufZ4QKR08FKbv7vASCyDwy/UBz7kWbUGQouqiHxZEpeUKQAGyzBqxawV?=
 =?us-ascii?Q?wqmrdxAEvMrIbc3FJz86qx1j/6UpMcnSHmvQtbbvIfeKzxa9XJhsJaWevSmo?=
 =?us-ascii?Q?YbeCPiegmoKYXSvu8MavVTcw053w/owNYUeHlvw8DPK3hZcKLvBmiItO6diY?=
 =?us-ascii?Q?/rVxvzEd6m9+rUSaQW+7Va4v5hiSHTpZ3ma2QOu0a2LCCEWouhE64+IfM7gt?=
 =?us-ascii?Q?WJkjOOyTYintR0wT8bjRB1/9eoXkybXCD+I3GpShHjBiUytI0hMSrrvX4L9p?=
 =?us-ascii?Q?z0agf2zSDqGQBuk5QkYht0SpQVyaj7BYwtEh7P6OsgburXu8l1XKwrVzgzFZ?=
 =?us-ascii?Q?NSWR7YMIkEyN9hLesVTOKYVsmkagq3eueN71xeh8+xlKRCUDv1IiyWJJNPTv?=
 =?us-ascii?Q?SD9C6jgnmNpTNxgFXv8ypehwbEC3EOoRxRFOo/sjHggXg8XT5u/6+an+0HLo?=
 =?us-ascii?Q?kQMPP08qtyoOpoOVTNIypRqZqpXUvTDpVpq+A6GBm2ojFANmB5D1wQf/HZpr?=
 =?us-ascii?Q?XUb9hAucg5ZM7P4TKWlSnAv+nWR4U+Fh34zy3+C0cn4B0zZ18nsGVNUdlY8s?=
 =?us-ascii?Q?P8x0qh8OC/Fu5soSLYVg9e1SePc/yDBB7E7f3HmK3hbvT6isFSsqdy6x5DxO?=
 =?us-ascii?Q?Ya+PHTkODQp584Eu7d32x3oxmZkMDACtEhvxyJHzHp4aiJP31UwGWjKhdWvf?=
 =?us-ascii?Q?qQUyy/zdBuX4xq0NvArECcypMFTOr6meCzIZU9gFiyiEolYwl5HmbSDgtsec?=
 =?us-ascii?Q?znlVI1oCwCTTCTFMnRr+4yXbiCjXqzDpMEODpHRPNrSPR83aqebfbVQXEwDu?=
 =?us-ascii?Q?0TPfscDV5DoPETq1zLanBRbzENJC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bb719a-fd14-4775-b1cf-08d96d79358a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 18:49:20.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1rjUxAE+OMRstrT4bk1bnlNFI7YYhVd5pGLrYPPNeuXNwBa9GDQy9PHSF59ZZUJ4Fi1wfguYU2sd9uL7wBlhD0IINJ3sH2yupen9809MLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3221
X-Proofpoint-GUID: ZfmhHsn6cdKoeqGsjNTtXgrRjBHCk912
X-Proofpoint-ORIG-GUID: ZfmhHsn6cdKoeqGsjNTtXgrRjBHCk912
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_05,2021-09-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109010108
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backporting upstream fix since the uprev from 5.60 -> 5.61 does include
some minor functionality changes.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...ter-Fix-storing-discoverable-setting.patch | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a7b628ce1b..0d30b1a3f5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-adapter-Fix-storing-discoverable-setting.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
new file mode 100644
index 0000000000..c2a5edd226
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
@@ -0,0 +1,100 @@
+From b497b5942a8beb8f89ca1c359c54ad67ec843055 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Thu, 24 Jun 2021 16:32:04 -0700
+Subject: [PATCH] adapter: Fix storing discoverable setting
+
+discoverable setting shall only be store when changed via Discoverable
+property and not when discovery client set it as that be considered
+temporary just for the lifetime of the discovery.
+
+Upstream-Status: Backport
+(https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b497b5942a8beb8f89ca1c359c54ad67ec843055)
+
+CVE: CVE-2021-3658
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ src/adapter.c | 35 ++++++++++++++++++++++-------------
+ 1 file changed, 22 insertions(+), 13 deletions(-)
+
+diff --git a/src/adapter.c b/src/adapter.c
+index 12e4ff5c0..663b778e4 100644
+--- a/src/adapter.c
++++ b/src/adapter.c
+@@ -560,7 +560,11 @@ static void settings_changed(struct btd_adapter *adapter, uint32_t settings)
+ 	if (changed_mask & MGMT_SETTING_DISCOVERABLE) {
+ 		g_dbus_emit_property_changed(dbus_conn, adapter->path,
+ 					ADAPTER_INTERFACE, "Discoverable");
+-		store_adapter_info(adapter);
++		/* Only persist discoverable setting if it was not set
++		 * temporarily by discovery.
++		 */
++		if (!adapter->discovery_discoverable)
++			store_adapter_info(adapter);
+ 		btd_adv_manager_refresh(adapter->adv_manager);
+ 	}
+ 
+@@ -2162,8 +2166,6 @@ static bool filters_equal(struct mgmt_cp_start_service_discovery *a,
+ static int update_discovery_filter(struct btd_adapter *adapter)
+ {
+ 	struct mgmt_cp_start_service_discovery *sd_cp;
+-	GSList *l;
+-
+ 
+ 	DBG("");
+ 
+@@ -2173,17 +2175,24 @@ static int update_discovery_filter(struct btd_adapter *adapter)
+ 		return -ENOMEM;
+ 	}
+ 
+-	for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
+-		struct discovery_client *client = l->data;
++	/* Only attempt to overwrite current discoverable setting when not
++	 * discoverable.
++	 */
++	if (!(adapter->current_settings & MGMT_OP_SET_DISCOVERABLE)) {
++		GSList *l;
+ 
+-		if (!client->discovery_filter)
+-			continue;
++		for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
++			struct discovery_client *client = l->data;
+ 
+-		if (client->discovery_filter->discoverable)
+-			break;
+-	}
++			if (!client->discovery_filter)
++				continue;
+ 
+-	set_discovery_discoverable(adapter, l ? true : false);
++			if (client->discovery_filter->discoverable) {
++				set_discovery_discoverable(adapter, true);
++				break;
++			}
++		}
++	}
+ 
+ 	/*
+ 	 * If filters are equal, then don't update scan, except for when
+@@ -2216,8 +2225,7 @@ static int discovery_stop(struct discovery_client *client)
+ 		return 0;
+ 	}
+ 
+-	if (adapter->discovery_discoverable)
+-		set_discovery_discoverable(adapter, false);
++	set_discovery_discoverable(adapter, false);
+ 
+ 	/*
+ 	 * In the idle phase of a discovery, there is no need to stop it
+@@ -6913,6 +6921,7 @@ static void adapter_stop(struct btd_adapter *adapter)
+ 	g_free(adapter->current_discovery_filter);
+ 	adapter->current_discovery_filter = NULL;
+ 
++	set_discovery_discoverable(adapter, false);
+ 	adapter->discovering = false;
+ 
+ 	while (adapter->connections) {
+-- 
+2.33.0
+
-- 
2.31.1

