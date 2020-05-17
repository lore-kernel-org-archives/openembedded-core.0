Received: from EUR06-VI1-obe.outbound.protection.outlook.com (EUR06-VI1-obe.outbound.protection.outlook.com [40.92.17.62])
 by mx.groups.io with SMTP id smtpd.web11.22663.1589722929123483616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 06:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=WZPS11rv;
 spf=pass (domain: outlook.com, ip: 40.92.17.62, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TehNAopZpyouc+d6KB2XmQTCYxQ32MMwHC7bCYOz+XA8lGiLQXBQt+He+lUIWNUNafEJcABER2leMaLL9a2IAQPXkN59qB6JgDE1kIpuu/VUn3EQaEVk2gAzXf+nSkb5LTTH4guhBa/tXqEcp2n5rQfEGyKHbiF9To7XPpK34LOiIRmjQ2Nz80ZGZ4k11CTS/IkINway61M6g1J6/9KMdGYeTN3aBnNEpIzNCIGBgfOiDVxAzaJCqe0fndbKi4T4SW1KTcoKgmkbVOJsc6iNxCXeXvPfS+W3NalRxA10vk6/KDP6iJ44Q9B/mv/y7B3MUj/q0YjBYonG9p5PzU8Vyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CGpwRx6FzYpdc/1YxnvzvBvr/b9K5pzC0Tr0GiZwDw=;
 b=XckJvK3ToNsbV6F+/6K+rzNw0EYNyCcjID5e6d0/nfqOA2OdYbsah9s0qPDF6uW9r9sxnFkoxmymPMzWCiHhzk1PietcfAHPgJ6xAa0SprgNPSF7SmonEsszvdOzHxMLx0ZgxFYtK1LolR6QCZvsm/fBe28g6yc/46H94XwsCscYMcVs3et5yY1QutFGuMYS4O7yuUAItC20F7Dj5lVvmQuzNfr75WVtW+kCTD6QGR+442Y2Bnl+S3anyY5Bk+VfAWmpVQgzlhqIMhVq2OFBO0X6idKJdSW4YLSa+5sm0ytOIZX9Mnl53soVjRuzrXHCLPxwAm71Icl5TirHvWA1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CGpwRx6FzYpdc/1YxnvzvBvr/b9K5pzC0Tr0GiZwDw=;
 b=WZPS11rvVH9O/OmB/P/u68fjPsKn0o/K+VhIKhqjzxrMJch2fLMP4SMnHlWTiAl0BrCkNbm3kN5E3VXI3SXi8MRsC22ZSbqMo7+R900auiyztVXeMsGJgxFjxUcJwnpybuZo+Et5dlMOxx7AIN8JGqE4ycPeHr6W+COpWjqK/i0tTYPOYH7a29Gq91ACKoN7l0aGmN7YPU/r0Cm8WIDWHTVWcchYGRXR7AnJyAH7sf4PStIOvw8GJaTSkiXOAGlNQxJGX8rTtZZX9oSG0frSB2iXmmmwIOz0WtjU5X35/kuwyp+WZg/wLfd9vSZhi5gXdyPM8+KnaeGs4fkLPE3HoA==
Received: from VI1EUR06FT012.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::4e) by
 VI1EUR06HT093.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::483)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Sun, 17 May
 2020 13:42:07 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc37::44) by VI1EUR06FT012.mail.protection.outlook.com
 (2a01:111:e400:fc37::164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Sun, 17 May 2020 13:42:07 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:EDF5C13B2FD3E318B06CD75EA94E4053F7939B3EA9A2FD614CD5619669558337;UpperCasedChecksum:1C8CE645DB63C681EDB6391E2B16AF6DCC151033B0E9C20A8154F5A626C9936B;SizeAsReceived:8648;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%5]) with mapi id 15.20.3000.022; Sun, 17 May 2020
 13:42:06 +0000
To: OE-core <openembedded-core@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: [RFC] cve-check doesn't work with rm_work_and_downloads
Message-ID: 
 <AM7PR05MB68819C3CEE4D2ED6C8ADD072A8BB0@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sun, 17 May 2020 15:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-ClientProxiedBy: AM6PR0502CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::35) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <2d748147-389e-c698-1441-0ba9fed82540@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.150.46.237) by AM6PR0502CA0058.eurprd05.prod.outlook.com (2603:10a6:20b:56::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26 via Frontend Transport; Sun, 17 May 2020 13:42:06 +0000
X-Microsoft-Original-Message-ID: 
 <2d748147-389e-c698-1441-0ba9fed82540@outlook.com>
X-TMN: [QOfi11vydEijWceX3OodGf5JeJRaqQep]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: cb096a15-c9bc-4947-bdee-08d7fa6816cb
X-MS-TrafficTypeDiagnostic: VI1EUR06HT093:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EL72I9+gCAKnVdswel24aM455YHsVs/OhAFNMYseeTZhBtkhUhGxMKJqMt/wPd9jyxpFkrTEhvXcMR1I9uyXeIErUL2S4v1Z1kJo15PNNjeA6szeiDAtN6wUJ8Z8LbBooYPuisCh4grHc91Pa4FFHTUuzGdmWOz+wdXL4GBMqZCxV1gpwIPlt+FtJGKLHkHLTy5DFkqQAVB67KD/2dYGAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	eVPHo7QnGymEP/2N/pukWRNOOaIy2vkE71bMmsGHP5xatQ//uOj7zz8zr7yQ2u9376O9m7uQBYlzo0SwJrI51YRBk0zRBSroRo34pmvEZJAIq7EwS9ooOKicl8ou4VCdhLwPjEl4Hjd5/Jm2hSZiMw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb096a15-c9bc-4947-bdee-08d7fa6816cb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2020 13:42:06.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT093
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

I recently encountered an interesting issue - I switched some CI 
pipelines to use rm_work_and_downloads.bbclass, since that 
cve-check.bbclass fails with

File: '/opt/build/poky/meta/recipes-core/meta/cve-update-db-native.bb', 
lineno: 55, function: do_populate_cve_db
      0051:
      0052:    cve_f = open(os.path.join(d.getVar("TMPDIR"), 
'cve_check'), 'a')
      0053:
      0054:    if not os.path.isdir(db_dir):
  *** 0055:        os.mkdir(db_dir)
      0056:
      0057:    # Connect to database
      0058:    conn = sqlite3.connect(db_file)
      0059:    c = conn.cursor()
Exception: FileNotFoundError: [Errno 2] No such file or directory: 
'/opt/build/build/tmp/work/x86_64-linux/cve-update-db-native/downloads/CVE_CHECK'

after some thought about it, it's pretty clear that the WORKDIR based
DL_DIR doesn't work with the cve-update-db-native, as it expects things 
to be downloaded once.

I currently can think of the following options

- document that this is a known bug and could be easily fix by including
   CVE_CHECK_DB_DIR = "${TOPDIR}/downloads/CVE_CHECK" in local.conf
- or the more complicated option:
   insert the following into rm_work_and_downloads.bbclass

   + # backup original setting to DL_DIR_GLOBAL
   + DL_DIR_GLOBAL := "${DL_DIR}"

   right before DL_DIR is overridden and in cve-check.bbclass

   - CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
   + CVE_CHECK_DB_DIR ?= "${@d.getVar('DL_DIR_GLOBAL') or 
d.getVar('DL_DIR')}/CVE_CHECK"

neither option is really convincing me, that why I'd like to ask, if 
anyone has a better idea how to fix this issue?

regards
Konrad
