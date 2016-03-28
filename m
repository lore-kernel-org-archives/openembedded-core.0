Return-Path: <Tom.Hochstein@freescale.com>
X-Greylist: delayed 943 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Mar 2016 23:18:12 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0104.outbound.protection.outlook.com [65.55.169.104])
	by mail.openembedded.org (Postfix) with ESMTP id 0677C6067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 23:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=60TCkmAukAjOQOrt/E6x5x493R/CSdyx4Edveo3EiP0=;
	b=YA15wklfMu96n4HnqMmRomwa50QpwUa+JhVhYuw9401DAMNbQBCIasB+p0pIk7U0pPDl5kL4924gk0MdUO8AEaX3HwF5Am2YFe3q+/v0hWWrY4awbcgZeM+Qhc2pKSSK8+C544RYxGWe34+5rkf4RW66jz/PxXzEmBPVNknKfXQ=
Received: from BN3PR0301CA0038.namprd03.prod.outlook.com (10.160.180.176) by
	CY1PR03MB1423.namprd03.prod.outlook.com (10.163.17.145) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Mon, 28 Mar 2016 23:02:30 +0000
Received: from BL2FFO11FD007.protection.gbl (2a01:111:f400:7c09::120) by
	BN3PR0301CA0038.outlook.office365.com (2a01:111:e400:4000::48) with
	Microsoft SMTP Server (TLS) id 15.1.447.15 via Frontend Transport;
	Mon, 28 Mar 2016 23:02:30 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD007.mail.protection.outlook.com (10.173.161.3) with Microsoft
	SMTP Server (TLS) id 15.1.453.6 via Frontend Transport;
	Mon, 28 Mar 2016 23:02:30 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u2SN1iO7022049; Mon, 28 Mar 2016 16:02:29 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 18:00:00 -0500
