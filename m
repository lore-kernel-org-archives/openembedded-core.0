Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0043.outbound.protection.outlook.com [104.47.33.43])
	by mail.openembedded.org (Postfix) with ESMTP id 64F786FF69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:23:00 +0000 (UTC)
Received: from BN3PR0301CA0076.namprd03.prod.outlook.com (10.160.152.172) by
	BY2PR03MB331.namprd03.prod.outlook.com (10.141.139.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.587.9; Tue, 11 Oct 2016 10:49:19 +0000
Received: from BL2FFO11FD047.protection.gbl (2a01:111:f400:7c09::150) by
	BN3PR0301CA0076.outlook.office365.com (2a01:111:e400:401e::44) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.659.11 via
	Frontend Transport; Tue, 11 Oct 2016 10:49:18 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD047.mail.protection.outlook.com (10.173.161.209) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.629.5 via Frontend Transport; Tue, 11 Oct 2016 10:49:18 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u9BAnEte015976; Tue, 11 Oct 2016 03:49:17 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 18:49:09 +0800
Message-ID: <1476182952-15222-2-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131206565590860711;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(47776003)(8676002)(81166006)(36756003)(48376002)(81156014)(50466002)(575784001)(229853001)(356003)(15975445007)(68736007)(86362001)(626004)(77096005)(5003940100001)(19580395003)(104016004)(8666005)(19580405001)(586003)(11100500001)(33646002)(189998001)(76176999)(2351001)(106466001)(5660300001)(85426001)(105606002)(92566002)(87936001)(2950100002)(4326007)(8936002)(2906002)(110136003)(50986999)(97736004)(6916009)(50226002)(305945005)(230783001)(6666003)(7846002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB331;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD047;
	1:MYZoQU+3mlgUaqT+J1i2F+t/7cF5iud5+o4Az0G61K21jf36cnbT7iWKXW3LUzs8omg+48a/s3ZeHQgpMB5ppMkARALX7XzY7e4lfRzRUPgKyib/wKi3xWni2BI5mMw+EwrQTKb1seI6PAOR+hqSfSDT9lwt1ZTXCilHreOw+iHmOYAXZpgy8csab8c9Wkx/lZMNGs6uhmhTuKyI0fhAFEskobtJKtciz4A9wvHF6XVodMj4pAZ2rwabnHqtzkK2cMqL1mgZUeyNcfqkZHECNOVBj1JOOMvyU+gC/mcdOQghbtOn/Tq83aW4U6Oj0K1hOnJLJ1lOE2IJivLbuqBSGJx3EK1S1ZCwZtI+SiFoTtj8yluyh0IAnK/UmKjWHJfVgSrXw6i7WNr0gMq2bLV90BEL8ngYCAS7D3oUwjacpZOtyDNAh7KYq0PPOA+GzJ4dYaw+R/dcMrJvKd+4om+rZDBtnqBppYmUUBV2QJDAcIRAux2ilT3LCHLFRao1QImOWbAYDW8UnHY82TGiiOPle5yXxCH05HS/cmZl6iD2Wcl9RQ9X4FMNebMP+nbhaySoJxMwgwjz54XQJCTyY5o4MyEu+MbDr2joU1ApjLTv1L4oe1gXg1AX2Tf56tLimICWLUaR8fU3wZf7E8/0314ZeuCPk4m6KXsmT1trEUG2cP8tMf8vN+1d+JKeeWagzVeMt6RMdbSbmjc5e1lXJufhC0EGxvNQBzNwS5MAXJ13viw=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 5b7da6b1-13de-4ff2-a248-08d3f1c440b2
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB331;
	2:cZfNvJWNokZV97pjc5e8rHTK2b3R+PG4wSEVEJW4VinXQWBy/OuXc48ZRL0BqtVpBqkjK2BOCeYEOgziJGl/MgFjk7bcJCHK8WRxPhvIfRhXtm+FQfQFlTZS6xugS+Hh5kTihgce5nxRdtCBmrnenBkX74f4z+kXQdfXxf8FVoPQnfUHlnQDwfajJFI6Ht3r;
	3:BOL/KaS4DN7Anpc47pwWFFCBUnd8nfCh9y1p6tqvpEsikBd6INM/AbSr6vM0sSARk+61UyNXCSY3PaX6nSOt51bmmvB8Nh9rjQgpS4CRW32dGXzqMfsLyfT+LNTZecw+CLWWrvjMMb2eY4TnMStEDM9HzQ5QUrUPmR7+aui80Lnc0lZAXDPAyrdfNDd3O3HhsiL6Dbfs8fk8zG0txP3m9NZ43k7IRXmQAWokwcjpgJg=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB331;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB331;
	25:3KU2sW7KYb73w5W2k5R5Jbc382cNpTIvUyb7fVrtEO79da//rxiEN+3XFBpdHKdlxpZA6WlWSgWukfUaZTrCZupID6ACT8qQkHl/si8Z7DFCedpF//Uuq/ysMv7jV4+ri1/cr2IjdGJR9YY++cG2hYCLImwc2d3nyJQx41mZf8oRn03fltTw6cCGPJsCxcun/bMyAhS1T/jpAR1Sr7ijnl54vW9QpVn9xAUMSvGSHDayB2FL3AQLm/4kthfd7UkQ4xMMOjlXMNYdvCjSAguYykzvSmjuTeQuJRVBX/KRo5gIERCOYBK/kZ7pU034wHEDnovJQ7+qiNgqsae8LzeUnq0FNgMJkMC/NZ4+poCLnHWkNSAgDVQYw53XiTnp9HOfXV9+IoNTUaGJlI/gHXNEGXE671a+0Ksqgdh4uFcdvfnT/+GpgStK3K5Hh4+KqJUq2L7+kS6MNAHm47Ux7zwL8kmkXM1pX7ALfTp9QMz8YSla5dKECXJvlbywIWw5BGAanTURaGoze9Bftj0Nkyl/1Rj+LamWccRvLpr7qJFGleEDhknFK8C27CvZvXatEHUlnVN+fa6skDjfV/08yKRyOP/WGPby6wwKnrsVk6mnd/nZ5OvD5CVzXy33DXJi8aB7csQkXmwGBqAaVr7aXMyp7DgZ6M+RcfAjpLWI67WCF+oQUx4eRcqht5/gyi7sFztg4BSkJ5wKKN/K/VQftheEqKhVNpABCCbvW0fIyj7kGqmRgHJ9Ta16TT4ehEPKB/VRfrkDnwZm6kX+1XBMenXufU5Su4K1beRAKLJpbLwLxK9dRa207xIgr40kodV8kG3L5jkhW9jChq5WG9WktulBX0tbmHF6Z/wi6nTFX1BmZlU=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB331;
	31:+tgtgSBERvu7n/BaEjXlg8g9UWJqaeT/1Ngnt5SXN7uKqCuIbx02vVL2TwWZelZRpefHqy5mNuQAyP3K95Bo9TJpQeo+ChlxO12+ioE4AkMuXJn4GLaCnHKz5ryC7snrxQN90R2fwK0oY1r9xbs+bGh2K1NhQwjwDj2un48Z30R9o1V0vfJlLC+6m7YumhaFy61sdhlEKlbqn444S+UwpVCkre0drYl1EyzmklRbeUw=;
	4:vUWhPPWHJnnN/Xz9MtX+1pYuu6IUndCZWHztc8gVDPNUneg5rQ0Uw+h7eyPIKHQOSjry9eItIC1KtYSCNkOF24MMH7CXt07QFyCPB7b2Z6ukZTkN16P8Xe8um4RFoaDFMFRlRGfmwI7ba5CZqI5qrT5muP6IGWS/30OkhCR4s5P3Bx9r16RTElRznfRe7BgXrXHJs1WME04x1FiwQ52FoLPMYxC3SjnwVRWFdtmId/2papy459r4M1257aNcSmS9Fq589sNppVA5lcrClTEcsdYrgdgrKXvrcFEsFokuRDAVMlfGmnuqiTCkDiq+L67NOt4OawWIOagO6CeP07/ZdTPzsn77woTEGtuGK7tXBh9Tni68SzM9x/ahv6Cy80w3kB25VGQPTpj/q55e/+Z6CNMuI/EDkn1fC624cVBVqBeW271mAbI7z3yM+Aa6JJBWioRF6J215s0C1meEqdK6S8rJ9c8/IEpFIRN4xem1NZHAb38dPDIIGZVmyMLFauSyzSECkAANHuHCMYsroiwWLNM3PCVfzL1bnCtHh9/d3WQ=
X-Microsoft-Antispam-PRVS: <BY2PR03MB331990BE0C6E1DD876F7E52E9DA0@BY2PR03MB331.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(13015025)(13017025)(13023025)(13024025)(13018025)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:BY2PR03MB331; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY2PR03MB331; 
X-Forefront-PRVS: 00922518D8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB331;
	23:8IaZBhbfLu3yqGDPB3O/F/Dwiy+o5PkZS1t91BO3gP?=
	=?us-ascii?Q?yencsuzsCx8CGr3wdBQuo/ndjRNK4pHArvaYlqn2kb3b9DsBoKQ7zYlLNO4k?=
	=?us-ascii?Q?RS5yRt6DZcmeJDnSyTWdGbyJmGCKZ3ehFjnTh23t/w5XY9Xqymwnlb9JhNaz?=
	=?us-ascii?Q?8I45NHzv519x0Cip6rj9RgA248QoH8ly5BgIUjxRMrRZsITd5xvIJJzL6OIN?=
	=?us-ascii?Q?ukJSuuWN/z/GFXmNHaTylKC4WRYk/O/NIRsCzKUAVxNYKCsvzKSHe83njRer?=
	=?us-ascii?Q?DOeOOzuPwVIQrxE+EZsxjHsGHzA996r59kbZmTkMgqs1B7uIsGpMbVfhs3KW?=
	=?us-ascii?Q?RSrgVlc3Vrj8oj+oYGXGxNhoTbh+FcDvhkeUw7W6tuRGDS+UWe9oxCJLQiHM?=
	=?us-ascii?Q?lgI9M4wIJ06mjZ5qFsK+TEw5g4TOFqYSIzmruooSPieNQCHXUvBpO7qUCjbP?=
	=?us-ascii?Q?WQ6lwjlOk4+CNrD5W5Mu7sqfPGozDgAmQQuFEW+PLxuk3KMwvihp+SBx8ke5?=
	=?us-ascii?Q?Lv40CBJvfXLn7rtQVVucWVZLpfnWFWAcYXOAlT8keMYYGXLMf4f3TGon7TRI?=
	=?us-ascii?Q?E60cbTUQb1o3NzVlBUADUsRJEt3RTzRBFu5qX/cOgKO76lSdB95bnWvpnHRl?=
	=?us-ascii?Q?p8rp1Vw0Z3ciNIPa9j5huDD8nWha6IvZT/LJPnNv0hPB9Dkf+edsvcrAAz+V?=
	=?us-ascii?Q?mId6rIjOVqBMux/PwY4d/6/OD1IHls1nCIUqWaPO7V4odNDgT2NSQ3Uz71Ij?=
	=?us-ascii?Q?Hbx456DBSPBj107ZDT+g/Iel9Cb8xe5EZbKUwJEQx2YJctdWj8h3nAHZmDcV?=
	=?us-ascii?Q?8WsUWDEfJY0gWz7Y9wA1b/DnyXVfvTYQJqbDlHNA7Pw384qKt2jt71piaOqJ?=
	=?us-ascii?Q?aQEhqHiGN7AgVFPFWx/jZiKlK8syWF16ntikaoYlTS7t0vgnCIolW4s4XENV?=
	=?us-ascii?Q?HmrADeESW5VZxnlpqwiL8P+vD/Dv8n7CxCXj7cBJzB4FgUewye7YE27ZSBm5?=
	=?us-ascii?Q?LM35iDZo3XPmiXelCqWRQTzYfMiQ48K6bopMXZL+7K2AH/x6dcnxMMQJ7+9F?=
	=?us-ascii?Q?ZVTeUatOKgw8enQU54j+ingHyogiC+9fo6urMEtfWXt/pmR7wlllA0aPkxF+?=
	=?us-ascii?Q?MHBxTZUdiZ+IjdNGFjtbbbzp9rgahP/X2dMshNm5GSOvlKEZOzcfuIr9ZAgq?=
	=?us-ascii?Q?ZxvPJCjvKTOOU0waL9SwLzhqX2qwDKIBlxCNJXLD3umpoJU46dBLLyPuzSKx?=
	=?us-ascii?Q?jta28WKBewAe3aqHP6NPpr1tr/f7/Ov8SZXmyJ7u0L9TSYLPgJBdMjToUXCQ?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB331;
	6:UZ7VGmPGJTqvLG4eh5eRGyf1luv/3zw90CioECH5RD4GQCmI6s0NCQtyeO+VWnKl1L+FeiuuIUgPfURpVBpqkuxnBFmk3VhHEtZ+71DOARkO+10wjn6ABVLkjdb/POewTE7v57mSmDYgzQrrXQXx7MY4bkUoCn9JPx7Sy9VzcKu1oedKRgxQ+Gpy0Lv0z6/WQabCZodkzqYB66LKB8W8b7xj8oHAxWQpoZEZ/NJRl6F3TFVjssmUR0aBZFuAuS6DPOMV4WiY4zhzX/sJaDvM5QD2714W/weo/DvOwqLSxl0=;
	5:3yWLT6qUA2SxgDZi8KhII4aXhFBNmf8mGMC7Z4Q9mYjPzpPVjDjnuJCwUime9mlZYb0UhiqALsLPMk6SOjJiQIQm8m+ZOQIZ2oavkiXboKgO1PspIYsudJV6L7JVKiW1J4qfEVQ5Feyqmy/K7W+PFrCVyiu2H5YHIqYtEVyG5ok=;
	24:neveWaLSkaLmjeOKOHa9lg6v+gIU9RPjD5QgxRkRQDxlPt4EzQIf0OYgLQch41nNzE9YLJ4mobCB7ebbHaAO9XIbJFUKV/OMrMpyr8exUMY=;
	7:tFJFIHGQBt04Sa2RDRFI0t4gfebq+my4iG22xlT8FxjqV+O0XJI6pmbwMX+ZzeU9AekHuZ9wRp4r/0t+FrYYqIVei2Q8BkC9wKDLS5qv1xRWHF9BzSHnJ7tX7kuEHIt+0S73PXsmIQ9foGsTCCkElNNrNS1oE4BNhAGYo8PurOPm15coy7jcotdqmf3/Ocg8dmNZwKlwDQM/oV4bV2kuZd7rr1eC/aTtQrxQvLqQ5Rp0nGyMwEn05XDtvkGcAchx/+yaPiSMuPPrcU/ys5qO3Arv3RtpZZDeYghGqcQOY6WO/X228FANkhLvAkINMYPzWK6l8NwhviovxXci3tcOxw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2016 10:49:18.8988 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB331
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 1/4] gstreamer1.0-plugins-bad: Support video rotation by using transform matrix
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
X-List-Received-Date: Tue, 11 Oct 2016 12:23:02 -0000
Content-Type: text/plain

Add "rotate-method" to glimagesink and apply transform matrix
to vertex coordinate to control rotation.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...-glplugin-glimagesink-support-video-rotat.patch | 574 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb    |   1 +
 2 files changed, 575 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0010-glplugin-glimagesink-support-video-rotat.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0010-glplugin-glimagesink-support-video-rotat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0010-glplugin-glimagesink-support-video-rotat.patch
new file mode 100755
index 0000000..b00782c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0010-glplugin-glimagesink-support-video-rotat.patch
@@ -0,0 +1,574 @@
+From 31c18b0796b433c5a3cfda90960dd394b16f8f1e Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Mon, 9 May 2016 20:26:51 +0800
+Subject: [PATCH] [MMFMWK-7151] [glplugin] glimagesink: support video rotation
+ using transform matrix
+
+Add "rotate-method" to glimagesink and apply transform matrix
+to vertex coordinate to control rotation.
+
+Upstream-Status: Backport[1.9.1]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=765795
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/gl/gstglimagesink.c              | 266 ++++++++++++++++++++++++++++++++---
+ ext/gl/gstglimagesink.h              |  18 +++
+ gst-libs/gst/gl/gstglshaderstrings.c |  11 ++
+ gst-libs/gst/gl/gstglshaderstrings.h |   1 +
+ gst-libs/gst/gl/gstglutils.c         |  60 ++++++++
+ gst-libs/gst/gl/gstglutils.h         |   5 +
+ 6 files changed, 344 insertions(+), 17 deletions(-)
+
+diff --git a/ext/gl/gstglimagesink.c b/ext/gl/gstglimagesink.c
+index 185577f..fb60468 100644
+--- a/ext/gl/gstglimagesink.c
++++ b/ext/gl/gstglimagesink.c
+@@ -120,6 +120,7 @@ G_DEFINE_TYPE (GstGLImageSinkBin, gst_gl_image_sink_bin, GST_TYPE_GL_SINK_BIN);
+ enum
+ {
+   PROP_BIN_0,
++  PROP_BIN_ROTATE_METHOD,
+   PROP_BIN_FORCE_ASPECT_RATIO,
+   PROP_BIN_PIXEL_ASPECT_RATIO,
+   PROP_BIN_HANDLE_EVENTS,
+@@ -181,6 +182,39 @@ _on_client_draw (GstGLImageSink * sink, GstGLContext * context,
+   return ret;
+ }
+ 
++#define DEFAULT_ROTATE_METHOD GST_GL_ROTATE_METHOD_IDENTITY
++
++#define GST_TYPE_GL_ROTATE_METHOD (gst_gl_rotate_method_get_type())
++
++static const GEnumValue rotate_methods[] = {
++  {GST_GL_ROTATE_METHOD_IDENTITY, "Identity (no rotation)", "none"},
++  {GST_GL_ROTATE_METHOD_90R, "Rotate clockwise 90 degrees", "clockwise"},
++  {GST_GL_ROTATE_METHOD_180, "Rotate 180 degrees", "rotate-180"},
++  {GST_GL_ROTATE_METHOD_90L, "Rotate counter-clockwise 90 degrees",
++      "counterclockwise"},
++  {GST_GL_ROTATE_METHOD_FLIP_HORIZ, "Flip horizontally", "horizontal-flip"},
++  {GST_GL_ROTATE_METHOD_FLIP_VERT, "Flip vertically", "vertical-flip"},
++  {GST_GL_ROTATE_METHOD_FLIP_UL_LR,
++      "Flip across upper left/lower right diagonal", "upper-left-diagonal"},
++  {GST_GL_ROTATE_METHOD_FLIP_UR_LL,
++      "Flip across upper right/lower left diagonal", "upper-right-diagonal"},
++  {GST_GL_ROTATE_METHOD_AUTO,
++      "Select rotate method based on image-orientation tag", "automatic"},
++  {0, NULL, NULL},
++};
++
++static GType
++gst_gl_rotate_method_get_type (void)
++{
++  static GType rotate_method_type = 0;
++
++  if (!rotate_method_type) {
++    rotate_method_type = g_enum_register_static ("GstGLRotateMethod",
++        rotate_methods);
++  }
++  return rotate_method_type;
++}
++
+ static void
+ gst_gl_image_sink_bin_init (GstGLImageSinkBin * self)
+ {
+@@ -203,6 +237,12 @@ gst_gl_image_sink_bin_class_init (GstGLImageSinkBinClass * klass)
+   gobject_class->set_property = gst_gl_image_sink_bin_set_property;
+ 
+   /* gl sink */
++  g_object_class_install_property (gobject_class, PROP_BIN_ROTATE_METHOD,
++      g_param_spec_enum ("rotate-method",
++          "rotate method",
++          "rotate method",
++          GST_TYPE_GL_ROTATE_METHOD, DEFAULT_ROTATE_METHOD,
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
+   g_object_class_install_property (gobject_class, PROP_BIN_FORCE_ASPECT_RATIO,
+       g_param_spec_boolean ("force-aspect-ratio",
+           "Force aspect ratio",
+@@ -291,6 +331,7 @@ static void gst_glimage_sink_set_property (GObject * object, guint prop_id,
+ static void gst_glimage_sink_get_property (GObject * object, guint prop_id,
+     GValue * value, GParamSpec * param_spec);
+ 
++static gboolean gst_glimage_sink_event (GstBaseSink *sink, GstEvent * event);
+ static gboolean gst_glimage_sink_query (GstBaseSink * bsink, GstQuery * query);
+ static void gst_glimage_sink_set_context (GstElement * element,
+     GstContext * context);
+@@ -347,6 +388,7 @@ enum
+ {
+   ARG_0,
+   ARG_DISPLAY,
++  PROP_ROTATE_METHOD,
+   PROP_FORCE_ASPECT_RATIO,
+   PROP_PIXEL_ASPECT_RATIO,
+   PROP_CONTEXT,
+@@ -404,6 +446,128 @@ _display_size_to_stream_size (GstGLImageSink * gl_sink, gdouble x,
+   GST_TRACE ("transform %fx%f into %fx%f", x, y, *stream_x, *stream_y);
+ }
+ 
++/* rotate 90 */
++static const gfloat clockwise_matrix[] = {
++   0.0f, -1.0f,  0.0,  0.0f,
++   1.0f,  0.0f,  0.0,  0.0f,
++   0.0f,  0.0f,  1.0,  0.0f,
++   0.0f,  0.0f,  0.0,  1.0f,
++};
++
++/* rotate 180 */
++static const gfloat clockwise_180_matrix[] = {
++  -1.0f,  0.0f,  0.0,  0.0f,
++   0.0f, -1.0f,	 0.0,  0.0f,
++   0.0f,  0.0f,  1.0,  0.0f,
++   0.0f,  0.0f,  0.0,  1.0f,
++};
++
++/* rotate 270 */
++static const gfloat counterclockwise_matrix[] = {
++   0.0f,  1.0f,  0.0,  0.0f,
++  -1.0f,  0.0f,  0.0,  0.0f,
++   0.0f,  0.0f,  1.0,  0.0f,
++   0.0f,  0.0f,  0.0,  1.0f,
++};
++
++/* horizontal-flip */
++static const gfloat horizontal_flip_matrix[] = {
++  1.0f, 0.0f, 0.0f, 0.0f,
++  0.0f, -1.0f, 0.0f, 0.0f,
++  0.0f, 0.0f, 1.0f, 0.0f,
++  0.0f, 0.0f, 0.0f, 1.0f,
++};
++
++/* vertical-flip */
++static const gfloat vertical_flip_matrix[] = {
++  -1.0f, 0.0f, 0.0f, 0.0f,
++  0.0f, 1.0f, 0.0f, 0.0f,
++  0.0f, 0.0f, 1.0f, 0.0f,
++  0.0f, 0.0f, 0.0f, 1.0f,
++};
++
++/* upper-left-diagonal */
++static const gfloat upper_left_matrix[] = {
++  0.0f, 1.0f, 0.0f, 0.0f,
++  1.0f, 0.0f, 0.0f, 0.0f,
++  0.0f, 0.0f, 1.0f, 0.0f,
++  0.0f, 0.0f, 0.0f, 1.0f,
++};
++
++/* upper-right-diagonal */
++static const gfloat upper_right_matrix[] = {
++  0.0f, -1.0f, 0.0f, 0.0f,
++  -1.0f, 0.0f, 0.0f, 0.0f,
++  0.0f, 0.0f, 1.0f, 0.0f,
++  0.0f, 0.0f, 0.0f, 1.0f,
++};
++
++static void
++gst_glimage_sink_set_rotate_method(GstGLImageSink *gl_sink,
++    GstGLRotateMethod method, gboolean from_tag)
++{
++  GstGLRotateMethod tag_method;
++  GST_GLIMAGE_SINK_LOCK (gl_sink);
++  if (from_tag)
++    tag_method = method;
++  else
++    gl_sink->rotate_method = method;
++
++  if (gl_sink->rotate_method == GST_GL_ROTATE_METHOD_AUTO)
++    method = tag_method;
++  else
++    method = gl_sink->rotate_method;
++
++  if (method != gl_sink->current_rotate_method)
++  {
++    GST_DEBUG_OBJECT (gl_sink, "Changing method from %s to %s",
++      rotate_methods[gl_sink->current_rotate_method].value_nick,
++      rotate_methods[method].value_nick);
++
++    switch (method)
++    {
++      case GST_GL_ROTATE_METHOD_IDENTITY:
++        gl_sink->transform_matrix = NULL;
++        gl_sink->output_mode_changed = TRUE;
++        break;
++      case GST_GL_ROTATE_METHOD_90R:
++        gl_sink->transform_matrix = clockwise_matrix;
++        gl_sink->output_mode_changed = TRUE;
++        break;
++      case GST_GL_ROTATE_METHOD_180:
++        gl_sink->transform_matrix = clockwise_180_matrix;
++        gl_sink->output_mode_changed = TRUE;
++        break;
++      case GST_GL_ROTATE_METHOD_90L:
++        gl_sink->transform_matrix = counterclockwise_matrix;
++        gl_sink->output_mode_changed = TRUE;
++        break;
++      case GST_GL_ROTATE_METHOD_FLIP_HORIZ:
++        gl_sink->transform_matrix = horizontal_flip_matrix;
++        gl_sink->output_mode_changed = TRUE;
++        break;
++      case GST_GL_ROTATE_METHOD_FLIP_VERT:
++        gl_sink->transform_matrix = vertical_flip_matrix;
++        gl_sink->output_mode_changed = TRUE;
++        break;
++      case GST_GL_ROTATE_METHOD_FLIP_UL_LR:
++        gl_sink->transform_matrix = upper_left_matrix;
++        gl_sink->output_mode_changed = TRUE;
++        break;
++      case GST_GL_ROTATE_METHOD_FLIP_UR_LL:
++        gl_sink->transform_matrix = upper_right_matrix;
++        gl_sink->output_mode_changed = TRUE;
++        break;
++      default:
++	g_assert_not_reached();
++        break;
++    }
++
++    gl_sink->current_rotate_method = method;
++  }
++  GST_GLIMAGE_SINK_UNLOCK (gl_sink);
++}
++
+ static void
+ gst_glimage_sink_navigation_send_event (GstNavigation * navigation, GstStructure
+     * structure)
+@@ -485,6 +649,13 @@ gst_glimage_sink_class_init (GstGLImageSinkClass * klass)
+   gobject_class->set_property = gst_glimage_sink_set_property;
+   gobject_class->get_property = gst_glimage_sink_get_property;
+ 
++  g_object_class_install_property (gobject_class, PROP_ROTATE_METHOD,
++      g_param_spec_enum ("rotate-method",
++          "rotate method",
++          "rotate method",
++          GST_TYPE_GL_ROTATE_METHOD, DEFAULT_ROTATE_METHOD,
++          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++
+   g_object_class_install_property (gobject_class, PROP_FORCE_ASPECT_RATIO,
+       g_param_spec_boolean ("force-aspect-ratio", "Force aspect ratio",
+           "When enabled, scaling will respect original aspect ratio",
+@@ -577,6 +748,7 @@ gst_glimage_sink_class_init (GstGLImageSinkClass * klass)
+ 
+   gstelement_class->change_state = gst_glimage_sink_change_state;
+   gstelement_class->set_context = gst_glimage_sink_set_context;
++  gstbasesink_class->event = gst_glimage_sink_event;
+   gstbasesink_class->query = GST_DEBUG_FUNCPTR (gst_glimage_sink_query);
+   gstbasesink_class->set_caps = gst_glimage_sink_set_caps;
+   gstbasesink_class->get_caps = gst_glimage_sink_get_caps;
+@@ -610,6 +782,9 @@ gst_glimage_sink_init (GstGLImageSink * glimage_sink)
+   glimage_sink->mview_output_flags = DEFAULT_MULTIVIEW_FLAGS;
+   glimage_sink->mview_downmix_mode = DEFAULT_MULTIVIEW_DOWNMIX;
+ 
++  glimage_sink->current_rotate_method = DEFAULT_ROTATE_METHOD;
++  glimage_sink->transform_matrix = NULL; 
++
+   g_mutex_init (&glimage_sink->drawing_lock);
+ }
+ 
+@@ -624,6 +799,9 @@ gst_glimage_sink_set_property (GObject * object, guint prop_id,
+   glimage_sink = GST_GLIMAGE_SINK (object);
+ 
+   switch (prop_id) {
++    case PROP_ROTATE_METHOD:
++      gst_glimage_sink_set_rotate_method (glimage_sink, g_value_get_enum (value), FALSE);
++      break;
+     case PROP_FORCE_ASPECT_RATIO:
+     {
+       glimage_sink->keep_aspect_ratio = g_value_get_boolean (value);
+@@ -691,6 +869,9 @@ gst_glimage_sink_get_property (GObject * object, guint prop_id,
+   glimage_sink = GST_GLIMAGE_SINK (object);
+ 
+   switch (prop_id) {
++    case PROP_ROTATE_METHOD:
++      g_value_set_enum (value, glimage_sink->current_rotate_method);
++      break;
+     case PROP_FORCE_ASPECT_RATIO:
+       g_value_set_boolean (value, glimage_sink->keep_aspect_ratio);
+       break;
+@@ -848,6 +1029,50 @@ context_error:
+ }
+ 
+ static gboolean
++gst_glimage_sink_event (GstBaseSink *sink, GstEvent * event)
++{
++  GstGLImageSink *gl_sink =  GST_GLIMAGE_SINK (sink);
++  GstTagList *taglist;
++  gchar *orientation;
++  gboolean ret;
++
++  GST_DEBUG_OBJECT (gl_sink, "handling %s event", GST_EVENT_TYPE_NAME (event));
++
++  switch (GST_EVENT_TYPE (event)) {
++    case GST_EVENT_TAG:
++      gst_event_parse_tag (event, &taglist);
++
++      if (gst_tag_list_get_string (taglist, "image-orientation", &orientation)) {
++        if (!g_strcmp0 ("rotate-0", orientation))
++          gst_glimage_sink_set_rotate_method (gl_sink, GST_GL_ROTATE_METHOD_IDENTITY, TRUE);
++        else if (!g_strcmp0 ("rotate-90", orientation))
++          gst_glimage_sink_set_rotate_method (gl_sink, GST_GL_ROTATE_METHOD_90R, TRUE);
++        else if (!g_strcmp0 ("rotate-180", orientation))
++          gst_glimage_sink_set_rotate_method (gl_sink, GST_GL_ROTATE_METHOD_180, TRUE);
++        else if (!g_strcmp0 ("rotate-270", orientation))
++          gst_glimage_sink_set_rotate_method (gl_sink, GST_GL_ROTATE_METHOD_90L, TRUE);
++        else if (!g_strcmp0 ("flip-rotate-0", orientation))
++          gst_glimage_sink_set_rotate_method (gl_sink, GST_GL_ROTATE_METHOD_FLIP_HORIZ, TRUE);
++        else if (!g_strcmp0 ("flip-rotate-90", orientation))
++          gst_glimage_sink_set_rotate_method (gl_sink, GST_GL_ROTATE_METHOD_FLIP_UR_LL, TRUE);
++        else if (!g_strcmp0 ("flip-rotate-180", orientation))
++          gst_glimage_sink_set_rotate_method (gl_sink, GST_GL_ROTATE_METHOD_FLIP_VERT, TRUE);
++        else if (!g_strcmp0 ("flip-rotate-270", orientation))
++          gst_glimage_sink_set_rotate_method (gl_sink, GST_GL_ROTATE_METHOD_FLIP_UL_LR, TRUE);
++
++        g_free (orientation);
++      }
++      break;
++    default:
++      break;
++  }
++
++  ret = GST_BASE_SINK_CLASS (parent_class)->event (sink, event);
++
++  return ret;
++}
++
++static gboolean
+ gst_glimage_sink_query (GstBaseSink * bsink, GstQuery * query)
+ {
+   GstGLImageSink *glimage_sink = GST_GLIMAGE_SINK (bsink);
+@@ -1817,7 +2042,10 @@ gst_glimage_sink_thread_init_redisplay (GstGLImageSink * gl_sink)
+         GST_GLSL_PROFILE_ES | GST_GLSL_PROFILE_COMPATIBILITY,
+         gst_gl_shader_string_fragment_external_oes_default);
+   } else {
+-    vert_stage = gst_glsl_stage_new_default_vertex (gl_sink->context);
++    vert_stage = gst_glsl_stage_new_with_string (gl_sink->context,
++        GL_VERTEX_SHADER, GST_GLSL_VERSION_NONE,
++        GST_GLSL_PROFILE_ES | GST_GLSL_PROFILE_COMPATIBILITY,
++        gst_gl_shader_string_vertex_mat4_vertex_transform);
+     frag_stage = gst_glsl_stage_new_default_fragment (gl_sink->context);
+   }
+   if (!vert_stage || !frag_stage) {
+@@ -1943,8 +2171,16 @@ gst_glimage_sink_on_resize (GstGLImageSink * gl_sink, gint width, gint height)
+ 
+       src.x = 0;
+       src.y = 0;
+-      src.w = GST_VIDEO_SINK_WIDTH (gl_sink);
+-      src.h = GST_VIDEO_SINK_HEIGHT (gl_sink);
++      if (gl_sink->current_rotate_method == GST_GL_ROTATE_METHOD_90R
++          || gl_sink->current_rotate_method == GST_GL_ROTATE_METHOD_90L
++          || gl_sink->current_rotate_method == GST_GL_ROTATE_METHOD_FLIP_UL_LR
++          || gl_sink->current_rotate_method == GST_GL_ROTATE_METHOD_FLIP_UR_LL) {
++        src.h = GST_VIDEO_SINK_WIDTH (gl_sink);
++        src.w = GST_VIDEO_SINK_HEIGHT (gl_sink);
++      } else {
++        src.w = GST_VIDEO_SINK_WIDTH (gl_sink);
++        src.h = GST_VIDEO_SINK_HEIGHT (gl_sink);
++      }
+ 
+       dst.x = 0;
+       dst.y = 0;
+@@ -1974,13 +2210,6 @@ gst_glimage_sink_on_resize (GstGLImageSink * gl_sink, gint width, gint height)
+   GST_GLIMAGE_SINK_UNLOCK (gl_sink);
+ }
+ 
+-static const gfloat identity_matrix[] = {
+-  1.0f, 0.0f, 0.0, 0.0f,
+-  0.0f, 1.0f, 0.0, 0.0f,
+-  0.0f, 0.0f, 1.0, 0.0f,
+-  0.0f, 0.0f, 0.0, 1.0f,
+-};
+-
+ static void
+ gst_glimage_sink_on_draw (GstGLImageSink * gl_sink)
+ {
+@@ -2109,18 +2338,21 @@ gst_glimage_sink_on_draw (GstGLImageSink * gl_sink)
+     gl->ActiveTexture (GL_TEXTURE0);
+     gl->BindTexture (gl_target, gl_sink->redisplay_texture);
+     gst_gl_shader_set_uniform_1i (gl_sink->redisplay_shader, "tex", 0);
+-    if (gl_sink->texture_target == GST_GL_TEXTURE_TARGET_EXTERNAL_OES) {
++    {
+       GstVideoAffineTransformationMeta *af_meta;
++      gfloat matrix[16];
+ 
+       af_meta =
+           gst_buffer_get_video_affine_transformation_meta
+           (gl_sink->stored_buffer[0]);
+-      if (af_meta)
+-        gst_gl_shader_set_uniform_matrix_4fv (gl_sink->redisplay_shader,
+-            "u_transformation", 1, FALSE, af_meta->matrix);
+-      else
+-        gst_gl_shader_set_uniform_matrix_4fv (gl_sink->redisplay_shader,
+-            "u_transformation", 1, FALSE, identity_matrix);
++
++      gst_gl_get_affine_transformation_meta_as_ndc (af_meta, matrix);
++
++      if (gl_sink->transform_matrix)
++        gst_gl_multiply_matrix4 (gl_sink->transform_matrix, matrix, matrix);
++
++      gst_gl_shader_set_uniform_matrix_4fv (gl_sink->redisplay_shader,
++          "u_transformation", 1, FALSE, matrix);
+     }
+ 
+     gl->DrawElements (GL_TRIANGLES, 6, GL_UNSIGNED_SHORT, 0);
+diff --git a/ext/gl/gstglimagesink.h b/ext/gl/gstglimagesink.h
+index f9a052a..cb0f4a6 100644
+--- a/ext/gl/gstglimagesink.h
++++ b/ext/gl/gstglimagesink.h
+@@ -44,6 +44,19 @@ GST_DEBUG_CATEGORY_EXTERN (gst_debug_glimage_sink);
+ #define GST_IS_GLIMAGE_SINK_CLASS(klass) \
+     (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_GLIMAGE_SINK))
+ 
++typedef enum
++{
++  GST_GL_ROTATE_METHOD_IDENTITY,
++  GST_GL_ROTATE_METHOD_90R,
++  GST_GL_ROTATE_METHOD_180,
++  GST_GL_ROTATE_METHOD_90L,
++  GST_GL_ROTATE_METHOD_FLIP_HORIZ,
++  GST_GL_ROTATE_METHOD_FLIP_VERT,
++  GST_GL_ROTATE_METHOD_FLIP_UL_LR,
++  GST_GL_ROTATE_METHOD_FLIP_UR_LL,
++  GST_GL_ROTATE_METHOD_AUTO
++}GstGLRotateMethod;
++
+ typedef struct _GstGLImageSink GstGLImageSink;
+ typedef struct _GstGLImageSinkClass GstGLImageSinkClass;
+ 
+@@ -102,6 +115,11 @@ struct _GstGLImageSink
+     GstGLSyncMeta *stored_sync_meta;
+     GLuint redisplay_texture;
+ 
++    /* current video flip method */
++    GstGLRotateMethod current_rotate_method;
++    GstGLRotateMethod rotate_method;
++    const gfloat *transform_matrix;
++
+     /* protected with drawing_lock */
+     gboolean window_resized;
+     guint window_width;
+diff --git a/gst-libs/gst/gl/gstglshaderstrings.c b/gst-libs/gst/gl/gstglshaderstrings.c
+index 729be6f..10186f1 100644
+--- a/gst-libs/gst/gl/gstglshaderstrings.c
++++ b/gst-libs/gst/gl/gstglshaderstrings.c
+@@ -35,6 +35,17 @@ const gchar *gst_gl_shader_string_vertex_default =
+     "   v_texcoord = a_texcoord;\n"
+     "}\n";
+ 
++const gchar *gst_gl_shader_string_vertex_mat4_vertex_transform =
++    "uniform mat4 u_transformation;\n"
++    "attribute vec4 a_position;\n"
++    "attribute vec2 a_texcoord;\n"
++    "varying vec2 v_texcoord;\n"
++    "void main()\n"
++    "{\n"
++    "   gl_Position = u_transformation * a_position;\n"
++    "   v_texcoord = a_texcoord;\n"
++    "}\n";
++
+ const gchar *gst_gl_shader_string_vertex_mat4_texture_transform =
+     "uniform mat4 u_transformation;\n"
+     "attribute vec4 a_position;\n"
+diff --git a/gst-libs/gst/gl/gstglshaderstrings.h b/gst-libs/gst/gl/gstglshaderstrings.h
+index 49ea8de..f9a13c8 100644
+--- a/gst-libs/gst/gl/gstglshaderstrings.h
++++ b/gst-libs/gst/gl/gstglshaderstrings.h
+@@ -28,6 +28,7 @@ G_BEGIN_DECLS
+ extern const gchar *gst_gl_shader_string_vertex_default;
+ extern const gchar *gst_gl_shader_string_fragment_default;
+ 
++extern const gchar *gst_gl_shader_string_vertex_mat4_vertex_transform;
+ extern const gchar *gst_gl_shader_string_vertex_mat4_texture_transform;
+ extern const gchar *gst_gl_shader_string_fragment_external_oes_default;
+ 
+diff --git a/gst-libs/gst/gl/gstglutils.c b/gst-libs/gst/gl/gstglutils.c
+index e2e04e4..a38772f 100644
+--- a/gst-libs/gst/gl/gstglutils.c
++++ b/gst-libs/gst/gl/gstglutils.c
+@@ -1067,3 +1067,63 @@ gst_gl_value_set_texture_target_from_mask (GValue * value,
+     return ret;
+   }
+ }
++
++static const gfloat identity_matrix[] = {
++  1.0f, 0.0f, 0.0, 0.0f,
++  0.0f, 1.0f, 0.0, 0.0f,
++  0.0f, 0.0f, 1.0, 0.0f,
++  0.0f, 0.0f, 0.0, 1.0f,
++};
++
++static const gfloat from_ndc_matrix[] = {
++  0.5f, 0.0f, 0.0, 0.5f,
++  0.0f, 0.5f, 0.0, 0.5f,
++  0.0f, 0.0f, 0.5, 0.5f,
++  0.0f, 0.0f, 0.0, 1.0f,
++};
++
++static const gfloat to_ndc_matrix[] = {
++  2.0f, 0.0f, 0.0, -1.0f,
++  0.0f, 2.0f, 0.0, -1.0f,
++  0.0f, 0.0f, 2.0, -1.0f,
++  0.0f, 0.0f, 0.0, 1.0f,
++};
++
++void
++gst_gl_multiply_matrix4 (const gfloat * a, const gfloat * b, gfloat * result)
++{
++  int i, j, k;
++  gfloat tmp[16] = { 0.0f };
++
++  if (!a || !b || !result)
++    return;
++
++  for (i = 0; i < 4; i++) {
++    for (j = 0; j < 4; j++) {
++      for (k = 0; k < 4; k++) {
++        tmp[i + (j * 4)] += a[i + (k * 4)] * b[k + (j * 4)];
++      }
++    }
++  }
++
++  for (i = 0; i < 16; i++)
++    result[i] = tmp[i];
++}
++
++void
++gst_gl_get_affine_transformation_meta_as_ndc (GstVideoAffineTransformationMeta *
++    meta, gfloat * matrix)
++{
++  if (!meta) {
++    int i;
++
++    for (i = 0; i < 16; i++) {
++      matrix[i] = identity_matrix[i];
++    }
++  } else {
++    gfloat tmp[16] = { 0.0f };
++
++    gst_gl_multiply_matrix4 (from_ndc_matrix, meta->matrix, tmp);
++    gst_gl_multiply_matrix4 (tmp, to_ndc_matrix, matrix);
++  }
++}
+diff --git a/gst-libs/gst/gl/gstglutils.h b/gst-libs/gst/gl/gstglutils.h
+index 1c5ab12..fc12801 100644
+--- a/gst-libs/gst/gl/gstglutils.h
++++ b/gst-libs/gst/gl/gstglutils.h
+@@ -24,6 +24,7 @@
+ #include <gst/video/video.h>
+ 
+ #include <gst/gl/gstgl_fwd.h>
++#include <gst/video/gstvideoaffinetransformationmeta.h>
+ 
+ G_BEGIN_DECLS
+ 
+@@ -116,6 +117,10 @@ gboolean gst_gl_value_set_texture_target_from_mask (GValue * value,
+ gboolean gst_gl_value_set_texture_target (GValue * value, GstGLTextureTarget target);
+ GstGLTextureTarget gst_gl_value_get_texture_target_mask (const GValue * value);
+ 
++void gst_gl_multiply_matrix4 (const gfloat * a, const gfloat * b, gfloat * result);
++void gst_gl_get_affine_transformation_meta_as_ndc (GstVideoAffineTransformationMeta *
++    meta, gfloat * matrix);
++
+ G_END_DECLS
+ 
+ #endif /* __GST_GL_UTILS_H__ */
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
index 108f4db..358c5d1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch \
     file://0008-gl-implement-GstGLMemoryEGL.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
+    file://0010-glplugin-glimagesink-support-video-rotat.patch \
 "
 SRC_URI[md5sum] = "955281a43e98c5464563fa049e0a0911"
 SRC_URI[sha256sum] = "7899fcb18e6a1af2888b19c90213af018a57d741c6e72ec56b133bc73ec8509b"
-- 
1.9.1


