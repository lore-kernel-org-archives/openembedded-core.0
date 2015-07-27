Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0107.outbound.protection.outlook.com [65.55.169.107])
	by mail.openembedded.org (Postfix) with ESMTP id 6F54C605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:29:54 +0000 (UTC)
Received: from BY2PR03CA048.namprd03.prod.outlook.com (10.141.249.21) by
	CY1PR0301MB1179.namprd03.prod.outlook.com (10.160.165.22) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Mon, 27 Jul 2015 03:29:53 +0000
Received: from BL2FFO11FD030.protection.gbl (2a01:111:f400:7c09::177) by
	BY2PR03CA048.outlook.office365.com (2a01:111:e400:2c5d::21) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 27 Jul 2015 03:29:52 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD030.mail.protection.outlook.com (10.173.161.40) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:29:52 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3TniN011958; Sun, 26 Jul 2015 20:29:50 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:29:33 +0800
Message-ID: <1437996575-29558-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD030;
	1:eS2TnP9jPEiKhLjgwBEw4p5tWBqDoMdY8XdBlnWwuoag099LucIa9gXRT8bfxY+gWBkZJNlUtutGqbEloZFwPFGVpBhazKne36tmZkJDMr3Qn/zSm5FmC8ytIf3++oM3aU1cgwzhGIuz5UVC0xJqtvQ5ezBs+z9Rm+9SGnyiio74oAjoRCmZJTZyvEYLamQh/mai1Uk9W98M/2byPg21/PqRF8fmUp/2svmeOPH3hKzXpD8dkh+m/besUAM/oWM8ci6zUUZ3TbZu2oDVwVQpvJCGI8ODhFUlTFzEVsSnrTq0rOclH7fZmFSWW/lgzx8eUp6MgTFiDoeLUoBF9/PUSw==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(5423002)(33646002)(85426001)(110136002)(2351001)(62966003)(229853001)(46102003)(105606002)(87936001)(77096005)(77156002)(92566002)(107886002)(6806004)(86362001)(50226001)(47776003)(104016003)(36756003)(5001920100001)(48376002)(5001960100002)(50466002)(189998001)(50986999)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1179;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	2:uyB61V4YlnyiiWhHT5T5NHF0clsMNq338oLQ3S7jyaYj1CQyBLANj2j/YY5Iklr19QoK29zSrkJjtORp0TLUddQA3oiRPOBkw5PWY+bqkegOPmedHYVyL/jO0bn+E6jSnTqiI/iLcvl8sT6wXNPgKFyCfTC/FUdE+4oT2/53VKA=;
	3:f1UNyRtCC+Oq2cjC4IShOy5mMJ0qhsUtZJJUG3iQe/HHVG6Ghrmrzh9qeY6apl/llOKdCpfLPSLLDbkv8eo1S9YvD56yoKE64bExqPcZ9zR7MRH26Nw+X90W5vlkVFk7xrlpdCpseqKAo/6qaKDwo5tMo7Uob0wjI3CbGLcdQ57CdbDMVcAMdgexlVKu49VUlL6XoypcLZACaRLYk30OScH3wYz+jihHVUVabKC5K7o=;
	25:7EpQZZmJ7aldWLJV79OFnafjvGDBZaF0RbOVEvQG4sYeQyAdqT7rVOGUlB8aSzBdGuind6E4R/xxuncP7IQ14RJIgCRkHzfVh/AWnGLlOgGcmX8ppTKFaizUiPpXPEaOD8nZQRAGEvJ13aDFBEf6SwXUoSMT95mHbYJtxtRf3YcCkGXcNkqPUjNGO57XVSx8mFKk8DAefqYqETcyoHxaBQ3m/e6RPAMBAN2Yk0JcFdSqdLyj7kaFcMF8iKHpRSPQ73NIerBm8VAxNPC+hqzvLQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1179;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	20:k6stizCTZTrIBVVg/2HV896P+uLBJerH3NAR99axzmlcEUhzPUjiryjSh1hIMkaNSulaLh/ShgCxio5UlrtEOdgrErS+QRTLdZ6ApFiTAj1lP24fsCmUxrzwo4HoJ6lfdKM5xeRqdwxywoP1dMlaWvgL2MsYddZFAVVVZ4LKBHq43gOJuqSpYXNXpTLDWFkdmU2slUuFh/oMIWhJKtaCbRbwl8TrZ6Mz+oSF9pW3EARdEfGP9pxF1iMMCNkWInKsLvSnVSs5Av+qoBbvADk2eg701iDpwz8sLet989KcmiqeRqg5KMciJNMO7oJ+spNV93Onf0qNnBEN5HewlWhvR0PGRQcMAOyMr8IaVPgwRIo=;
	4:pFvsaSQIsvWYl37aeVPEXAaKLkM0OOXKCeYtvx2PYdNHw5ugUWuS3fCyYMoCuOvttwDIoUMRUAb596BJ/ch0A+72l7TDAPgtklyVAP8pUD3tWWp6HCXbkXTwvYf9oItgZcs+DO0Sk+UJBU6kfufV/+FjpMGabQG3M8nvkLFQhu2rEE0Zj8JNdR9GGtU1W16ZWtIqMKbsGoPhTcrP5V8vc1ySQ//s14FTw0qLcF3JlwGAwMqOcjVKXSEILxLy4RUt7kmXXjP7qmlBditNhPX1BJtmxkU058llaUq+1CibCIo=