Message-ID: <1459206002-30154-3-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
References: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1110001)(1109001)(339900001)(3190300001)(199003)(189002)(81166005)(33646002)(5003940100001)(50466002)(76176999)(47776003)(4001430100002)(2950100001)(86362001)(19580395003)(450100001)(48376002)(4326007)(189998001)(110136002)(19580405001)(50986999)(5008740100001)(107886002)(77096005)(2906002)(104016004)(6806005)(105606002)(85426001)(2351001)(1220700001)(1096002)(50226001)(586003)(53416004)(229853001)(87936001)(36756003)(106466001)(92566002)(11100500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR03MB1423;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD007;
	1:TxWXxs6SLWY+PWGzIoTJzbHX+aKaST1+spuiNSLDp/wLjIlvBz6pB4aahbP0Yx25YjqrFbcLBUhty+uRu44M7D5SBMxt8brlVuF7TMaxRfSkqdUN1vbxIeO4acH1XT8HS1pptB5T87dqUi38YpO/9SnVHzy1egYm8EetokOhWUPSYiXkBU2/iWQZmXnDvqwaA2LESE1JXk2Hk2TOatpraiRR2fb6JNh3aDbB5JOrDA1hTdw1E35lpYFV79mHZ3bHuaE7xt0igHVwHiTq3inyb9Jeroz+z4T24V5Wp5wFro7/NxorwUIpRs/qwzsx95/tS6fZmi4zDe7cWdhal1hxWT0gXNMzivIauC/aAe2/bajIWilnEOE/n03pnBYKzjNx9fX9C0H+dFbYUiOa/Ek+u8RoR8FNkkWcrBfCZTerX8t36WESt4yWsM5fSORXmDqmaadUV8KIVC16wnvyKnKOGRPJo5vAX9dxLI8TpKfI8iFS9gkYgVW7YBupkf4xdO+KBESH/6l7WivDaSLCdms6kIlGVSS9dE71Y60XgbGrWXI=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 91afafb2-a6e9-4085-9e3e-08d3575d0a28
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1423;
	2:LQ+VJ9I8hgjmOjaTU2dOziBQy8xcn8JSFaE4l4CxXuVKBnZr6i+qT8S8MXAHEvRkuYlM0JYzOH7Yz59zPzjy7vRhOO5ey6G0Qljv+L+suLtkeoLzy7Wi7opAL+KuDO9UG+NhsEO0i/pYMmuOZJJuvmDfA+dEu9bN1S5Zk84GZUVCe2XWN0I8HVB3UhiBTyny;
	3:Rnq4tJnLFqEorqxwBmmgwg9LEQs54BtlH8lFgCllJOxCLaA0Mm2o0DWtKiQQFinNSIG49G0PdQomiZkT8S88GLmakahNQCvHttxsCYFp+tP3lWS0OGwTANwkFZ6ewsx1P864xuEb/PAPPGwB1Y/rb8+Naae7UW/P1VPAzw/aWrt10V/anZUg02IiZ4dmQ8q1baKZgSwrhMnhh9lhsd0NMzaapP01N9zhsLukrTEn5AY=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR03MB1423;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1423;
	25:es1B6RSx9A3qWgEGmXuAZsYRE8oD4/UtuB8VjPqFHjUDS37Z3OLv7j7ux/HS9fObUxhn3qDHCW/daqDa2rd7vdlH5ACbqokUj6kQB9+whQlXPjlWX9TvMvyUMBFQ0JuercMC+1YmN5B6YFSCHicsBRC4olVFfIDhNOAq0XOLQqaNu5Ye2ZAZQFcUuvxfFQPfe5qvw9y+MmwWEqmrES+4rB9/fAY6RRKAvImbPOP3ebVVUMfxNLRGOzmpXYqpyD/W1KcAMAglM3oyvRDs6uRwMD8McG0i84cQFXXukjhysrGq+ZNwlyoo/ri2DWnWTPsMC2hLU9qdR/DUtiqtRnDWwyrTT03CEUeDjg6EUBe2aTtmOT4Q67dK2Kd+TyraiPjh1pZWxnEVXKGXj3Lq8wZE/JaARsSrxPcnl6HAVfm3SrlgrQmDH1BVekp34bNeqjE6+0cnJfjy9N2Z9RM266tw8ksU69LBj6NBOdD4GF1kcKCaeuEwlfQeJK3C1y83JZmlLipkuSzNnp+8UmT/8gh00eG/2LYbMnxhyMgoWvqXrIZitAduSBXjfdFCGZdNKllbagjfLEt8n0wgJ6R4Qdi/oPGbtCJaVMiHOKt7AcNgHVE=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1423;
	20:w38HihEYVf98wOhV90alxE/9jQjMkqfDYNHX3libIJ3YFV3Iof+brrzG8wWbRj/YNBkm18clIO2PHY228a4+cTB3LzwguFzsSqBMa2+R+HfuNE93tGyjpJvCN1lfAq5mGvhjcq/PaqagjnHqGRSB8PPkv3y834HMg+wNSHsSH8x0blDOEAGNbTu9y/jMmZc3k+LthaxGaPNNnXQjnO4SRESmGlKY0jpmXk9bN6Yqa/aBZDH4ugDUZh6qgm7aO2smUdeSzMTJRNp/AxMqaJyRWvstx2XmPtdtHXG+h4DB/Zv87PmWuKNqvwOMjXTPQ9JpeAJuWGf2ZLkrVnbWyulCmvMWxkhS6NfgMxtyBNQnm9j4MSlAq+pG1+kIVaROwUw5UOS16zAUQaocecsTX3Ao4p+dN/WyArU1vV1+VCV4AssXhbACYsUOkuEfCDeMP7Vm;
	4:9I5HO4OunikvvYFzdrrmtwmVvUDIjz1wvH+spkypTf8U8MXCoqGE3dvT4UWjGteXPUOQWqI40tawuYOr+K6UX2UVRl8RTdomDaYZ6ul50hht79M2BkhPF2q1z+f/DYpF67DTyFpGwgZc/EpjaHl0MnVkvPHZpDvzeN8vRiqcVTfMSK5MZ10IXsZOJ/gEeJGe+pbMHkAQUKu45lYg8gAW8pIerHDLSaCRKj1qjINcwFJWs0XFLc2dWI2IKf5YSowXxBtfhkLzyxUKXAWj5Y9ETVDtiLT0X6mKT0CjG6lYTDJkac96ReAkunoQzuBY9cq6U+qkDVEWMYQ9d2teI0QYzllKDKv61gLQJaJTV/bDakvWT6Ly39l+Dzvvz6VVtyJqNaKnwwtW+T8qHEwTLNRKq7E8iEgzjJ/5QFZZD2Wlv9Bv3uHrJvgtm52Q716d3OKYrEXU7NoAu5YGDTO1ys6TaQ==
X-Microsoft-Antispam-PRVS: <CY1PR03MB1423E35877E880DC1960AE6EE8860@CY1PR03MB1423.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13023025)(13015025)(8121501046)(13024025)(13018025)(5005006)(10201501046)(3002001);
	SRVR:CY1PR03MB1423; BCL:0; PCL:0; RULEID:; SRVR:CY1PR03MB1423; 
