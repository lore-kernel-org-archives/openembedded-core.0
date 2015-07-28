Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0142.outbound.protection.outlook.com [157.56.110.142])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE54762AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 10:01:00 +0000 (UTC)
Received: from CH1PR03CA010.namprd03.prod.outlook.com (10.255.156.155) by
	BY1PR0301MB1176.namprd03.prod.outlook.com (10.160.195.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Tue, 28 Jul 2015 10:00:59 +0000
Received: from BN1AFFO11FD052.protection.gbl (10.255.156.132) by
	CH1PR03CA010.outlook.office365.com (10.255.156.155) with Microsoft SMTP
	Server (TLS) id 15.1.201.16 via Frontend Transport;
	Tue, 28 Jul 2015 10:00:59 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD052.mail.protection.outlook.com (10.58.53.67) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 10:00:59 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6SA0uLr020751; Tue, 28 Jul 2015 03:00:57 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 02:00:40 +0800
Message-ID: <1438106442-15071-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD052;
	1:CAV3G1kXR7bLllqc3f2bbmyad22kMnAoBvQqUv7H1jrWRWEK17QLBS9L5HpfmEaYB68yTQaN9+9+p1hgpRDM7xof9A8iUXR0xaY/YgUC/jMC2Zm5K4XPnwiZ7KUpeD8fZp2rgbg9tRES0XpPnLXfFMAKlFdUQ4j09mLsV0KWEkuGt5rf5rlErZt1YRGbRfX02QRlUD39bdqL+jSEDMzgscr+R7h8AZ5kFvT9y/ua6SnBc1pXTpTRIpL6cHqERl9IGgd2CvgnG3gsg0xeHV3HuaFm4pDwcgIeMk5CI8QPYxynZZjyEuP72UxILRhZ61P/mIsVlzi/BdeDeZw9F4M36Q==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(50986999)(77096005)(229853001)(50226001)(33646002)(104016003)(50466002)(85426001)(2351001)(47776003)(87936001)(86362001)(46102003)(48376002)(105606002)(106466001)(6806004)(5001920100001)(107886002)(62966003)(5001960100002)(77156002)(110136002)(36756003)(5003940100001)(92566002)(189998001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1176;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:nov; A:1; MX:1;
	PTR:InfoDomainNonexistent; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	2:WLOgpAtuSGlNclKjWpbmxWgxlCGkxLd9C0mjcSf22eNvyhRYnW4ziBCx0gWTW3JpD8JKt+7gEr5+6vY7wXsL+U32WUoEeRDN7ubA2+CC0XeoLXiIJ4pCbc+4h4V9idwX+/lk0rDt4ahjahvszB47s6RwnSTbbBLISHj2FadihVc=;
	3:SiWIZ8e7OpHbljbHfkRLfzv1JeFHBunME41a+Uc6POR2P3eu7MVw69Fx+X5NbT815975Bq1Cfxn2Rb6eT/fB+IHE0aNxDeo9DkJRIL9ozR21VHqpwMBjTSg2Ml312AKD5KxNKm6luJVIY9OZpg+nVWR/vihhBlXN9wQv4Upf5S4CKaCyZ0biZ3gahS9uLdklnAAnqCI7cX33Gfr9c/8wWCaQZsXC6QKGd7nGZwvjFmw=;
	25:33gjbOLAM5t3+0rtCP3J3Fyo/7dgkS5zGpRJu/XfS434O25rGoZx6JWcrPnp/KMY8JLJ7jpAgOf8T5s7ZbQDIws92ez0/kNQJIMQBmMsbUrPqUimZA5q0IHCqaNgZVw4vx5prU36o3Qu6Djxi6Jgt/7LQnCQgMZJVKlWTWJXFfXdxHkx92dHG1yr+oPBv9rNaZKq2hIJkpKa9Y3vOI+kEOxJYn4RATYLc5ToS0MAz6iDtCnWAED/rJlStaJrc4xt6Q4LwsBuS9rFCBi2niPj3Q==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1176;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	20:fuanuoC/CG+391HZL9KUQqDYHTePFWoKRgIIh1d6SN3+YhxaJX5bDprYbuVwxdFrOGCqbk5UGZGaXDcPsBrZxMzJyysxDO/RE0PG+p6ZjW0OxIKyw4Mbopa6910vNRaeBaJohO3b/McnqKuFz8+Qk9rQUv5cIuKNK3JrfZeyUg336K1IEIa+rAEO8R7X94PHeu5TJkjYvldl6M2Vy7LuQ0uGBe2Rsn282h8XSlA7CTstlMsCKd4S+8OM72sw9soQdwzdiwKQj5gRpVJZso/Pf9kUSY2ZqQZbEbWDwq+HD4/HB3c9fO1p+g54FTb+IzO6IjY7ZD8Hsv8v+DtsxbFxafmINrLgKFBBU6kzCtf+kWE=;
	4:93RO4z9PJh61UBrMOppzrrkvhQ2bNTdG34buqQybSUhtFZ0vk4Y9uUkbP8suwavLxGNWnOBCfTwp4cf9+f218jmswKUUOC4Xyy0HoUcqHApuu8Hj9SXnrAO/3KMYym9QsaBQERyC+YRNNl+YAKXGhcxSSVBj4+0uuuB9lI4EaY/ghDlhDshyYkWMpM2lGtrUo+wvfpLoEamAUVRrvQr/S//moaxnLcPzE/O30Dw2kPwx6CWfNR1ZfmLJohOUwdOXkNWq58kyY3cPFQMa5hTFqruVAe3bDToP3wenekVa8tA=
BY1PR0301MB1176: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1176E5BB37C9B87A36BC678C868D0@BY1PR0301MB1176.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1176; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1176; 
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	23:kiJxKsQSCldpjR82GmqZ9ryg2WObQjREM/SLsHaECYsQloqaVcqIQpZ79cIQ1wr0wpQ9H9Z3k7qVqpnDDD5hA2AnFf//BfElhbEBDw2H0hWg7nddhgwI9Qef8ef/YFgNn4YOH8ds+k/WsetUMGDZhzU7Pw8KZqmesSSgDm2jLNmKqYyD5E65SALLjQuYnFZW0rGdgjDNjd4ah581F25zJtXGAVb5oLYZwsOrW0FuMeuR5yJXoMrgSVu1fBn1epV9pcaRi3saOEh4xHDi0c268O/gKOq4QHKBlD8Qa9KNj4R5wKT+zKwgS0A6/EyUhWYx9lLQsZOqSbepq4Cf4op0AGJNBAarL7S6KGKMNIvtb7zLDpfe/k6wyTusWV/JiXhS6rtbhW/LFWYLFwsxUE2FeYbKPLcEaGDBt6wJshXGUK3DgyMR4Mxwo/sjxRjb2JeIfEvKsqj6c91mx8485crtRhd1Bvo39Zmq3/8XPfzqFTadFolY0EGJ7Ae/BJ/GP39VVvPeYXJl6woo5iqlI83vhKAeMgxnreyzsrYfINqNLqhCtSENoB/Y4tYpf2YQtojBBGA0kEvGEn66YRh46LNI+pl2lhWokB81SOIASch1uOnDLhGR/7nMTz0RD5bjRwySNkfPSegDICwyhzQz60vskzaucsgmKkWTCI6TDPnYjQQlb6999/6pNkBMxWX4WuVgJRbkXWWMhc6UohIANLAsN6AIow1zlfe1FtdiWremDG49QTs72XvVHUwdOeZ0QlLJvpzb2b+aKTNI34pywWBeKWc3vwNQBQgkbsYTmvDyHuNOKE0k2GLGXx8COvdpVhd3qZYUkSLefLKwrpSwBgs4GQGRDqMy0R+6O3S5+RwuWsCGpjIf8QeoxG9vqu5TCIeJIpAcwZKmR2yxma3Epj4QCg==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	5:fNNDaHxLQRnDh61CP9hssNCg7TWEKW6sDdM3ru4l8IDHpIzEUIyCyk+ZDwyTohFJIAfgMbUb0iiEDJUtWg1dwUy/6MWtWZH+jks4O0qkm4+NhU8pduhTSZxnZPj/YvQIvu62p0uFNHDwLBEZ1seeCg==;
	24:+QC7MwHetHQUdSiqhzP3vdCqJ7qyjDy5FPytPj38l/8GgWXJ5v4Tr/Z7DjlpJWbU4chxLTRxgiQaZbDxaFHOa+iLKoCqES+NnhEG+9oCdVE=;
	20:deEDhch6O41qDzZF/1OoFopi2jCmU2Faru34wFPEVN1amK+H4HBAmxCMCD5tgKY1n292Sb2kJy7F+rq8PmjzhA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 10:00:59.0059 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1176
Subject: [poky][PATCH v3 0/2] gstreamer1.0: Add patches for Gstreamer 1.4.5
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
X-List-Received-Date: Tue, 28 Jul 2015 10:01:03 -0000
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


