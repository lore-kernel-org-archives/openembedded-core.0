Return-Path: <mkelly@xevo.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0059.outbound.protection.outlook.com [104.47.38.59])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3F571A50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=kKSYY88we6ykULb/OGYdbF6sPeZpoCoH3q53lCCagEI=;
	b=vJEctuy6UI3Aio1cfeZL1ii+0Zxcj4bek54YWHVXJYXyhr8GqwSXxgjxdN/UJ2Yizn7BtQkumonBwey+pqLRmAEvzEAxyyC4RypbjEAE/4b7VuyvU4UV0Sy2op7dTO9X6qJpSWE/amFIBHvTAC912YAYUxaS8GA4qbg6ca9RwXk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from willamette.Home (71.35.172.156) by
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Mon, 16 Oct 2017 16:31:57 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Oct 2017 09:31:43 -0700
Message-Id: <20171016163143.22844-2-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171016163143.22844-1-mkelly@xevo.com>
References: <20171016163143.22844-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: CY4PR06CA0029.namprd06.prod.outlook.com (10.173.44.15) To
	MWHPR0101MB2942.prod.exchangelabs.com (10.174.170.13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c922509-ffe8-44f0-d181-08d514b36b90
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:MWHPR0101MB2942; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	3:0c+TSS4eeke7TQWdrp2jIkB3G0TbpoLoWNK3yWTeDkOzGVTnZGPWs1a9cF+lBSVS+PbQNQ7NKPlf8pzTt8SWEl9mqnT3sREXOSJVmdib9NE2PmJb/LZN+jzfL7d4HcrZt3pT/6Lvxis3hNH2CZO86HMD8JJGAfRJAaMlSjHB1Rq01a73xI1Y3T3Qyj40L6KwskAYTMNWEE+T0bEptaRo+KKZ8hvhXOcgKse7c6yWry5lR+YeaDpqg0RxiemiO0Bc;
	25:V4C7+INzOyN2gk2Px6FakMq1u9a0qVID3zXdCNlcmCBBHq0vyllgxfHKu5PBGlM3zCfngdJ2bBEH4E1sxMO5LWZDO3TSdDEowl8Jm/W+A3AhfCSeto5VmWwvtLTVuBGMaIU5hVRBux+fZn3atMm8/rjYn4qx4vDcb8QY4JCfU+W6UdpwEPSLgE1YEAwC3Hg3XZwXd4F+2vy9+WVeiIiXLpFoZNTXgN6dzbLTID6L4IhAdz1tE3glkZ4wFYdWFGREvgql6m/YVoU5UMNGU0cpQ7PJTRgUweLllvdK20zaDOTgtxsquPcb3S16bwQD1OjHCVtRWLTH39X2wKpkO7YcFA==;
	31:9uapRp+kQmQiM/PsaxxqtkEYchNgZw0rxen2cxqNrlUA6v6/MInnuOVoQLSwkgDyrmqVXpVBvTmOY2V/NpoEdWkRTAQFcsPBeFBe0LMNpsC9311VuoQ3PNxVaAP/Kf5SPrlFY+7WUrKiLyq4F6DOymdieNZoh9k43mHwneCgSv6b1QwtYKVv0D1YTw34bEElxcE2m0x/Ys+8RvhrU2vRZ2LrP2/myKlAkb5j2+O6NCw=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2942:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	20:2mYHKPgwkbUy18hSr/y00rDdcksHzaH7EJyF4SlDbq1yaPOUGMWYdpaChYmPNe6VHrac+w1saSa9sboff9YhwUKjJOudxzZT3pB7UBn7QcSHnYBfqcSj6ybm7ywxOdDgrYHBVlbl36a1EdPoY6mpRqq08yagzGifT9bwMTQ3ApWUanx8kawV0+41HXTRaNUim0ffoCa71olToKs//FNBwXvzf+mdOzrt2GGvAR6KAqUBxVYWkaEYgdoBhcfYpprprq9Mt0q8i8vv/00ea8PXG/+PZFvgt6Wx4ye8cuBAt7Z+Aw9i+GPx5gNJPWTZVtgnl8TDhiqGHJrcJEKei81DdfVEpJ8eHhhi41MgomoNcCGQjxs/IB43hf+Fa+BPQV43Ipfv/klnOkwNwcasAXJHzTVt02OK2YMjgFGo68VqxBM=;
	4:8fd/yeSjdol4SmPiveZ4JAaCezLJ68Ynt7mLm9UGC+rGjs/feTtMCu8W2wG+K/9zMWN3ta9AH+ikaoTkHZsAj6QZhYoWd36DYjO9CinY8V8IKgTNGGoVsqAUG8ZidYFCchDnMWdA1X9rT7Rz4fqMP1jLKIgl2wkhtIPAwga/LmDIz+Mrtcm0s4eVKqjTH8/lU2mLRfsywCE/r3GKH/9A65pT1amHZS8YY8oe5Y0O7uLaQVbE8mU8TJ7KjPxjkugt
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29422D47EFE87B8B63A6C12AAB4F0@MWHPR0101MB2942.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2942; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2942; 
X-Forefront-PRVS: 0462918D61
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(376002)(39830400002)(199003)(189002)(6506006)(6486002)(478600001)(316002)(68736007)(1076002)(36756003)(16586007)(3846002)(6116002)(97736004)(21086003)(86362001)(5660300001)(6916009)(101416001)(69596002)(2950100002)(189998001)(16526018)(6666003)(25786009)(6512007)(5003940100001)(33646002)(76176999)(47776003)(50986999)(53936002)(48376002)(50466002)(107886003)(2906002)(50226002)(66066001)(105586002)(2351001)(2361001)(4326008)(8936002)(106356001)(305945005)(7736002)(81156014)(81166006)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2942;
	H:willamette.Home; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2942;
	23:xgn3sPkQqWS20MVoLafeioIr5lrzDj0vLRRK9cR?=
	=?us-ascii?Q?LT3mfSe7HSfbrwTZbSKE2SzVYXIqMBJ8caZUdJRNY1B3DmIdAQ6kTiLd2Uor?=
	=?us-ascii?Q?sOaV6dqX2imAMT2sde/n32/+VhOr5MAApyQQCitJ+FmKBv86yz12FdipkQE3?=
	=?us-ascii?Q?sZBvk+GwJA6gBg9KljPeI892JcXLsEl+XrnJ3O64426JM0tIa9WUXzUKEpuK?=
	=?us-ascii?Q?ToYvbg61Vzc0dfqgVWIuNhaZk59CmMKjehjIoRPIJDWa2iCTvpK/b/qrkwZQ?=
	=?us-ascii?Q?lW/GIvgVqhyqdS9PsmxUSp11pHowu5jgJin6U0A5PqM8cw3WnCSdI/2ZBQjs?=
	=?us-ascii?Q?A8Occ8ddjbC3I9tenHHcO9OUSEBZBjfABra/VZkDOVN+Obii+QkrcWf8g8Or?=
	=?us-ascii?Q?0Nx18Im8vCrYEx2yql/tYYEO3mCxRTEM49yq0koHLr11lPNEkKigXI8SpN4A?=
	=?us-ascii?Q?O7gTRmpK8L03w8YXu1q2k/jm/avq1wcFVih31gtDwAlzmkuFL7msizmY4iZg?=
	=?us-ascii?Q?Kv1e4VTmnDA3UwuLY5BDs2RdU0xAr7PwVpPVN4CS+raCyTjsfadustApP8WS?=
	=?us-ascii?Q?eyNCzlvjLA20Y5ouDQrjfxoAASRpfOQBCFHIkluh2rgvGrgDqPJ0Q2kFYm7d?=
	=?us-ascii?Q?AVa04FsDK8gYqB83HWaWGuP0tg6hz1PTuEisAss/SrTWuQ6TkVib30bhgHiu?=
	=?us-ascii?Q?Npy3ikWC0O7v5Girdq2ZYMC+yDqlGadS3T2SI3XRoO2HFT0coz+HerlNc1Nr?=
	=?us-ascii?Q?DMPrfTwFauhzVMsAzQ3zwbSCPXEvC7pkko+HT/Bk6oIpnStD1ok1nEEy7tDQ?=
	=?us-ascii?Q?hB9GUnx+7QL7fUFBtF8ZhQCVPJwGAZM3XP7HacC+vZHjhSi8tT6mfuswsELQ?=
	=?us-ascii?Q?f9Cttv3TFLdluqfs8XjKeDBnD0NFxOVBaCSzojUXXt4us2fe7o6GjwErTCcA?=
	=?us-ascii?Q?D/ma2sdewp8XxKTSy35TuQo9uWfz/yZMD8U1gbqr0l8yRMmB226WbZD1JWrC?=
	=?us-ascii?Q?sH7TyM6f/n8UQtIl64E40g1jPMDT3Q3DeKLaKOGf1eSOLMPKKuzFyt/HMciq?=
	=?us-ascii?Q?/rWG1IA9FsO/DlCGO9K3U+7AuWOuYn9k4oDUpkd9VoDyLqrcYi0pBptuYfI6?=
	=?us-ascii?Q?KQGbxEeIX6+0Oo7P4vExyRXm89ElfTp2xu0bLPzrJbvMVpsROQ40Zeix4zXZ?=
	=?us-ascii?Q?/poLcQjwJmsbB0nmu4maQHhCNDRdElBkMCM3P?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2942;
	6:S0FTc2prnVQ+ykP4inKH/SvwjFKro0M2njMxHJwh0dSnZnTAsfefr1LbNQf1qhNj3JL/6t1bPIvePI1+XV9gwwBvdPvijkGiqJDKt4/sE9o/8691m2oAARt/xrSruF/49HQBPQTVTBfHBqo4w/VYfVkkwss3lsoUjdDdLDYD6eXaZT3Jt8e3G8qBbe4U8RdjPJK7HFLslV0W5rX7f2+UDsDF8PxLextvE8gg2wmFphSdbcSlnPvMTtlAtaBkG9Y6rFOyCWSpDUtA1TB2tNa4FOpQH1Ohy1tkbAKYgyelp6P/MT89UDXjPLn/nQ5lDaVEl/CY2L4K0tbJKu/hSraDkA==;
	5:np3PXet9UDKBcDMg417L4KNNWFxb3G5ZoWDjL8PTiXHLwLoIcO4lryLAKmKHm8xQLLzHi1VlHugSXPZ98dsx46cdFuAs1KPQ+dpvJY0YqCMfmrExPsRAnZ0mlO0hVWyGXJrxFqgGnwc5CMHy/nnGvA==;
	24:y9A3Q28jrbHDZuZsTYBlnlGumWBaH+dfzBbEFVsfiyzlkkh/1WmvQAY0aVPg0vuIEu1w3uR369picSFSkM7tk/W5+rFVPcb7WoX3gnj6Yhk=;
	7:MAQT2OB33n7w6jOceZt9pWMBz5hr3YT4zjaEpnwt8/cF0Nao5r3tYOgvbLgfEjI6o5ToM3czGY9SGfnmsfipMEKdmVoQlnLtG+y4+4/49r4l7yiLQZM6KXX1F8iix4FLauOSb0Y3k0yyF3hK1Wo/K7rtubChSnmbsRWktjOJeV6LSPs2QaQsMd+YQUpyuytlOZ5aYxCnBRl5+Y1novPuvaJFAWxe4W1djQph61pEApM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2017 16:31:57.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2942
Subject: [PATCH 2/2] systemctl-native: explicitly check target validity
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
X-List-Received-Date: Mon, 16 Oct 2017 17:04:23 -0000
Content-Type: text/plain

Currently, we parse systemd service files looking for valid WantedBy and
RequiredBy lines. However, invalid lines get silently rejected, causing recipes
to build correctly but then not get enabled in the rootfs.

Add explicit checks for validity and print a message when an invalid target is
found so that the user can fix these issues.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../systemd/systemd-systemctl/systemctl            | 37 ++++++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 6e5a1b7181..3bed407d9e 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -1,4 +1,24 @@
 #!/bin/sh
+
+check_target_validity() {
+    local line_reg="$1"
+    local service_file="$2"
+    local unit_types_re="$3"
+
+    local line="$(sed $line_reg "$service_file")"
+    if [ -z "$line" ]; then
+        # Line was not found; there's nothing to check.
+        return
+    fi
+
+    if ! echo $line | grep -q $unit_types_re; then
+        echo "One or more of the target types in the service were not recognized as valid."
+        echo "Service: $service_file"
+        echo "Targets: $line"
+        exit 1
+    fi
+}
+
 echo "Started $0 $*"
 
 ROOT=
@@ -120,15 +140,18 @@ for service in $services; do
 			fi
 		fi
 	fi
-	# create the required symbolic links
-	wanted_by=$(sed '/^WantedBy[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
-		        | tr ',' '\n' \
-		        | grep "$unit_types_re")
 
-	required_by=$(sed '/^RequiredBy[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
-		        | tr ',' '\n' \
-		        | grep "$unit_types_re")
+    check_target_validity \
+        '/^WantedBy[[:space:]]*=/s,[^=]*=,,p;d' \
+        "$ROOT/$service_file" \
+        "$unit_types_re"
 
+    check_target_validity \
+        '/^RequiredBy[[:space:]]*=/s,[^=]*=,,p;d' \
+        "$ROOT/$service_file" \
+        "$unit_types_re"
+
+	# create the required symbolic links
 	for dependency in WantedBy RequiredBy; do
 		if [ "$dependency" = "WantedBy" ]; then
 			suffix="wants"
-- 
2.11.0


