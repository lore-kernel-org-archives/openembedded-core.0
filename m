Return-Path: <Tom.Hochstein@freescale.com>
X-Greylist: delayed 1016 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Mar 2016 23:34:51 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0112.outbound.protection.outlook.com [207.46.100.112])
	by mail.openembedded.org (Postfix) with ESMTP id B04B56067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 23:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JTtnw1fwdH6IprS63Eo3Xe9SEaN6Ve83A8r+/kIgyXU=;
	b=0gGFtcOakIcGBeUNHbgj5rw1eQrvoIKlNXhsFmewfkScsoflRVez6OCJRKiOgv7NcCSMBVf75EfeSyFjgfMONoVEGzZqkRhhfgpn8y8x5+PWIU/01P28TnJLx1Av6tnedpQ0ysYmcLbYqIVCcgAosgZAP887h49B9QY+HvMgbJ0=
Received: from BN3PR0301CA0047.namprd03.prod.outlook.com (10.160.152.143) by
	BLUPR03MB1411.namprd03.prod.outlook.com (10.163.81.145) with Microsoft
	SMTP Server (TLS) id 15.1.443.12; Mon, 28 Mar 2016 23:01:45 +0000
Received: from BY2FFO11FD027.protection.gbl (2a01:111:f400:7c0c::178) by
	BN3PR0301CA0047.outlook.office365.com (2a01:111:e400:401e::15) with
	Microsoft SMTP Server (TLS) id 15.1.447.15 via Frontend Transport;
	Mon, 28 Mar 2016 23:01:45 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD027.mail.protection.outlook.com (10.1.15.216) with Microsoft
	SMTP Server (TLS) id 15.1.453.6 via Frontend Transport;
	Mon, 28 Mar 2016 23:01:45 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u2SN1iO5022049; Mon, 28 Mar 2016 16:01:44 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 17:59:58 -0500
