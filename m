Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0137.outbound.protection.outlook.com [207.46.100.137])
	by mail.openembedded.org (Postfix) with ESMTP id 86D4A60589
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 20:31:15 +0000 (UTC)
Received: from BY2PR03CA047.namprd03.prod.outlook.com (10.141.249.20) by
	BN3PR03MB1415.namprd03.prod.outlook.com (10.163.34.22) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Tue, 1 Dec 2015 20:31:15 +0000
Received: from BN1AFFO11FD051.protection.gbl (2a01:111:f400:7c10::183) by
	BY2PR03CA047.outlook.office365.com (2a01:111:e400:2c5d::20) with
	Microsoft
	SMTP Server (TLS) id 15.1.337.19 via Frontend Transport; Tue, 1 Dec 2015
	20:31:14 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD051.mail.protection.outlook.com (10.58.53.66) with Microsoft
	SMTP Server (TLS) id 15.1.331.11 via Frontend Transport;
	Tue, 1 Dec 2015 20:31:14 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	tB1KVDQp027114; Tue, 1 Dec 2015 13:31:13 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Dec 2015 14:31:06 -0600
Message-ID: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD051;
	1:1D9rP3YWKnnjlueMdTeb0unkd8HZoPw/mr0rK+zZMO3Hu4RBwYr8i803OQh8Z4AHyf6HB7Tp/aTK/JJHmmywkYMYaLrnnsMObC2FoP5vyOkd3ladTU/hesL1JRQuYToxygPp2hhz2WiPt3/kv4Y5zbneyXoYrd812a5XWnX1xXXtoFAk2W02tmuDL4NkW09a/rSkge1CPIUDeslgbt/FmHw8L8MMfonAs2koStXmA1gJmEJni27GuDN/dR7n2xK0yxIcHEmRPrFj+j30VmIyEGnFdOJFRHkKY43OJzBuGUQI2dX7xkyjbZwKh4CQ8QoXFnBDFwnxVGPHOucHwnahIv44ujSJwjOJQsdv6rMT1D4APZSdllKTB4U+FX2hk2761qicVK5AjLIVW6xtOE8zQPAsVLP/Io3hMdaw1iBAhPM=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(33646002)(19580405001)(5003940100001)(229853001)(2351001)(87936001)(586003)(104016004)(48376002)(36756003)(5008740100001)(6806005)(450100001)(1220700001)(4001430100002)(85326001)(19580395003)(86362001)(1096002)(11100500001)(50466002)(50986999)(110136002)(53416004)(189998001)(107886002)(5001960100002)(47776003)(106466001)(77096005)(97736004)(81156007)(92566002)(50226001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1415;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1415;
	2:v+J/vnI86DeVoYIJn7wq8qGjuM40QoP132GcJXw9PWLEhyENclhSRDNr1Ucnf/kx8f6/nTL6UXtRIxUfJ0FDkup39XXnSwYWU29HzvstgT9jX8k0ORydRFvvKm0EA0QkR130YDTXgCum3FGP0PZKSA==;
	3:gPL6nB93bMYaeKS3HQYO7U0OWsqk1bQG9DJGg0M2sydt5dFKWpPclQM0Pp4RXu6I7nlZYBiDkVhE1VDG5Eql/fELxpbTflt7hGZERjutIG3TsTaj4L0hgToYYpn61KwqKKBIlaJW9m0yeGKW0IMQxq4oXYcLgq6c85gIv3V1DYJTULs4LFjR/quMGv9Hw7mr2BQHbJpUDBV/LfKm0uztokLPjVdGkqQsir7idBOIEUU=;
	25:JBSTo2oZsDrdTwBdLYK0vETDAJupRApBDE3kkHQsB0Xj7O3/QRlED+i3/yXZxu1PgLOK2FJd1NsavBmLf30JNTla6y8ncPp5HXMejpeVFolp4bbCASca7MnJfKyUl0zdXxAaDFpB9oF8sPhqZmMpNNWDvge7vl6ciB7voWby41hi1kY21QFDW5cidnSlykhjawEImDQVqcRMZhaIDosqjbEC8T/sOibs7YMnGeIt2GOnSSIjOxvuRwq8ZFCpOgFQ
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1415;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1415;
	20:giA2aZ1KU5UWIxEA63MovYJgR0XAmeq78s38Nr3jMKhm5E4i+vCAmGgQCQn/Yph7aoxPY6GKiX542+ehDsk/mFZ00nli1StZG9HNE+u3/jW1JkDr5DqTNLlFRmrqd2oFkQajGyXIL1/Yt758vmxDT5fAzCtdaxZ403DZmdZIc30kbCtovYcgJqmZq63luidEPeFjir/3ICArX2V48GIQBOkhW/q34R/Nj4sAN8Ncpurjm1l0wgr+OXSB1cSl7xOJVsAxGRDafk8TW97z+Axl11oGS6f1gv7fAzIWXKlEGnAqIKU5g9UKWJYjJ1OmJOY3ZTpJ9ilkeCwAJ7ybGka98MHcS72W59voBrvfbGww5AA=;
	4:k/4ZdEWTwJefsLroGglJqf1GpuSXBh+lawr3m1QI5HZd4O0o9RNx+SGkKqEbz5L6Gw/3bXfD2jI8pnG4LNQ5Ph6a2E1hThIk8iae6xY6MgvBdshw+HSewfDrQ2CdvnqtTDPApbWfIOQ0xKJSJPUwKVFRgtlApDKAcSHMrx7iQHyft0tl6oaVf00Wajbn0Q6DqFILek4U/XJEnt1g4sbTCGENFHXHSLjQMO45QzueJ4xpvPp0WJxloujD1wPSI+ZYDJsm62mM2z17Y2ahAsX8Gd3YjsuNPIZYOqH8mOmeAd5WnB9qTnCQl1W7YF8U5OSEdsP3VGTkfyA44w21o8MA+e/kxD3LFy83Pk+eXcBzPrZnhqXBcDvum2b+ntHuSoZBkvyF4TnfJwXKfPTUwF+BxEwcq/BeZ4ybl9xhyVTIuPk=
X-Microsoft-Antispam-PRVS: <BN3PR03MB1415F9FDE9D196E215F13A4FE80F0@BN3PR03MB1415.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BN3PR03MB1415; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1415; 
X-Forefront-PRVS: 07778E4001
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1415;
	23:M1JISBs/NApmjzJQuEmhk8EdUJu/eS8Ctt4EvQmvL?=
	=?us-ascii?Q?DWv3mmP8JRqp+zeCoc/0T8d5TBc1ZxSbwa/KZS6o/LRlPFLG81wer9czllR9?=
	=?us-ascii?Q?eI7GJQ9uZWczJJdwSvNOjgBPY4TZXeFLCVrXP/Tpp7BQJJP/Gbz95kUWaIcM?=
	=?us-ascii?Q?uk3UCnRkahjmPQF+ZHX8PtA2M1BKWrTOPRaRM/+wT7UDOrXLfada+HIXEzSl?=
	=?us-ascii?Q?xU/oEAGyZUdFiD5TYRs705+KP54k4VuekVoHNoVod9EZH4duAv+TK876+70S?=
	=?us-ascii?Q?ExVFUBCCXoD2PoNPExdrFO8xTpTWrM9DUiEf7b/pKL4VivQPp4AO5ymrfFFH?=
	=?us-ascii?Q?2i99XngAum25nvdW4+6znTVahK0UmspqMd1i3Be8o4y34MNgVXa65GRHixBA?=
	=?us-ascii?Q?JGgE4/YHH9jwt5PQJ246OPo2oYqCxbij/UIacLV1ps1gYrHieK9xNTzY5L1Y?=
	=?us-ascii?Q?migqLcn91LYW04blGm3vziiPAeXxnpSmdTKsPs3ITFMHBtsK8oCZ5wsO2ymw?=
	=?us-ascii?Q?umQDyIborjWdBpETQZC7JHMxbdOlKDOw4ZaTnyAjlLj20+EPCQu0GFM0w95A?=
	=?us-ascii?Q?KtXFruHn/81ISrXjE5kaUAjiXuYnrXICNkFlur1KBtKVFOeYWCYNEpx5BQrv?=
	=?us-ascii?Q?4qZ58K+8CmWnR8FWUzDJMz0wiX+bTMK9+19GHidx4wRPaOl1oL5AABLkkNrh?=
	=?us-ascii?Q?oRJSf3VAhF32TBuGlRsrJg/gZWAhV8nEckoDAxcT3wXOI55rTqZZqJ+aAReh?=
	=?us-ascii?Q?lMKjymCpZr045ev+fLnjfZ/rEFeYN/rZHyBMFPGrX895Esrme66xhfMc4zof?=
	=?us-ascii?Q?X1H/LcC0LoAOGpcZQ1rU4WRq9a0RabBP01k4+o9wSw02KZeiPdCCeO9W/kxe?=
	=?us-ascii?Q?HEYFq/gU2ZPBEwWI3Kwn21DGH+wJ4N3Ekm/3e0mUo92l2kSPwB2ZGUsrN1Gc?=
	=?us-ascii?Q?Ik2dAo3yLwEIqC0K6t7wBF6GJ0ZzKXnWlSNfMAZWZa8VYHXSqzOcRTTns4Xy?=
	=?us-ascii?Q?njZDVFImjrVwux2VpWB1nkwSRYw0tce6l5rkSAb79ydiPExhuPcVxeAOpbTu?=
	=?us-ascii?Q?L/Tu+I=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1415;
	5:Z8s/BYI4WXbOD7vP2nXtKl4vTVLHPhBpspvFTDIEOXMMMvanF5wj0HcYqIvxh+/8AI0EruH3XRWyOTtfsWJ4XWxapMtfjF5E0sX1j3fl/YRrI5Sa3qsJ8+5hM11XDSqAwIqcry6IIOCopNUhg8N04w==;
	24:YxZI3gyXwj5DFsOek7cg3b4hwqxT6wKXrMldQCjCWAsZztizfB+uAUA/ISI3JNQG5EKcZ6YbW1oz3zbG/uSWlEBdjLjpfZ1hDwX7xtNHwWY=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2015 20:31:14.6900 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1415
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Subject: [PATCH v2] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Tue, 01 Dec 2015 20:31:18 -0000
Content-Type: text/plain

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

When XWayland is configured, Weston must be started using the
weston-launch utility.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston-init/init | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 2e938f4..d1e902f 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -38,7 +38,15 @@ case "$1" in
                 chmod 0700 $XDG_RUNTIME_DIR
         fi
 
-        openvt -s weston -- $OPTARGS
+        # If weston-launch exists, we're configured for XWayland.
+        if [ -f /usr/bin/weston-launch ]; then
+            echo "Starting Weston in XWayland"
+            export XDG_CONFIG_HOME=/etc
+            openvt -v -- weston-launch -- --log=/var/log/weston.log $OPTARGS
+        else
+            echo "Starting Weston"
+            openvt -s weston -- --log=/var/log/weston.log $OPTARGS
+        fi
   ;;
 
   stop)
-- 
2.1.4


