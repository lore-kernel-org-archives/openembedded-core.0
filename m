Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 4768 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 May 2017 10:44:04 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0139.outbound.protection.outlook.com [104.47.32.139])
	by mail.openembedded.org (Postfix) with ESMTP id 934AA77AC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Uwj2FzDNf8XufNsj1qy/+zaPeIIsYTRAbVfFgfKztkE=;
	b=sHlBjeuQc/lVgyXnsd1qZ+CCpx8lIcsJXhR/TAOsr3EWimjpDd9NJ6ACv3xLSjURKzb/FzUZeFqIb7A7/KOhPTkAahbBYcdn8b0ozVanakGF6j3YDQ3ha3DhNcG2+UX2hWGx2iB3yhEB6ZYDS+CFZIm1ag9rGvudBGUlQRKXL2Q=
Received: from CY1PR03CA0035.namprd03.prod.outlook.com (10.174.128.45) by
	BL2PR03MB372.namprd03.prod.outlook.com (10.141.89.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.11; Thu, 4 May 2017 09:08:49 +0000
Received: from BL2FFO11FD037.protection.gbl (2a01:111:f400:7c09::108) by
	CY1PR03CA0035.outlook.office365.com (2603:10b6:600::45) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1061.12 via Frontend Transport; Thu, 4 May 2017 09:08:48 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD037.mail.protection.outlook.com (10.173.161.133) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1047.9 via Frontend Transport; Thu, 4 May 2017 09:08:48 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4498jtB018599; Thu, 4 May 2017 02:08:46 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 May 2017 17:08:40 +0800
Message-ID: <1493888920-6154-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39840400002)(39400400002)(39450400003)(39860400002)(39410400002)(39850400002)(2980300002)(189002)(199003)(9170700003)(189998001)(47776003)(8656002)(53936002)(104016004)(36756003)(38730400002)(110136004)(54906002)(8676002)(356003)(5660300001)(81166006)(8936002)(106466001)(50466002)(2351001)(42882006)(305945005)(50226002)(6916009)(48376002)(5003940100001)(2906002)(105586002)(4326008)(77096006)(50986999)(6666003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB372;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; MX:1;
	A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD037;
	1:CZNz6PB51ir0N3AHUWokhzOaCe2mhNjPAj3ROEEFXhUGdHb0m+Q7B3TNf0ZN55FCPz7yiDJA374p+gRPZXPlJ6w2WniS1MkVsgHoDX3nj8DsoJBIIdKiKefoVyF25a97l9RKhzJd7eujLd1ORTkXEqh9rW5ZCJDK/JlFx5XocEhowjqy3UgJ7rZq+QNr3Ar1jntxq44IRbcAnYARhn3BblW9GCOlm8IMa/fGaPLrJg7J2NVyI0sLzbh+ND2MeS3cIgMJTdn996CJcxpTbHg3uaUPjeNu8ia0hoH0YWKpKp26cWCqH5cz6x556ljB9/8e8NeuAwCtqZjavEEdsjo02yD6NxVuO7ceUYfBVtqGpmJeakmTlypaPpXApeeWfnsBUH1LWy9gJ09Ni20oL2B2JqHzwn8un/SszQboGWOf/0KU4QSonJXHRKt0eRfkxq0j3eOfFPM0RU/M3FGoPejbiRZX1VGvkk9Zgsi4t68lmWlC/3MPfUho3uU7kbas7UACJzOTq1BdCmAzNnh0279ug/m1WXSUyVg9sdF2khoZhcoLNahzsEioac/VYnykfjl0eTMZsm/nW2UUNk24vWx8Cg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d6afea1-1a4d-489e-5c4d-08d492cd2cc2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:BL2PR03MB372; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB372;
	3:VLL2QfDE8I11XwbJeVp5IzDx6bksBv3mWNRCdE2QpnoAIDWScgvsUW/zUATTNSsnli519lO8O/3TSbQ7F2OxLFFUtXpYaWnZx1agBTGmKW3xJnTk+sk6IVMccS8UGSkHUkV43GhkHuKPxtV9YCLEm/3Gf6dImqST1XEFcbr7mdIymQAWYtPEuy5fV5CL56m7jWQ199c/XoxU72dxMleugG92mZhYcku+gMzayLvfOPgnxHxq55D7UglmLWs5n+s6zV1Lrif67ujPIR7i7C8SIamPKFq0cyRXHBMDp2CjRgst0uLeystgrlh0+3z/CbOK6NFUwCzt8cciIcOeCBc3QWlgW+GPNcbQic2jzx9f2ujXD0v/cK7sPJAanWW08g+jYJFyZHlTTp3R9hf0syNc6aIXUME/02qqltd46QS+H0dc6IDmXIsywp3EGLJ914ZnYCtia8tMEi4qnmfwgRV6ew==;
	25:p4LSFOEoNwwAb6io7ELH/j4u8FvTRvUStyXvPwyWKA1ySuBwAahaGTItX3StV3YOq7VljhWkJn41BQkYrB4YKelHdMpdLRtRqYbIWMPp9ktDmf/VFMoj1qdzCnBfc2sSoHkkBOLcbFacQFbwtv/eav0rzf7JWjMnN7MATj4B6mzai+PzNAQozaW7gGb81CqZCOmGLA5CgQUmxqT/h7Udbs5UYOFckujunhYXr0m0QkW/mqESAd4eN0i6PTzokjnMOyhbrP4I+rNZuSlUyZy+Xe+b2c4b+Hegh1FWbHEkSVn+wQ17XGB7C5dlGnOFLbIepyU1anaiOqw5Ah5HRDpHgA+ldwxlRj0zMucg2hTx39aGEt0snk7fqUn1PPb6KUflcIXL0ZCktzObCFzURwldFxoJvgPh/JY2MltPwszLiMOFNEDaWQFrs9Wxyhz55E+lq0jlVNcdgDu1AGBD0aqBZg==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB372;
	31:3lyFbRLsDTHUqzJfWWIyP+uojyWAeP5wkIjPBNr0WuwoDgWVRmd8thbXOLLDCcS+hHI8NoTDDzYvlg3TYb0kh8kERiHt4FK+58p9AnArEjrwVhqUek6pd/gmXpsus8wE7JeKh4Ti78LkGngvz0el3yNx0y/qxjFoDue975abeSK9CsmMy+q2y+DltDrrGPNsKF6qqiLTdG/W8lVWOXxGCYsCSYRFrdv4q06qY/2VItQU/fo0S7rWnaX27j672Eq/+3UCPrRvXDW/yBp5TUNG4npBVaV1THpnYhJIgDXakGI=;
	20:i4nhkvxlNr7r5Y8SoWg/rRES+pI81dFfWzx1hyMSg00MTQ4tyMi52P6Ssqwg3Uq3sVG32NRhR+HneXQx+YegNumjX2iyc8KW1qv3QeZ87hXFr1RycdOVO+KlErZsvU+7UmGpS0pr/y0p4JJ1QL33ASqWm+IdHpbNk3JrVfDKby6J11Tpbv+HX/q4nhyxMAPtaEWBWd9y+avezgscHkeiPwzUJA12vT/TZurSrArMe3LTfYnRG4FNrDTKdZVese7OTKI1U9IwBitP2L4tua5fzfdEXMDXYNEFJoAm5YqesYchcVS1Cf2NbbNdvXEZXYMxOuHKd/aEHPaAFBJ/MZ2lrSqR31R1IEB9ncD78/Za0MnhoDwZxoPjUAdDasxl+njJxnhJsRVbkhhlBD3nU7UnjXPben2LpixR5fOTw+RHybr9ymfqbHfaDpt4jsTTkw8Q3s9vepgplvTOCj9arPuJA0Y+PIItmQSRmr0+ULq7/mToyDqh6mkG+75jzTwy7rgDS9gsVODNT8WKTWWKjX4Ysh/KMC76LpPBRdXn7Ax8aNxersNJRY0phQCNU6UHw7KyWVEzw1tdHfqi1eZauosmToir4daBVmuc7bolX3Y0o74=
X-Microsoft-Antispam-PRVS: <BL2PR03MB372E9BF802C25F15E51CCCA84EA0@BL2PR03MB372.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(13015025)(5005006)(13024025)(13018025)(13023025)(13017025)(10201501046)(3002001)(93006095)(6055026)(6041248)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123558100)(6072148);
	SRVR:BL2PR03MB372; BCL:0; PCL:0; RULEID:; SRVR:BL2PR03MB372; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB372;
	4:3J1eRINzWfetHcBs44jZkQk5pEZVE1B/hcgUT7scbPaVHbsbbOUDYaSYwtG8yygp0YUeO/dHiQXRX59QZEG0MNo+H9vfmVJKcWKdeqYcAdZB+402oBCZQCsNo6LWiA0e4DObLP/Y1bntF0/ejli9R8LGWL6kxiGN4eZv+t28SFQ1mwGx1us4ZYYP7kSLrfJrS1QQOyZgU/+YGMoyQwgD3dt6o/SuYxWOUAQrbMwlZxGBzOKXAVtux6fMuKfkR7/jWAbGfeHKb6nbKTesC5xF38ORQcmX0WSsYaqF1Dg8sqT+xgzieBjBs4Ykur0HccIAk2J/ipK6Oi5+Xsibrs88XsNcl3WsRo2lq6Ci1TyFpVxYfD/4ubBXa5UgZ9gFRvWewDivCAldXO+8V44JLPF+91vQ8miMf+oqheyjyyikvzSj2RaDbrAULqz8BsRCe+WtNFblCaN0F9eRXoueyF6Gq8IPCqJ+wdSJ1gdITOGMho1YuN27L7d7sJZGmS7pjvgMbBQbWwaXAeay5xBE5K6Q9AtbLUUet2PMvDuWJ0CzJUzHLO3wZnd8R7/lIfvISe34v/sNBtUw+4yfLiISCl82hozQvJq9UDEnkcUCU4a6BHMcrWnrS7T13P27lcbTFZqHExg86+1PgJoUUzHrGksNzYP1DxbP+GCXcXHk3e7aGgQFyFW7wLUO1bsYSJKRS7qh5/JSKSVsWrp0KTc2P3Inh++Yi7eo59HghAFA5iKgEp8Glw2fVs1mQ4ScxLPxSUEx7ERon/Rf07BudXY0h+SpyPBJKnVf2rT+WZq0AE+cFpQX+eQllaWAM9RBqspwKh5SGzoonIjV2QuhLIWGukJN3F4veq1+Z5IXHiv8+N7IHX4tZtD8Do7bwpQPi1NI86Eoy8NpsmD/pHA16JJ2/DX7mS60B5zNMho0JsRI0kJIKQM=