Message-ID: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(3190300001)(189002)(199003)(53416004)(50226001)(450100001)(87936001)(50466002)(81166005)(107886002)(85426001)(110136002)(92566002)(189998001)(5003940100001)(47776003)(19580395003)(50986999)(2351001)(229853001)(6806005)(104016004)(105606002)(4001430100002)(4326007)(2906002)(1096002)(575784001)(86362001)(1220700001)(586003)(11100500001)(19580405001)(48376002)(33646002)(5008740100001)(106466001)(77096005)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB1411;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD027;
	1:NesDcv7e5PbS1FPCBBuekTK5nEB4V7EcY++SVbHVUeq/9wiQiX+gIvZu5QebZNWrkfA3AkaKCkDPRaijsfu1IwYyKOfFT84hzTYR9VoC5+N7mu9U9T6gcYMOBSBV/zKQBHN5I5AIZ6sWrKhl21hwvpmgZcsadNvPaymaPJhXzJl9LLtpljkfNlcHKx3b8uswslzm0DFyYsYQURVV4CUFRRagYT8Ki2/LO7GSERcjRcAe0Ro6FKfhSGvQtaMYczqZuK2oZbnEAjXC+XyBStUAUROqw9988f6jWIJBXgh485q5Lfo4vi3Dzkj4C4s0bGXh4BTSLzY4NNY5YoifKNlfXyoKJBEKWQ0w5HrIqNoDniIxFNqxJpRWJC24j5j+jskvxPM0H/2N4JrJyT8ZGhmVtmO8KYbtuUwF5gsvUmTu443zvaFYhFEzUZR+wkYBHKalRBE9gmER67byc2khdvA7LFSqbGxoTXwJVHWda03wCYUyqex2FFUzQ6yBcsXGVnDYmyd5Pm/plUaeb1UVds881ooIWRGxqfzq2dHdWNjZ24o=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: bf24893e-0762-4f21-252f-08d3575cef60
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1411;
	2:NU5pQ/iSYsyrF9r+p3MoBCbvxZ6NLwaZQZXRDltPf7DOIL5+wtA+LYN0MMZ/wpPe8teJ4lXZLn3sWTAhxK/Mk5RejdK9rwZYg7cESqgyKUKqLl7qGH2LZxiVDJGPRGlUynAD7VP61vgSjZ8KGt9pEzQscuSJ9CgpRVczRd7CYl5PfrtIqCF5FLxfb9XlpM2j;
	3:6Bdm2OIInxLVK7VjhcLPyxYgAdsscR8WI0S6wx8xrYeZHtcBVQCd8er6aZx9ICrrYVlW8v+6GALguo/BX4BkWwCn9E8WLJMLycJbjlw3s9z9LXfETdo35mJW2NbLTzGoWXe/Tv1vtPnB2JuqwtIT6Cb0C6KlEk7BpJSB1M8GFxRTtJoxHZiIDW/c4hftHPVu9sebLnz9MhJh/UQs72z+1HJndAV/L/Ny8RHDBuhDK7M=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB1411;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1411;
	25:U1YTEBzej5wiYF4TEWZrTk6nxen8IONmZUNGbx7AbslOQXIjpJCzvz6jO41NeFiOVYOROdWVqSaGNCqkGGxZDHLL7tWZHb7yGATIcgwBi6gcUXOsVu1oC4ZsX4WQqLB84iZBM+RDX3q7pF/2V0MxwmqfclDw8hUwSrw885oleHA+W3A6GuuiiUxc2r4C3kJZCjNgv3oBOgF/WiWV2JEp+9/AXa2QNv8r6kScLwXYrLRznU8u7utBL9G0d+r4Ruvpy/+b0bx9E3L7UAIAXaPQnp2cKB6toKftx+eOMYa/Bv2zoMmhieHyl06DL0IEbg6xRnTJrLrOzS7BWiXe1pg+9+IDcLkUIS06e582VUYYe7QHnSYoIN0nuJm2cwkmv99VovOoUWGuYHlYAsINHz9VBu5/V4ZQ8tvz0YqY+obR7kaER185QLGkt9cTNUVcWxEc+ql9Rlmf25xN01z4XIRpt7ZHfQ70tHE6Zh+w829txEYnO3fzEe6LMu4tZUK+NhP1G+wPP8nYNA4KFvHH7IfzFQ/kj8dfc1z5cbNIFVI6iLA=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1411;
	20:5NkP7fO0AG8Hc1iX2Xfe6onD9l4uuzcyBo3gyS8LKdykVQKkvQFHw5/jqACYQjeRbPRirc4W2eMqHc+LK0t9DThNPEUDULKkLeE/L9dt33D89qsBXV7fGknHR8J09JqlTXNQnGMOd/lf/Vfynl8ASzqyYGiI3Q3shSZQWBR1m3MNnlUZZKiC+6/LAqThfFMJR1NbiZHswV1S3yrVSXTtKRA4sWPm9ZyUQmNoSpxI5zdmogCvExJWphLZJ5lClzWQwcEy//exmbQdeG561wh/sWhfFkcpDl9CV+zwiTYLRyu+eTEuGJxEZSdqLcf37s0tkRJXhM1XYdsfcUMglKTcH+wWulvnEPN6KVg/eIYbkVzupyGwDmNiRyxto8XmiH32szjDaxfATYrH9ns8EUao+KbGs8qCKer5MeqGpVOF4+cTZqAsFz79X7IcYEi7WWcS;
	4:WtfSa/3KbwvCw3ardwgMH8EF5aGguCRHfPAhDDI9HUO/AppJY86n8dD5qWT60eaWRMO0IgcjwKwNGBdNbhYwXuvCKUpUfeA1b7SjZXY2KA7IaG9d62jXI61bnSH0qxwa2amzl3tFwAm0F7L4a5QjrJKY2t1Yd+xHwsLh+y0JradgwZyBf+Ij0wCU6B2evtPJdpyscwmQz3ENmuR0sfDiccie0AtExNNG9RmY3777PHxreZFq3PQJ5e/3t5TyImGB+Z1jM67LLQOz0xUJ3AJ63TEmwctNmAYK3/AWwK5Q+7Yi3caWYzvMCgAQejVGOzzGLFsRQAFZc+LzMZWGQlJdSk542z0L3FOaaeZ3uE7ZDTL8Ilfc5YRNBJtrbCEKCkQmq0x4Hkul1B6rZybYw/WuKaXx4/HwS3iYZlHdd5y5Sy+t0ERgZvvTJYV8YSkld45Yx7aAi3u7jR/VhGEAJ00U2A==
X-Microsoft-Antispam-PRVS: <BLUPR03MB14118B8EFFC892D9D0C090AAE8860@BLUPR03MB1411.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(13017025)(13024025)(13018025)(13015025)(5005006)(13023025)(3002001)(10201501046);
	SRVR:BLUPR03MB1411; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB1411; 
