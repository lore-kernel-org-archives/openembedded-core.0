Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0049.outbound.protection.outlook.com [104.47.32.49])
	by mail.openembedded.org (Postfix) with ESMTP id D3DC577E89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:35:58 +0000 (UTC)
Received: from DM5PR03CA0043.namprd03.prod.outlook.com (10.174.189.160) by
	DM2PR0301MB0910.namprd03.prod.outlook.com (10.160.217.140) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14;
	Tue, 23 May 2017 07:35:57 +0000
Received: from BY2FFO11FD007.protection.gbl (2a01:111:f400:7c0c::140) by
	DM5PR03CA0043.outlook.office365.com (2603:10b6:4:3b::32) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14 via Frontend Transport; Tue, 23 May 2017 07:35:56 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD007.mail.protection.outlook.com (10.1.14.128) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 07:35:56 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4N7Zo6d015402; Tue, 23 May 2017 00:35:54 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 15:34:18 +0800
Message-ID: <1495524863-28699-2-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
References: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131399985565161944;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39860400002)(39840400002)(39450400003)(39380400002)(39850400002)(39410400002)(39400400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(53936002)(54906002)(47776003)(50226002)(8656002)(6306002)(498600001)(97736004)(4326008)(2906002)(8936002)(8676002)(81166006)(76176999)(85426001)(110136004)(38730400002)(50986999)(104016004)(48376002)(50466002)(2950100002)(33646002)(305945005)(6666003)(189998001)(86362001)(6916009)(575784001)(5660300001)(77096006)(106466001)(105606002)(230783001)(5003940100001)(36756003)(356003)(2351001)(129583001)(146423001)(121003001)(17423001)(156123004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0301MB0910;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD007;
	1:ZOlSd/V0HVrJQMIljhG1toETHH5spBZ0R8T1SiJIsb9/uJm1j4jv5JMnvRvDSaJ4w+mAcshL17PFHEMqeYsJo4vOuaRMrIVmkmnDO+LgmoqL7kgpW+5L950lOqhLeNLrb+qfxg3nh4efCkxjBw31l3h9i5tSMoWvw2+xvkk30W6ePxfHHivpYmwjilRbdfsbyk246pmrx/PdhHaybbNKBpsmufOFypSKbXdb2mStX9ifJX4eiYufQxDCf4Gzk0kRG1C2F9BcluMKixOasPvLVRwc4nP9GboA6Qlbqv/gbVgQnRf/3yB00LwfdM+iZtU0QauX9lowAYvCSsSsPvr/gPq7h9SaoNlljm8GTttjT+jtfoBV5qn95DEVStyJJJsIdqcb3mWMZx7spRd5OgoTT5g9HnAw5HXgeCpe+qK+6m2mpHbuJOmfIKThKYk2OO4DkTBDMJG2a3aCafUJsrsD6fVDNqGA1L7B33DFjo3IpdzqWtUjeQZW7tukVScvKItvM+pcWRwSPzDyF4ygAupgQ6t7E0Ok7mVIElvTmWKPiZrQf4/RDSZxQvSrfOe1CchnTz7necsD7I0qERkFX0OYEZPTRRxqDqk1mGzu8fOu3XORFH3zZGaH/V8CCdb5/7jM2eeTJ5PZ+cTUS7l7DBUQzBDEUVP3ziSSiN/MaT9czB9WtGGmHcCgP7PEEvwsZon14dAOxNtAY4TuVAeV4lR5MstGkemExdwCuURCOdUAgHLZtA/FLmyHbcQ5XplWHwJrh+/6/lIrxvd/YA6w+Cg60w==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PR0301MB0910:
X-MS-Office365-Filtering-Correlation-Id: 344e50e9-acee-4d29-ed66-08d4a1ae597b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:DM2PR0301MB0910; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0910;
	3:yCXOH2jPnc7RkLUjZiCnlDnIXsHUt2sEs1xBlokEEk3urWQmGz/plFPieGH/2zNVDshsyMBp6NRLiBAtsl/SZsoVObvl+BADH1lpuoJwGDDlcOd4R9j1bPGDbkmMSseuxbhT3DUq7WVtAJcsA5P6Ki8jGt+NKsfSrXyrha4sldocZzm//CxUOHG58aIdfyL/Paff9eiUpghzhAJrLAgwZZ41QRCvNoJUtO/CWjl68RCvwwnhjP1abJiYPOU+/OxpY8knMONMpmnOGDfDmlBiRGtLUF6Q2asuZW9pho/yHuzj/g6sNRv3gLEFMoFESMFg47ySZsMWaY4Q8GupSJVlOLUPyZ25S1GiytZhrwATJn60rxwwSaXxm/NynrMTkjWa634zhQF79wCtcMZtVe/w2NKgQvSpdWGYMSNCnCgz0YZ5io+nzIMsrH4FOia9peyF;
	25:fzKKoRxApkf1bOYKTWvTANOupCS4RL8F+w81RV97xzP8dlP9zyEDo6s8ZeynShjuE33Z9tJlg4i7dzE/o1k/4m/Vw6j/ZDpCZwyfhSZDfJlI6Vz1JophBjiHB1L9RAqZf5USwb8rWV7FNgJW9MODD5ioQUn7NBp1o9u0RytZSCjnznhkLfzNj9kHgGj9Qy23nqxpBKlNvvf9qwSahDsxq7VHv9RrnmZjYaIxWbaAdqtU62McZ6XacKZ7+Rp/36DztNoKlme4MXRzlhlbWFE4z9/fRsg6NXU/3Iook+ZOedtPjg7S+AT/DGK5hzv/poWHbn8EUjMcd+k/lozMq1QfvKWZVAuc78N30o3METQmtsXIVM3RsZzju3b6kDdByxIjFdQos/OXy/MYbAT69h9W1OQGz/+cOLzH7BGlrEowOstlm0oVXMAKeSjcW5o3RaAMqo4LD8A+Kczt4SNBdjkqEatXbHAiGgodo6s29ivrwCM=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0910;
	31:ZEd6WFKafZia/3yvomp+5dgElydU4EKsRxE22UJ5Y8H3q14QvwakRY8NYQlmo+GDie2KrPhPDBwLzHbnEgVimXfVmQ0teDj8syNN4Wp/2pdaXPPyUsODJHdMRer5dgwDTv7GNbuht80WpfHcQQUp0q7lyTCHvz/PusTO4ZPOaF2P0jwO+mvGgulakL8JLXUqpq2dTkqtIrLncjGzTRlln3tAGWkfb1ruhrhvcCMqMGNORKQ1Y6/7snf99d1yXll8d64QhkD6G6QA5+zhpI5+hg==
X-Microsoft-Antispam-PRVS: <DM2PR0301MB0910029202C12FECE2620BE6E9F90@DM2PR0301MB0910.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13024025)(13017025)(5005006)(13018025)(13023025)(13015025)(8121501046)(3002001)(10201501046)(93006095)(93001095)(6055026)(6096035)(20161123559100)(20161123563025)(20161123561025)(20161123556025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123565025);
	SRVR:DM2PR0301MB0910; BCL:0; PCL:0; RULEID:(400006);
	SRVR:DM2PR0301MB0910; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB0910;
	4:99sVO8QAy7BPrSuXEFjEEODxJWrGly839Zvs9zUF?=
	=?us-ascii?Q?6M7QsPr5eoX7MI8kThvBUnMA8l0+fe5HuxrF/izehSsQpYa4CBGXVMZ2LKBj?=
	=?us-ascii?Q?onbdOIsHx4v22uQiLICh/woNZKOvGvtTe+89G7gbzTcrP6wMFV3SSm6pteKW?=
	=?us-ascii?Q?MFTBV4CJohcjE8OKnL8Zm7pSIFnB/AnRmImH30BL1akwOJvx1Ec7QiAP85Gp?=
	=?us-ascii?Q?dIrmpe2Rnnq+VC+3fEIKwd0obTgwHu7xYa1Xs1BOcYj0O4ScxuZRzbJbw+20?=
	=?us-ascii?Q?07B+ba7sN0P+PKn5tI+84dwml8bLzCC3APBcVhzvXDojoBkr4pdbY3KP4y4X?=
	=?us-ascii?Q?Rq7uEeMu096bofIOB+Hrxi4YECVEsG/Ps5zWwmyDcyUghcUtQNs/yFeRCTyq?=
	=?us-ascii?Q?K5DOntqTp/4WjzhfuVwKkWTAfrH+/YlpwBm+9Nxiod1r6hsSoX24cDTUKds4?=
	=?us-ascii?Q?b7E4k0iV9jAEaW7anIRIelM65+vWiJ5mDFijLRvyrEqLmuFzISJmatNQTX6d?=
	=?us-ascii?Q?MCuNp0Oxyq5HxC9C63KeGmXurTJISSf+4HI42QREVQK0wWBjcE1okA5j5rv5?=
	=?us-ascii?Q?lz1E+N+c6n5QmBSHOAnXrbHf6sophw342+2AtqSouBEXQ49c5Tr36tcH8PZd?=
	=?us-ascii?Q?nRajBggT8x58NZBYEfRy2Tox9Wrx4H9NeoOoH9kBIsxkPkbyszjPohBR9aQL?=
	=?us-ascii?Q?I93zO0X8UIAaYqhYzaZLfNv+hdozdhq7IVUqj2XhV4HYAnsQ/jv6aTclaYiX?=
	=?us-ascii?Q?ibE1pW9oldU/x8i0q/oCok7uTWSVXykEvIiZXfnH9FDsgZ++15+AedHxEfYj?=
	=?us-ascii?Q?mMyPImRsAZQIml8n4yu3v9lYjiRPYFTqx68redTxDd4pgu4FyZ5ICotV0FRk?=
	=?us-ascii?Q?w5gVZSawpjYC1Hp+x6mpziW0FfVdlrcUaLjtXZdB0BX0BturiJRd4uGCiU4H?=
	=?us-ascii?Q?BQOgXIopvy2FT01T40k7gdTABWMXsZgAkXrb/gljmw=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB0910;
	23:IxRBOauugJg5URdQm3CPQnqMe5kAd2YY/GWvzQF?=
	=?us-ascii?Q?b/NMt/b24ZFx4HRrrFQ2GYze5VJSnRH6NIn2QKLxLJN+ubZ+p3RRP71IfIyf?=
	=?us-ascii?Q?UwSE2i2+aB6EdDoNwx6Q5znWCWO51XrND9M8AA5BZsxtKBg46mGqBxqpCD7h?=
	=?us-ascii?Q?JECt8n9Yk/pqFy4tS/RwlvFhpBWJCqzU6SycRwcSRHqfg0CdhcyNZrm1RFHB?=
	=?us-ascii?Q?+/18c2YfIx8BCWpFyNY1/wsT/GnwBpaa1/iu+Oyba5/mQ5f1RtG4sEVZdaNv?=
	=?us-ascii?Q?kmZnuUQsUf0L9YaFuHXMrDAuiAIAaWnf/xDfo0YcwAQxtgPP7jQGKVpcDRSU?=
	=?us-ascii?Q?Hufi7ZhFG1zoV8BxnMRoxCHC6xUqBqS82TUSO+Q83Oaclj2XVUj3ABgb4W82?=
	=?us-ascii?Q?/NCK7Q92QTUOwXJtdLOFRmXmv85aisvkIMWiCS28tsVMEbDt3ZT+j4RoZoJx?=
	=?us-ascii?Q?vBysxrrPrLORCpwNielmg7fbP//NWeV24jh5tLUq7bUj9Kmes7psKVgg3WCR?=
	=?us-ascii?Q?vx74ysMmkU0bW0xiLxu9HUBv9WlD9T037PlNHd9XeTpT5tzZuaM5L+jLt/BM?=
	=?us-ascii?Q?NL11yJP2nKKUB86LUc6gGisiuLbcfKsUalvgB2heFWzPVycv1ce+u05TpDQF?=
	=?us-ascii?Q?uKpxQ1qkL0xakDDtfolQEq9TqNaqS2v2A7QNNMvintgjmNTfDZuIMbH8xkuD?=
	=?us-ascii?Q?NM2dPYRgrpme850B3fZ1xcuoVfbpOUZVFeKGNa7NvGkseknMnHRkg8QLhkLO?=
	=?us-ascii?Q?nGxbXRwGUIldTEwMs2QIkap/dIeR/lPcDeRwWj3hbipC8b9QFOseK51yaIUI?=
	=?us-ascii?Q?I0XcfcLdlbacrn1GpqPS6vmg0+3uvcqkbf3kXKRYAgfrYwcOye0Zv2HglPnk?=
	=?us-ascii?Q?y0Ex4Wguxhew1V+GwZHh1ihk6+vLyAfVE0sMuou2mTUtGraWT5AGuwXISvv7?=
	=?us-ascii?Q?fbjLbvFvrhgzH8V39Zz+UcMXB6yjYEYByEw6NJ0WV0dOyvQXnF2YM3vnjtsB?=
	=?us-ascii?Q?pNhH4N4vghLyXQbLP531XPNuZd1XWJC7ppf+3rFiHB53qQEpcr3D2dP9NXn3?=
	=?us-ascii?Q?pk/EeFM+FhTGgB3/EvspmXEMZ6S8PVN0XS9G/3ZlEDpTSsBwNu4eGYzPJv+4?=
	=?us-ascii?Q?cvHTjTSkUI1GXsYXjDY8rZ9O4GXgm4dCaWbCxqJyafycypi0j0Q22eaEZ55e?=
	=?us-ascii?Q?NdjpHiVFVpW5JaX9Z91Kmrb93tS2KK0tqzyPb/CeEuUA4L3AOVvzP58JuPWu?=
	=?us-ascii?Q?s29lMILtna4vt2ToP7WZhRqvMKj8PJMZLYxxRDZ1BGj9Z1rmKgcIW/SNIqnr?=
	=?us-ascii?Q?EFqi63tXE3gJx6xOFtQ+2J0/IpqZe8v3YrRuh1nk0zCZpPpRc+XUOoBalgR5?=
	=?us-ascii?Q?tIr2xDlMMKQvgaaovfUePTg/U6iBG+aOqjBoUPCUpuFSBPV48Z3hC92B6FcQ?=
	=?us-ascii?Q?eF8GKkbR7ElxEk0HNMDh1Ne+Eb0XCF/U=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0910;
	6:LP8+4IJ5mtVGixRMrYCIBWnEIfGMwQgRVdqm0UXr5i6Re5ZYgQ6ZqjATOLyiEarZ+wr097n3c0z85yqYIosVxpWmurzwhnUfkAsMlI9RgK39pz9dp6Y/Pp2BEzVMSCHRBudssMneIzuaRaYuIn5ifhwlJXAXwMBayONQVZ9MhwDSKU3qjttJ35w8YX2pGeJUKGDZyTubXycNsZfzaUgipB+GFXuFcQiUD5jmmfAltPM0b3pDlGDPym3/VkgWdfN/OlrBQ6m1cCyk4su+JNuO0viaJwIh9Gxw+F6BPbQFixPG8neqos4HB/WAHQzgdZHI5tCUC6ZTWVdNMmwBZ+T2VtYQkZWzxVdy8bayQe3tT6BprvDMBER70WuLzOGEVV9naJh6Ih6CsCfLkr8aYsNnoi2eUFlkFredq4jZwjtmH/hn1Rz/O+VuYTdUyF+kEdW8MFOQNTA2gajgs84g7v1vX3gOddwYPjCN1a6jcUn+P6rmQhY1a3RV2jDe68MuDKEwf8Ja6hmLSKKqBS/VaV8O7w==;
	5:2U34OUc47TK4wLWTJhRXA1LgsZMvxo2nJIQppUsffQ8UKqff3u0xsDx3v6CrRPvaMv/Uc3ObT3CcE8aFOpH/xKTwO0HVQ5QopklysrRHZVhglgoPR6obfpsyxUi640VPf6QlnG05lKjPfiOpdUln4zJKWzQ955KUi5HsJucvF0nQNQrXdRo3Iwjs4m/utUDB;
	24:yfNPWkqzgrhOjAmAq6BEW5kfCTMM5y+WtLMdDbOLypr42LAniHhXKgm5kGEgroDLGmT/tPCiDucHYFeRNKFw8g1+qVFHQuoxW/uj6gpUxlk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0910;
	7:ZfFCrLPoP4HsItOpct/U5/+zDaumiLl3wIBY0VGDi40dOK/1Ub69t1Wy055RiPTNAxDWr2Msmubljt/xMJam+NBXOQ1QmY7aMGb0bCT2zcELIV+MekAm1dAHXkWSI1FAYHrlqJQoSqRDr/byjUbd61vRfsZ2vhNDvKNAUapUFQU4F8ZCHK12pRkn2LTJYBju+rVC5IGUkAJqwwD1LN1Qcw/JAQ6ri+2e76d0wxo1q33UbOi9URcyGbYIj+fx76PL3Do0YGc4EGCYcksOE0wcpdp7QNacSwW4YwzcWg5hwUTYSnUNW0pFteqn8+LuVrId84isyiVewjh3XIUkTMeNIw==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 07:35:56.1885 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB0910
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH v2 1/6] gstreamer1.0-plugins-bad: Add two enhancements for qmlglsrc
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
X-List-Received-Date: Tue, 23 May 2017 07:35:59 -0000
Content-Type: text/plain