X-Forefront-PRVS: 02973C87BC
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR03MB372;
	23:leSd2NuhO78fWrMp+Gee+akZSDBMaU5fKeSl4b2Mai?=
	=?us-ascii?Q?6WvqpsPlDw7rKGfAgo3gyrTyX9kpgGCQnXS1pyaVmwv7rCj8DYaXFTVt5Ciy?=
	=?us-ascii?Q?YU3DmJxqbg3/KpT3AnBinpVOXgucw9VLYCcNvZwuKd2HPnrJfN91XesYbGQE?=
	=?us-ascii?Q?pw2MyFd5b5lvjAgF+HH5qSL+mg5woLpf9Q+iPtOt3R8U0fZ2IKCqGv576yAS?=
	=?us-ascii?Q?ZhtBT9u4ips36Lsjk7cNgOwyXt5hoz9suyAirLbtN5tETNXWKLYT7Fqm3pry?=
	=?us-ascii?Q?jZ82QAqLpUT9JVgva7zwLQE6RUfx5Wv0EWMRzyg6NV2Qj9Mvnqj1iQxWJWT4?=
	=?us-ascii?Q?66SuoyubjRlmPrqdsjki/vOKBSmXuMxj58VIPYUyGWawb4gF9EZdoQAA+WBy?=
	=?us-ascii?Q?HuOOpyvJLWtpBCBBzFIvy1UgaOOdZ4GC8VpCFZ60+p2/N8P6ebWs/LBP509+?=
	=?us-ascii?Q?7TCXipIlcRgwonodGx/W3Ehf82qalwFkce8aqrWfT9TOgKRwfFc+sXrhHv/5?=
	=?us-ascii?Q?dSLjKD4F66geSnXm8qircJE4tNjy4TSptFL1h6X9ZnXy7Xs8ukks9FX4r0CZ?=
	=?us-ascii?Q?IlOnEYA0Z4HNOUZ/WK+0ZDZACyurYbueOIdlFHL9iM85y90Dzxt9OA7LtY6K?=
	=?us-ascii?Q?hs0xPyR+Ee8FfC5k24sDXPsCFj8QoTKiyojeHwcHwNseY3k9TZdZdDBCov3/?=
	=?us-ascii?Q?7+vt6FmqACtsXvvyBPw82A754rYhBFH39bIjbAXH0xQXCG+d9EgJ9YFQQRDS?=
	=?us-ascii?Q?ygYZCXL3CTJWicTCuJOgDb7NjoNJOez1MemyAYp2jGBTrFdmHDLZg8iidYs+?=
	=?us-ascii?Q?DfCHRmmg1nkPVMxYLp11ZWhFOejhW4+F3FpRtDnEt/FMxBnEaGQ6R4y7eIf/?=
	=?us-ascii?Q?yS7+BSM+HD5gqPKrcmuhLDuiWWP0335RWciq+2O4Mo3t9Gax8qV0IpD7sV2o?=
	=?us-ascii?Q?nD0vwROUOLUAkRQsI3hjcggSbhsL23T/B1RYVVPTcEpTpfNJwKddlKkMJh1E?=
	=?us-ascii?Q?h/yy8/ZO7YHCE3spMqK/MU?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB372;
	6:Gth55ho+RRGGS0hnRGJuhWDX3JvDaWcuX6q5UMaqMYtmn/s9ioJwhK6NtpX0VGG9ls6UsNEWixPBaCt2zZv747Np0w+8pODwAZ/D3U8AlzPa0nOyQAvI24Xe9pY+O13v+MLS0cuIgJ7aYGxP7XewfWG3cv1hrYfAzFuyBwDCo9waJTtlPJoLV/RSDaJdJEx7mJP2OZlOyYomE2o4u2gAhng1KmqzmnYQ7nAbTr00nCIWmt/8jv4Azp3bLIDPxpHuKslYoFdmY1JDEeyIDAN3wGBCfMtHTT/h6FtS62YWAjtDvo3lssvIwLxrjTLr4k6WXV5B1KRr7aYUm6rK6NxK7ftaM3B23F5tRorKXXr7XPj1Fh/mYRVJ4NUAwWB8Gzy3s4I4U/LBo/utKZRUUCU/kApv4D7nADqoj8l5FR/ChtKh40/QUp8MHSViAXXg2wsjHR8kJt+l1rryttJ1rD3qjCUn3mIx+aGO1BxyyLeZXbLVsecDIpJ7VP40qeaUNjyZD1J9uF+MkdYc1Ve8CeV2RYxeXl4KEJadBXLItVaE3m4=;
	5:3vUO1ELltEuPxljLIolthlOqL9zDXJbaCf1EUz6hPrOPjK2mgF7HRNjTszje0R6d874ogJYdfzXbdq4VxKVPXN+n/8Mbh0BFuVuHrIcytooJbwbxyOTBKLQjUVF4JGd43FxjgqDGIiF1hqUU2uHMUQ==;
	24:HJJm6IXYJS5YwOUcNmxNY93HYkTxim3brO3gvXNgKj1DQCed+3bX73xirY1i2Nia5q+AJUJU39J5WBvVQsFqn2KvumRZMnzznKVyd8cn7HQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB372;
	7:ZgWsIISaRhmyfma3HLzSw6/nhEnh0HyRsJdjDSSUadH7GUSTFYURMDmWseheBMCh6xzpclJqEg/ze+ukB2OgngSrrxkegWY/Khy5pbj+YlQ0/wsG9odhkT5BaQFQLopr2PPgCcTVEMrVREsVViYzo96gnl1PF1Vmo6V3KdXlsVRphS0Ft8EADjNh4UqHpXCmqOiyR1ATDStri/X9rxQGsUxGd/19fhvBDWxiQwHzDSWi1YQO2EjpolVbDYg4RYQ+pcFsxtkecA3UP6VfkVs3S5o41siY/QygUeMSTv127wCholAiKJn84JAisLL+fW4CjcpFxUR7rFXNmz7bqY3kRg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2017 09:08:48.1252 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB372