X-Forefront-PRVS: 0895DF8FFD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB1411;
	23:OeTJ7jv9Rv1KMmZloIk4wP+csJ70ZD7l9lh7xa2SB?=
	=?us-ascii?Q?V53CuSacFygGdvd6rbQMQBu5qpNbHknIikNzxLa2aC23eLxqIvTsg63aBCy4?=
	=?us-ascii?Q?t6Yp45XMPOy0s+Gie5xe3BEznZO7JBuzQrs9xS8sHZytLYsNmM5N89PT6lA3?=
	=?us-ascii?Q?PPCo5fkVnQVM22Tu9KIZq6ZTEH2a6BUaKVlFLXRfttYOTdBvEYC7dTORDA0n?=
	=?us-ascii?Q?lEjR+XriX89KKT/2K1k5o2erE0rjaJKI5MHfcUx5XLmD4Jt6i+bHEEGAgEBk?=
	=?us-ascii?Q?IXOXearN0VIaT+n7dcfNNJrmx9CqPWW3VOL45ZOmr2QkjA5Y40xwrOXqpDTh?=
	=?us-ascii?Q?wfQtKrk8klyVXVSM3em8X0HJeQEa1M/1ooYC8pJ1JLJ2+aHvHcEVTRygGxDi?=
	=?us-ascii?Q?7yjDqdvFM4zWCYC1fOtGdr1M3MmemcKdgwXUX9778EAnvrq0ZNBXuno8lQYO?=
	=?us-ascii?Q?VpPUBVyKoFEBQGNDzmll3wbLvm71uPSt1arWfZsb1y1MGREAQyDuv/s2Jxl2?=
	=?us-ascii?Q?a/eEPP9wGag6C/cqTVcJ9gRV12NkgqOdXspgyv38XssfW/PwCLotfQ0hi2OV?=
	=?us-ascii?Q?0TuSbFHvh7TRW27yu01jGvuCSNE/rEx0xOQC2w4vaAi2MJu4tJuBx46p2hoH?=
	=?us-ascii?Q?gPt8OEPmrrOZIpH4hpopjefUpGSKzOuzbYFMROXEljjMCGf9bqPov91L93/K?=
	=?us-ascii?Q?mPmvUbtafozeIOTFmtZ+/cDKygdnZ156epoeJTBIlC2bC0JQ0hwKLZp24AKx?=
	=?us-ascii?Q?IVswUokB6muhoEHPkf/nZUbRHXslh//lZ5EAZmrnFtEccJywKJqG2dhK+8Ta?=
	=?us-ascii?Q?Fh/SOGuPOKhcXLtXecMH11CcM66Sm+XqUDpaKW6BBxCdzjYr9Dr++x/4mKVr?=
	=?us-ascii?Q?ak8w88zsjnZvbRFXZhXD3HhKxRfN7B9/53jmDvQ+WENhJo1RsZoUZjXlFfwL?=
	=?us-ascii?Q?kNXfsxrTdRq8dSWueJSlA9gHPbuZhtxg6PSl4QQrJFjpPt7q4TIjQ59sMWAh?=
	=?us-ascii?Q?dBkCP3clUG1cxvIC6ZdnKcm4IIQWsPEuQJDcqxKjIVCwX0mCnKvQukRECBJn?=
	=?us-ascii?Q?kULhZ4y5CFl5vZvkQN2wJlvl9W+DBD1kr5wPc5pX2apfNTgOcLabjbiipw9a?=
	=?us-ascii?Q?ijHxTQTYPTB/LtQ4z15WuVJbFjCXTBq?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1411;
	5:pLO8f7y31xOSrzUsVF+RRuct/W5+1ZVfOnhWKFubIZ2Ohog+MKoVPBxDAt5A51RwiOjNUiApBXPTtiU0eHcyg0KCUbROsPCN6B4sf02+o+iiRJ/1psvhVNy7SA4SZlP1Pgz6GdG5QYxhzjaEJpZGUg==;
	24:gsQhII2pgLx/U3xt26KnwjDKDo2DpeoKBgXPJqUkR/vf4LaVy6yRhGgKcAgAyMvR+lmhha7AZNKU7VqKlMuQlYFw3RxhwhE9RlRBCIqTDhI=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2016 23:01:45.2163 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB1411
Subject: [PATCH v4 1/5] weston: Include weston-launch if Wayland is configured
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
X-List-Received-Date: Mon, 28 Mar 2016 23:34:52 -0000
Content-Type: text/plain

When weston is started as the first windowing system (i.e. not under X
nor under another Wayland server), it should be done with the command
weston-launch to set up proper privileged access to devices.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston_1.9.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 16a788d..bf33588 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -19,7 +19,9 @@ SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl \
+                            ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'pam', '', d)} \
+                            "
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango wayland-native"
@@ -38,9 +40,8 @@ EXTRA_OECONF_append_qemux86 = "\
 EXTRA_OECONF_append_qemux86-64 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
 		"
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
 #
-- 
2.1.4


