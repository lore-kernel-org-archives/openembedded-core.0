Return-Path: <prvs=696fae14a=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB2675485
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1529005519; x=1560541519;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=2FvTuDtKxhZfmTJOwDnGW5JiorfyEkrTiftbin3q0M0=;
	b=bmTg8H1q/u43RvhMrYC9zK+ekpZu8qJaFiDgogETTC4ZuFoMxSSRWLRT
	hv5elbTVYXinTIak3pxqjbJIM2iXGT83AgJVgE2/pMkprn8gqHnm3pxJS
	Qbhl+kXFirVX9++h/839Ii8LtVo8NRtxN97tANCZm6OquS+3gIIXKQuOn
	a0lRUhIcQloEaS82U4gslwbu62Hixbt1O48y6ZzBflR4KnwbD/QxNB0eN
	5T3H1jjVRc23SIH+cymRw89ZxVxTSNlG/owW3q+H3htCIn+ghmvUvgrLr
	xuw1OWVqIodEi7SnAwH7kjCTLTnZVdg6GilyUuoLD8Hnl6e+6vs0T4j8+ A==;
X-IronPort-AV: E=Sophos;i="5.51,224,1526313600"; d="scan'208";a="82598189"
Received: from mail-dm3nam03lp0020.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.20])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jun 2018 03:45:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uae3i45fkPRmFjMZMU2hqWWIEV2zZ2ZP6fHqhgOVkGY=;
	b=d3HP1EDAvC9EYXbbkEop7711y/m/5sxbnx0g69suclB9RoYBp4yt9e5SSIMVgk973FBy6P1WR52IaxyhcMTfQMyIFlaapVnogIerwoc/zLo9s9fd4AuQvZ4RytvNr66Sl4cO9DTWn522XDzEWwOzDfMCOVs0H8lgkxxAv/8L5iI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	CY4PR04MB0391.namprd04.prod.outlook.com (2603:10b6:903:b1::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.14; Thu, 14 Jun 2018 19:45:16 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 12:45:05 -0700
Message-Id: <20180614194507.93168-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO2PR04CA0113.namprd04.prod.outlook.com
	(2603:10b6:104:7::15) To CY4PR04MB0391.namprd04.prod.outlook.com
	(2603:10b6:903:b1::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef43e854-d91e-48e9-6073-08d5d22f5a6f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0391; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	3:P7y5AYTvW4JV7tj1H6m83ZpRc0VNe2uxAO5grcWlFUO3eKOcccbUYXvD8agOPoEjKyHIclLWtqhDCR+qu6hZnCJIth2GyDNsIRqxhO7Yc/8VT5yVvTuuD9O7z/+XNzAn1MvRdGyXverjbYpZvBY6ig+c6ioJeVyIldB75sQZn8bRn5Gg+cvTmIYQ04qKeIv8yVoxyrlxozBj/+zYXV/MpnPCygKXXGSF52FrilLiSbMh5U2pjpQ//CgeBGCiW2Qe;
	25:4DBVByBP/8Lh0LLmch0ZXQXUqUwAdpNk1G5pYHw3Kg+Y2j5eK3OxNdkJ3FdG5sHSQpz4FZpL9evHLR7FnZ10/5q9ePRvTNFhvHj/Eiu2LmIIp7fdyzmWr722m/4J0OXM77RSKCvqdqtHfjBr+hUN4MoHB4lH0LgefiyA69MDPBLZS+Jw5Fi/Imu3jfocfeolyuPptiQ4EnRtuAy2+SQOoO0FnbbGBxLtPSPBw6V+ZQqT5ZZ5el02cu7T8oryRQSvgPECUG6pZBChMq0LJGHjXIayK60vC5l1LXA21t4urtheOb16JcL11WDqN3vr2E6svGZkGBVN5Vsg+okpf/N03Q==;
	31:UVUSE39uiA3eQkU8LTgweSZt7uccH//BUglR0R04TuzGrTAfWDLbvgAPvt3GiUjIpYKEJeCIxhcZG69/OUElCJqsvfivLVhMPscbCh7b9Urg93Eeyrw27/M/Y2aXLj0KK22U9RP28QscV6a54B8t6K7c8qSsTAsiUi4uJLEmZEav23b8KOvJ/xLFRw9dKkVEBFeNNOjUqwiA10zGbiiYMg5DrysEluk9YuZv91ObwBc=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0391:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	20:zJ7Cm5bNnavY1Ve7im8v1WDbEe2eYqO8ErflHuBWLwbfg1JTrMLr+R2nVAAxda+eXFn4o9XsoJT0WFDtQ/UmGES/oaXO3K2cG7R8GIwosQf8LKRQk2CFvq5YzS4AcRwrzgBQwTRUSD0flZAc092q2T2/fXFebohzWKl1q85nGiT0vlCkjWaY5tIB4rg4dmPrVkmXf3JIaoggw0A6ob8H/rrluT3PX84qkE4Z/5VKXN+W8Kh+K//0IFCJngbG+bb7GuNQX5J65J+til+guzGnPxGAC9K73rvt6GPTqEoq1CKZmJr1mLnNlrJa9YNkfOW7b8YoND6y+8RvlLTzHUtbT7pT2qdfG1elJXhr0BiNQmiSE/Y7lNdOw+g4ekawNgCBGoz2eGQCFr9R470Bzlp1qQv7jpGk8dFKSYs1aPGhsMde/APxXtxC4QUV2vJHg1ed3uC7mXJzvhhFYooI4Aud/qD5ebj0rWgmiWMszgQX27jjycLlYPfplRScZUNTJDZN;
	4:t0Upc+FDF+xHMLvaZerZQUEaqEW8w/0mP/M+spqy5m5z1+3bDT5zM02T37mn2zGlrRe8Uooh589//o5fPRr6RxKqQ9C1Hth3Qn5t6282ILYAmVolyWUdOcM/adZQdRbhW5Fg7Kb1FjOZ1Ch8Trircn9Cfhds9l5i5e8mc/wiz50CUwwIv4VL34MzpAcD+mIIIfkpAPenm7tX4tc+/CQhMqllPfReOfJVBv1RwYlrBiwNSMUjR3FMOPxhEvLu1xSQo+JBcVNTvvUB59176TtnQ0+TjmRJxs6rOMvgTndTEC7mP9y/p2j4I60Zja97c1d8
X-Microsoft-Antispam-PRVS: <CY4PR04MB0391FA7A129436C6F10C6F20907D0@CY4PR04MB0391.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(73538370219878);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231254)(2232076)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR04MB0391; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0391; 
X-Forefront-PRVS: 0703B549E4
X-Forefront-Antispam-Report: SFV:SPM;
	SFS:(10019020)(346002)(39380400002)(366004)(376002)(39860400002)(396003)(199004)(189003)(36756003)(50466002)(316002)(6116002)(2906002)(81156014)(305945005)(8676002)(7736002)(97736004)(5660300001)(81166006)(86362001)(16586007)(68736007)(3846002)(486006)(6916009)(6666003)(8936002)(50226002)(1076002)(59450400001)(956004)(476003)(2616005)(105586002)(44832011)(53936002)(25786009)(26005)(6512007)(51416003)(47776003)(186003)(66066001)(48376002)(2361001)(52116002)(2351001)(478600001)(72206003)(39060400002)(6506007)(106356001)(16526019)(386003)(4326008)(6486002)(59010400001);
	DIR:OUT; SFP:1501; SCL:5; SRVR:CY4PR04MB0391;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0391;
	23:UrnuDI+x80/o0GrXYs4NTxr9sd+RVCxUERzVYAbh2?=
	=?us-ascii?Q?vfpQoM/EXULnSTHAxeGvtSSlYuLHgy5HftuY6zacjeQ+/8Gw7371iG2EmkVE?=
	=?us-ascii?Q?eNnE09UxpyAJIhEZgJG/lyLTVbhO5QQb8bmmf4dywYr3sPhqWE0ALYntlYKe?=
	=?us-ascii?Q?EQoWgvxTQJEcUtO9+zALqrOIcXIck3kyQpy/iQuZI/G2yXvq5N4v9Bu0bt6Y?=
	=?us-ascii?Q?Cf7MwXjjYTGSUJNrO57btk6NoRSzFZav3X1PMpImEKl4CWWHG7XPYaJy31IS?=
	=?us-ascii?Q?PDIALx0UeYvVt2l5jpN3ywYp1OS/VV4iem2hCZ7+eqvUjVskwiu63FCFDaeF?=
	=?us-ascii?Q?I5G8JQWPylIiS2ZabxquEP8fK4SdShL/Y/gI8FpboeuacnmM9SBwxg1bKKiA?=
	=?us-ascii?Q?uOZY8tAvBhyorfIToeSIrWWGn0Okb+WeJdh2ZZ0+AWbrzUs5Ls9eXmCXXduU?=
	=?us-ascii?Q?SrTpsTwZcpZoGUsvkHXo3mwTq6lsUWYiZ99sHbok2Vg/F+j4mfOnBbyP7zN/?=
	=?us-ascii?Q?LJq159eg2fPbmP8/oYKaUDXabkBtpHCqrlzPYX/nPlzquuvznhM7R/syvdgN?=
	=?us-ascii?Q?209KEPqfON3AwNN5M1Uu1CRQM++GuscbzN1WpNjrm80eJBdhPgTq5XO5Kb46?=
	=?us-ascii?Q?xiA3MLGhBeykj82ZkGApIVgZtkTpWsLcNy9DxGo7ci9umc0F6zNANFioE9mK?=
	=?us-ascii?Q?tze6aCR6RAzlsC8zih7GL8zcwvn1/AjSkYyne4s/tL0w4afjad9nLcgYXkN0?=
	=?us-ascii?Q?1tBQT5cv1Sgzi++UhIAgVHjoYpbVBkkCfBRN/Cmf47i89lwWablwi98Z5KjQ?=
	=?us-ascii?Q?WhKby1Ld6UVyiKj5cDLhgd+JXOwv4II/kkk3wzPk6kQ3RYvP+xWjW3aWIliL?=
	=?us-ascii?Q?1FA5GO+U+iAho14iqVpCxwifAtpSSBtSDdHwsi+Wz3tqBw3GCVlAJoHC/ePr?=
	=?us-ascii?Q?vs8IpDnFIKZj1DSLWbTs2fbiORwMAIavpoUekUpEOIlYlvO9BiRrmo/Mth8C?=
	=?us-ascii?Q?CK90VaWg6BtYanL6IY6hSjtE7uNEd5PZ4mZkvv5ZfYgGYxmVjvvRk2hmtYei?=
	=?us-ascii?Q?Xinci27KvSHhc+5/Zpx5ekDgt2g3KTKCnLHM2wKPbo2ix4m68rMeHVRHj48z?=
	=?us-ascii?Q?2FeI96NKJegAo/+GPWR6oVMYvA4yMEt6vH4pqa9+L3i7AmE16YkzW2H+1RGq?=
	=?us-ascii?Q?8fpJlU1wtzJFjirhf7BCSnm8BEzYkqziWFs06lq1PeB8qAs5+931W4MQ3XU0?=
	=?us-ascii?Q?CmnsD7ul28+1QZ40L14lumC8CbuT9PcoAJSv6JCafA6Y1n1ElQ6m2Koplh2T?=
	=?us-ascii?Q?bR8AP6qiJMe2UIOqha5mC/zFngOohXvV0e3yab7UmV5?=
X-Microsoft-Antispam-Message-Info: dMnckO7oTnBNXDChU53kf5NZGG7SoqTN3yIczsGxAfAqKZs7fQRhTJPBIDh5qx2HEv4YwsgVJ8oMguEIR4GyVaLSUZ8mHgJMLfPYKsx63wSlMYXRKu68dhKV8YwgC/+4ryiIPbY3BA9qEEUbg1C6zq3WjR/g1qCLK8SD8rIb60hMg8uDd53Pv27h3VceSKNzhb4vgC5v2MFCKm8a/MzRnanpBj/HY3mR+DHxSY15cW208GXrqCQvsLtwzDsOJm3aEu0Z590Fl4h6zYBX2OJ/TplKIfzf/zbQiIEmmz4B2X73nVMa9J/Kch92FxfP5wje0Ppdq+FsJQSXhLCk12RD4gXvDxl9oLpPNmXmyc/9Oi6G++MeEJAAU1PTvsdPDs7T7KdzIY3HLyMefgtFQoA44Qdyh9QqvQWkLnVfCveEl+BFQTckjPKnwSgxT4KCvbBbvrYq5mtrscR1vpiZx6DpQvUvlK9d9SXJ6VmM9BKlAc80NiTNOg59hdDYwtDG8qQI/oPYMkb6axPgSMt5DvOSts1FRZh5de7zG0I60N/I5x0=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	6:Qd1w5LiXBboXdMvMXNP9Dka5Fy7SXlpY5egBNk2gFi9/x41uxAROyJopyGKn+Q8FXij8JADmIshfch4AKEDHoeIpNAH7EPFbgQYPD6oS5jnONAHuU1LYlKKHdylOlDoAZYXxFpzjcK1qaLJQzjbhE1GysKLmJETrSu3tM/UfJBw0o+62eg0HauUC/0iZQ77bW9C0KLIqB6/Nz9+dJtWeVh/XrZVQArJIkpiGH2arQkIASztP42qDs4tkG144MKFEROZFTIYyYmmWGoT5lX1TaSbbuQZuuD8bubLkCS9/efKb8jpZHzO9BC2SsfRHTzerMw+mNpnexS2w404kng9AZwcyYJn0yeotJtdVvOu+nXkSaiAGLgLnBh2VGKEY0+M1aUiZrROl0M0kdtUegf5l5dK2VbPINkCKAfzAL+YlhaHSrmwwacMRF+OIaQRJeyTGytuUwWHQ71IUJWeyciT4FD6eWeluMqgeIlClS+Uay7+USuTFrKkP4JPYssX/JvQ+;
	5:VgR1rV2N8HCJ4G4RYOX/tJ13AbRM+18gtjkK4cVC0voiDFKijBxJhOjVJtBSdUaIgoL9s6/usrZW27E2a2XICAWj0lC9OPv3UaY5Gx1FPfKejfgKpqfo0FrZv2puNLS3n223skkHY9QEIS3I1ilM+QsRI9pKd7plf604DKLlF7I=;
	24:wTPGoq+A9tZ8UfRUE5v/VAR8UiCOj2GZ5Ljar6CYyx0cO7/hxr/lxHggA7ppLMr2eAU3gbq+mIfrFsHoHLmdLw==
SpamDiagnosticOutput: 1:22
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0391;
	7:fQ/0kOLNTTynoYXvl8DEZxWAzNTHZd8FFJeV6sZ4CNYSfodkY5gmnvTqZ/7HGtbIgLjoijFarrt2rzSu/Kl7B6L/okgTTtSytpw51CxX3UMahMSd2KuZqoQLZir7knEekuDE5J8AHazjbw85nj/JiVn1yAN4T3WRLNAwwCTtSTCReGWVB0H9BdHr5zJ7W2VsX97jfTQolFJxBTjngWELlhu5rqdH9nvM7bp4JLsmUWY2Ilx+g0yYj/Atzc4TH0Ho;
	20:F1OqlE23p04mfwnoloob9xDmyDOgD6fGwqJ2TCoA7nnhq9kpJ34ByvD0v0d9Bfsuu5vcK05tzQLaa3IElZkGF9PekJ9uGZcda5lPoE1ofsfBvzGBoFsUM46K9J8Zx8LzmtkuNitR27S/5V5/gR/D0Nme8W5iQ9zgiDXXgWdA6fs=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2018 19:45:16.2955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef43e854-d91e-48e9-6073-08d5d22f5a6f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0391
Subject: [PATCH 2/4] recipes-extended/psmisc: Don't exclude autopoint for RISCV
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
X-List-Received-Date: Thu, 14 Jun 2018 19:45:16 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 82ef947709..73b4c56f69 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -19,7 +19,9 @@ inherit autotools gettext
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they 
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext 
 # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
-EXTRA_AUTORECONF_remove = "--exclude=autopoint"
+AUTORECONF_REMOVE_ARGS = "--exclude=autopoint"
+AUTORECONF_REMOVE_ARGS_riscv64 = ""
+EXTRA_AUTORECONF_remove = "${AUTORECONF_REMOVE_ARGS}"
 do_configure_prepend() {
     ( cd ${S} && po/update-potfiles )
 }
-- 
2.17.1


