Return-Path: <prvs=722272e76=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 701EB60721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 21:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531256907; x=1562792907;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=SqYCTCz+4cojRBucg9e/pai92m3AB2z/PPnsLhcDlh8=;
	b=Tkv26tkHMhUYNwIwya0LC8OBagupEcTrxlAoVGb0+bz0oBSEWBKzyTnJ
	3aAqoxm35W32KcJE51yPq9xxL0G74bk1P4Nz1S89JVofY3t8yzAFp+dki
	Q9O2SwRubNX2Q3Hls2J5s7uS0AvoyLvOUOvltsXfcGh1J6mlj8rqNdtpJ
	PQIiRLCcJMqywecn6eoZlaBGDp1aLw1zoIz8uXxIRnInvW8ZAzvH7pPrS
	mD/m3Bx5/lg+BRneNOyCO/DOFOKlYOK1D8Gk2ORKv0KGXQ3807AAVnggo
	EGBtVIUBxZGsU0cM45vhapfgYKdVNlxOKkfK9Z2CTh7CFJCw/A6ga/dkF w==;
X-IronPort-AV: E=Sophos;i="5.51,335,1526313600"; d="scan'208";a="84952633"
Received: from mail-bl2nam02lp0081.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([207.46.163.81])
	by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2018 05:08:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2Rlrf03nDiJEvQs4KExf50qj7aqmgceUKqd787jiZRE=;
	b=I41KyCET6FpVKNIDBN0pG3LntussFkTBNJEJSQWJUwSwno4OwwJGLMdHO8vj0KFuX0NOW60EmrySD8DRFKzvMS8hIc/Durpzw5rLbGJg2sEdOWLOyTV9lImzRPFltEQz4TMuTr5/QGzzHWYJL1wJzfCsQrD1GVBBMskSRGAv10Q=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0396.namprd04.prod.outlook.com (2603:10b6:3:9d::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.22; Tue, 10 Jul 2018 21:08:24 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 14:08:15 -0700
Message-Id: <20180710210815.25446-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR02CA0006.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::19) To DM5PR04MB0396.namprd04.prod.outlook.com
	(2603:10b6:3:9d::17)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daa7434d-ca2f-4297-b3ce-08d5e6a94694
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0396; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0396;
	3:OOeb89h4xqSr1vIVYrPnL5phsU+M7rzayXBRFgyFqWX6EW0bLadQPtFkJ9MTLW+OkxCgNeYH9rGA7f+CjoD5cTRJZmTAQ5aoT8iabnjkaIfUXrTpPLolXx1MGtwuAqB/CVlPI4zbe+v20g7fyk6sEUdci2dhadHxbJ8wDDsfDpk8fYymxreOozNjAdqZV9axXEHsDiIONVkDC21Cud4/vyVsfDWHx1igu0kf6jTroLSza7rliWdkIQQT1IPWMrzR;
	25:iHruhXt/NLixo/1tGt4oeSvlp8enVJ9SNmjrZKP7cCBTrrKgPkOEo+n4bgl9X5KYw9WBqPb9y+8GWaq93WnteWdfSjTIWs7srHe/SvSx5iZpqQA2jFze6QAqWisMsNbVvhBFJAT+kM1ozV4HTPmnhP6+yaZ6NKxm4Eo0+6geamz2iCkJmq6N2hbzH0IZBW8cmjpZG4sy16uMBdFmnbCCWBbaNqU01s5PBnArk4KNWHZ6ncyX/vcltdVPSjfO/j77ZgW9HfeJ5fyzC/bsmTfcHtIAj8O2ch5c9ruTF7PHOe/DCXGhB7zRj3RyXDadmxqDvoan6S6oA0LVfsfs7phXbg==;
	31:09NpXVxKsu2zn5kLuj3k4NNrQgOB35NR4FFqo6ULsSPd9tmRwvmfQRZOpGbL+74tdPNA6PO3EaC6SLweSICrETFs2P50jcIl6HkhxIxI+rWLjCNMskCi+/QtwIp0Oq5DwGhIoNhTE69SE6eDGYHd6K6up4rb6bR9yIMH67yMwOrTdjXN8Cz+4QIQZjk/4tYkQK/nIRx6G8R3p8rr4ZfhiXBrt4QEMwNaKCZYFKPKj3s=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0396:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0396;
	20:71cp6IBkXIwDPvFdjsX7eEagIz9mEyEk18/ElWqL4+MR3hFy9jeIRatKRrjD1flrWZzUXQ1Nl1cb9DIvMEmZQggLBOhMuheHqRxnMJmDlQxWPs3daSaBz+Mvv94dz++9SVYo5+q9pNP31i1OEppnTSUF+rPyVP4ZV6fYz5GV99E4yVjFlfls1rHC4cvPakb9t8AiKIt8QKGOuDaAjhSAGT147iINfUIBNUzllwPV3uePMH+TZbcHVtJHuz6RyfnkIz5j/t1+8RPRUCORXgfcVqTUR8w8BYhHresRi0ULLRAh4ckiPXatBp//rRIDF2t5wx0K0bWCbJWWdueOpG4ngxg0tXY3Yxf9QsOtXZwLCIsKE8rkIbhLMd3c98U01Enqjt/Wy93a/tryAVSBqN4LOGJS+OFmoXA5ht4cWhbK/DIoDmo9URy3ou23+Sabi5lnaYiFc05yPCxtOfy9HGRlGMx7eLxKcEGn2cTBnujQppylukLaBaOC98I0FI/j1m68;
	4:0LpQbvPYdYfSa5lD9f77zPq7pCBHVql/4afgkKmNhZZfOwroPhnoUfsPER+LOt52SrvcR5UWziinySKMWzhCnPqlhqbW6vmXVfR4cjjJZrb5TJxpHOHLt0NvFjhmd8emxTin/5re8sIYD82XEGmbTGgB2e9uQgugLFOu7DStOeWx7owsUl6kNMOqwQ/hBR0U8ztxyaJkf8tkydYMzLTrLMyjcu+2JRixBWi3lti4SUwhALHjZnagLoCOQ3wVpt1GJ3FLKkWkaYdsA+M8BwAh+g==