Cc: chunrong.guo@nxp.com
Subject: [PATCH] kernel-fitimage: fix ${KERNEL_DEVICETREE} includes subdirectory issue.
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
X-List-Received-Date: Thu, 04 May 2017 10:44:05 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

    * For example:
      KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"

      ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"

      but only the dtb name should be used.

    * Support "ext2.gz " filesystems

    * Support mutiple KERNEL_IMAGETYPE
      For example:
       KERNEL_IMAGETYPE = "Image"  or  KERNEL_IMAGETYPE = "zImage"

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/classes/kernel-fitimage.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2630b47..33b477f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -10,7 +10,7 @@ python __anonymous () {
         if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
-            replacementtype = "zImage"
+            replacementtype = d.getVar("KERNEL_IMAGETYPE")
 
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
@@ -233,6 +233,7 @@ EOF
 # $4 ... ramdisk ID
 # $5 ... config ID
 # $6 ... default flag
+# $7 ... DTB image path 
 fitimage_emit_section_config() {
 
 	conf_csum="sha1"
@@ -346,13 +347,14 @@ fitimage_assemble() {
 				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
+                        DTBNAME=`basename ${DTB}`
 			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
 
 			DTBS="${DTBS} ${DTB}"
-			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
+			fitimage_emit_section_dtb ${1} ${DTBNAME} ${DTB_PATH}
 		done
 	fi
 
@@ -369,7 +371,7 @@ fitimage_assemble() {
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
-		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
+		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio ext2.gz; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
@@ -395,7 +397,8 @@ fitimage_assemble() {
 	if [ -n "${DTBS}" ]; then
 		i=1
 		for DTB in ${DTBS}; do
-			fitimage_emit_section_config ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}`"
+                        DTBNAME=`basename ${DTB}`
+			fitimage_emit_section_config ${1} "${kernelcount}" "${DTBNAME}" "${ramdiskcount}" "${setupcount}" "`expr ${i} = ${dtbcount}` "${DTB}""
 			i=`expr ${i} + 1`
 		done
 	fi
-- 
1.9.0


