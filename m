Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0116.outbound.protection.outlook.com [157.56.111.116])
	by mail.openembedded.org (Postfix) with ESMTP id 3E79F736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 22:48:12 +0000 (UTC)
Received: from BN3PR0301CA0040.namprd03.prod.outlook.com (10.160.180.178) by
	BLUPR03MB1410.namprd03.prod.outlook.com (10.163.81.144) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Thu, 21 Jan 2016 22:48:10 +0000
Received: from BY2FFO11FD006.protection.gbl (2a01:111:f400:7c0c::171) by
	BN3PR0301CA0040.outlook.office365.com (2a01:111:e400:4000::50) with
	Microsoft SMTP Server (TLS) id 15.1.390.13 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:10 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD006.mail.protection.outlook.com (10.1.14.127) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 21 Jan 2016 22:48:09 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0LMm656012064; Thu, 21 Jan 2016 15:48:07 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2016 16:47:35 -0600
Message-ID: <1453416456-27728-4-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
References: <1453416456-27728-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD006;
	1:VEIL7ZMpQcJOg5oIQgdYGnZvMdZts0V+7zo/0V+EZrWl1vBJ6Js3yT/QhaxClm69FbqTqUgGkD55Lb5RIbsem0N/zGpf/YC4rjHWfS381xkmwrPWkewUROoom86WKtDZYlFQFzCNqm23ahsXZxZsi8yHz3Wa/gdSrUcV8jax+AnXQENJ5pIbtv+413/WUIJo6eZ18I5qwwDYK5XjmeFcP3u6M8o7++m7OMATmaSgvrpu9D2+DExJ9B1QNbUdcvavRt7RUnZ3YlsLUVGsQACk7jGck+6QYKj6XiYetXFwFYcyADrHh6008P1itTdbWRStMr8ARbUwg50t9w8LWPmF0SDENnd2WToj1zXWaLmR+V8fytQeVXPZRUuLUh8PdzfQTR+J5f8XtmwW+7JrM8MUNIZGvBF4HQeT6yKYYvnwn/pYtvmm13TW3oXBFvW4dwYRkZ4cb/CoGLis6fkR4hgd8DR62qO76jbKMwX09SsF0MI=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(199003)(189002)(189998001)(11100500001)(229853001)(85326001)(2351001)(2906002)(50226001)(106466001)(53416004)(5003940100001)(1096002)(87936001)(4001430100002)(92566002)(586003)(5008740100001)(1220700001)(4326007)(48376002)(36756003)(33646002)(19580395003)(19580405001)(6806005)(2950100001)(104016004)(50466002)(86362001)(450100001)(107886002)(81156007)(5001960100002)(77096005)(50986999)(97736004)(76176999)(110136002)(47776003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB1410;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: bf25bcb5-1ee4-4796-2866-08d322b4ef84
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1410;
	2:MWOcGVNHRu+PWVxNPabUx1Et7b+/ANgkYxA9Xptx6ujzP/dlgfE6NMnh03vgtPHSNQ6VJ0ZIcJOQWJSjFh2m0TLA115nwtzWaipNto7dJFff3PoV+CXND0iViN8yT8cDj7Wmenubg2cOacaBSHpXlsXweIwb3sdhywlKiGh/Z1ehLjsByBZJAKPw8YhyyxuA;
	3:mGWEHlZF+/Y4McLc8emq2JvuHbkq4XLQwiucYztSeGny3kxD54a6MHd+0MwuAQeW5x63Ou3xhQI5oGx2re348cG/5eWsQLzAVQ3fyj/kJLTg3SvdKIi7T2dW1J8SWv5ZAHrwCyofVZ3H5tkjOqwRliQfmpzLJEdFFtMWUIMDioxJvCKwI6wmr3y/gp9PtqRyYksS0lOtlG2vKz1u+oTMCQP3Vh/YPMdLKKrTd9RKY1c=;
	25:z6lWui6zFkcTPsoHtAXU91QUwMH1xr/Ih5Jq81IyGRsBKzH33XFvddhwX0zefMchgsAbdY7BAyWOcntkBFTviOEailJ7jzH/hmioHUo5Pv0skq25GaaUiZhOS57ykT96R3JRJ+bGnZ6Z10P1U9qKO6tadCtAlQ4cQdjbDHfC5DXhudGYhU4B6tMhYhrpZhl8ihgiAx2j8SgHCgikOgVgqB0TA37o0cRr8qOEiyMr8I/2Pw7XO/9MyOG8sUhduGZc
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR03MB1410; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1410;
	20:4K9+PAVFXS5+OXTqwxlsj9SvcJqhN/tkosdUVpjaXbHHk0q3fv9unP/RTW7uzSy3NfUto/ZttvZ+qB3nd1EOzoPrnYeTiixyNgtfpgglxkEcQeDSUcZqdZ0SX/Ptg1M79DxGTwQbsDo9o6Cb5beJgXwSZ8k6v7D8+182CBNpdYqGm/ZWyKDe72ZdJkEYTYlRzEKWubJPQG5dQmnChUSqsLhlWKnDdSbnHnLUCC6ifn0JKZ6gXfe56A6c5gpTLOFBQzIfaHf3kHqysfLKnac2jtBqwlhHowojWSSjqgSgc9x1NKMJqkO7WYyj6vgXKluvbF5VHl3K3TTE+egjVCdB2kRVmFTj+xE3kbcqwJe0Y2mPcidHGL4ScD5/qwbJjqVgvWQYYUoEfOY3fsfV6DiYvxqGVmg8+79pR3DiEJtP4nr1xkiJ3CGNYaNs51Fp8Boc
X-Microsoft-Antispam-PRVS: <BLUPR03MB14101CBEC3ED68505FEA12F0E8C30@BLUPR03MB1410.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13015025)(13023025)(13018025)(13024025)(520078)(13017025)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR03MB1410; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB1410; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1410;
	4:pqg2wCgoUH6i2f7q41NrymSf0RSkLOO/IVAeSwh3VKQA+ioy6rD1UMDbBFjn+F1WIw0w98ZUg0lNTyHfeiWqGsbNHNFfujAhBh3R3nAVnyixAJ7yfIzfOLKmbAmWheROG13Hw6KjPm3KON6rmbs/Tt8MldH8P3JIGdMYLaGSXJlL8cePz7IvphaIrupwtFjmVtRs5KpemV36be5mKGBIxguXC/MvCWxwyHNOiCK1xuEjcldcUUn0TTlLzRFSmjvSNacz9xaIApihV7cvpvCbPUC1VUw2DE6DZ5ONy0fFqbugrm7Tt5AVKGyOqJwmVoLefXIM0qPmz+dTpamKuCr8DI1LKkpa/gLNmIO4GVH2vrKWqK+AWyfjWG8AcCfpX+Dcfgd3uROgw65PhEwZxzmgAuzH0ygJQ2zQUMzumI+3k84QcwztIPs5MZV2WQsL7RR2jcamlD+8JYZp+evgwxw4+ykiUHiyW4+riZvM+LcsYQWUYJQ9xZWd9hanoLcFdmyb0uKDl54VXQZotdmRThE3zA==
