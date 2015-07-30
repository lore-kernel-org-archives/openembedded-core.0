Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0131.outbound.protection.outlook.com [157.56.111.131])
	by mail.openembedded.org (Postfix) with ESMTP id EECA6763CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:04:19 +0000 (UTC)
Received: from DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) by
	DM2PR0301MB0768.namprd03.prod.outlook.com (10.160.97.151) with
	Microsoft SMTP
	Server (TLS) id 15.1.219.17; Thu, 30 Jul 2015 10:04:18 +0000
Received: from BN3PR0301CA0034.namprd03.prod.outlook.com (10.160.180.172) by
	DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 30 Jul 2015 10:04:17 +0000
Received: from BN1AFFO11FD013.protection.gbl (2a01:111:f400:7c10::106) by
	BN3PR0301CA0034.outlook.office365.com (2a01:111:e400:4000::44) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 30 Jul 2015 10:04:16 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD013.mail.protection.outlook.com (10.58.52.73) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Thu, 30 Jul 2015 10:04:16 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6UA4Dkf028536; Thu, 30 Jul 2015 03:04:14 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 02:03:52 +0800
Message-ID: <1438279435-16336-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD013;
	1:DPicbpEZoX0Jn13Z1GiTqOq0zhaBrNMRt2jBdj2FkhqZjJaob/2DEy0yf06xEvuRYL+facYLXe2lTkMO5dL1iIi9DTu0P5QVBYsszFEM17YdCkX1fafYb4yQf2AEiuj7UH/DCdSx9RJ9CgV9YzC/vidEddvMhoc3DhWqCaqzChy1/xL5x0QAyFQjTvr80+EDgdU2zDACdS78qhlXtMyAKznyGHpJQFTr1e+jyEb6YSc6JX6Ux3p9nosoLaTvA0++2sDDY18PaBDgL80RNfe7czM0dlnWwGSyxUYx7Ns/Ci7OQ/BwedYzf9j9/DcOTdwE4jwmIyict0hKPdiHG/Xdwg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(47776003)(189998001)(107886002)(110136002)(36756003)(77096005)(50986999)(105606002)(230783001)(106466001)(6806004)(92566002)(50226001)(33646002)(87936001)(77156002)(46102003)(104016003)(5001960100002)(85426001)(229853001)(48376002)(50466002)(86362001)(2351001)(62966003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1183;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	2:y6Gt2EvLoYwQFF1YxJHqBrt8YLU6rWz4Ga5MpgM6CdSJTq+oN2ON9Y3i0o9zFp8ieLuev+FaaWFIgNrFM99sxI3GMaznKjzww3doC972ecE873oODkkKsc31SRXvKIuFwyxGAWISq101bpUoVW6PLxn5FZhD7awSRd2hJT4YJdQ=;
	3:Rvt9i6AWiV4e2TZpKMqzsUsaKoM2XA7V9qz1rdzmVMoAwVsyC7oRFcxsY76ObyHGTMQDIvmJ83x6+ZFJ7Wq8pnBTrl/Gp9Nl6pIXFY+/Ij4CT2XIx7eQ7db1Ejm3WU42xVH0Y2+nZW9PC3TgZa6n5m2KGkA0c04bZrrnO3G3YAfDQkadEl6yKqY28zKDqgNDGJSsYB1PETW557h1sXuFfADp1lXRKgGz1QFbigvoliM=;
	25:tazPBrBb/Yp+ViJe2GH2DQ2Wtdl5cmLqgeWVkHs8Gu98QuyLPo7ZpKVSEaF30xnlMXF1lJJLTVyNggQdTk9POfU5zFU2jT8C/tihsQbU6srWm+Pgve0skv6AEzEJeAizSPIwvmQpuQY4JLxyRh+fqQyZ4zGpRfjReMipfkPUXk8VcTLfMDEj/HPRwfq8RYZtJ9W4TRXEx5Rpj34Q0c9TuMKlKrbXLryuh08dxIRPoF6P+wKO0YDcRlX8/BiFDVtyPqQM3L3tAEinVOgFDRaMag==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1183;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0768; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	20:M9OIyOUWdzR2pyqc6Uvm6+8n5Uepmr0te9D99Uno9ISucqWDMpIRiCCy4mwXtpgWEJY0t1bX878ciQFuG9ZXxU6C0eKGqzhOa81UCi2U0cj07liFKVXzzKc3j6J9ZUKkm+ofvHZ4e75mMRH9dBDr8aAFD1QU22x0d3ufr1doU4rWYJt7poMd5Bm9WsnbNDGEbtFpHuElzManBrsixEnjpE3zUaRzYpMFbBT9reVh1CQfPWZh+PruNX5IAGl8KXMzjJzllxhurUyZ5ic9xJsLTYasos8Jh0Or1TovSVzLQi2bO/2gdi0Ds2KqKWkwQV/5H6rShpdasa0d5FLvIYy0lf5sBpWN3Xt99MzXvPjRG7Q=;
	4:9EYjTACc1u338hflxuJB+20Vg7mDlKdn+fdFIEgQGnHIgReefq9SgbxETt/0PNA9/mHxHEZDSeB8Ld82/skaFelXxivLxdANmqiP1Cq0U3iCj2B/veZAveLcCYotKfziqIxTDdJlL8DVFqfmJH9xXlnDbIWT94FScZMn5CQDknUvTsj477tdCMV9pQ+a79Dmpz3pvVqpkPJFhAaBhtQaX5wACsabXMfLiOA32oRF1fzx5r7d4TWxzPku6GPccinK0sS0wxCvbdU9HVowD5K+LKky7KAc3KpARd4hgYxAA4Q=
DM2PR0301MB1183: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1183815ACE0D499DEBA8CDA9868B0@DM2PR0301MB1183.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1183; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1183; 
X-Forefront-PRVS: 06530126A4
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	23:gBCxmAtHp1IUmQNzQH1N9U7+ADbx11XFkVuOeA/+4KpLYURPzXmrsDj/ITi5K3KxluPHFMInbUfIi3qbT3h6CCoY/BvAcRhuiK5TvED0uKRTpnweiKBwgdRd1EPlev1rFKQ3BIBEf51zX/ejJBafdhiKNiggAzAoB/m/kEWW5Ne8VAqxX+582Newu8xwcaD1VXBUix203BGlK+IjZMz6AxJAX1HKqjX7t7dTYPvHWIk2sJgShFHdhdiwkGaJs/Gn+L7Nm5jOMoHQubsGExx5xaX2hBSmeCFUjh9iIkqI9FOx58XToKmDEjK4Q/xJLztYdCsFlcRIOKGIWXKi/cZoNslW5mERwKn8xWNfIQQ8KPz0wT9v+fw6UCXTkVv2h4LbVGAaBKl48t+6o1Xs47ytldHddARSm/BRqalD7FKVXPBV0vtnJdzkqoQxibxtiWTlOuV3/9rIRnd3yV2YO4RhmRRJTdwwL0oe6pqytLUH+XCpsm1ryo+6OG/J31BsnxAX0Ne4+PRJzBBC4FzsaEpx+blYLgNlKKIxE68dEt3xYDGELhOuR9s+vzWzEaDyL60rv504Q2/2SZUYRDRlU5MVoP0EW9DTiUZ5ZaM/r/w7hsCz7OxHuk3akxq1ZRbAK5psmbX+y71AGZhpG+pCUqb0VSiRZUn6ZzLOousOJb1Xa9LTT8qSuba/Cua0HDfRi/9aRYtf4fYcsfPKvKEP/ADurHIti+cfq0q3uX1iA9ni9BwYFY+DjpBhGInV5pOwj3IuouaqVQkxwsFrp4mSs1tXOWN5jcdRJLRilNxYEkK+kpD1tepOo1lSNKMi+KpqC79BGm7yteU2FrbQ9SmWbvWrFROg+uHOgcMqyAYRUvlD7Q4=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	5:1wHTsp71HB6esVv+oTSdkLXSH8jxprqC1rHOfmGlUM36xZRiA0jHzcCi9vxO7lMgzoxmwLUiH9Td0Fb55uBWIXFCYOJdUWt4L++YcfuiyuZ0o8Lxus2AtGDRt+pYy7qTW2YMzsjmGQwAri/H4Z1T2A==;
	24:ydMMHn6WTg++1btCvktyleQoV5ri047IMOmGt10SAHQ2qiyA+2Jjxu+oo3F5HrkWGL9UDAbB/QNpNYDVHuBa//xc2gOYexCzAuikW/LLxQE=;
	20:XBykfoZYfhzP41hpqyllYYnWsb+kvK01bRbap6CDeoYOVZmKuE37b+RY4uQqtfe9LxUuZW1eH+YJK4f2dgUPRQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2015 10:04:16.4151 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1183
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0768;
	2:qQy1fRdkzMZo9sui/7c6NvN+GMKNesDU1mf6vLOpkxBxhE67RSM4AQlkgHtBOryU;
	3:MxxlIjjTCplRclzY2smFnBFm7tBufvRBRq5nfi1zQTNQSHd1O6n5lFhEFxRNxn0sLBo2x3qp9PE1FXOzfPjC/CnH2QgMDLXoLdpK/QmnqvXAwalcxmDmkecVw3angQHGnGJ2O4+5GTEqI8oJrPniA9vB+5oGEjW1EuIj3OJrMlQuYi4dbU/uEVjaUgWwzNY/7maHibtKLnbiVLV4qcQK/jnpw5hGAuaAsvIjCcragi0=;
	25:e9WMXUiTrDJ+HhoQKMlLvu2mBWhGkSlTRbiieOn+0LsNDzq/it24solfym4shdXQskYkwVnnuMc1OcodJEwvIRJWDcDqbMV4pzh1vVa/HU5AoWDyrlXUE/Y5WEZwdgiDI/SSwJVG3bbjws66n4ZtlAFvAbY2RRPQD1ejCLUmwihO9O1mBC0YeQ0Z/gybcDaYnjOS6UwFEb+5KJTu46jSmsZBiGiNAQ+CH+u6zRa6IBNV24SZYVc36REMmVCyVzC0hOL+Ln5AQnJmf3sdIF61ng==;
	23:bsFH5x963AWqFzCH44JMQEF/5NSjsZTkB5woZlXKUP24GVKKq7dztTRsYPK6dahF/gQ0ihxsIAAqfQogC/6NmIMUS36l0+3fnzb4t6BuPCYTaXpfut7zJdKId+IvO+V1FGSwT+AcIdkfnDk6LIMoee7kKJbxYajXl2dIh9EcCtdtm2gDCAIicqckkJZq/lQOShDEnTySBf8C5KZUtKCuXJXavuzqtcQMu+Jx2lt3AtB+BozT6Oz9zcBVB4M5QBWt
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v5 0/3] gstreamer1.0-plugins-base: Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Thu, 30 Jul 2015 10:04:22 -0000
Content-Type: text/plain

Fix issue about gstreamer1.0-plugins-base

-gststreamsynchronizer: Sending EOS event instead of GAP event as GAP event has issue when A/V have
 different duration.
 Stop sending second track EOS event if sending the first track EOS return fail.

-basetextoverlay: Make memory copy when video buffer's memory is read only.

-gstplaysink: Don't set async of custom text-sink to false.

Yuqing Zhu (3):
  gstreamer1.0-plugins-base: Add gststreamsynchronizer related patch
  gstreamer1.0-plugins-base: Add basetextoverlay related patch
  gstreamer1.0-plugins-base: Add gstplaysink related patch

 ...rlay-make-memory-copy-when-video-buffer-s.patch | 129 +++++++++++++++++++++
 ...-don-t-set-async-of-custom-text-sink-to-f.patch |  31 +++++
 .../do-not-change-eos-event-to-gap-event2.patch    |  49 ++++++++
 .../do-not-change-eos-event-to-gap-event3.patch    |  31 +++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |   4 +
 5 files changed, 244 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch

-- 
1.9.1


