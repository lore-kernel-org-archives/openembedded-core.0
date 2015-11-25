Return-Path: <Tom.Hochstein@freescale.com>
X-Greylist: delayed 959 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Nov 2015 23:33:09 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0101.outbound.protection.outlook.com [207.46.100.101])
	by mail.openembedded.org (Postfix) with ESMTP id DB7146AC4C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 23:33:09 +0000 (UTC)
Received: from BN3PR0301CA0081.namprd03.prod.outlook.com (10.160.152.177) by
	BN3PR03MB1414.namprd03.prod.outlook.com (10.163.34.21) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Wed, 25 Nov 2015 23:17:10 +0000
Received: from BY2FFO11FD041.protection.gbl (2a01:111:f400:7c0c::132) by
	BN3PR0301CA0081.outlook.office365.com (2a01:111:e400:401e::49) with
	Microsoft SMTP Server (TLS) id 15.1.331.20 via Frontend Transport;
	Wed, 25 Nov 2015 23:17:10 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD041.mail.protection.outlook.com (10.1.14.226) with Microsoft
	SMTP Server (TLS) id 15.1.331.11 via Frontend Transport;
	Wed, 25 Nov 2015 23:17:09 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	tAPNH9hO005662; Wed, 25 Nov 2015 16:17:09 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 17:17:00 -0600
Message-ID: <1448493420-2011-1-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD041;
	1:aiuu44BbgK+axiU7H65rSK3tuTcHECgevlu7pN6sUh+Bdvr3Mm0OyI7Xep76cyQAimSypjUeRNw+gZyOLGutFnyOmSiysm0MKfpOen+TcpdeVnEie83M+I8Bp+VSOicQVb8r8UPUSbmPRw7aGFLoMFOm5ljfOMx0vwedRCTy8NT0z0jlCYT82GQAkdv+iTVUesZnLMBYTosaHaaYDOI7KVj4+XnERpdkUcEtNodTpz3aXrl1/QhhSXqHS2tmLfweSLtI7iBxxgBOBKzAkdY4F1Px6Lv/dfj212PgWVrQik4luuP7t84gjbfDuXEHeSgxE+Nx5CUvAA7QinbxdTPgmY6S3h9cSq1LX1nnsKFlTQFSKz04IOt8SIXZLdbMlXjBr+zJJIxMVkaBGqFiwSF7JX6J72v0rGcYOMm26sqrElo=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(86362001)(229853001)(106466001)(107886002)(77096005)(47776003)(50226001)(6806005)(1220700001)(50466002)(5001960100002)(110136002)(92566002)(104016004)(97736004)(81156007)(53416004)(19580405001)(48376002)(36756003)(19580395003)(586003)(87936001)(50986999)(2351001)(189998001)(5003940100001)(4001430100002)(85326001)(33646002)(450100001)(11100500001)(1096002)(5008740100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1414;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1414;
	2:QBD+Vg/Wao8Jw0vzrcZo4y9dH0J9Ha0LiGxGDiVlm+zPysV6ZZpUmKVgh6y5YlWwS6j/zNnH4S4A/kPGsTjRCl47EYG/gTSd/wRJnckKAzQKwiD0DuxMsXbo+Bmofar4XSYRas6mzBJbchFRa9Egzw==;
	3:FHRVnmdZiVZa+rtAoc4JUUvEks5lUSJfUQoxo5BLb+HYm5Kyjge/qld8eaL5vmccymYc1yU9SYa/UrG3HkA4Pm7GXJsPe5WWNIdzbarZE0DQw6DbovCai6UrDDxceo5Wah1iGPqiJkgVUiSepsIDtG8vQnRy850BQvShzU5CcEQujf2QT3s2yKr8JIZCcwSupQvfsZcyrMGbwzn4Z3+l2K80wr60JplvkaHslMb45bY=;
	25:j9V8cI+vlahZkE/hAXrmOHuc8kVNabt9bYhqmippcLK5VQ3CzAiTKja0ue53NFVlEmP8FHwVRRE5we3K5ygDMVbdgiWfO5PnofJI+qay4qiPeAKHRjNtnZI8FYsv1TvzjVM3Ta/5SFZyCX825IN0wMJG/vUaWqmvxpXk+46y4vDCpVBvtUjm5UTOcQraMLH2LKTlC0lsap8u43Pxr9f26WhGwYiObZ7X2tj4MvXKbijIvrTEf5kbywv4mDc25oUH
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1414;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1414;
	20:99Kq1t66z4A7kYQ7eD1Mbv347XcqGR06t+NJq4wjF4pn0DN4j1ZEh9t1TU1+g5Sr11svzE0mqgf2L03Z7loegqtz/z6pMkDlMq/We0zwcKaSHga2QMtcvrBMYBCjLGJannZakmVGSTrhTClONa0rriwVW4r6bCUS0CVzba3iITewj+uKA+9SbdJYfVU6OoUOgYcOY03zvIUmHGGr9jFWyKUKCcQNKmg+AiSeX07HJxT2qn+K0sJtlEJjyxlazot2RW3WyY3Gjl1iHnYZfoUxDxjJ1P7+Q7hRY+kYwhebJqt1IhRNSYGCDKUE8mPlLuoCQUl5WE6Z3N7VpzASH748gQtWGmla3BZENt0en5D619A=;
	4:lO7ygnt1T+yfhi64z1Z1NmRQ57iWQbjvEDVwX+GGg/htDFXY8sajL8Ra7c7hquoYYMQjIQPw21kJ5pqIZIFwEDpFqnZCGrAsg7YbFpPF+ZEve3ufKgx9tG0VcJ4+XmNNzbyLHNz2EvyfUiQJ8KWkj0ElMmV3BRLY7mAACuqTiAwzkDW94o0bK51XXRH6egEGIiBvCPkty/e9kqwWc/o/REFD1ysn9foycKMIBzg7/6mI+4CQuwvtKUlNsfTqQVsXzrJXPLDIg55PIBOU/uOdzWD2+7OIMImEr8Zf0ZgxjXTACodtI6phUdqCCeQa6DDPfTyCskldfwzaGE/xJWd7IbKGzlEgSn3a5ZioclwmUp5OuB/M5EVZ3K1cvS7QaMbtfob8LgumAXcx0vrC+FvHtqddw2iP4JenIWH6hLCBOr0=
X-Microsoft-Antispam-PRVS: <BN3PR03MB14141403D015FD64CE3B7D8BE8050@BN3PR03MB1414.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001);
	SRVR:BN3PR03MB1414; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1414; 
