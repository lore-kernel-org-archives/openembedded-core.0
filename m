Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.54])
 by mx.groups.io with SMTP id smtpd.web10.5490.1607414651398842449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 00:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LTHd4KO9;
 spf=pass (domain: windriver.com, ip: 40.107.93.54, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKwcOQ/P1wbHmsFwgu2PMLwn2/JO2IX84BZKsirpwtPwGsm9fdXYEPUwCgUwnM8o+rz3UmOL+dAI4HhRGdEC95dPsN2Ws/S7XYSsnEsNnO8i0Md6Hse7KDDne6Rcz8f5LYDo8kHxJqTbpmx3/psrFbG5UhjVaJMoDgPTpl4yPVgUEAKOfvIq2nDlUcgRZqrmHf4qiXAHg77aVrzloEca3fyIkcREa4w3pj5kNJA+EiI5urQccds5Nyp7z/oF6SD7yQ6IZBZMYh6MOuG58x1xqk56y6mq2hKTvTi12LfUeDjUvzzQR1p5Sij17XEmQUWkqo0oPtvng2XTafoLOjB1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+2OGeRFotp2lQA4lrIRNtDHQR1c2bHjaEjygzLwLK4=;
 b=OM0w4fQZ+beduGEu+UkNQGKPYjUdY2Q/JQ8VgV1kSy3IDaf8drsmCO/tB0gt8NhQjP0Lc3uvuMVvvjIZjXo0/ebGk8DPPqH8yK2oymRNqUZ82RS83AIOa2E1/F1NnP3wybQVu8w/WnDMTLITSf5n/93Dye+p720Pu7axenArVEITnAzEesxzteQeMCkXH/TG+6h+kqG+sPir4XTjHmjanmWxZpSaLdLpqVb1PUT7bLsbqQMgBAmCyGF1x6fpWaYbuyBGPzm+YE+KkFfwjftHzAdi8CjRXxmTCAFMSXn/5CuxX1oHyIcj4kKJbARCI0ourQ1jEqT6e8UfT0SsgGsmhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+2OGeRFotp2lQA4lrIRNtDHQR1c2bHjaEjygzLwLK4=;
 b=LTHd4KO9OAXksn1+QDLpp+IBJh91MzE1p151xXotmfyO1IeMVx+YvKdlURKHN6/17zuJ788G2dxea8bvLnAqXH8mU+ahH5gUydB+wecZsccyLYyfUoppKwmv446n0qUfDIj7/yEuNyR339TwdnuCgdvPpU29w5WoN33Vz1xfmyc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 08:04:10 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3632.018; Tue, 8 Dec 2020
 08:04:10 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] meta: Fix for ncurses minicom and archiver.bbclass
