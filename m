Return-Path: <prvs=72899bf67=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 5054D78860
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531775059; x=1563311059;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=1HwIivMWqXdySMw7SPDl2S4RvyvI54PmwtA49PHYwY4=;
	b=naJIW2hzqLEW4o3jpw580SYujc6Egk98YTEMvNGgQOx9JwTXn+jL/85j
	fD5rPo6keYWgFu0nuZqKmDIgsmgck9+s0T/zFXAxeCxk/zRAPyfpVmkwE
	VtwW0xcmmZ0ssIi/4IzqIYrFIZMdIWcY4Fsa79dKrkTz6X9zbwj3CpTpO
	KkAIo1RoF0OLsBIJQRKjm0zTLoaT0F6vF+6sLEsj9vebjNJeKyDMKe7SJ
	pN/1KfmZQPZYgjjrk1uwFFVGk4j/TPrnPw5gs4cUY/x+wc/A1SFBN2Zgc
	RSpoOtpOwNLRSvFVHKiBsAkeISwrIyBBjIrGcgbTO00MZyjKg9YPJeP7J g==;
X-IronPort-AV: E=Sophos;i="5.51,363,1526313600"; d="scan'208";a="87336378"
Received: from mail-dm3nam05lp0120.outbound.protection.outlook.com (HELO
	NAM05-DM3-obe.outbound.protection.outlook.com) ([216.32.181.120])
	by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2018 05:04:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ptdsrWUkmczBoYW5uw8Q3RPcbuqMaZvht4uCxXDSIXw=;
	b=cnGV6mdJtxze2iDtjt1m9iA/5Gfs70up1YvHkSHT7rheMIkUd4P3buJ2Y0xEnNJ/9qnuqEYLdobPar7byVeG69zRny9jmzxMpJ0oTZw7wDHLkLIkz5AjjFF7+V0VnoO0wFpqpVimiV2PuVsMkZsoMCFDGNfgi+keEO3J6oO5/68=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0395.namprd04.prod.outlook.com (2603:10b6:3:9d::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Mon, 16 Jul 2018 21:04:16 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 14:04:07 -0700
Message-Id: <20180716210407.21494-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR03CA0036.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::49) To DM5PR04MB0395.namprd04.prod.outlook.com
	(2603:10b6:3:9d::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a339261-ae6f-4caf-b674-08d5eb5fb147
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0395; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	3:TnM83dZn5H3GQmHIn+D3faMnYg1sJSpQ+sivdxDlSV43Hb/AdIGAw1FUl4NXuV/rtpSEFI0qOpFNt7gvgrshVDSMavdZPA3K9kpEJEsINx+bjqg/CzS2bkJaO91REw/soFCXycHuekXn6pNrXovdSMumKv8WPl6z+eE2eCS0+VPZY4dr0k565PQBEmDxp9gro5yl2CP+iu7vQnnOy99wn1S+OoLVPKflxeh1hYuBVLD4bqWVVlfLpV77QkSn54Mg;
	25:yggAzBUiKx4Whse1gpufw/h0iimiue8qnZq5tP5dt7agRWs6+3izMmderjWpm/LS3xxo2nDJ8ID+rcxNUvUKgAKQvHnOjcGr3QGiOM4YwiPHZR3LzInsvtzKQGq7SM5xd2wd0sxosHYwT/cE2AwMRjWSUieXivvAzTQOlc0jbRYHdJAKxw8xVUliwsQ83FnNJjZxmG2mHynDRWceF6aLx2ehExa+vh+Dwkvg5ipQEEUDbm15BdcNlkjiCcke8xoxJKeGhcmItPFuhaoGgCwq7XRkLytkmG2gwSOvipi8HImgfgXLyRXoEHSRWFC0szdcJd0DdHvDUpedms6I+0Yeuw==;
	31:aFi4qOPZP3l4HgoR/dTLr2x7Y3WqVBSKXKAUVfNoApjRd+kfmiPfs0pc0ANpnKX5IRVXzWdgrwZMxKuRaa2yn2Bn5ZlwB0QzvSbcA527karkWw1jk72ZwrOm/CBsQr7UecazTx29dhtwFgu33VplPVzzFK/5zfqAJnKngrk96k9ZffGuxlEWWFShUyb8nyDudjirhVfpZgNLA0Nh6mFOcfjs0A815K261jXhjelX6NI=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0395:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	20:PwoYTKO3xEzlOljXTmfJVUfUsRie5GZLA7Cxe+glnmsHjnkJCs3PEQF50BYOczd71mtNcb09LOEH8omG7XrxESn4WOgMwzED2oma2BKJNRPhVrPUOlSQwaRUl5DgCfrSFPatjjJ4X+vuVq+TQ7xtVW+HjIARwDpXwmfHE+L2Eij45JGHnDCBX/mZd+Y8C+rnRyGOvv32F4XFgMSGBD1CrpxtgdDDOSPFqq9tfnqHygsNJEgpelaGQzyx4MU2l+ziYdvdbYO2pHCmz7YWIcpogyva8j94IepA6awYnenqD6+4S5cGMmkbm2bJoh1saNerd8EH88+2arUEStzgfA+WOKFnAWOZL0P7QbC/6Kfond4iXZv+Mtu02EnPCLv7ZQoj928VMBgSRLyfVELfAavbHgqzy0znfBNvOoyQXynAYPb1cHqODAg7MvatPHhhF8bEqnExADJ7MUjX/UkJTlc1ZWZRjzZUYMANaBefcPFWH1WmKaDQPNJOQ3xshT5Vedha;
	4:9bdrYY5kz7DUpRJpY/b1wSh4CEynd3pdnnOa5+0A42XwgZnocblfUg4J+1wakTSmtDIshelJN4EL6679LhPR1utMDFnMFQgN8AiXAN4LNJ2LQModAZ+dlju6d8S5PeQttRyfT8NQM6tdIFHyTFt1UQUj1x+ui8KNQz1UJ7406nrxZTxCN0uxBwkHL5SuV0nzdwZ8D8KrOE5WVQBq4gn1HazEQ08MC0UIK5aEwFegyPplx43eCKG6sVToE2TRAvwXck1LB2O6IZTv3okWYImSbQ==
X-Microsoft-Antispam-PRVS: <DM5PR04MB039550EB795DBF8F10FA1EBE905D0@DM5PR04MB0395.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0395; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0395; 
X-Forefront-PRVS: 073515755F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(346002)(396003)(366004)(136003)(199004)(189003)(97736004)(72206003)(81156014)(2351001)(86362001)(7736002)(105586002)(51416003)(8676002)(14444005)(44832011)(6666003)(6916009)(50466002)(81166006)(2361001)(6116002)(1076002)(50226002)(6512007)(305945005)(3846002)(52116002)(48376002)(8936002)(68736007)(316002)(186003)(16526019)(26005)(106356001)(2906002)(386003)(6506007)(5660300001)(4326008)(956004)(47776003)(476003)(2616005)(66066001)(39060400002)(6486002)(36756003)(25786009)(53936002)(478600001)(1857600001)(16586007)(486006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0395;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0395;
	23:8hhEtvzI983VjGEKalQkPP0VVWSr8TBXoewkS7k0Y?=
	=?us-ascii?Q?YwdkMVbDZ+oagcZxniAWoWxTgHjCoJCWCTICJGcwpCDxY2JwtqHkFLPyFJA8?=
	=?us-ascii?Q?x2f2vb79/mt+qR8tY2EZFnKEsaA3udTygddvOmPpywa9Cfi2ECAoMKa7O7z/?=
	=?us-ascii?Q?IJnc+oi6DDNbLtmGaeQbmG029CAsRQUPn+lRNoxuaYcc41nbjGLlTaXACZR1?=
	=?us-ascii?Q?2FVwn1RSMbOQdSZBIc1AwSHRKKUjEk3+cMBBzU2ZN+OVvkwQwo1kHo06E45v?=
	=?us-ascii?Q?EV3B9yu1v408Z5rYyfj5s8CNz1bEx1EH9y+sOzdIz/Fb2PRtN8nvPaa4658V?=
	=?us-ascii?Q?3tmlSe/K/st1v8wbiEn+cgTPTR3bNlKfFUHWF6E6Z9wj2/r2SikFBcJWeUFk?=
	=?us-ascii?Q?paGf2ZJdVXo41pw6W5qr6+RR8uaThmNJQk6N1QrVS04fTLiQOfsPh48qdW6N?=
	=?us-ascii?Q?tcfqk+Z4t+QVwI3vxXhecTFmcD82imtQHCQbWKoeAThVK9hdwWDh8XpL8E/n?=
	=?us-ascii?Q?uznz7/zTeSEPjvx96Lo93MtLYAO4QBV3mIufcepM7neGYNap1tzx3C1v1aul?=
	=?us-ascii?Q?tpY8UKDIogpszyiVqW6QW+v70RfSMUWxV2h+AVfqCSGA9/L5efQ9R4tz2c7D?=
	=?us-ascii?Q?ekTRtffWhim+9oyB6yL6GbwT/ng6x/9QsdfokRS5bWh9OaGMHbrpbOMkhKEa?=
	=?us-ascii?Q?VdzMIJiMmJzdy33S5ANyq0ARLdLQ4tmyavmeYgUnJ5UOY/dSpklHlLfJRXnS?=
	=?us-ascii?Q?AwxqooIdhUeETRa44dlDqkn4/Nlt3VifH3ibZNhmDbCuO3q8IPYOj3DN//th?=
	=?us-ascii?Q?OJzNCs8qHBmYAqgE5HwdraN/+nfZ4U6tUNSxwwcSd2XNMdvh1478mZk1vBgh?=
	=?us-ascii?Q?ETwsaxqxdoBabBvk4Oxg0MCEmt7wTM071n+JTF3tVSTiS9ngJLqPdLGhhfDf?=
	=?us-ascii?Q?kB2n9ajO+ug9X3CT71WPIG5cx2mVxOduzw6ehusfXcXHGkHFn3TIoz9hXP9g?=
	=?us-ascii?Q?h365BtkgxB6XgGZuFVmoe9/4h08D6mf5OmQxYQp3sxHrwDPlI3Z6A5mpP4dB?=
	=?us-ascii?Q?VeI8y417xV3+ng2/CLXEOdG5UVkB9f1k4F/WkKtYuVY6yYLgNFGAywudCcI8?=
	=?us-ascii?Q?Rsel9IbCsNj2pudBHdc+GuRpcQkjM1FV0QlEjBs8V0CfZnmzZtA/IKiTSK7I?=
	=?us-ascii?Q?5yvhMS9oA3DBt5IeYdg/BDTKKkgc1yFkANbfH2P0jaXLoQkkOJj8oXvB+JUD?=
	=?us-ascii?Q?mHRvb85o5sC0pYr9fP+B+59ogVKTDNABfbog7gW?=
X-Microsoft-Antispam-Message-Info: gvFOsFOzrl/hRN3DkBAJKjdF5Y5AN2l0UMi5ii/GA+JiafBax2idPR7MnTF+kitTSAqdcJSR4xfHWPWdohsCuuPGuP8PQQBh3rrlPcbeD9RwQO5xK7DDrpBqM/Byj3a6kQ8q0MWrkZ31m3t5rQrkEV3DVf0SYNPMWnjJC8CwY8SXu1Qw5nvjeXrBH1T/e0Brmp//A6mSDaBpkMqJnZRky+o62++qMMMI09ypWRpDAlUrx3ZLelTiUleylpcK2Lw2o5uagy+Ua4KMjBLxNrY7Zy0obYij0zeBoumblT8TiMRzrT/F2OCTrjN7FRgukklCDmbXDy8wirM3CBZfmxpS1Yo3TEc7uSRxXJnwTwwKzrU=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	6:EXGjq6Lz+9lt/Mby29jXK2WB3f1yW4oExJsg1+FEGxh4p820KyFMTwiBGoNrGAImx8rXpsk4hiV6io8oBdjQaDDIeYlcaoepG7PwsAZQgmYX+08hO/UwSgOwDJ55hHnhSIl7CQoaNotAncRx3zBQ2DIzL7RUv5SeSC5jUkXK1OK48yDeo2Tp542ZNAGA0kimCYRXSlDWU7hBkbNdTtgveT47Wh55t/8RdqFrTg6yBIE4QaamaS2o7OWAll7IAniTWDmTvEcQ10vfxRlAan3Q0FH1LUZ/UllW5C+Wi6wh42PpBEgjoX8USbgF70kZw2nFuS1k40fCn3GnkNhk5jGvda6KHq4RWWnh7UkMNr2LUKtvJPuKbOj1q+lCnnDFrStLIgzLgm4I7iGw0AsSBNTtn1AtuMU4cWp9nIMHx5sw39ZE/N2iCbMyfm/WFt8OEPfBmWgtJq6XHOck9AfbaDS2nA==;
	5:zSq+ygo5ZGevEJRCsPn5FKS94AL1RZfQ2e6Pz4xKtF1uqUbNemHrW4GzEKevnLUQq6of+KSLt76sQYcyWvgJMrnJaCyfmSSvnjT47oOxHnngOSYYckSynzfIDuMK/8Lx3HmpJ1+/k6Zeto4CEV/jyYnrehhElPt7TQEdsZ5p9A0=;
	24:9KxiIklwGtSgPvU+flEJ4S9mgfvsiqXz2XkOjuHNUJ/1nfjR/GfhB4/fL0ITzDNJ0DLDfzjqhHO5rLtM8mET8mRPn93I/Fs1U5PzAl7jU1c=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	7:tiMwY6BlDNpq2vjGM0/TulVjkz4AMWr92d4vIN5Wf/ouZw1+MDa3mtCt/61Ow+xhkJ2WDuBNYdW2unkCpqkD89i6/5zKsGaIHScP4MbslqLxCv4JTMO/Wr1r7FWjwkvCNjrpQhp0ulsCEYFNdtfETK9V2I5P6xHmdHa7dTNzS2EEEHqaYTKLx4vl5z8rDGW+r9EpSgEvRtPbEUT2c32g0pSamWdkvtFcpAgMueo/R0tJzXjC22m0tjaZK6eonrXm;
	20:+D5YDFK/sCaLRsc2BaIBu42uoHyt+dtyxlLah3CZm8msZjY3vyLutCPhcLbfb/qdl/iu6E+ujbU/40vYHL+OPGCbvmlAMUndGdUAlXQyIt3rusY25dI6yt/DbQ1kA9iyrZ6a/uWRL/KMvQzwGyzEzacIjPWXIHNi1fBtHTlfSVM=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2018 21:04:16.9238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a339261-ae6f-4caf-b674-08d5eb5fb147
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0395
Subject: [PATCH] dbus: Enable user-session package config when x11 is set
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
X-List-Received-Date: Mon, 16 Jul 2018 21:04:17 -0000
Content-Type: text/plain

When x11 is set in DISTRO_FEATURES enable user-session in dbus as the
user is probably targeting a user session.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-core/dbus/dbus_1.12.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.8.bb b/meta/recipes-core/dbus/dbus_1.12.8.bb
index b3ddaafab5..7499b93244 100644
--- a/meta/recipes-core/dbus/dbus_1.12.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.8.bb
@@ -102,7 +102,9 @@ EXTRA_OECONF = "--disable-tests \
 EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 user-session', '', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                  "
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 
-- 
2.17.1