CY1PR0301MB1179: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1179F9C06BCD826C55D95C08868E0@CY1PR0301MB1179.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1179; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1179; 
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	23:W5eSr6hmGEUsAjUGNOwS9BCd7BPGVJiLrUc4zfUiMU2zaL/QHS90yvthBTI7TEuVd4BIkkKevj0xq/Czh4wJMc+rcS0FCFvqAu2nWmdTwOHqg6nbq0ZJsRJTm+3V4hvotF1DJFRoj/wuAuoOfKWs6x3+6N2AC3dA2sdLk8pSB5CYfXaKlZnUT4zmVfeaSuCWTm9o/3HKAcG7gKlzRJdbZsFr6uf9dAK+ZoRsH/4FAIekykQ03VDHYVUamH9UG9q64ecbEMu2sVULz2dPiGyxA3dRhzhAAh3cEf/wBBQc9Gp9bqgwwtVuv4ZzEopdsBAFsdthNV1yOvmnXSbKL7DrcYZSd4fcJhw1C0IO+4B1B8OqvboKrytMwjRu45YuMXqGnSfBqLcFTIJPbOCCbw+Z/Yjks9Aus0AQV7rvjZmUDRBv0hslTvduDFW6yjrQ4zwsj2cM54vmUXWHnMhb3CiQYjyt61JbLI2gQ3WMef4rCpijcnytFWYUnIdIHEwRi5N+IKW1BgvCkQRkfdsNcClooWdKB6ayHdHfBM4gmzEW7vXUyxfTEq+HjoltgnwATHflydmm7eZ5+SNtJ3JnpCM1nkb8Jyahqwd6ZSyJZ/RSpy+tIRdJDwh1BpH1ZuK0ZgYb64QT1YCGKRykahKfUOhtxcyA4lwz2T+tgeN2itd1XumLkU85fyX8oRsW9Vyb9TQpo5Jjc56oZu5jjqRcNsqeewCgjYlbCiHaJ/Ai+QTkk2Itr7Q+Q6p8PQXE/YN/ScT6i4W8AONLq5FMTruai4N32modtl0P2P+2qAGMC5V1XbAbwUjBn5p2+bHNT3ypOJBQgKIMCagomVdM5Lzw/tqeEFd2QRuBMihVpjoAZ8vJm8w=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	5:mArNI5dsoY+xbcCTukZVa+C4L+XKem8GQ7IWTuh3pUyFk6kj0YG8TQ6aHj0gN/CyLqTD1NnODMwwaZ2/gTprFyEak22rcB9WBdqVJTIXCpkwQuU9XSzHT+ZHgMyCmzOM71dSasZh/4YLwEZd1PfgWQ==;
	24:QTm0zTzLMmNAcia/j6HEQrIONlwnCp0y+W2Dqas2LmBPJPVyWgL9psIVRBAzb9/zrQJa9lGe3VzSuWsKZTIaGM90q51dOR8BPbCuD86ogsc=;
	20:GWELWxNQ7XXqhm+d0BGQ7Wjqla1nmJMc0VYOTTNEGWC2QqJC4NFXd6ohu0ZxAlobFgenLvT+OB3Z6OKA4MaXIw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:29:52.2529 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1179
Subject: [poky][PATCH v2 0/2] Upgrade to 3.14.38-6QP_Beta release
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
X-List-Received-Date: Mon, 27 Jul 2015 03:29:55 -0000
Content-Type: text/plain

Fix sticky events haven't send out when active track reach EOS

Fix QoS/lateness checking if subclass implements prepare/prepare_list vfuncs

Yuqing Zhu (2):
  gstreamer1.0: Add inputselector related patch
  gstreamer1.0: Add basesink related patch

 ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 +++++++++
 ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.4.5.bb                |   2 +
 3 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch

-- 
1.9.1