X-Forefront-PRVS: 0771670921
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1414;
	23:qjPxG0/klRV1u31jOXcPMAn/qZW3XSlci1U8DqLE4?=
	=?us-ascii?Q?h447nvLzxifp1YFNw6hk0lsZd8gmAHGbXTipuFIYgQKdKxkG1vamoZelENez?=
	=?us-ascii?Q?LQ3eo36avCa8HXXu/dC7MVAM2u4H/aScw97POwSaCjiaS7zsmpEDLP5lvX5t?=
	=?us-ascii?Q?4qJPIx8BRL2ExhyJTnFM83YI9lAutPQEbfeLygg05eeNpEsA1wL+1N4mAMxE?=
	=?us-ascii?Q?hD9F7TeSqel/FSozDv9HI2/c0I8evKZvDsXXn0c2Q1NN/LswKpTQgs1YyNeU?=
	=?us-ascii?Q?JNYIr/X80g7SWjCov7A6+dz4VF6XwmRslzhRXZLU+lDz7N0fhY8Spzrdfu1O?=
	=?us-ascii?Q?vXmWcTjhyY/zO4s3GjPaL9UU6NNmm5I4Nc/JFDu2qiKAI3SRTTdOWyrt8Azn?=
	=?us-ascii?Q?8SfsBOuh5ajIV8I6F5Xtmc6elXM4HtUlCwKsj1qaBSuNwm3E3+Y6TzY+Joar?=
	=?us-ascii?Q?Jqo1VAV7KpCixNTJ6ZlM8pdB3x3HXoVaBx9B0HkDS6iInxifVe88NM+Xw2vT?=
	=?us-ascii?Q?0DVHf/vyzyPJ7X5tG1aXt2EAIDhaWb9CX/27BZhu+MpJxPZZo3syueetZqWn?=
	=?us-ascii?Q?sUMIC+qzTxZf98p8Qyme93NtKctb47cwt7OooA4Ci+YEXfnqAfli5JJHgOB+?=
	=?us-ascii?Q?IYxr+nKYLl3iazEcc8mRYi0MFwo8yAVtTr/gX17ZRLTQ55q6ih0KZtZvIkJP?=
	=?us-ascii?Q?n/z2e0ealn8/qMtVcSSFuJ2+Th+RYh/I1fPDyudI6E6+4Kf8VUfOXqrMp+Eu?=
	=?us-ascii?Q?T9hR3jo603YehPokx40CfiUV720rC7B23ccemspph+GcWzZkYYn9T1Hxt/3a?=
	=?us-ascii?Q?DVpoTnuypgqYYtoies1NQsdGdsTu4GFbUhJsRDxTixizYLEF7i+uhYGwmE8t?=
	=?us-ascii?Q?Cy6AXgiU/sH0/H9SE8A2cOEYyC/WHTykgd/uZr0yBPyi0c168sx2BFC/FvRq?=
	=?us-ascii?Q?b5AXwvWNPfIYWGEHt/EpFfH/NQzEHy3PAIr2+M3Ore4tirNwapZ6Ta3AwkX4?=
	=?us-ascii?Q?3k75pWUliKl1PtLKt+P6mY9xfj6Wfq6+SvdbzcFfyG6ISRLaLyy5oyca6chZ?=
	=?us-ascii?Q?T15eHg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1414;
	5:yu0/tBIeb7CLI4rG92FUzQPMlDwlAMGAkJi+q6OzZvrKEhPzsl39kvPPdLqZuQLeMzY6EqXoQATdKcHvuqC8kVI3XTZUcKaSt7WS1Qq28mIQVdPs1D1T6BuCZSy2xiOHPTcxHcjsSfaFDJXaA5Y+cA==;
	24:PW2Zp1+sBIUJCQYlxaDnt433gZVfRt1M2vMOMdVwhQdGcj3EZ/6dgsTjl9AAAZcUskL6lhk4fk3mjF5R0q81R0WJiP2rt7PrgXEnalc7qqo=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2015 23:17:09.9704 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1414
Cc: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Subject: [PATCH] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Wed, 25 Nov 2015 23:33:19 -0000
Content-Type: text/plain

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

When XWayland is configured, Weston must be started using the
weston-launch utility.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston-init/init | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 2e938f4..1d4e577 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -38,7 +38,16 @@ case "$1" in
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
+            #grep console to look for gal2d-renderer.so. if no failed
+        fi
   ;;
 
   stop)
-- 
2.1.4