X-Microsoft-Antispam-PRVS: <DM5PR04MB0396E7E18C27289CBC6663AC905B0@DM5PR04MB0396.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR04MB0396; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0396; 
X-Forefront-PRVS: 0729050452
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(136003)(366004)(39860400002)(396003)(189003)(199004)(478600001)(476003)(6916009)(105586002)(486006)(956004)(44832011)(6512007)(5660300001)(39060400002)(106356001)(97736004)(8936002)(2616005)(7736002)(66066001)(6486002)(36756003)(25786009)(53936002)(4326008)(72206003)(47776003)(305945005)(2906002)(6666003)(2351001)(81166006)(48376002)(14444005)(8676002)(16526019)(316002)(16586007)(2361001)(26005)(68736007)(50226002)(6506007)(51416003)(386003)(52116002)(186003)(86362001)(50466002)(1076002)(81156014)(3846002)(6116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0396;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0396;
	23:Nt0rB8Abd0Nebt0SEG/u0JAEgsKiuifot4+rItMsh?=
	=?us-ascii?Q?TJLC6nlSJRkLZG+PPGDSlWHG9sTOkTpsrziZK9ukvoZDD//j6DOZ2MyDyg3X?=
	=?us-ascii?Q?/n2Vvf6g/ILWHECqT9UIH8Ulwm6yLzUdgbFwuEGhIm+Skrx9h0m700Hdkb0P?=
	=?us-ascii?Q?C8AWTuJexKE2h3ISiA6/uNPD59cbCX0HafAGe6iZR1s15mhGgtFtHPhDzWMk?=
	=?us-ascii?Q?BvxLiewUEaL0jNv284qnhIfMO4Pi+rqFbnBxWG6dJLvowova6eQVNWaV+Bt+?=
	=?us-ascii?Q?EV3THAzSsgenRd6LR4aVCeuJC/Sh5Rj8ZkkOmtbh2Y5LOTvetiSF8Bf1B/4V?=
	=?us-ascii?Q?F0NtGdwgM8a7FZPDpEEH2OzuM+OjQKuG4yN8ymJp5F8r64IYdhT1qK1mR5vO?=
	=?us-ascii?Q?a5+BdREphLESyEm3j0V+gEEi3i/2KQlMadWMt1LD+r02fhTQFdBGNzJtuvuw?=
	=?us-ascii?Q?ApvN4kjg6rekYnYvTdz2iljdnk0MbBgLYYwpkD+AP0/3w1on1vJAO7LDYPeP?=
	=?us-ascii?Q?+xyHzCJBj6hkOuDYMTRuqFaZ1LqW9CiGMaqI7j07YEfQnSnhkCVYkMaDqIbf?=
	=?us-ascii?Q?NAgXQqpHLduQjQve3f2GkZFrHCd/B4BmGEddOFgERrGbvlU8InY1B1m+iJWA?=
	=?us-ascii?Q?anC2pl/gLr/Bjt+snfnfhM9qjmcHQ7T1HYzO0KcVdoYdqXW00LpQ/c3vrMRm?=
	=?us-ascii?Q?3B6iIGJ8z76is3VL5GHwyBAhx8uUvUrgvxrWutUqBlMd1fTvY1DEBBmZTal8?=
	=?us-ascii?Q?IFOEXRWSMn4M6iva3Ku4b7882/fP/IfMEFjplRTiN1LbubMA2CzHddwNqmrC?=
	=?us-ascii?Q?H8wsLFWCFnOoZPxkG2iAYvxYjuTjw40VGHNlPy1G8kJArsn0o11T5cdk6k3v?=
	=?us-ascii?Q?pikk+PREwWmv2UsHkQ8xk41JX7Vn+hxZP3lH8ZTenbttqAG5yoebEH6eKg+/?=
	=?us-ascii?Q?DB2kTWZgxY48nwQdXiu1oRtvWYMt+KKCvIZrUQJyk+HR5XNEnJEcDKrLdAA9?=
	=?us-ascii?Q?ogLNLyytVOEZE0NdfNOZ9I8xyEqL5pq8hWcWuZKVHI1f7sIV2XnEUehbqNi7?=
	=?us-ascii?Q?Xc6NA5yxo4MipcUUVIvPNY4QcnomBWm2GDQgTbZKIVgk7C5tYp5kx+/v4dke?=
	=?us-ascii?Q?U4Q+9y9Qf8uB4VM/ZHUPzj3Q2mwqXxKy49mMvzeamOwjkC887U0nlvU9bQ0N?=
	=?us-ascii?Q?ar9LRK67c4H418uTn6VYbL59Qvwfp5s1YDKOu4VikTNed7bOGiILi8wT/OME?=
	=?us-ascii?Q?78O8cyY3Sqt/V4VA5Q=3D?=
X-Microsoft-Antispam-Message-Info: MQfUzzNNreIqn9WhvnJZxflejvG6iEikSM5jlzseXQ0oebdZGi1NW0M+dxG7vVXprvYv8DCZBnmrrO+rS0MVYzVp5rgFRI0HUCUD/3pRSl4NLubN8vmcFSg+CTKPY6fwvkSbYt5UzO6agdfj5JeoiGFh07T/oZG+giFRVvrZ2rOFilf9Wrb2p70ATJMZ2E2tsOgJ9L1a+RGJVgSGzea7hsKI/2u/xMpPilaFqUu5bCbWhAe3qkbjQxYbD9ASfML0FOEZ4UZJ5iRYx3wsH6YUB2amzUNNo4TYJJczyUbPkvRUwj/WxflC2Vb92GjnPOTgDyqlOH4lf45UITYalw2PbPOJaNE9OlCnnpIe1uF+/0U=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0396;
	6:fyuIpQd1mebsLDhHC8/yeU9DQR5bBB3hRo6m5Xrx1EdyhfrK4m5ipVSRDIecGq1IqGPHYXoirqE/+p9ZwMN8KTqKUC7sTDbmX3wyDMQoxjnh/HWfRG+J3IIgiCHifD4R0uhxV7GnMFIfnSb/jTX0F4lrkZtUMYLZCBuRuFRPCSfrrl3nToBc1aHPm6yZhTsu1w75ul1JbaKfDR3FGoPnNQBS+NEWvyM4PITl34Z9o8zF5iwXZKhtTNdYT7uXpkRXgIcll9HfnizpwRtmOxI7XRABPHoevxcIqmb3awu1RQUDVdu3aT08D+/nrW34yo38p6HoAYtRkUCvdhgbBuffQu8KD1LTHqy+bTQC+cWNZSszkzKQKnOnDgRFBGA8ycT17RQesX0Fs08wO0P6dy6jho+XN6valsLgt50DYCbXHxOTcoVA71LmSzmM1BD1d2SzHqcevm9uCfzTdLFAZ8863A==;
	5:UPz9YpGklwKN50dOLJ3CGZat5/CYI9Gk95RJ5ykX1Ueqhsso/qV4xKFZP081RYtTo0/cE4fgXgm9OibcDcPvg9XfA2tW+uWLtbqVQs7r0gKAvgkg/FCw2WEi4DZ2P9rWhABI1EmXj78rqSGBm39FjRYVMoUV+tceotbGz9qc3Zk=;
	24:CjvX7ONM+FpNrVM3rviPKnplzwjMv9+7meNz9Kp1sCoG6e1GphykkHDmxwF5f0n3NXPs70PZSVv2lE0K1nu6sLeEE1fxJebrqKkG/QOjhFo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0396;
	7:P/mwvjEIgYzkMXTjFE7uDV0MvVBRXB1lPVjqER2iRWFkcJlYAAdukZgWUbWBG9xZctnFe5yXZrl0+rT5xsnSPHDzayx5WMWfDirWPTrflNPPr1Fqnaedsfe/6xjiIsGuodZaclbGyuEJ0+8dJy04LzxopZIePMceZdMVDAGcGtvn60rctnclJRbOV9zzwD9CYmTcmhjxh2fK3xYOLYuiOr+3cBl7KbX120hWe8+GiCdW71z92KRIW15UNUsZt1x7;
	20:lFHPxr7Nr9P54jHSDr0f1XhUjjjgbtYXEDJ3rujVS17uU3c2ZSnVmyuPyVCJxG+tY2SRlyctApxptZS+Y2w1SauoosHA/Lj9QTBBvvLswF5lPuqvcoTzKDlMuS8C87aTTIb4R8NYFp5Aak7WX21QwbItdIReJsJpXmHQ0hjfjtc=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2018 21:08:24.8663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa7434d-ca2f-4297-b3ce-08d5e6a94694
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0396
Subject: [PATCH v2] xorg-xserver: Enable systemd-logind if using systemd
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
X-List-Received-Date: Tue, 10 Jul 2018 21:08:25 -0000
Content-Type: text/plain

Enable the systemd-logind on xserver if the user set systemd as a
DISTRO_CONFIG. If a user is buildling Xorg with systemd then they most
likley want the systemd-logind PACKAGECONFIG set.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 882897bd25..89318e53c5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -123,7 +123,7 @@ OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
 PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'xwayland', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
 "
 
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
-- 
2.17.1