X-Forefront-PRVS: 0895DF8FFD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR03MB1423;
	23:jFNqMNaF7lETYbBg/uy2r9GyUOAuO+TKrrVfidDHA?=
	=?us-ascii?Q?FIt5yadp29DUfmhTRF+BTkkdxlAN5ifg0Vh7P0GdoMJ5vWog/mgLXh8tuijX?=
	=?us-ascii?Q?i69+nXU1bzLfykp3l8jL1B2IZLAywu22d8VxhYlvzc4/YV+PqbWDjc39mTCH?=
	=?us-ascii?Q?vLqjmPRHmjiA8aDOpHCJTW+Yotblgm51q37CQ1Wfn5lP/4L/afm9Duk5peE7?=
	=?us-ascii?Q?PwOY/ESRI3BviSPj6ayl2naCV+PqQvMR4aLBVbazcaqbPIM7RvvDpZ1gewuP?=
	=?us-ascii?Q?PDVClLeVxnW89ZgGIYdDWQXVuTMlKejmG2uY7Zd1mfIqq7oBNkJU2HIKGnWz?=
	=?us-ascii?Q?5AFxhiVougna08vFoyqog0WZV36Gl56RjNN7pl8vitUxfL31blK2j2EII7NT?=
	=?us-ascii?Q?xUD6n8b43c5+V5rDQ/zuh9BMQ73taf/juLCfB+P8PsNlg9reEgIibKaf4ugj?=
	=?us-ascii?Q?/1opGjB7NOdFW758Ss0+cvrTpAyxAYv8840dJtujjaxy2tJsILSMC0vptvT7?=
	=?us-ascii?Q?xyhIQxmZRdp2md1XraVriSwq81LXC37Ebs6DHn6cRrg5dKBgFf8tqJg16KVE?=
	=?us-ascii?Q?s8y74DMe8MD7hJ7bMMoPcwJrRExys9No75MMmHuEpzOuqAyrN2FSYAZA2E0O?=
	=?us-ascii?Q?xqi65xq8/95sK/rKwt8FPU2YXdWs12Hg7SfpzhcHru7rDa7nlQW4KA8RKTRx?=
	=?us-ascii?Q?wqUk9aaIGoZp6EISC/alcUz00ts5l6rvRfQhmnBcUXlcyw6Pkg2xgxPMyUaH?=
	=?us-ascii?Q?SX7f7Trps6/SBk3kkb/hN1dq91teXoHC3BcOgj2Qe5u98LcSHMIrH+bN/z/F?=
	=?us-ascii?Q?VBZr0Cy8iik0LnUsmsMomc6RlVVnS5OSZF/Y5TvVVzZ1I3G59axes9wkCrkH?=
	=?us-ascii?Q?n6RUghwTTe6YcEXpOMnCFyesmUNOCeEj3mBy9epJD+AU+aOYdMnXfWJCuFCA?=
	=?us-ascii?Q?CUMFeeNxNiYEJnkugicaApb4REPVqF5WvhBMJ5deo0zbCffz5/jXJ+rOpFh+?=
	=?us-ascii?Q?yDNS03yvZJ7eAemyILdLKrsJdTK9UdnoYPGo9PXbjLg227Sjdd+F27BoTW/+?=
	=?us-ascii?Q?a7xbUBB/DDOmAXk803frK1MZdxIzZR9XtiffqBuN8Zwg2eqddFdkL0I3gIEX?=
	=?us-ascii?Q?QIn5cBhK3JfYz3VJflhbAIdayPo+wVxmFvTiFwQdSZCOF47r5nc6g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR03MB1423;
	5:NrKtbfNVJSDXLMpEZaJzVzBYDESSHyY9ovjjdsaC4FhODecpjNJA72rCUUKTZ9ZTCsL1dmWAD0OditNyrWcYh/cVaME4O4/y1z78+cp3hELvsfn9W6ZPA8g4qwmZ7RwTMFhli0EeE3Hum/2O1s8RLw==;
	24:PYz03k4xs4zeIT0xgYSsBhx6Mc9Ig/koB4wO7XTd+1maqskdopqtUOCsimvtLG3H92eB+aRYmV9KudVAcnk8q+1oSR3AeRLkClmoxHxBq+k=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2016 23:02:30.1665 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB1423
Subject: [PATCH v4 3/5] weston: Add XWayland support
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
X-List-Received-Date: Mon, 28 Mar 2016 23:18:13 -0000
Content-Type: text/plain

Add a new distro feature 'xwayland' to enable XWayland support.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston_1.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index bf33588..7df5562 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -21,6 +21,7 @@ inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl \
                             ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'pam', '', d)} \
+                            ${@bb.utils.contains('DISTRO_FEATURES', 'xwayland', 'x11 wayland', '', d)} \
                             "
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
@@ -42,6 +43,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'xwayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
 #
-- 
2.1.4


