Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32247.1793878353229786867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Oezr7/sr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576967b061=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59uOTm1187682
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 11:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=u3DqpM+1rCtzBoP4T5reY/kHilD0w2KvsOGJWpC3Xpg=; b=
	Oezr7/srcKeykjoiu+6nnhRngW67d4rBBzvZTwJH6I5YD+xuPNA9Ugfr6ZU+gW3z
	2Ccz17w5ov65RC6dwfTlYFDSOdRUNzOCp/RSGQKdBAsnDJ8PgTl2sPzx3H3LEQ1T
	nO1mhAWaH8dJj+JOkwJ+zdrIlKnKTTGPincgIy4PZADP6WBrft+elb755P2yMFcE
	L2IDVawzcEzhO6EZCtIOFMeE+wgshvJ61tDjTyNga4Qu67zL/WZirL2fidYvOfmA
	g9wL6vgBJrHnVWYvwlsZxtVK5r3iDgXrNU9C8RDYAvZ1EfgUVd9oCdGItoFdzAXQ
	PRbBazt+jibBb3O9yn1N+g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022130.outbound.protection.outlook.com [52.101.48.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hram4hnn8-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 11:32:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfM3Alf5j5uAZiCgQ9QU2ZxY5vL9ZXOqVvw+K1Spc7yj8m4py4iYjLz+VqemBOU8OwSH73Jpg2aTHNXKbFpbFfI9fFMQckBCq9lO2IWZEvGNrPPkDiFjlZaGAcD2zrcFuYSzCV7lAjcXZSC+/Zqmqg3CoUkQJ/mmva3F39ovXlV+qBUYpx3hO0ke1pCfCnEqq+FItMmlXb7eOs4YLwPrweGcUiS0aduYUrwWbVZ4lC20ipj/HgOz4OZSiKVKQrt+d4+WOMYmnkLVZQWYbpzBNNsmaQEcsC3V/N4KtlZlXOWZpS2KH547DbiIxc34hXJ3vUTHfcZn+wFrlJmbAtMT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3DqpM+1rCtzBoP4T5reY/kHilD0w2KvsOGJWpC3Xpg=;
 b=jpPzueu9KWats7R6+UiFiqNoy79srYfNjy3yzGVUGWFDSrUxZ8F5gCseurdQuDivsFb0XSTjTSMv1tvHmavN9IaF+oErcpBiqyHTuIPz7srpOhLRfYMAKyn8cCP7naIw+2L60RILNfJEH50zTcLr8CoRG09pTZKb090IJykM3Lz5+KHmSQzE4Rjy1VUWEmE8Orhd7GQhoxGSFnS11ex8eX1NxwZD3jxWbTxYwHvQljh3yy3MY0NqDuIN+hvMVXcYUfg50I4s72MmCC5xk/D6JOJG5g+XdVKS8D917grJ58454Qa9M4wl9J7Cr93W7oD/hN1LzW9rY2jH8tVXE5M0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Thu, 5 Nov 2026 11:32:28 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 11:32:28 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, alejandro@enedino.org,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        sunilkumar.dora@windriver.com
Subject: [PATCH 2/3] rust: keep host-kind dependency metadata out of target -C metadata
Date: Thu,  5 Nov 2026 03:32:01 -0800
Message-ID: <20261105113205.1571267-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261105113205.1571267-1-sunilkumar.dora@windriver.com>
References: <20261105113205.1571267-1-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f591e6f-d12c-4c3a-ef37-08df3b307836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|260925022911599003|260925021911599003|261102123227099003|260925021311599003|56012099006|261022075727099003|261021121427099003|11063799006|5023799004|261009223027099003|261026121527099003|10067099003|12006099003|25016099003|22082099003|18002099003|29003799003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: dqsC3YduUkJ5MXK/0mw+ZuRUHK1uKmKtmZaP7Nr2z8Ig+UodBJm0DC0WyZmjhA40lMP3JBJc3UN+WIvvRf424ZSx1xTaIwO3zu+uaN3S/FWJKt9cfelsqA6xtR0R39FxxjIuinl8Qzma5+J3VH8BhiHJzdVg2rMXJbG/E9xOdUyrLB+lLE/TzMMr91L9YIpcP8OoEO+knrJ4sVyCbmMNxcaMn8zh8tNnyMXLto4pvHPE4S6DTUpXdumhBvpsb85YGmWhn6UjEpMjzLG/L2dEcLemx18QS4WZ4Pn2FgYxqXJwUjqism+rfY0aYOwkExVd/E7r7j3VCXdrqEmFN++0NsSLtgEQXCZ/ELzuiPlETjDu85ho66Pflo/gSrkcmqLCqOt77Sms7UsUCXOEPm87L17Lpo0o+hKNaRkuaII3/2I3/VF8hIWNMOykgkQMhxnj1zBGau9BpLs/PMb7DThv3MwOT9eECieXQJFKQC/L/4z4gdSqpYzaOXNzqivH7EwwcpKhyu1l0pdBnpZK2PXnDUYQLdjsnB3xn91zY8l9zyasiHFBDd9Ise5ewWhk8+jeqO76IgcF3E+mgh8XvAmmIkvWr1EzvfyhO5ZNXFWHAO3PBGggiHLoOOOm6SPnsroKpzLUKbX5QTGBjoDBl9woF0IGmYwKgvqHrcEFhSY8yMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(260925022911599003)(260925021911599003)(261102123227099003)(260925021311599003)(56012099006)(261022075727099003)(261021121427099003)(11063799006)(5023799004)(261009223027099003)(261026121527099003)(10067099003)(12006099003)(25016099003)(22082099003)(18002099003)(29003799003)(6133799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1cycVpyT29Nb29SSWxIVDM0aHNVU3FCSUJTRzAyQzBuYnVUZ0E2UzVMYmZK?=
 =?utf-8?B?UFFnMEdKbm5STEVJYjVpdUpFUWk3SzVUaUVPbVZYY3oydWZGTWgzSjdYcXdw?=
 =?utf-8?B?Z1J1YkdxZFVqSkhBUldaMTVEOVNOOFlIeHBINmg1VGxURHdaK3p4ZUNwTXF2?=
 =?utf-8?B?N1ZkekNOQ0xyVzlueHFnQWRDcjlTTzlmWkNIeHlYaGdReVBDWXc0NWhlSUpL?=
 =?utf-8?B?VEhSNTJYTGlJNlNmMklCVnFOMXhVMHhMZEZlWlR2VGg4a2ZBbzVmN2x1SHJj?=
 =?utf-8?B?a3dHQmFHd3NOSWtBTFlaVlZnSE8rU1JvMWg1ei9iQm1WMFpKZU84UEs2T3ha?=
 =?utf-8?B?TVdtSGlGN042TEZJT0JjZ2JZa3VoYm4xMXZLcXd2ZlYxbjNYWm1rdUtxVUFV?=
 =?utf-8?B?all6clFpMjJZei81alhHeXBpbVBSL09xMzd6ZnMwRUhCcmQ5c0M5SjRZQko2?=
 =?utf-8?B?V21EK1pGdGJkS1pFS2JTMG5iVVhmSmVmMWdvM3NHMzFJTmRGMUFwN24rY1hz?=
 =?utf-8?B?RE9reE5jTnozeFRhQTZ2QjY2T1dmTzB3OTJGUnI4cm1rUUFianF0ZzEwdDVQ?=
 =?utf-8?B?WXh4M1NXTVdEaVN1WWVVa3BlckxRaHlyRlh2S1VJbHRFZThpZmFGenJyWHgw?=
 =?utf-8?B?K0RNWVJBNDQrb3ZiQnVVT1Bjb3UxcGhNSUNiM1dteHhaQmxrU3JnNVJZdENo?=
 =?utf-8?B?ZHRhZUpEZldXR1RCNTF5aW1FdTZBNzFKK3dTTWdEazkwTUNjTTRSRDlPVEps?=
 =?utf-8?B?a0FXZHBFbWNUSkd3ajB5eTQzM2Q0ZmI1RXU4SzZER3ZzZXpNMGQ4SllkOWFq?=
 =?utf-8?B?WU1LTnFGaU40eUNTM0U1WS9QVzhpZEVsSmpMb2gwUS9rVTJYSjdyZnJObi9z?=
 =?utf-8?B?M051VFFObFR1OHA4MEVSak85UGlzUUl5TUVmc2lYTkpHNXVFRWRhUjc5NWJq?=
 =?utf-8?B?MFJTaTJGN2FrMzIzTmJUcVp0TjFoZ2dXUSthQ3N3QUpaWXQzNFRWWTQzWlNq?=
 =?utf-8?B?U1ZEa1k4b0FuNzdQZEJBQlV6MnRsMk81SGd4K1ZteGV1WFNTbFRIcVg2QjZr?=
 =?utf-8?B?L0crY0gxMFd4WFhxbWxaVWJtbHQ5SjFuNGkweXFiNWNMcmM4VWs3RWt0WUp5?=
 =?utf-8?B?OFVzbGJneE1JTFJpaUt1aU04N2FlRk9VZkF1U0xJMUFGeVJ3clF1WlEvVWZQ?=
 =?utf-8?B?akNiZVpia3lOdTgzT05iUENhbzREcTBQaHFPTzB4N2VrekVZMVlENHI5QjVU?=
 =?utf-8?B?UjJUc0xVbmVoajJHUExJMWJKUXlGZkY2enZtZXZsYnNsVjY0MndySCsrMVNM?=
 =?utf-8?B?Z0xrZlpSZU5aTnQxQ0hGNjdRdU0va1VSZE9tVmtlZzIzaERSS1AxY3pqSUZL?=
 =?utf-8?B?d09ZRUh1dEplRnJzZXZ1RUVCS2htUUhYTU81T2hnNUZzVXhqQXFVdHkyenZ2?=
 =?utf-8?B?K0NGdGR6Zk1XK0wwdzhnOFplWUhHZlpSRnNINC9ZNVl0ZllZcEdwU3NiRlZa?=
 =?utf-8?B?T1JiekdyUk9PY2Yrd2RZeWM4T1YrODNYUFJIQjNqTDdDU0VLc0ZhMUFjYlFL?=
 =?utf-8?B?MzNGcGhkUWphaXMyNnpFYVZyWExXdUtDbXR2LzJBWTVmS1dRS28wbjBCaEhz?=
 =?utf-8?B?RDJBc0ZScU95YURRSk5NenR5VXo1WkdONWRNTUtTQUR3L0hsbys4eThkanoy?=
 =?utf-8?B?dFhMUWRldVJwa21aRUs2SndsTk4vR016WXV0VXM0eldCT1RSbXJ5cy9vSm9X?=
 =?utf-8?B?VU8yOGFqdTlEUkQyRUdwTHl6OWxLL0hrekpVVmUwYzc5Vzd4R2JmOWpDTEd5?=
 =?utf-8?B?VjA0ZmJQUXlkT2lNdWJySExmZWNrL0VqUnlsbXRYM3FhejNIYlFWeW5aUWtX?=
 =?utf-8?B?M3VCc0lsVE5ERjFYWXlBQzkzOGxGeTNmVVB4bTl0UTlBay9FS2xmUmFIK2FX?=
 =?utf-8?B?RW11Vkgvb2o2NUZWc214QjNKYTBualIzbzVzNERKTmxwQ2gxY0psMjA1dW93?=
 =?utf-8?B?OTNnTHFUQWdVY1RFbkplTWlOdER4RU9HcEF2U0tKNnBhcmtFVFdXTEFJTDl6?=
 =?utf-8?B?R1F0M1ZwYnY1NktCc3N4Mld2dmFXTTFGOVllbGxaeHRzTFVWVzMyNFpaN2tC?=
 =?utf-8?B?dXVkMmlXRk9GNTFkanhScGF1L0huUE1Tam11VW9ZZWdEVlB3L09sa0kwbVpW?=
 =?utf-8?B?NlZyWncyM3JKU1dFVmg3T0hSRVQ3RWlreHlTUER3L3NxRm5DQk1CUXBCVE5o?=
 =?utf-8?B?ekJDTGgwYldua24vZUI2Sm5FcmJiTWdheU5RQlpqem9MRlkxZ0dFRDB5TUN3?=
 =?utf-8?B?cWpFS1ZJUkFROEdqcFFUWmcydDNMNnl0TUFKM0hDR0tVVCtESmMvRzQ0VmRJ?=
 =?utf-8?Q?wxxXj/i8cVd0JxEU=3D?=
X-Exchange-RoutingPolicyChecked: MsVC7HGUxPg8aQFcXpuwTamtl1Z9EryCQkk3JcBcq5dKPsgj6tuZAYWcwLzx4lxiTaCqMKxBoudIttWtI24RccXdZyx/OOrWU4uXJfcInm5FiJBuoTsn8q6mgF1V2FIqOLLEXLDwsSzIVhf+G49Wa4sZEPuHFFE2QBnKmojJxEbe80/YMlLG7uRU3RptORnonJhzRYyBi6pwXtOZFea/h/iiE3D1LjzlzkP11RhI4YnA+omM1gcVkCno8nfnpDinaYRjheY8Hczt7baMYSWBhdegjoxOzvZ9LKgabVLy2CgySaf2iQQVLmVF+vm3YP9mpFWzkp53osuECYwWvwZMFQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f591e6f-d12c-4c3a-ef37-08df3b307836
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:32:27.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zj0QfNEqDMcafMlwlwi86KkADBBfJvWQyIor3d9XPmhjIMFgQVIt6qCCoy8UQhKtxD91jxoxQ3yBKO359gYFpNGtAl8d83jZMu1DxnUJ/As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cpMOAF4i c=1 sm=1 tr=0 ts=6aec694f cx=c_pps
 a=5U2/TfBw33PfA2YBhd8Q5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=psDUkV7eLCA45ejDN5cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ORZHBVCTDaTN_16-wIAF8PEBMsacw1Xq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfXxvsafXFjGYY9
 JxuOtaLFqx1HwUeEnc3VUsv/Z8QbdZoaIIZf2RIzAEBu47ZPLnbDe/XE9JL0JxbWPQ+oEoXVQUs
 JdT23W9piGPs3o5zgLGEkw4Os2TAPeW8wW1jLFmntCd/+O7c1zOr
X-Proofpoint-ORIG-GUID: wPWMeZGrH9rWtg0l57Q-oaZSaF70If7p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX3XxoJOl9Y1CS
 P/xoaCEfTXEIs5iPNTGO39EDmQe32LmMH3QaNGelQ2RPnE7O4lJDn9fZ5oRhQ9DwDbzxH/4Nzcu
 cNdfP7bgcABgNi1Am8RKDjeBwpxF3QeLWsgrIma337Iw71l4pJbGSHeRPCUylflhMalXDZVb09u
 dzJOOxkrOmHwlF5oTZkwGy4CBddFIJNs+Z6617/v2sU9kC4rYgQDWRmCpEfJrPJ6ObZLyVbak4J
 XRJAVwgs4UM5DdKQXSzM/okYYEB/5+xBeHSepMoA4xm0dkwnQpNmzpppOSuvgPZ4cR4p5f5kZjN
 O9s9S+sn3TYeycBONpNHNXNcwQrf0lXsNcAI70LbtudnHgmysqkCxQrtKS/lBFNotiT50oAY6Mf
 dp53gBZnM64YiCU/nabk+SniX12yX/w5HOomYqu0CFIHy+ZSrfaB64f1GuRVXQCyDjzLO9QnGm3
 2gnl1NnWf+masF7toGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A59uOTm1187682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249540

From: Sunil Dora <sunilkumar.dora@windriver.com>

On the autobuilder the rust-rustdoc and librust-lib-example packages
were not reproducible between the x86_64 and the aarch64 workers.
Every symbol of librustdoc had a different hash on the aarch64 host,
nothing else in the package was different.

The reason is in how cargo computes -C metadata for a crate. It mixes
in the -C metadata of all the dependencies of the crate, including the
build script and the proc-macros. Those are built for the build host,
so their dependency tree can differ from one host to another.

For rustdoc the build script depends on sha2 -> cpufeatures, and
cpufeatures pulls in libc only on aarch64-linux. That one extra crate
changes the hash of the build script, from there the hash of librustdoc
itself, and with it every symbol in it.

Carry the fix sent upstream (rust-lang/cargo#17522)[1]: for a target unit=
,
host-kind dependencies contribute only their package id to -C metadata
instead of their full hash. They are not linked into the target
artifact anyway, so nothing is lost. unit_id, -C extra-filename and
fingerprints are not touched, so file names and rebuild decisions stay
as they are. Host units and builds without --target are not affected.

The upstream discussion is in rust-lang/cargo#8140[2]. The PR is still a
draft, the cargo team would rather solve this as part of a bigger
rework of fingerprinting (rust-lang/cargo#17439)[3], so we may have to
carry this for some time. Drop it on the rust upgrade that has the fix.

[YOCTO #16376]

[1] https://github.com/rust-lang/cargo/pull/17522/
[2] https://github.com/rust-lang/cargo/issues/8140
[3] https://github.com/rust-lang/cargo/issues/17439

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ps-out-of-the-target-C-metadata-hash.patch | 123 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0006-cargo-keep-host=
-deps-out-of-the-target-C-metadata-hash.patch

diff --git a/meta/recipes-devtools/rust/files/0006-cargo-keep-host-deps-o=
ut-of-the-target-C-metadata-hash.patch b/meta/recipes-devtools/rust/files=
/0006-cargo-keep-host-deps-out-of-the-target-C-metadata-hash.patch
new file mode 100644
index 0000000000..5e796b0164
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0006-cargo-keep-host-deps-out-of-t=
he-target-C-metadata-hash.patch
@@ -0,0 +1,123 @@
+From f936d6a954455eff3a60968d155852f9de730228 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Sun, 27 Sep 2026 08:47:23 +0530
+Subject: [PATCH] fix(compile): Keep host deps out of the target `-C meta=
data`
+ hash
+
+A target unit's `-C metadata` mixed in the `c_metadata` of its
+host-kind dependencies (build scripts, proc-macros). Their dependency
+graph depends on the host `cfg`, e.g. `cpufeatures` pulls in `libc`
+only on aarch64-linux, so the build host leaked into the symbols of
+cross-compiled crates such as rustdoc.
+
+Host-kind dependencies are not linked into the target artifact, so use
+their package id instead. `unit_id`, `-C extra-filename` and
+fingerprints are unchanged, as are host units and builds without
+`--target`. The upstream PR also adds a testsuite test that fakes the
+reported host; it is not carried here.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/cargo/pull/1752=
2]
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+
+diff --git a/src/tools/cargo/src/compiler/build_runner/compilation_files=
.rs b/src/tools/cargo/src/compiler/build_runner/compilation_files.rs
+index 593e57e..63855f3 100644
+--- a/src/tools/cargo/src/compiler/build_runner/compilation_files.rs
++++ b/src/tools/cargo/src/compiler/build_runner/compilation_files.rs
+@@ -89,6 +89,8 @@ impl fmt::Debug for UnitHash {
+ /// mangled symbols need to be stable between different builds with dif=
ferent
+ /// settings. For example, profile-guided optimizations need to swap
+ /// `RUSTFLAGS` between runs, but needs to keep the same symbol names.
++/// Likewise a target unit only mixes the package id of its host-kind
++/// dependencies into `c_metadata`, see `compute_metadata`.
+ #[derive(Copy, Clone, Debug)]
+ pub struct Metadata {
+     unit_id: UnitHash,
+@@ -744,7 +746,7 @@ fn compute_metadata(
+     let deps_metadata =3D build_runner
+         .unit_deps(unit)
+         .iter()
+-        .map(|dep| *metadata_of(&dep.unit, build_runner, metas))
++        .map(|dep| (&dep.unit, *metadata_of(&dep.unit, build_runner, me=
tas)))
+         .collect::<Vec<_>>();
+     let c_extra_filename =3D use_extra_filename(bcx, unit);
+     let pkg_dir =3D use_pkg_dir(bcx, unit);
+@@ -843,16 +845,28 @@ fn compute_metadata(
+=20
+     let mut c_metadata_hasher =3D shared_hasher.clone();
+     // Mix in the target-metadata of all the dependencies of this targe=
t.
++    // Host-kind deps of a target unit (build scripts, proc-macros) are=
 not
++    // linked into it, and their metadata depends on the build host, so=
 use
++    // a host independent stand-in for them (rust-lang/cargo#8140).
+     let mut dep_c_metadata_hashes =3D deps_metadata
+         .iter()
+-        .map(|m| m.c_metadata)
++        .map(|(dep, m)| {
++            if !unit.kind.is_host() && dep.kind.is_host() {
++                host_independent_c_metadata(dep, ws_root)
++            } else {
++                m.c_metadata
++            }
++        })
+         .collect::<Vec<_>>();
+     dep_c_metadata_hashes.sort();
+     dep_c_metadata_hashes.hash(&mut c_metadata_hasher);
+=20
+     let mut unit_id_hasher =3D shared_hasher.clone();
+     // Mix in the target-metadata of all the dependencies of this targe=
t.
+-    let mut dep_unit_id_hashes =3D deps_metadata.iter().map(|m| m.unit_=
id).collect::<Vec<_>>();
++    let mut dep_unit_id_hashes =3D deps_metadata
++        .iter()
++        .map(|(_, m)| m.unit_id)
++        .collect::<Vec<_>>();
+     dep_unit_id_hashes.sort();
+     dep_unit_id_hashes.hash(&mut unit_id_hasher);
+     // Avoid trashing the caches on RUSTFLAGS changing via `unit_id`
+@@ -884,6 +898,15 @@ fn compute_metadata(
+     }
+ }
+=20
++/// Stand-in `c_metadata` for a host-kind dependency of a target unit:
++/// only the dependency's package id, see `compute_metadata`.
++fn host_independent_c_metadata(dep: &Unit, ws_root: &Path) -> UnitHash =
{
++    let mut hasher =3D StableHasher::new();
++    METADATA_VERSION.hash(&mut hasher);
++    dep.pkg.package_id().stable_hash(ws_root).hash(&mut hasher);
++    UnitHash(Hasher::finish(&hasher))
++}
++
+ /// HACK: Detect the *potential* presence of `--remap-path-prefix`
+ ///
+ /// As CLI parsing is contextual and dependent on the CLI definition to=
 understand the context, we
+diff --git a/src/tools/cargo/src/compiler/fingerprint/mod.rs b/src/tools=
/cargo/src/compiler/fingerprint/mod.rs
+index 172165d..d7f1e55 100644
+--- a/src/tools/cargo/src/compiler/fingerprint/mod.rs
++++ b/src/tools/cargo/src/compiler/fingerprint/mod.rs
+@@ -74,7 +74,7 @@
+ //! `TargetKind` (bin/lib/etc.)                | =E2=9C=93           | =
=E2=9C=93                        | =E2=9C=93
+ //! Enabled Features                           | =E2=9C=93           | =
=E2=9C=93                        | =E2=9C=93
+ //! Declared Features                          | =E2=9C=93           | =
                         |
+-//! Immediate dependency=E2=80=99s hashes              | =E2=9C=93[^1] =
      | =E2=9C=93                        | =E2=9C=93
++//! Immediate dependency=E2=80=99s hashes              | =E2=9C=93[^1] =
      | =E2=9C=93                        | =E2=9C=93[^9]
+ //! [`CompileKind`] (host/target)              | =E2=9C=93           | =
=E2=9C=93                        | =E2=9C=93
+ //! `__CARGO_DEFAULT_LIB_METADATA`[^4]         |             | =E2=9C=93=
                        | =E2=9C=93
+ //! `__CARGO_RUSTC_BOOTSTRAP_WS_REMAP`[^2]     | =E2=9C=93           | =
                         |
+@@ -91,7 +91,7 @@
+ //! `[lints.rust.unexpected_cfgs.check-cfg]`   | =E2=9C=93           | =
                         |
+ //! `--extern priv:`                           | =E2=9C=93           | =
                         |
+ //!
+-//! [^1]: Bin dependencies are not included.
++//! [^1]: Bin dependencies other than artifact dependencies are not inc=
luded.
+ //!
+ //! [^2]: `__CARGO_RUSTC_BOOTSTRAP_WS_REMAP` is set by rustc bootstrap
+ //!       to customize remap-path-prefix
+@@ -111,6 +111,9 @@
+ //!
+ //! [^8]: including `-Cextra-filename`
+ //!
++//! [^9]: For a target-kind unit, host-kind dependencies (build scripts=
,
++//!       proc-macros) contribute only their `package_id`.
++//!
+ //! When deciding what should go in the Metadata vs the Fingerprint, co=
nsider
+ //! that some files (like dylibs) do not have a hash in their filename.=
 Thus,
+ //! if a value changes, only the fingerprint will detect the change (co=
nsider,
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index b384a0c76e..42d45a1ca6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing=
.patch;patchdir=3D${RUSTSRC} \
             file://0004-cargo-omit-host-triple-from-unit-metadata-hash.p=
atch;patchdir=3D${RUSTSRC} \
             file://0005-rustc-span-make-hygiene-encoding-order-determini=
stic.patch;patchdir=3D${RUSTSRC} \
+            file://0006-cargo-keep-host-deps-out-of-the-target-C-metadat=
a-hash.patch;patchdir=3D${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "6451598a99e77f07571960f6b21d577399d3a30f33e=
80cbd2e3a4aae6535d265"
=20
--=20
2.49.0

