Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 874 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Oct 2016 11:03:56 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0049.outbound.protection.outlook.com [104.47.33.49])
	by mail.openembedded.org (Postfix) with ESMTP id 078926FFD3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:03:56 +0000 (UTC)
Received: from BN3PR0301CA0064.namprd03.prod.outlook.com (10.160.152.160) by
	CY1PR03MB1422.namprd03.prod.outlook.com (10.163.17.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.659.11; Tue, 11 Oct 2016 10:49:24 +0000
Received: from BN1AFFO11FD039.protection.gbl (2a01:111:f400:7c10::199) by
	BN3PR0301CA0064.outlook.office365.com (2a01:111:e400:401e::32) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.659.11 via
	Frontend Transport; Tue, 11 Oct 2016 10:49:25 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD039.mail.protection.outlook.com (10.58.52.243) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Tue, 11 Oct 2016 10:49:24 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u9BAnEth015976; Tue, 11 Oct 2016 03:49:22 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 18:49:12 +0800
Message-ID: <1476182952-15222-5-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131206565644934581;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(5660300001)(47776003)(50466002)(626004)(5003940100001)(4326007)(2906002)(85426001)(104016004)(48376002)(586003)(189998001)(97736004)(36756003)(87936001)(6916009)(8666005)(50226002)(19580405001)(19580395003)(2950100002)(229853001)(6666003)(92566002)(356003)(575784001)(68736007)(305945005)(8936002)(33646002)(110136003)(50986999)(77096005)(86362001)(7846002)(230783001)(81166006)(106466001)(81156014)(8676002)(15975445007)(76176999)(105606002)(2351001)(129583001)(146423001)(7059030)(17423001)(121003001)(156123004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR03MB1422;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD039;
	1:Mgbtsc74PEh10s0wapPlB7dR2rZMeG2mmZY52HidHdBLB8UzUaKDOx6RAHkboQMfoQTyt/RBYgpL25l9pyJq34355f9ESrLAIGDh8JJiyIBx17+VKiUVzoDSpjD9lCfKgJ15yB7a/ZEhnsCbiTu7N0zQaf2+cOmDAhGcDtRtKbjZL/s1saYi+DZofBS2eN+VB2xrTvTlqR9kMkVvrD8znLBNWW7bP6hVHuSVVTTcpRGEdoECDZTTGEz8UQSehUtZdXHsLD6eLhkoNZKFzSeKr1MJeAZCM+YZJsPcm7Ber2y/Wwgm3fbcXlx0gaMiKgvABW8bCkDVeDRyFnNCejwx/RssfsW9Akb9qQBSR1+C+GyEYs+9BsXDSe3Fm+oKessivxje+6e7HSOgaLom2c+JrIvDLHZMnp2xdtbUzeWDkDozYItE7vF86C5A9SqICfr3g+y8ZH0uBo0vBL6Ho/mnU5Y7N4oR82zH/nyeunXPhTUMaFGsJXjqe6hswv22yoqh+rT6meBQNMOXPn0K3EU2AOuZJkHziFvse0KaUej9lKNF8M4AwCVQX+eV75nQGEg4lutcLk/g2EIW4zszKc/MqxJWYQZ0QVS5ogbcwXLdhjkfcU9dLfUNW9cw08N2k5Le9z54jRBbZY6jBhJD23H15zsXz9D501RmB32l4i4LIn3E+VrB0wYW+NsWYal8w1RGCnntcZyF6YfkhQmmz+1dDVMczKzUCHPf38HYTt4kZ54=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: ffe09c9c-a9c7-439b-bc53-08d3f1c443eb
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1422;
	2:zgHsLRrPYLjb1dMBe5G16LWPj1w4QqC/vpTCpyQJzzrecHzAl7jn157Kfsd5QByuGS8F9ae44aKZz5XUmDx1ba2Q5Hu9kcgSHqY+nd6fDFEBZV9TDEKQ1P/cuyY5vt8FkLTa5o9nuTlaqMdiui7OOMCIGLy8qtT7YgmsOUPd24NAGu7wqSRH2JRI8smp1uhhPPnGm6iG4OOCbfiK1pyV1A==;
	3:X0Mkkrkc8AyykoR2d4ENGx3cARNwcvmzwydZQ90BGT8MTRE/l9AQnCbf7R2LV5YNuaS16AF/wce2RVebJmIkm26j/PIqiWcNhgQtpQOmlYy7KClxcNyWhTND34fWme+CU8i3tfC5Qn0GE+YBqV6eWVcxiofUEeo3JHsOfkYkRWUBTyw4jUWp3kf7yKSdFXrKTlvEf0h14v80v1aBqBpWL1dpL/wqYW6iqkiNQbwJIyb9xCaTdoJ6AMbCXG7sZ25Q;
	25:zAW981heWErhhHSJ7dHKE+nHHV5VA5C0vGvW9ezaT4h5HpwETdO+YPpm713DrWYKX+NEoKpRB1YTScp+1voaaLAWlhrkWgCrzaNiclthtnFDRkK/ubQdi8Z9gpPgDzDOPhyj3tsyI+azRPlvR2HEgoDhxDQSYxqU8CjIMHNO6UMq+8pW9DJFXvTgE/fquhihYlyqPFmfzK6IlqI7QXSNS8SLr6UE8Cwkj0lO4TH+Hwt6GN+lZhdapncOuqMH9iFARooaW6va0PVZb8KmByY2lWHxPjCHwxJDZif1W9iVo4JwdGdejOlmSkX4YcQQWCVV1V1Uk3cpWPgODO3z+8LwXgbL0kHnecVS6GcsllfQ8OEOJr9IANYxsXj2meFYdReLE33CdyoyrEyDrg0jdUq4EEw1OxC1Xygyd+a8h5WlmtyiDRDDp7aip0lRxOloC6+t
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR03MB1422;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1422;
	31:oykF4fr388fK15VdKhiJm55XDpRx+foJnaUBZo/AKHhdenWL1WuIsgZsuux7w54yrmRC3QiV4N/9U/9rphnkdcKetlRjDIobOl9V3AW659FYNpWL7VJGQ0b2AmC0te+YRWLTUci8msU56Stl+vYvKRpio+DZo+GuMbW56uPTB2wbNWo9CHUzpGXgr3KuaJUqzQHQyBUrBiQ9AdZuiWlPqBsZYrI9VktezxO+zZlq7Nl3UbvbQ/vL9gmSx0oMRoATfU7OVKjsa7VpjUZ7vJ64eaRWj0XwYJ9kUS8y0DHYhXU=;
	4:HxDLuAIr7egXPZeP15lHTXqnZJP+4kwOOOrMAgfc4Y+S06Jjfnm8JIqDvLbmY3ww0o1KttX3m0K0ANNFcgqu14VPM5GP0hUnaf8T7ZIioG07nrOoTJc0rXvO0q2UKGQll7cFF8HzU1I9CEIKcLu9hOHWxLX/YjYvEJhVO9ooeI7cNBGrspl8xO38o/BPklH4DQXt2XrLUptOGpiVFXWCBNBdAmPj2wjDpXh2m5c55gWd4L9pC4UsB4qMG0iQAbPHpfYBOMHfPXay6uWvR7gjT5CgmsM58sQCHkhwbrmR2L7D/SYMvhrvm+XW5a20ppVfW8hoWqM2dTfO+pRs0P4zN5QwTIywJCXcbYg5lCedmT+H58OvjOFotRnPu4xoSB8xQg383f5GUwwRc72zYIF0Qs11ttWgFQ+KMLbewnRyBRrA7HpfW/3WibcRbxg66swG+sdS23X2BsPXZkX+/HZuvnBmqSojrgpUbNZ3GpWIjMLAAWQ6AoQof3B02dyh89ldn1j2t3hRD3mgHPciSQRw0zhR3oRmM+S48/woPfzvSEm4CNOAB1QUG+nSVKtBBxb+5QC2EPfUD4IMUkvu1ums0D3NHQAC+YIHF7kyLBp8f3FTRJq7qy6kKJZBZ+kSg4Z5
X-Microsoft-Antispam-PRVS: <CY1PR03MB1422CF31FF4D22C1A5F4FC09E9DA0@CY1PR03MB1422.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(788757137089)(21532816269658); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13023025)(13018025)(8121501046)(5005006)(13015025)(13024025)(13017025)(10201501046)(3002001)(6055026);
	SRVR:CY1PR03MB1422; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR03MB1422; 
X-Forefront-PRVS: 00922518D8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB1422;
	23:BgKSnY10uplNBjaS+t5MgrbUTd7617bxkYbmz+25v?=
	=?us-ascii?Q?leKdC9SyUrNyw7AafjtFQat4M3LyFsvQw+uhrjew+r4+zH/IhwqezcnD8kDl?=
	=?us-ascii?Q?Ap7OCv5NE0dRSBWJc6F1A3GIo9ovF+Z1MKQVvhyxKMV5C8nK8xHIFnLZGa+i?=
	=?us-ascii?Q?TrWl2toT1awT/eLU1kiE7BEwVDOYwfVachVqqRvjhMzQsy750FeJ1ruodVkv?=
	=?us-ascii?Q?mhY7adQ+easmQ6p88RKV1wc3noGyCOpSfxGnx25GPc9aIjD41tG73/leW0tk?=
	=?us-ascii?Q?JW1Jf1h0lWgmxcoYZ3xQ601g+bLkKYtddZxRjTVKkjupvjGTG4grItWYBqPG?=
	=?us-ascii?Q?zw6PKQAFwKLGC5sAckDtRqGiwZdlUpyvrJF6On9NyVVEAerO4XWo5AT56Zv9?=
	=?us-ascii?Q?7DXaG5HBt6liOJUf/vW4FU/4EIsHkRCLO2KKvKF1EOwZaQlYsqNE9cqKlKg/?=
	=?us-ascii?Q?8W1hCMtr4hYVSDXaJ6ZSYgW/rj/M4WTLhp13plCwUlsDJ8s0Y6OvrifAsJ+o?=
	=?us-ascii?Q?0DXvT7pp5yxZN1XWTB5f2GlSlRmJKPYiFEHRDXcP6J5eez45kMRKRGQDGURV?=
	=?us-ascii?Q?g+3/b4ouv5yN8TYYyAzBOs126ju5p7LH1SJxi9Qu3QPeeiYKPJmbGJjJ3KoF?=
	=?us-ascii?Q?7MPjZ8+pte2NS24tjaqy2LgUB25VsGhpQAXz+zU+GWfhGLrB7Z1y2049yNCd?=
	=?us-ascii?Q?FWX3Lp9TIpxLtm8OEj7B6fHsedxphgBVWZPFYaSieUuJ3aaXKfPZR4RVIwVa?=
	=?us-ascii?Q?BgGy88L13mYhVA43CNyh2Yhr9ZjjB6QLhdCMSe5h1rSg+DyhObb2iaE4I6pE?=
	=?us-ascii?Q?jRxBiWi5Xg0S2lYij9TZW9ckgK+LbetGNq7fgU3wHP4gI4QVNQobWHvWUATv?=
	=?us-ascii?Q?mfoI1WZgryBROBiHcD0j420btqGDYc/cS7wnofr6fwFEv+dEFeMGYt9K1nqM?=
	=?us-ascii?Q?PSBJnnKPUWK0+AhiURSrsqstzLcz7Efubl10y1I/8A6haeP/cA4/flA/CV2A?=
	=?us-ascii?Q?GTioxFqWzOSK57afrpw70vUFndaEWDpm015gy1Ad8pE9C4W3I7Y9xWeu9Od+?=
	=?us-ascii?Q?sqzMdtChO2ejh8fPB2oh6CsodF8jHwlOHzWN+HvqZJOr6QQGBjYSDatej56I?=
	=?us-ascii?Q?GsGR+Cu2yhUJeU1dkopqgeuxW5684k8dTv1X2gx3EJXIU+9zpNKVnY/Kn9Nc?=
	=?us-ascii?Q?aGjA0+0XfIp818h9sntFaPD2byha/ViYlZSHaVWfq1nQiGDo/ayoVKhyZNnv?=
	=?us-ascii?Q?DMNxqyuuivjidb5fERlWfTZy2hfldsNZgSG6aGrYz2jsjIIA9pODjkVwcrmO?=
	=?us-ascii?Q?xa0zDwz+3dGtMEK/wJ70yELtad2c0Q8Vfk0Zo82Ez0CRnjVLEjzhgH0cc3JT?=
	=?us-ascii?Q?baaWc5O2E0B314+JeXEjFr33QM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1422;
	6:8bdWqm3wSFD2dkar9JCSvgWsaxruD4vqtArBCXGo6btLfAkKA1noCxf3F/eMe/XMK2DQg9jtLNDhtPwX0MhnmWvl51KeAwTDjijUEkDevCb8jFvxX8+ekF1rZ7mA+FzU/qDKKt22k5E5i2/Nps9mMOSKCwsqVRlwMi3e+y9uqdMoQDMOgFrmXQ78xLqAk/cbe9kVvRezpJe0oog2rLpJbWCYXEiBC/9K0mtNqS5BgZyc6p7pxn/RaGhlpjrUJJbVmKllvm33TThNwWr1pzFdgviFsdnPDjSWiED0yIOodSCUL0dMOBjeBZVzRIYXBo2M;
	5:X9xqx/EcY3OHhdYN5PnUT4L9rbjd0FpSzGKM2dsbNdIe1JWojdGP8+rpfsmrwH1iyrbRRVvh6PPSzI50mxjMQjy5DMi0yUao5mhCvFV8OAavsZ2maeOt9/2/ZEbq6yQQLbkYdUd0Y7KnDMmuOjR9iUVJSCAYT7XsebdF/jazXNLzwEWsr3fj6Ji1dkucVBol;
	24:CjUjCbcATacFSlNq9jIMwoQZ3efCYsKlOT4JS3DKMRfr1kSioUKLLJYK5zfVNb0wdp1aOKIUE0Wr6bKsc04piAtx/h1+ZkhwOPB4vG0BqgU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1422;
	7:ceCtd0bfFluWUqJSBw3jstIQcpagRc5LAJJTjkkHYs6HQXnBOSvde919VDCdHkKeK9HIdASHF+2v5a1dpHkAfiifqtX+38SMf1OtMREAG/fohteAW9niTIszeT/D16zGW9+mtdkzrNM0IlVRuKcV49Cq3g/2ojuasWC22tjyJfOWfo/8y1uVUgUJUrM14gCC0ZkSsFLL8YaZWidE0IMKeoJ7O2ksEUeHVIRZHoXQVlWEuWJBmBRIdm0ytbHW7G1K4H0BXLX6rj/iNe2m7CY+kEjvyZPzLwDx2UcdtH8UkE22tQsDuf+fcoA95pB9TiNvDwWRK8/ASgoElESmCZ7DY5SK5SbI8YanrtHe83564n4=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2016 10:49:24.3062 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB1422
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 4/4] gstreamer1.0-plugins-bad: Fix glimagesink cannot show frame when connect to qmlglsrc
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
X-List-Received-Date: Tue, 11 Oct 2016 11:03:57 -0000
Content-Type: text/plain