X-Forefront-PRVS: 08286A0BE2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB1410;
	23:stW2aJ+VDdcGCoiqC8sCGiAfqiBt2Td1450RPLUwJ?=
	=?us-ascii?Q?UBO9evphRZY6GGHcr88dLsowDhX8gmkc3JNfMmiOfwVo3ItDwBF5kN0RMOft?=
	=?us-ascii?Q?zlyLvtpS1piS/JZLzeN7VVL3+qJSq2D8YiZ8RTpwiClTxv9WyLc4PglgvPvH?=
	=?us-ascii?Q?C4A10B6TINUKXc2ftu2LIT7l/o0tvhcNMjddHSeWUmjjuApety1JnCEUgB6b?=
	=?us-ascii?Q?l3MdzIREQr+YFi/0YiC6yNM9f87/U8Giw7HhWhpRH0djB4zXs+2EmeiBIVc5?=
	=?us-ascii?Q?yFn3T1mv4vOJYIsjvQt+vpgIpwEPiwy1yh1N7CZ/W7cliCbevL40NeT0hOv0?=
	=?us-ascii?Q?pelolhoLWfr0CoWDrm33m3hlmahvYkdNl2K3WA3da3Pa0Dq5QZ+GvxR6f8cG?=
	=?us-ascii?Q?cPI3DdQ1D5xlWBuS+RDPpKqgZbvnqUmenxkm+ms9uI1sQGVsNBpcfwt6fUhj?=
	=?us-ascii?Q?5NlMxrjET3LdtZKPif1Ay5cj1pk+H84B7fZK+CW1AM2P6HJhe29Pmi87exbk?=
	=?us-ascii?Q?EV+n0vZGUgxBc8htz7OMlWAuQqUm0cTJHeapTUCcWSpzdH3sjA88VZcORoCi?=
	=?us-ascii?Q?IoizBZBlP55qjMVtJ+Qus/WrDIIOggEtxGmSkMdNryLVVAmVC4htVCpbO5Ay?=
	=?us-ascii?Q?29yvWbvYF4Mx4oyFfX+9zTawC6dNVTYmve8Ennixc513j64MJIXEEQbxQ/Ji?=
	=?us-ascii?Q?mLXNhREV0Ye1LVmdv8fX+hnajtU37Fs3H9WLplZsMH1BiOdhWH8rcwf2ADMc?=
	=?us-ascii?Q?sMdk3igljXlzDr8g7yOt4h6weKYThL1PILp9sqnazzVSxRDGQajGlaAT+mq5?=
	=?us-ascii?Q?2uFfZV6qtqaj6fiYIDfUcQV4IAsbgfFGH7Sb1kjxBade19tv9CldDGNBaq1P?=
	=?us-ascii?Q?OPJTAQ2JILB4g46i61khucs3vWbUSPQxuveiIkM3yXlkESE3gV5B2aihPR4N?=
	=?us-ascii?Q?sjY6TJHjgLFm5afoEjv6r3kYiR9sy0crfPC2HGsRPegtiL0WblhWq41W2km0?=
	=?us-ascii?Q?ZH0VroQuvQVjSuANc9s2BKZcSAjauBCzUfgWtziTTHY4r4PNYjw4hxTx93mn?=
	=?us-ascii?Q?VaOaZfOiPfhFC/ptz64RXPUOwqJMtiTgcCkz3XFOw3gJSDY3vxO2qGExKAcN?=
	=?us-ascii?Q?3MfEHjXI2FvygGUn/w6AzmEJqQjXmHR84D5S6g4ogZOGnmL1AuOfA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB1410;
	5:2tbmbm3X2TLX2j+I2mgPdHPnWqCbQfyv/qv/Lg3Z6j+M87FJmg59U4qMZPAfolXSL2dp1mTa9Bzf6FinyrUA4mV5mksp4U8xwOy1d5kN02ti2VUHQCZMUSXv8dbtW4kDsHog45DQx1KZ7m2vMCHoZg==;
	24:mvW3P5UK/eSE002useydPOnwcPtIevbFhJgq54pvlEkRWxVGWPpDMjm5VFhj7nbsZFQAbA3lNB180sm/ZfhFN/csaCpvVttxuTBk4gx4ygk=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2016 22:48:09.5061 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB1410
Subject: [PATCH v3 4/5] weston: xwayland distro feature requires x11 and wayland
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
X-List-Received-Date: Thu, 21 Jan 2016 22:48:13 -0000
Content-Type: text/plain

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/wayland/weston_1.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index fa6092b..d47105d 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -22,6 +22,7 @@ inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl \
                             ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'pam', '', d)} \
+                            ${@bb.utils.contains('DISTRO_FEATURES', 'xwayland', 'x11 wayland', '', d)} \
                             "
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-- 
2.1.4


