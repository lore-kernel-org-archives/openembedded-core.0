Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0109.outbound.protection.outlook.com [157.56.111.109])
	by mail.openembedded.org (Postfix) with ESMTP id 2693573237
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:21:56 +0000 (UTC)
Received: from CO2PR03CA0017.namprd03.prod.outlook.com (10.141.194.144) by
	BY1PR0301MB1175.namprd03.prod.outlook.com (10.160.195.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 30 Jul 2015 11:06:23 +0000
Received: from BL2FFO11FD041.protection.gbl (2a01:111:f400:7c09::146) by
	CO2PR03CA0017.outlook.office365.com (2a01:111:e400:1414::16) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 30 Jul 2015 11:06:23 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD041.mail.protection.outlook.com (10.173.161.137) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Thu, 30 Jul 2015 11:06:22 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6UB6JZb026460; Thu, 30 Jul 2015 04:06:21 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 03:06:01 +0800
Message-ID: <1438283162-12897-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD041;
	1:HmQ9Sj933k5JVixRpl1ktFjx4ZsvpesH6udEJNgJ7aRpx5c1XE8/UJL7XfW2oEAQlyJUmCLiQl5Yhp5NxZGoSIHtXLu8ny1uegISxK6G1T8lgwArOayoeUMtF0Cy5eim0d3teVbuGizrsFdAqsl6yUD94tMtQ/YN2VL8EDpZKw2IxhaYkqt+YF5TAivwQankxgnn40/SArySHu1COAOKH6BZ/JDKaJJJHQag0Ye4EDqOYWJiJhyxq/lmXzUv9oyYH1AOb/72y6g7PEHSSWgScjV49AUHaswziKbZnETQk6I8ygcxr73eDzlhj5sSgf0RgxwBxRJvtZO8pcMMn18myQ==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(2980300002)(339900001)(189002)(199003)(48376002)(62966003)(450100001)(189998001)(50986999)(86362001)(229853001)(87936001)(104016003)(46102003)(5003940100001)(36756003)(2351001)(77156002)(92566002)(47776003)(85426001)(33646002)(50226001)(106466001)(107886002)(110136002)(77096005)(5001960100002)(6806004)(105606002)(50466002)(4001430100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1175;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	2:cdS4yEK9PEQGRC/UfMqEQjawKgnIDTbvbHsUj/IstzTmNPIjJsdMYOol7g93ENfOCh83Ph59Jc8YPzkJ8+roHnbfVp5QnFOe5eaV1R5reTtbQvM7+D3X+2CufXMOS3qJyvTs793cGZM3IBiIoPqDww7GNqXtlXuZEZaP3cY4iqw=;
	3:3iRP2X9oUlAfYLbLAfPUzWKFqhRJJ5lOEaCLTw8/ICt2ax4NgXeOuv/lTlTn3HMn40PWhU/LxkMt2lHOZFXFUuFB7yuQ7JYGtMMdon9W88mUkYhs3RxoDJ/t8XlA0bCmN8KCiJ9goZ/SlJhIspF4bmTxki4JKd37vPgadvpvljpYuU3ZE2FQkLL3Av8HleAFq4JUVGYj6RWxz7jOX9D8sSCccZZtMw1o33bkeq8MInw=;
	25:Jn4T/1VOGmMbhXCCmComaCUdOKEEXV0PQjLKUElxHDxo2IivqT04m3su762tXq5UFj88aodHDU8XMZCGall7BYTL/vBQItchtyhd4hWQwaOIJqkEwjTqrqihmUrMSiL9eDp3XFnAWKWbrifh0ZfiaGyAtmzLVS8e3DzaIOxlnJzTyg6d4lffZwVcUu00PpfRfIuwEGg3rEi7oOR8RTuUobJfsLxSiqTUMb8jCX8V9AArh4pfTScJrB126EMifJGnN4v4r4CjdwxNxnyv4F45+g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1175;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	20:ktYUvABBfuVk2FYnY7s4m3ePv6ANYUP7OrlAIcxRfDFCdm5N9BGl1TKXsF6vwAu5bLmfvYKRRN2h5nVLOrYUXjHksoVHaMcESOd3/Pbot43EIdy7HYTTvQ1u+FnkMWPKLqMQgQC5FxXpFQZ0E+wwV4/3eu5X8vOZug18K2UALLGiKF5u5BNY45umPT4Yk180NwWPK0SlDowYMXwxH3DD266J2xKePfK67tx40ZqkNfKWUoBFx+fV4oN3ZOCcXHOLacPq4qwE7H2hPWu+pFTTpNR8SgYn9JEjFDPNXnmgyomc2/S9l7CEpkyj2oq6olmQLAKbAofF3dwLqL1Pl0Dko5GG6uLzxZdfB1SGOemJx5c=;
	4:ze9j1JE7JZJotQIKUov87DJPx5xeNEuKlK4+HltdHWX8yNeVMgGayFELmpFDDcgAVplbvF+ZKpUeWzXo6Y+/uUxnvCd0GpAOwwrqS/BU/Wm38uRnqxFqf5s5k1QS9tMZhrS8/W9NTtzxrh1FvhmFwgzceAMQiq8hJmqHSxeJM4S+fc5oJzOOFspCeFHtrjAqRktCTd4I3WA14l4j0DcH6UNR0A3NQefiDBx5dIt07N04kex8yuXfFf16k/oSpWDn/+cl4UxXZ0A05nwhOwkz2yeUc/+oUqgOVKN6084LdH8=
BY1PR0301MB1175: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1175642652C34741ACAEE723868B0@BY1PR0301MB1175.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1175; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1175; 
X-Forefront-PRVS: 06530126A4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1175;
	23:RWZsUKwKocia8Z4XQ/neKiU2kZizoZpxz32aEwa?=
	=?us-ascii?Q?IwrTdHN8RlkzrwvauFPaIgZnI+w7eKjqCODA7IV7LDmI5u0WWApGmISSOcc5?=
	=?us-ascii?Q?fuQAnntGe3uR3QWlyEApxGwNKFDVDenRJQSDeh7vqvESBJ+UfyTQM+rJ8gbC?=
	=?us-ascii?Q?DMLT/jhqeiKu0x9qgbeTnAm6EvPbXz1um24rbbEB2CrC9Nqi1jptc3FmYxMU?=
	=?us-ascii?Q?mK3xANDJBaMZAGWqfhkOcJ9H5EKfyho1yY2HnzbyJaYyRafs8PtTDjNTGOu1?=
	=?us-ascii?Q?MB6aCTNmqeKlrs0kmpCATqdnk+UJ1m3wp5olPX55yFwA0Cc+8WsJVrCTwUfO?=
	=?us-ascii?Q?j7BF3GWDF3TGjfdz53gTdOgp1/91TNVvWtF3EWb47BhdKg5g+BBk0XnASxyl?=
	=?us-ascii?Q?Md+NkRD1FrDIL1hH6CQ4kmxxsi1Wlo3+wP6dWN3yQ2WfS30bhCvkuwenp1KX?=
	=?us-ascii?Q?Fgoh6qGRtH8L8+YwZBdav1xnyiW+nOmYG5Ee/e+tu4B9yF+r/HZFdI0wDbh0?=
	=?us-ascii?Q?l6XBzxw549V2PUwSl24Qq5OY3owOQHTcP2QL3IuE1PUuT+/dPZYxTIMBgVyc?=
	=?us-ascii?Q?9mOiBH3w2e1KNlzMeMSssdcF8sfOB8loctooSa3rRphjGduUQkDPsw7OOYOL?=
	=?us-ascii?Q?EgPg3Wj4sccxi9uQ/iFUfvR6Si/CaKxHzAcRbBUpa1lS8A43zd4MIDcFvtpF?=
	=?us-ascii?Q?1vkIo5LDGEvM61Nf6yX9wl4ENbeZ75vK3csJmOhRQNg8A43q4nT+Aj2S9KJl?=
	=?us-ascii?Q?vaBBb4geMTZVxmycjz5P7KhBrl4pvCx/Eie8zNu5p8kEJ7taF09EYRs9m8SG?=
	=?us-ascii?Q?nNJfWr9jKl3CY6EP0pLhrv2Z18n+YRcoBVhCnx9vAaE6l8aBg+w01lg8zJxf?=
	=?us-ascii?Q?7196Yg9WRLuGwDfinD66avwkjaXBajAzvKz/kmCIV3SkzZIE7q9/LjMrKENu?=
	=?us-ascii?Q?jteIr4AKG+zzZCEzZDmar8/K8oEvcyGz6eChdlaEQlH5xXyfkPZqoI2slHri?=
	=?us-ascii?Q?i1AI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	5:w/M5jXktMCEZtT76/5W4HxiDPvVPLIbl5/M1MWHXBF8jxAQ9HnsuJjnmAtGMXKSKcPelZWLs/jdvsHG5DvMCO0Ncv55jypkkddgp2NcXz2qwYkYQ8oWhgtPeAuuoHY/2RCvUlergyagZwnihYeuHyA==;
	24:qu95LZ2QMnjCwVcPaypeo0NWVxWYaevAVpEN+acXSG8m1Q8k1mdylfTa5XAEd7PuchYe35Xfuc9SZbp4nEuKt0Hqmo8TV6ByMPf7xq5ZiEc=;
	20:zrjO4Qh8GJz2krOloQYw9oxRRvXEcviKwxXpXbsJsHHJVpGczjwSsOkfEY9cJRK5k6Tq0PT+aod7CHTMTize8A==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2015 11:06:22.4583 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1175
Subject: [poky][PATCH v5] pulseaudio
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
X-List-Received-Date: Thu, 30 Jul 2015 11:21:57 -0000
Content-Type: text/plain

Remove the starting PA in script, then pulseaudio will be started in yocto.

Yuqing Zhu (1):
  pulseaudio: Revert "launch: Avoid specifically starting PA and rely on
    autospawn/socket activation"

 ...ch-Avoid-specifically-starting-PA-and-rel.patch | 31 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch

-- 
1.9.1