1.When connect to qmlglsrc, x11 event loop will be replace by qt event loop
  which will cause the window cannot receive event from xserver, such as resize.

2.Also advertise support for the affine transformation meta in the allocation
  query.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...x-glimagesink-cannot-show-frame-when-conn.patch | 71 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb    |  1 +
 2 files changed, 72 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow-Fix-glimagesink-cannot-show-frame-when-conn.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow-Fix-glimagesink-cannot-show-frame-when-conn.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow-Fix-glimagesink-cannot-show-frame-when-conn.patch
new file mode 100755
index 0000000..eb79c5a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow-Fix-glimagesink-cannot-show-frame-when-conn.patch
@@ -0,0 +1,71 @@
+From 139e50acd70b8ce0e220d7d7433ccfe43a6b1fd8 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Wed, 27 Jul 2016 10:55:01 +0800
+Subject: [PATCH 5/6] glwindow: Fix glimagesink cannot show frame when connect
+ to qmlglsrc
+
+1.When connect to qmlglsrc, x11 event loop will be replace by qt event loop
+  which will cause the window cannot receive event from xserver, such as resize
+2.Also advertise support for the affine transformation meta in the allocation
+  query.
+
+Upstream-Status: Backport [1.9.2]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=768160
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/gl/gstglimagesink.c               |  2 ++
+ gst-libs/gst/gl/x11/gstglwindow_x11.c | 14 +++++++++-----
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/ext/gl/gstglimagesink.c b/ext/gl/gstglimagesink.c
+index cd3147d..d81fcfb 100644
+--- a/ext/gl/gstglimagesink.c
++++ b/ext/gl/gstglimagesink.c
+@@ -1957,6 +1957,8 @@ gst_glimage_sink_propose_allocation (GstBaseSink * bsink, GstQuery * query)
+ 
+   gst_query_add_allocation_meta (query,
+       GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE, allocation_meta);
++  gst_query_add_allocation_meta (query,
++      GST_VIDEO_AFFINE_TRANSFORMATION_META_API_TYPE, 0);
+ 
+   if (allocation_meta)
+     gst_structure_free (allocation_meta);
+diff --git a/gst-libs/gst/gl/x11/gstglwindow_x11.c b/gst-libs/gst/gl/x11/gstglwindow_x11.c
+index 67160f6..bc7b9c0 100644
+--- a/gst-libs/gst/gl/x11/gstglwindow_x11.c
++++ b/gst-libs/gst/gl/x11/gstglwindow_x11.c
+@@ -399,6 +399,7 @@ draw_cb (gpointer data)
+   GstGLWindow *window = GST_GL_WINDOW (window_x11);
+ 
+   if (gst_gl_window_is_running (window)) {
++    guint width, height;
+     XWindowAttributes attr;
+ 
+     XGetWindowAttributes (window_x11->device, window_x11->internal_win_id,
+@@ -422,13 +423,16 @@ draw_cb (gpointer data)
+       }
+     }
+ 
+-    if (window_x11->allow_extra_expose_events) {
+-      if (window->queue_resize) {
+-        guint width, height;
++    gst_gl_window_get_surface_dimensions (window, &width, &height);
++    if (attr.width != width || attr.height != height) {
++      width = attr.width;
++      height = attr.height;
++      gst_gl_window_queue_resize (window);
++    }
+ 
+-        gst_gl_window_get_surface_dimensions (window, &width, &height);
++    if (window_x11->allow_extra_expose_events) {
++      if (window->queue_resize)
+         gst_gl_window_resize (window, width, height);
+-      }
+ 
+       if (window->draw) {
+         GstGLContext *context = gst_gl_window_get_context (window);
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
index 2bde0a6..55ffce9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0010-glplugin-glimagesink-support-video-rotat.patch \
     file://0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch \
     file://0012-glimagesink-Fix-horizontal-vertical-flip-matrizes.patch \
+    file://0013-glwindow-Fix-glimagesink-cannot-show-frame-when-conn.patch \
 "
 SRC_URI[md5sum] = "955281a43e98c5464563fa049e0a0911"
 SRC_URI[sha256sum] = "7899fcb18e6a1af2888b19c90213af018a57d741c6e72ec56b133bc73ec8509b"
-- 
1.9.1