1. Need set use-default-fbo to qquickwindow during set
   property to support change render target on the fly
2. Calculate qmlglsrc refresh frame rate in qtglwindow

It adds some common features for qmlglsrc to make app development much easier

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...2-qmlglsrc-some-enhancements-for-qmlglsrc.patch | 170 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 171 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
new file mode 100755
index 0000000..b4e662f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
@@ -0,0 +1,170 @@
+From f55cc58325ed5df0b0d5fd0a61ebb32d735c2481 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Mon, 7 Nov 2016 16:31:02 +0800
+Subject: [PATCH 23/24] qmlglsrc: some enhancements for qmlglsrc
+
+1. Need set use-default-fbo to qquickwindow during set
+   property to support change render target on the fly.
+2. Calculate qmlglsrc refresh frame rate in qtglwindow
+
+Upstream-Status: Backport [1.11.1]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=774035
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/qt/gstqtsrc.cc | 14 +++++---------
+ ext/qt/qtwindow.cc | 34 ++++++++++++++++++++--------------
+ ext/qt/qtwindow.h  |  1 -
+ 3 files changed, 25 insertions(+), 24 deletions(-)
+
+diff --git a/ext/qt/gstqtsrc.cc b/ext/qt/gstqtsrc.cc
+index 3cfc709..350f70d 100644
+--- a/ext/qt/gstqtsrc.cc
++++ b/ext/qt/gstqtsrc.cc
+@@ -132,6 +132,7 @@ gst_qt_src_init (GstQtSrc * src)
+   gst_base_src_set_live (GST_BASE_SRC (src), DEFAULT_IS_LIVE);
+   src->default_fbo = FALSE;
+   src->pending_image_orientation = TRUE;
++  src->window = NULL;
+ }
+ 
+ static void
+@@ -147,6 +148,8 @@ gst_qt_src_set_property (GObject * object, guint prop_id,
+ 
+       if (qt_src->window)
+         delete qt_src->window;
++      qt_src->window = NULL;
++
+       if (qt_src->qwindow)
+         qt_src->window = new QtGLWindow (NULL, qt_src->qwindow);
+ 
+@@ -154,6 +157,8 @@ gst_qt_src_set_property (GObject * object, guint prop_id,
+     }
+     case PROP_DEFAULT_FBO:
+       qt_src->default_fbo = g_value_get_boolean (value);
++      if (qt_src->window)
++        qt_window_use_default_fbo (qt_src->window, qt_src->default_fbo);
+       break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+@@ -508,7 +513,6 @@ gst_qt_src_change_state (GstElement * element, GstStateChange transition)
+   GstQtSrc *qt_src = GST_QT_SRC (element);
+   GstStateChangeReturn ret = GST_STATE_CHANGE_SUCCESS;
+   QGuiApplication *app;
+-  guint64 frames_rendered = 0;
+ 
+   GST_DEBUG ("changing state: %s => %s",
+       gst_element_state_get_name (GST_STATE_TRANSITION_CURRENT (transition)),
+@@ -553,18 +557,10 @@ gst_qt_src_change_state (GstElement * element, GstStateChange transition)
+ 
+   switch (transition) {
+     case GST_STATE_CHANGE_PLAYING_TO_PAUSED:
+-      qt_src->run_time = gst_element_get_start_time (GST_ELEMENT (qt_src));
+       break;
+     case GST_STATE_CHANGE_PAUSED_TO_READY:
+       break;
+     case GST_STATE_CHANGE_READY_TO_NULL:
+-      qt_window_get_total_frames (qt_src->window, &frames_rendered);
+-      if (qt_src->run_time > 0) {
+-        GST_DEBUG ("qmlglsrc Total refresh frames (%ld), playing for (%"
+-            GST_TIME_FORMAT "), fps (%.3f).\n", frames_rendered,
+-            GST_TIME_ARGS (qt_src->run_time),
+-            (gfloat) GST_SECOND * frames_rendered / qt_src->run_time);
+-      }
+       break;
+     default:
+       break;
+diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
+index 3d96751..edb6b24 100644
+--- a/ext/qt/qtwindow.cc
++++ b/ext/qt/qtwindow.cc
+@@ -29,6 +29,7 @@
+ #include "gstqsgtexture.h"
+ #include "gstqtglutility.h"
+ 
++#include <QtCore/QDateTime>
+ #include <QtCore/QRunnable>
+ #include <QtGui/QGuiApplication>
+ #include <QtQuick/QQuickWindow>
+@@ -71,6 +72,8 @@ struct _QtGLWindowPrivate
+ 
+   /* frames that qmlview rendered in its gl thread */
+   guint64 frames_rendered;
++  qint64 start;
++  qint64 stop;
+ };
+ 
+ class InitQtGLContext : public QRunnable
+@@ -146,6 +149,12 @@ QtGLWindow::beforeRendering()
+ 
+   g_mutex_lock (&this->priv->lock);
+ 
++  static volatile gsize once = 0;
++  if (g_once_init_enter(&once)) {
++    this->priv->start = QDateTime::currentDateTime().toMSecsSinceEpoch();
++    g_once_init_leave(&once,1);
++  }
++
+   if (!fbo && !this->priv->useDefaultFbo) {
+ 
+     width = source->width();
+@@ -157,6 +166,10 @@ QtGLWindow::beforeRendering()
+           QOpenGLFramebufferObject::NoAttachment, GL_TEXTURE_2D, GL_RGBA));
+ 
+     source->setRenderTarget(fbo.data());
++  } else if (this->priv->useDefaultFbo) {
++    GST_DEBUG ("use default fbo for renderTargetId");
++    fbo.reset(NULL);
++    source->setRenderTarget(NULL);
+   }
+ 
+   g_mutex_unlock (&this->priv->lock);
+@@ -256,9 +269,14 @@ QtGLWindow::aboutToQuit()
+   this->priv->quit = TRUE;
+   g_cond_signal (&this->priv->update_cond);
+ 
+-  g_mutex_unlock (&this->priv->lock);
++  this->priv->stop = QDateTime::currentDateTime().toMSecsSinceEpoch();
++  qint64 duration = this->priv->stop - this->priv->start;
++  float fps = ((float)this->priv->frames_rendered / duration * 1000);
++
++  GST_DEBUG("about to quit, total refresh frames (%lld) in (%0.3f) seconds, fps: %0.3f",
++      this->priv->frames_rendered, (float)duration / 1000, fps);
+ 
+-  GST_DEBUG("about to quit");
++  g_mutex_unlock (&this->priv->lock);
+ }
+ 
+ void
+@@ -410,15 +428,3 @@ qt_window_use_default_fbo (QtGLWindow * qt_window, gboolean useDefaultFbo)
+ 
+   g_mutex_unlock (&qt_window->priv->lock);
+ }
+-
+-void
+-qt_window_get_total_frames (QtGLWindow * qt_window, guint64 *frames)
+-{
+-  g_return_if_fail (qt_window != NULL);
+-
+-  g_mutex_lock (&qt_window->priv->lock);
+-
+-  *frames = qt_window->priv->frames_rendered;
+-
+-  g_mutex_unlock (&qt_window->priv->lock);
+-}
+diff --git a/ext/qt/qtwindow.h b/ext/qt/qtwindow.h
+index 8cb5a2c..697f389 100644
+--- a/ext/qt/qtwindow.h
++++ b/ext/qt/qtwindow.h
+@@ -65,7 +65,6 @@ GstGLContext *  qt_window_get_qt_context (QtGLWindow * qt_window);
+ GstGLDisplay *  qt_window_get_display (QtGLWindow * qt_window);
+ gboolean        qt_window_is_scenegraph_initialized (QtGLWindow * qt_window);
+ void            qt_window_use_default_fbo (QtGLWindow * qt_window, gboolean useDefaultFbo);
+-void            qt_window_get_total_frames (QtGLWindow * qt_window, guint64 *frames);
+ }
+ 
+ #endif /* __QT_WINDOW_H__ */
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 0bb4053..a5fc913 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
+    file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


