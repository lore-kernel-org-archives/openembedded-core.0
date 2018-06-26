Return-Path: <alejandr@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0081.outbound.protection.outlook.com [104.47.38.81])
	by mail.openembedded.org (Postfix) with ESMTP id E3F4574778
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 22:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Rb7FkVDEUjjWSTb6STBI2VIf1v4Jjfm9JWke/EpkIdU=;
	b=iajzgtCMmlvTMXZCNT1qIYUIKeKr1xlrEtk8bUP9+K5QgpYqr469oHtvV1412iOzhYhDcmfzO1TwQatCO/LRG02QLeqsnsXX/A/7UHnweKgs6BHBkr5kUuq0T3anHA+gUilBJsV1c7Rk7jgZTajBbvc+og+3dDVehUPcJOvt+LY=
Received: from BYAPR02CA0026.namprd02.prod.outlook.com (2603:10b6:a02:ee::39)
	by BLUPR02MB162.namprd02.prod.outlook.com (2a01:111:e400:849::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.884.24;
	Tue, 26 Jun 2018 22:51:18 +0000
Received: from SN1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by BYAPR02CA0026.outlook.office365.com
	(2603:10b6:a02:ee::39) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.884.21 via
	Frontend Transport; Tue, 26 Jun 2018 22:51:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT031.mail.protection.outlook.com (10.152.72.116) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.906.15
	via Frontend Transport; Tue, 26 Jun 2018 22:51:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39833
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fXwns-0000pF-C4 for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2018 15:51:16 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fXwnn-0007RU-8k for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2018 15:51:11 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w5QMp60L004150; Tue, 26 Jun 2018 15:51:06 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fXwni-0007Qq-Jk; Tue, 26 Jun 2018 15:51:06 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jun 2018 15:50:41 -0700
Message-ID: <1530053441-4955-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(438002)(199004)(189003)(8676002)(107886003)(81156014)(8936002)(81166006)(16586007)(36386004)(356003)(305945005)(478600001)(7696005)(486006)(476003)(426003)(50466002)(48376002)(51416003)(2616005)(26005)(77096007)(50226002)(126002)(9786002)(2351001)(47776003)(2906002)(63266004)(4326008)(186003)(5660300001)(6666003)(106002)(316002)(6916009)(336012)(1857600001)(36756003)(106466001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB162; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT031;
	1:Mc7TgSLhnMIPNnhlErPr/1g4yy58qS89mm7nWjNNKEXnXOlCTr6a6xtaLSYQw8ZCdps2iM55seW4Ej20Eqm9gbEegyGPDTJepnRymzGj/rh6l+ly+B+h8ZlHckSLJFVA
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c32fcd9f-f18d-4735-b7ff-08d5dbb75372
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600026)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BLUPR02MB162; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB162;
	3:qMlH0/BIuD55gdbq38hOuTmaY88/zxegXeJQ0Odwu08S26SzpQnVlRzGmRNx39+u8SRNkCHThIm76zcBfG85ivs2R5YgtQsni6C5c/BytkCuR9DN+AhGmyxl9TnrDzZ/1T57fveZgpyObh9tZ4skjsm4nC1pftcW4GwmpHYcg9ho5KCB/IhupDoV/GmzNuQEbJGcVRZnIJNxtm+j7c+Sv9n5C3hoR4SpA0euIB8w5vSi8b3IM2DxhMyYLa2KyeeV5Tq69kI1l6CF68wkxTUmHvGzztzUa+wGzFY2NRhp14saHM5YhuTOeV1I6xFnbzMZBYtJtTAjlKXDkfQUF5b5bU/WYBz6q7ZO+pdJ2s/6d40=;
	25:K8ISLO8bqypSypvdQWFsRWQjT8N5sbRNfPZi0TrnhFUsiDpqha8ST6cKVKpi80TrotL5IQgyNCmGMPXQEUwSgvZbM1jd4tCRR8GB939/JMI1HImqM6z+vstrsS5eyd0dcnRBLtiirk3lDrX2o6LbhEraUdOMwjLvZjUrew4PPPwoMdI1wJUTmKLRVcFSH5YTyzbWPqtSojYQcJrA1cQqdBdtOpUJyqNgCM56oHjCHa43/IiTzusfi7oElvstNi5q1xwzRhSjCJlfPV1toEtgbsDtL5/ZO14pxVoReWtR57pYOTBYhP/Rxj6j/q/NiR+hwLKNciTiSpBt0vbK8JHfRA==
X-MS-TrafficTypeDiagnostic: BLUPR02MB162:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB162;
	31:3AmoQGEUXcCtcMQQ6R4SF0EcZRTvpka5nFYkJ1W0apa1xdgmDNKl1QCUE105sXg/TytF4pA1TrbwpXBmga8wuutaAMOy9zkuGqt1rwnltp8jJ0CULn/PvvsfEW+Q9veHhHOhciDH9Ycn7jzEaw1U7VO5THsUkTnq0xzqs3pRZeMQDPpXgam/SE3PzW/ziLyYfOGt94CweeUKydLMAAwtf+70gV3zJbKSlW8RZjvtQIg=;
	20:Qa9zXKZSbjdfscuQz9RW8w7UD1ObBxADaQDZAqY+rTHPYX2R1QwDwgkVqO/WRxTigqaA7amM/5++zEOU9UW8qzyPzqFkRKuosBZ98ErYWVqtVQ3SLpXdYrvqc4Rd+VPmfecXN1BuNFt6h9SjApdBBw9p9Odm0G/DOJpMyMhkEPiPIUx33MaWTWGKNgcfmohMrTj5eb4TprDC3e+fUuoBxJa5jRMbBZEet4pfFOZhVG7GsI6GTubLQ+Vwm9t800np/rgS0GDQ7rqLZ8YFeqEdT4v1y4mq+mMVI1f8r8wnOhCVe7lnlFYihuXEoFSFvFO9xK/osXX6AZJMD8XO0rus0X0x7UBoGXYsHfgoEYgBfPMNlHvffsfCrrxXFtLHUnD5nHCecI5WUGbZ1GkdomKWkrVz9draoaPwNxzcN2ifUQ+V9lCip2AxFGMuMIZHIb1uxXK7ZvAU8Wdg9rX24ix/WKL5yLR88QoT9c0ydi+MA3IfeERUrhKM1kfLgFzlU3Zr
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BLUPR02MB1624C5A9BEAD9A461E5651DAC490@BLUPR02MB162.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(60795455431006)(85827821059158)(192813158149592)(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:BLUPR02MB162; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB162; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB162;
	4:ORytCrQA2/kANTANK2vbJFgwb3wgzSrYFLCqZW6uT3B9mFYJgrSMKvnnlmT9adUhN65tXpBDZbGrYz6B/s/db3uH53JrlrhcuHW09LOUjQF1yp53F2+HT08Z7XuNZ8YnwAFpzD/TV1OZtK+pwWkirK03EzBUurz2Uc4It0x4RKhuru8I4bt47Hgufx7/Z5xsQjjyMUEVhtWpfU6xv0WCf9uCyYESmBIw3gPtejf6lVO1lj2Kqt6KkTk1JnHbebe+f8fqYWl6EjjPN9vEbkalcrlQWkKy7Oa745aP1qYU8yJGoMVc/B7QPrr59XbtJhhrEqtXVAR/Gj4EeOka/0WykUR4jWlkIxMPwCGJxtb72nY8KCutTeXJG3YcPjUyrG94VQ89GBS8eWSfZkRtsRYeEM8Rm9t+MT0NZTdOuJqKA7k=
X-Forefront-PRVS: 071518EF63
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB162;
	23:8oSU5yRJ/YhTJsujF9p8o51TP67euzywSlDc4kIW7d?=
	=?us-ascii?Q?2BbpfcqIhvdNyP+hEXcfTTe4gavo3N6AGzdAQg5UJf9BlkNzKm7Tiu7wZCcF?=
	=?us-ascii?Q?2Ut01wCPM3bdiJcgn7IC0Snpy4zPiFGIGIst4lZVz+13FGL48XDDkn+Zva6R?=
	=?us-ascii?Q?WqUkomURGBquPJFvYz+VdGagC2F8Urht4cSyC7l4gMs3szJpL4qb5tSGShkn?=
	=?us-ascii?Q?JE/6WHt4pXmXxyb1N0LA9ZK6vFA+L7TBQn0van3IQqzb2Y/NfEWKQ2DZsEO3?=
	=?us-ascii?Q?g/n+RmD8PUfS0FE9uAI4XXvyGPwxIS3dcWCO/W0wOZm34HqsBtlVR77EmAKM?=
	=?us-ascii?Q?+vv/XxxHsqNUjoUqnkiozv059cdXJtWyc+ZBsUNmoD2adCKLyoBCEXagsIbo?=
	=?us-ascii?Q?32IH4xFRZolpQE/bTX+MuQPyO2z6ErRzRTcpHNynb6a/U0Fb7TytcaBBiyig?=
	=?us-ascii?Q?TJ9VRtg/nC11cCPg+SJkHXIJQLLRIUmC4UgCmHIOkjUuzwVTzXOrxRY+LIXN?=
	=?us-ascii?Q?r2t384GG8rTyW0pYcMlEeUAFsIlMwExUO2feJLneygmykvBEAQnQz4aa+c+M?=
	=?us-ascii?Q?u+/HuygAUW97WYFDgLTVcWH7KICtk//gHsuBYqfR/Z2TMyL/h32+2Yr2RsDJ?=
	=?us-ascii?Q?3/LSCGUWUL+V9+x9rLmYp9zYO6RfS/i0Dxfi5wccU6FqX8mg9WTkX8m2yjmB?=
	=?us-ascii?Q?CiSUXnJc1sRUY7GQttdb7CpHcP3ZcY815VoJoe54eB9QtMb75rnSghbiA0PF?=
	=?us-ascii?Q?LXgXljAzjw77HflRg/8ZSR5t+hp3HgHs62+pyO/heaOYxxAT316f2V2Lf2cm?=
	=?us-ascii?Q?zsEbyn6JREk9xDP6Qs4QtOuZHIyNlirs4/upoMyLzywTJbkqia5TB6AQquol?=
	=?us-ascii?Q?l99PaCSfW9T0DkRkvx9bV/42QCs0yPmGnYVCjolVr2likw5GKz91AXYkhFN+?=
	=?us-ascii?Q?v46wQfG1OTLrEiWz7cGu9XfAXhEDLIoex9FHx5hO60GyD9WZF3/Qms7Cylu0?=
	=?us-ascii?Q?iL0c17sa+k8tnouhXgV1kYcQZAIL41ekQt5KlANpaCFBiiJ+sO6a+mg/C7m/?=
	=?us-ascii?Q?0vAExdNIfmb4j9jMqJ9pqL2BC5D83aOCjpnv4DJ7gMLpGjcw=3D=3D?=
X-Microsoft-Antispam-Message-Info: EJqvvm1BLJlN9hd0L8GnouFqM+xzpEX2QYcljg4E65HLStbTGq5mPQ8fTMS9A3kRVUAtAEz0Kh2SozfX0oEjYtks7BftIIgE7O6hwe/LC+owsZ1tSXTcgIqqjRB9l9wzWsor8hAOkp5h5RJl4RG+A8LEwqhp1/yuo3TnOT0xVJLMc0SUIhE4TT7yO4W+gFKvzCcmp0smlVKsuwcZ7qEapQ4ZQbdVDGUNqhZ51X/t/RsvulaLG6G2Vai4kRFXxv/91CBU4Rwb8NdNh6DTmayEOqqAmBjSgJhI6aS44wGrrBk6XVV+s9tAqb8FESf5ZUmQtcc/y+ZpedS5zyww7juKUKfVLifZhGsDG+UrQ/T+JVc=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB162;
	6:nY1K5aJiOcDesRNP/RzY0pq83+Z81NmMwvJmJRcQy212P8kihmVRJbq0OXztpasaXmE7JpK58IGqh+nv8+7yrPXrf3jBsL5qIl5h8t0YaJvsgfxOSISnn0XxPn1ssqdIicGEWV8zzZfQFkqyHMpndn1DLWlbnpx0ObpGYnzjHUMbsXmS1ztHTCZbfqrg2h6H8P72K26m18nHjvU/+ykaMgmlUZVmLQ8Fg6ySi4uGyj6AeJGBz/n9bIi4ZMGQqNP6M4CAkOUazkXsfsPSMFZikbVM3hQQ2OiaPn5BxinlcYh4BQ27LbwoY8HvnFZQa+oG8c6W9e4lfSUktdzBTqHadvp3hK5cyJH6mduvgxzt6UMP4R+cjXFhk1ZqD4ThYiLKzznmcuWXJAyga7uVpoJQz3ryvaZ78NEVWkmebXf7zpenvD2w2leJOkksOKAFP/2JgTav9nV6jzXzgb93aOsyvA==;
	5:uebdbWRvzrGmtGTDacbY0PiBasJf1Wxe46zwsos0jCo1/TWm3LBhgZlGSHpufUxB+ZXJ9rzzU28vq20Hsxzi9EYz76VFZp27ujGX7WKBlQXmMhNLV2bPUMpVxwItYPaDM9p5aMYOL15RrNIWa/72ZP/BpI04Uq9ZESQL7i9IEJY=;
	24:70ipBHXj4731vtIMqcXEW9WLm4pNFr2UZVD969wZEImk1DbncaCGzLimxwqVSwpbBADMTy7g1KGsiaXWLyTG06tLQMJXWI7K4Cr/AwBUjcM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB162;
	7:fEl8MvyoXUio2HbAdlH8+BweE9RsKYKOx/H08EyNqO6M4+j2/aXCfbGqPkFY5C30qXDJdu9TQOxFz0Xw+7hpH1IzzNeJPdq9tEsV8vLw1JL+ivUIE/A3hgdCLKeCvlnw26qvE0eyfre6HRV3LpdEDPUBNpTIm40vcmtr8IcAe/n3ePyFmo2heyEZzK+XJZCxj3XvjKmbJU6Em6ZkIBchxAPiyTu9NN5J7EoTQx92B9J2px/hJ38pPEI88wTK1E9d
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2018 22:51:16.7068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c32fcd9f-f18d-4735-b7ff-08d5dbb75372
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB162
Subject: [PATCH] maintainers: Assign ownership of newlib and libgloss to Alejandro Hernandez
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
X-List-Received-Date: Tue, 26 Jun 2018 22:51:18 -0000
Content-Type: text/plain

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7547aef..1d3e059 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -327,6 +327,7 @@ RECIPE_MAINTAINER_pn-libgcc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libgcc-initial = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libgcrypt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libgfortran = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-libgloss = "Alejandro Hernandez <aehs29@gmail.com>"
 RECIPE_MAINTAINER_pn-libglu = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libgpg-error = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libgudev = "Maxin B. John <maxin.john@intel.com>"
@@ -512,6 +513,7 @@ RECIPE_MAINTAINER_pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.
 RECIPE_MAINTAINER_pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-nativesdk-qemu-helper = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-newlib = "Alejandro Hernandez <aehs29@gmail.com>"
 RECIPE_MAINTAINER_pn-ncurses = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-neard = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-neon = "Maxin B. John <maxin.john@intel.com>"
-- 
2.7.4