Date: Tue,  8 Dec 2020 00:03:54 -0800
Message-Id: <cover.1607414579.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 08:04:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f48f3c59-4244-4075-20dd-08d89b4fd822
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB457499EC24E54E91FB504419FFCD0@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fHXkVVWA7Ql2VexWWnPRhqTjQGk1IqN26fopnmcTWKo1nM7Fw9U7DF2LZQ9eplnD3wj4hXwBM/XqSBkFSdYPASAz+TSlIq97UHI0Cl/+pr5m67FEArbZuKwILij4+r7fhpGgPIJnBDO+h+JOos3B2U29lae7q5gEXTxHDtLf0UNJEPn8j30EikGDh5aKcZVkLyQZzFqoCEqaFJhJlsD1y3O19a4VsMB4yo1aG2GNTusWHUrgzf2wktrMAFzl7DPOQFVsWOdCK3kW091274tltW4mUxlB6juSO9kxVCxmmI/LjofQZ5gQJj4GelaQXXzvvG038U34ehQhwsUI33Zqkm2ZATW69x/uS8wqHEbPBhHQsEJz9faOTaOH0rpCNvpoZxhZFJiI006UZhwewgJGVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(5660300002)(6666004)(86362001)(83380400001)(2616005)(6486002)(66556008)(316002)(66476007)(4744005)(36756003)(16526019)(8936002)(26005)(956004)(66946007)(6916009)(6506007)(8676002)(966005)(186003)(6512007)(2906002)(478600001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?WiC08c79a6d6fcG7R2xJSwSoXlqMUxbC9nbZ7PobBjQZJmUYw+FU9hrPTJQH?=
 =?us-ascii?Q?VuyndC4bOGnEOi9Ga3ClTTGS+cQh2AdFhjTs2A1adOD24UtYihjZyPaDx1eV?=
 =?us-ascii?Q?FK1scJlowswYR167BOyFx96VDskqHbip3OrI4gmI1VhdD4aku4Xf6wYVWfeO?=
 =?us-ascii?Q?T3pvoJSFZE6Wx1xb2R3pXafSk5gmAssFLyXOJvPaWW3qIH05gi/qL3o1/D66?=
 =?us-ascii?Q?N23evd2exOTENxxM/owrc1hsnost+uc5cg39+qjSh9bMWSK9EM+DBBNQw9Gx?=
 =?us-ascii?Q?96iEUdzdNKjTYt3sBd04jnrQ8uvrTFIGiS56WtOCYkrHaUSw5cg4q+O45X4y?=
 =?us-ascii?Q?GgqjVrArC8cz6+0uqPct2riv5gLZS1se+15avt9BGmf1pHtaiA5mwEbwMmkn?=
 =?us-ascii?Q?gC/TauVWwld0Et5gfMyGhFygvL+PYY3qmvpM4DbtQtNoTAi/k+pAoXHxyQ7g?=
 =?us-ascii?Q?RqIegwd79FuF9MEFS8f4RbuW+cBBmymrawIuWA4sSmGJi8OFTEHJ2b3lCeTE?=
 =?us-ascii?Q?Ljrh8kUgVO22q9pHto6DlgIPjJBgQNfuBWDi1OBUjWn+cHgGZ/B4jbXWOA+6?=
 =?us-ascii?Q?/7CgtPH6fVhzcG+d1qxZ/eml5iwCO2LhMPAss/6f0RjOh0/2rIT+WSQ/gVCS?=
 =?us-ascii?Q?X/GNz4pQfr2xPhZMCy2VXjlKbEA+zghAn08EGBcK5qmis7L1QtUv/cgM81DU?=
 =?us-ascii?Q?CDd1PL2rAKbPZl0JYC+0hOkFG3RIBQPWdpkLnr0TzcWEt0WSzgLLir4u1zl4?=
 =?us-ascii?Q?KhHpAkGQUe3LZwqGvE6hn7o1yUmf99fLKDVVmZmOaZ9hXFnmFtZvp7xD2SPS?=
 =?us-ascii?Q?o/iyIGU+20kzXRzn/aZ+Ab+GB7pu6ynj2vuEH6644pkMrMUOnhvhUyQk34s2?=
 =?us-ascii?Q?O7Z13eBwHpfrqVbVtFitimrtwWgZei5nwYJ6xlB5NIcgHWG/Ppx1jknn7nvH?=
 =?us-ascii?Q?xAdZlGUCny83hjQIfg+yc/LkV3nqYLxb7m4sBC5dNBSE5ZAAImPMMs4rzgFv?=
 =?us-ascii?Q?1HVC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 08:04:10.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: f48f3c59-4244-4075-20dd-08d89b4fd822
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vF1pzPj5jXOPhT3jgGMbH6wkURr3P1yRVfpe8BwKzU33XGfByYtjSNO0x+J2MVYx9nZhYmOoiOBSgxtY/JMI1kk1d3xlt/Bnd+Rs4uX0wnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Content-Type: text/plain

The following changes since commit e995e67bc7a3d30adf9f8d0d2f4df92a941baeae:

  meta/lib/oeqa/manual/oe-core.json: Update test_bitbake_devshell (2020-12-06 23:16:50 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/3fixes

Robert Yang (3):
  ncurses: Make ncurses-tools depend on ncurses-terminfo-base
  minicom: RDEPENDS on ncurses-terminfo-base
  archiver.bbclass: Fix --runall=deploy_archives for images

 meta/classes/archiver.bbclass                  | 1 +
 meta/recipes-core/ncurses/ncurses.inc          | 2 +-
 meta/recipes-extended/minicom/minicom_2.7.1.bb | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.17.1

