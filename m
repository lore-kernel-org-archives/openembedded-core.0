Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.895.1793644361449329110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 10:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LXg6jRFB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576698308e=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HQbbD2839217
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Nov 2026 18:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ck6xIszXos9d1iQtnKgU4ecagE6ewxeLMORejcUDorw=; b=
	LXg6jRFBFqtw0mO5CtTqoEYkvciAfN/mH9cRz8inAZ9T95Ddbn12aW645cPQ4xbb
	eiapVww6/o/Q3n1BOSx7GM7QNalxI45j8V/lmWngmm5m7XfbGfMbdZsQl67NxEo3
	Zr+Vxw+ZNmc78+vmZ0o9cN2/qJHrE5ScyniRhBJY4I0vAqIZJhFG15P0MkF/VZs1
	RdqhccaOUotnJC9nP1UzyezurSgIm8LgY0twz2jUb6zFzNrOPD61xGIYJj+iaL3K
	d4CZOIeSaN3ENggYxaD9w5NJkvNDy19ud9jYIqYuajvhCM4oiDFCmpcsoW0FP/Ip
	upCOF600uMJREV1DCCIc8g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022111.outbound.protection.outlook.com [40.93.195.111])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hn7a6twru-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 18:32:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2XA/niU0juDS95//abQFOOqELD+zYVtH0QPEIsy6v0PXfg/zoWu4JccvNyyRyM/XUtewozWWbqhStL+dNKf+WTZw86QcGAlBivfB/PA4MNyW8CBF1ne/CRnzRwZOapCYOpyEQUzvgnmylUkuKX2WyR1EXObEPwnVpwWp6XdYGaao2otoF3KXmjK5vyLndcmrThnDfVNQv2Az7ZUqA+7XmGHL81DNFoqCo0YIP5dCyWpHwIUXClWIC+39I0ScKFYLznflAtffV8d3bfhj8zEkdzWEilqaVOKVy/GUooi+YnYDM1LYAVT1I3W/KrI/sdZYdUXrgioGob760jKw0tOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck6xIszXos9d1iQtnKgU4ecagE6ewxeLMORejcUDorw=;
 b=zPNzRBpheyV/MObYI8IRoYeW9FxB9P7x7BYaKpU/JAJZouuMgQgjps/D4axgwXNCoPyWQe7ZKPoAdTdC45zUJATvvFBNWeza+C2ZP196VQN3NNfRNfgdR/Vkd/92dCZemBo0BAoUcnDzd29qzp3HZ+GJawVlw6kgpuGE4AZ653fZiFVjR8Q5tQbdY+oHZ9XNKw8B8sFy1lZb2IYZNBctTBdl71JMD/D2kqoGMyA/kzJ1HhqMSR+M+nl9jScKEChyiA9qWoeQnC1wdL3OaDA7IFL4NPSxA4Y+rJWEBEIOXYlsWxjucRc71IIvbWQqQOOesaYU14Q6zP676/oAus1VvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 SJ2PR11MB8515.namprd11.prod.outlook.com (2603:10b6:a03:568::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:32:37 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 18:32:36 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][scarthgap][PATCH 2/2] nasm: fix CVE-2026-6068
Date: Mon,  2 Nov 2026 12:31:40 -0600
Message-ID: <20261102183140.2210513-2-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102183140.2210513-1-kris.gavvala@windriver.com>
References: <20261102183140.2210513-1-kris.gavvala@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:510:23d::12) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|SJ2PR11MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f283303-663c-4702-cab7-08df390fab0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|12006099003|13003099007|38350700014|261102123227099003|261021133027099003|11063799006|261021130227099003|261022115727099003|261026130827099003|261026135527099003|261022075727099003|261022113327099003|261026121527099003|261021123027099003|261026140227099003|261028144727099003|261009223027099003|261009221227099003|261022105027099003|261021135927099003|261021121427099003|56012099006|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: OufN1Hgs/ti+E3DVY+Ekv6rl8zfn8znWA/qv00paQMcvQXUOyt7Q/5VozSoBQvPR5/qYLY8G0EVneDuZjRgH8Q7I1HuVYWvPww/aJ2dYyCytLjEGH7+f8XxO3BwgS5gW9ZYubyATGYyFjC3NuvYp8w/abBBSyCw+RtBvqyo9KWZTazGOOW+xu5/oHMNoyF/Yeayh+WeQ3i2ykvA36mgSIzOyhwdXYvvNiB8krTFUwYI/3rSrp5HUm96qXucAA+PMTnwpTmO0dyFsOGSirDZeyqkiIdqPKT5L6rYVwWvehvljAGFTg0ATMER0qdwgxPmm85tiyf22yh9JqRzBVsFl3eo/iVKM6BwTzsyH/34hAvak4p+VtJcsq0/w+qXCT0eVQa6LVd5CgN857iuzsCIlaqm/06QVkv8A4oNQ0RP6lDiWlAfCTTmdAaU8HdkPRnVuK2phyDGF7CflG13fSkwT0A30MPUh0o5za70iZBMxcPw72inNxz4b7iHvTpq54cFhcZWrVuCzlkjMb+mNNUFsOT8kGlAro16L0/rjACDh38EFDQYamhPkcksPL0Y+AapPpnLhWeqsS17OrZvEAC1G+SNPSg3kh8VRdK47C4LOmGKAFNlA/7a8JTsrObjBDNiVl/lPOfPSSQbr5pbOoZrBoGNoEvm4o7pKFhkOWrVh8oQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(12006099003)(13003099007)(38350700014)(261102123227099003)(261021133027099003)(11063799006)(261021130227099003)(261022115727099003)(261026130827099003)(261026135527099003)(261022075727099003)(261022113327099003)(261026121527099003)(261021123027099003)(261026140227099003)(261028144727099003)(261009223027099003)(261009221227099003)(261022105027099003)(261021135927099003)(261021121427099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ToC817FVkWVeA6IgAjOR236/qxOYso+hNq65JZgYPUgzQFArTOppujIzdLmD?=
 =?us-ascii?Q?vCsPMUNoNHTU2mtqkSCzzIzBxu8HkWrMWS1KOeDabo6iHFYXYolCGKbSUFGl?=
 =?us-ascii?Q?fNTwfisA77WOMAuSjGie5xDrDnCoNVqm/cQveQjSELZgW6Wtwv6zMbGef3d9?=
 =?us-ascii?Q?KEuTxFJ/NalxIjHCL6QRaEIetSg3i+EifKYL5FIFrrEcmCkcqbDvEDcEaHx7?=
 =?us-ascii?Q?cz8Fv4ofXxaiaZeVT/NiGQCB8AjD7FNqk1sehAYrZzXVpUegp3S45z05MVDD?=
 =?us-ascii?Q?oYR3xTrrLWBDe1jpfOil1Qi6t+8Q6zy5mvhsLiiRLuZaSXbH6D1GxGMp5NC6?=
 =?us-ascii?Q?76UOV+DrubLF1TvgUKfPEa7hhDCSPolljPIEYFIZcXrB+0yH89WY2nSmqylQ?=
 =?us-ascii?Q?I5YTBaCZ9efp2oPsJW2KI/OhiwBkBtvPzW0lXLmdw60xlsm3cWFqVlQ7Xbzk?=
 =?us-ascii?Q?dkv3m5BP2eiZrdKrW26ztqZY2IbGVc7iLe90sMb2JtzAveKwmKEJW1lCMWl7?=
 =?us-ascii?Q?jwwAXP80uDzcLm2Q19eP+FSMdqnpAMPQLgZIABytfha6bgj6uodvny10OevV?=
 =?us-ascii?Q?xFsOQ1wZVI36VK4Mcu8YN6oqgiXc8UMhh5pXnGKrPzdxgQZSo3lUlnAM299w?=
 =?us-ascii?Q?LJk37IUvTyDtZc4vEGQqdbaf4QX3tv6s0JojEAggXaEv9SDzZsBZeDwxueW/?=
 =?us-ascii?Q?7OmXZFGSwQmkXVD8g+AqQd73XAUEiilfbXa8F5MN1UFqA64/d3AY67jGMrh+?=
 =?us-ascii?Q?Le7s6hakLGt3huFYEWt8qiJCQTiSFVXfKhvJZ6hz5Jq8edxpUThPzMNxpTRp?=
 =?us-ascii?Q?iHYRLUTVHL4uWOmLjRvudihU0l0p+pSIsj0g3qBhEyowg9OQpBuzxLjQ9cXo?=
 =?us-ascii?Q?BMTHcKoPMStuUUOUUaH7NRh0GIqH3KhSqdRZaEcI36H/t7DIzWsh875EvH0r?=
 =?us-ascii?Q?Qrzz8IVv8NLhlkRBHZNGGCL5hXNOegUpFCzAczmuTpU/Pa0pXNT/Y1czg9Vh?=
 =?us-ascii?Q?Xkza17m5LygqnVlAMzmwadC5nO7FCaiX6F1jqveaOcNBnEhuMHyUYUbbd2ci?=
 =?us-ascii?Q?YLnafqgm1mxLPqF4gW9ZN0lv+d32DpLCBO2bFo9Hy/2Xbi9rJN6xzqaCe9ih?=
 =?us-ascii?Q?GBxWEAzh1NqKvPE+7N+UtC6YTajfK62xHVm6vEXjGRNXKFNo0LulDv8lFrT0?=
 =?us-ascii?Q?MRTAh9RFwlxLLszd7DPbl8bGmFIt9U/aHJhSPUkI/klY+AIQwCNdGdEkYKc6?=
 =?us-ascii?Q?ZfSsdJ/fbyXAm2KTlpF7hVNCBE3ofk6MSS4ENUNzYjyzbncWqF1oXD/2hKQc?=
 =?us-ascii?Q?0Rk2wu740+jeWvEvgUCZjFQqdxH4postcz+5C2R/tGRt2B0S4eM9OA9zaDRZ?=
 =?us-ascii?Q?4NJgR0bevk/sRko5w7gR1dKMVv0msRdiArefGh/g02pTPIfn/avB/WXISFAl?=
 =?us-ascii?Q?GOE8+xaqqUs7OMgA9eDF041b+IZENp+3h81n30kmubdKv0U6Lru6Dur9dq5t?=
 =?us-ascii?Q?1Q6GI1368kq/Dnj4I90xGwGZ/9twBnaWCarIacff9jFbX+RfJylUHhZHRmZc?=
 =?us-ascii?Q?//WTHJALbLKt35IYA1n8fOK6FpIeUUCky+zVrhc2tGamuw7jsjZ4g6XQx/7D?=
 =?us-ascii?Q?84CF0L+8UkwxjhordJfxNfdgSzaUJ/q4Uzk//0F77oLNux7BeaBxRvVbJHkE?=
 =?us-ascii?Q?ilgy1GGYTtTaYjRyhTbaPhI2WbkCKjkBHkxvZxwaEbn3JWIupPdT3O5K3K98?=
 =?us-ascii?Q?++25DtUSp3kOqr+0hLlmdsF+YCOwyfI=3D?=
X-Exchange-RoutingPolicyChecked: e6esixRdf9so2W7C3SD0nxo9pr/dMSm4dN+US3LhPoM1jHHrgRYBHc6PYol4/cXlM9xuZgsNFVddtbO/VqzJe9DfS0r+7TLwDg2UigRAJJYjwNlxHT0nQO6CZySuCMVr95kWcWt2uh08Q3y7D8yZaQEvI5pB5XuNU9T3TVnVqdCWE+vHi9OB1AB6rt/TpVaNH64JQElbJJpStKKkNvh3x+N8aO3DlxALG/oja0egQM3YE//0Hgqv0zZDLVFqBQiVVA4XoH7daFkN3Ei7puKz6xFafY0LyNPPAtZdKAHwV2yqyPrd/UDOPEr6adSdCtgTzbr1ohX+0XPiXQT/bbcpSw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f283303-663c-4702-cab7-08df390fab0e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:32:36.7951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIMV8lTvJVtTLJmV6J7haUzbWcAqaDYNRwXhWtH8SQcMPNgarBwcZvvlyvstadbJ3FUZGRlFetPmUQQNLkY2rNx68tGwKZ+MapGpfTRyRUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8515
X-Proofpoint-ORIG-GUID: TagrfAvsfcfK3pXFGr9jbMCxnfoZd12o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3MyBTYWx0ZWRfX7j9rC3+GLs1J
 THNQ1VOaR8aVhp7bVwGYCAxYA/Xx3XaUUxozQ4BHH4/wopiWQXEPC791CPAEag5dHYT7nAI/bQ0
 08W8crVHNKWDwDNtxmThD2AQLlyWzT6cemoCka0NOW9fS/u82nbZG4pDJFAPyGWJSoxJNBf7Zey
 D6L6KEk0TonqFC/DFNPLTJSjWWrcbDM/lhHXlzDbNz775k5PLwh0E11TjgIJOd07gDpkUA8parj
 7F2k1YoRkzqMIuxLf5TEyMYI9LWoR+4W4PEWN0FTRoQc3E4thGRonjpoo3Sy3Ki6BEi4Ax+2D8F
 WUkZSeEIUDQ3lcWkQCyEeAENOgV0wXzlsB3j8Ja2vjGqFCzQ9210D938JUiylaei1yBgM2cMvvg
 rup15845C3FOkLWsZ0oohYCsodlf5UOuPBF3uTUtmlMZdooD8da5XCfWfduFoL4RgVmvwFSWVIP
 MVHqgOHivL7IAO/GH7A==
X-Proofpoint-GUID: TagrfAvsfcfK3pXFGr9jbMCxnfoZd12o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3MyBTYWx0ZWRfXyVWgC+qKpLC0
 vdPDOmJ8/Dq8cmeFPo6HwH0qNK2DcvrQJSG+YIFupH9zLikzUqhZuKKfluSODLRTJfq5Bh9Sq6U
 p17IwxmSQ7+u5bbjzG1o/dC+p1T9NlNOjxv4hfUbPopDKXcc/GcU
X-Authority-Analysis: v=2.4 cv=LampeTfi c=1 sm=1 tr=0 ts=6ae8d748 cx=c_pps
 a=50WmdcGmutFPi3Fug3z0cA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=IGX8wMYuAAAA:8 a=t7CeM3EgAAAA:8 a=oGMlB6cnAAAA:8 a=2Ik8_l_yPAddq-O4d_gA:9
 a=MyEMWE6lpU7D9y2mAhno:22 a=FdTzh2GWekK77mhwV6Dw:22 a=NdAtdrkLVvyUPsUoGJp4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 18:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249222
Content-Type: text/plain; charset="utf-8"

- CVE-2026-6068-1.patch applies the upstream fix in [2],
  addressing the issue in [1].

- CVE-2026-6068-2.patch applies [3],
  adding helper functions used in [2].

- CVE-2026-6068-3.patch applies [4],
  which prevents the compilation warning:
  assignment discards 'const' qualifier

[1] https://github.com/netwide-assembler/nasm/issues/222
[2] https://github.com/netwide-assembler/nasm/commit/7bc82e7daf4cceb6a8af7ad2876485c9b4b01a56
[3] https://github.com/netwide-assembler/nasm/commit/44245e4684be1fac6c2fb7ac67dce8a55a574956
[4] https://github.com/netwide-assembler/nasm/commit/7b4e77dae29156a283d31fe707939ce21bf3eb3e

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../nasm/nasm/CVE-2026-6068-1.patch           | 98 +++++++++++++++++++
 .../nasm/nasm/CVE-2026-6068-2.patch           | 80 +++++++++++++++
 .../nasm/nasm/CVE-2026-6068-3.patch           | 51 ++++++++++
 meta/recipes-devtools/nasm/nasm_2.16.03.bb    |  3 +
 4 files changed, 232 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
new file mode 100644
index 0000000000..44f691610a
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
@@ -0,0 +1,98 @@
+From e3a3fb40d21edb638f8191465574aaaaaacb336d Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 26 Jun 2026 17:27:47 -0700
+Subject: [PATCH 2/3] asm/nasm.c: fix use-after-free for -M* options in -@
+ files
+
+-M* options in response files would hold on to a pointer to the new
+value, but in response files that is not a persistent buffer. Make
+sure to make a copy instead.
+
+This uses the new nasm_str[dup]to() helpers.
+
+(Note that calling nasm_free() on a NULL pointer is guaranteed safe.)
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/7bc82e7daf4cceb6a8af7ad2876485c9b4b01a56]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/222
+Fixes: CVE-2026-6068
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ asm/nasm.c | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 49fa00eb7..98bde83cb 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -121,8 +121,8 @@ static unsigned int operating_mode;
+ /* Dependency flags */
+ static bool depend_emit_phony = false;
+ static bool depend_missing_ok = false;
+-static const char *depend_target = NULL;
+-static const char *depend_file = NULL;
++static char *depend_target = NULL;
++static char *depend_file = NULL;
+ struct strlist *depend_list;
+ 
+ static bool want_usage;
+@@ -709,6 +709,8 @@ int main(int argc, char **argv)
+     stdscan_cleanup();
+     src_free();
+     strlist_free(&include_path);
++    nasm_free(depend_file);
++    nasm_free(depend_target);
+ 
+     return terminate_after_phase;
+ }
+@@ -750,7 +752,8 @@ static void copy_filename(const char **dst, const char *src, const char *what)
+ }
+ 
+ /*
+- * Convert a string to a POSIX make-safe form
++ * Convert a string to a POSIX make-safe form; returns a newly allocated
++ * string.
+  */
+ static char *quote_for_pmake(const char *str)
+ {
+@@ -830,7 +833,8 @@ static char *quote_for_pmake(const char *str)
+ }
+ 
+ /*
+- * Convert a string to a Watcom make-safe form
++ * Convert a string to a Watcom make-safe form; returns a newly allocated
++ * string.
+  */
+ static char *quote_for_wmake(const char *str)
+ {
+@@ -1188,20 +1192,20 @@ static bool process_arg(char *p, char *q, int pass)
+                 case 'D':
+                     operating_mode |= OP_DEPEND;
+                     if (q && (q[0] != '-' || q[1] == '\0')) {
+-                        depend_file = q;
++                        nasm_strdupto(&depend_file, q);
+                         advance = true;
+                     }
+                     break;
+                 case 'F':
+-                    depend_file = q;
++                    nasm_strdupto(&depend_file, q);
+                     advance = true;
+                     break;
+                 case 'T':
+-                    depend_target = q;
++                    nasm_strdupto(&depend_target, q);
+                     advance = true;
+                     break;
+                 case 'Q':
+-                    depend_target = quote_for_make(q);
++                    nasm_strto(&depend_target, quote_for_make(q));
+                     advance = true;
+                     break;
+                 case 'W':
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
new file mode 100644
index 0000000000..4b2334776a
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
@@ -0,0 +1,80 @@
+From 4dfcfe9b333230788be7328e8fe943bda1610011 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 26 Jun 2026 17:25:23 -0700
+Subject: [PATCH 1/3] Add nasm_strdupto() and nasm_strto(), to replace a string
+ variable
+
+It is common enough that one wants to set a string pointer to a newly
+allocated string, freeing the old one if it is not NULL.
+
+Add specific helper functions for this.
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/44245e4684be1fac6c2fb7ac67dce8a55a574956]
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ include/nasmlib.h | 23 +++++++++++++++++++++++
+ nasmlib/alloc.c   | 11 +++++++++++
+ 2 files changed, 34 insertions(+)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index ed4222b11..fae86d3cd 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -102,6 +102,29 @@ char * safe_alloc nasm_strndup(const char *, size_t);
+ char * safe_alloc nasm_strcat(const char *one, const char *two);
+ char * safe_alloc end_with_null nasm_strcatn(const char *one, ...);
+ 
++/*
++ * Replace a string in a string pointer variable with a nasm_strdup()
++ * copy of the argument on the right, freeing the contents of the
++ * previous contents of the variable if non-NULL.
++ *
++ * If *str is NULL, simply return the old value of *ptrp.
++ */
++char *nasm_strdupto(char **ptrp, const char *str);
++
++/*
++ * Similar, but the new pointer must already have been heap allocated
++ * by the creating function.
++ */
++static inline char *nasm_strto(char **ptrp, char *str)
++{
++    char *ptr = *ptrp;
++    if (!str)
++        return ptr;
++    if (ptr)
++        nasm_free(ptr);
++    return *ptrp = str;
++}
++
+ /*
+  * nasm_[v]asprintf() are variants of the semi-standard [v]asprintf()
+  * functions, except that we return the pointer instead of a count.
+diff --git a/nasmlib/alloc.c b/nasmlib/alloc.c
+index b77d48217..fa3e9e996 100644
+--- a/nasmlib/alloc.c
++++ b/nasmlib/alloc.c
+@@ -101,6 +101,17 @@ char *nasm_strndup(const char *s, size_t len)
+     return memcpy(p, s, len);
+ }
+ 
++char *nasm_strdupto(char **ptrp, const char *str)
++{
++    char *ptr = *ptrp;
++    if (str) {
++        if (ptr)
++            nasm_free(ptr);
++        *ptrp = ptr = nasm_strdup(str);
++    }
++    return ptr;
++}
++
+ char *nasm_strcat(const char *one, const char *two)
+ {
+     char *rslt;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
new file mode 100644
index 0000000000..b25a6de583
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
@@ -0,0 +1,51 @@
+From db6cbdf6244ddb729b7c6331f62f42334bc00550 Mon Sep 17 00:00:00 2001
+From: Kris Gavvala <kris.gavvala@windriver.com>
+Date: Wed, 23 Sep 2026 00:57:12 -0500
+Subject: [PATCH] Drop const return type of filename_set_extension()
+
+filename_set_extension() always returns a newly allocated string
+buffer, drop the "const" from the return type.
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/7b4e77dae2]
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ include/nasmlib.h  | 5 +++--
+ nasmlib/filename.c | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index 494d7842e..2771c5951 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -366,9 +366,10 @@ struct debug_prefix_list {
+ extern struct debug_prefix_list *debug_prefixes;
+ 
+ /*
+- * Add/replace or remove an extension to the end of a filename
++ * Add/replace or remove an extension to the end of a filename;
++ * returns a newly allocated buffer with the modified filename.
+  */
+-const char *filename_set_extension(const char *inname, const char *extension);
++char *filename_set_extension(const char *inname, const char *extension);
+ char *filename_debug_remap(char *dest, char const *inname, size_t len);
+ 
+ /*
+diff --git a/nasmlib/filename.c b/nasmlib/filename.c
+index 0e27f69e2..85c42a21c 100644
+--- a/nasmlib/filename.c
++++ b/nasmlib/filename.c
+@@ -16,7 +16,7 @@ struct debug_prefix_list *debug_prefixes = NULL;
+  * field at the very end of the filename.  Returns a newly allocated
+  * string buffer.
+  */
+-const char *filename_set_extension(const char *inname, const char *extension)
++char *filename_set_extension(const char *inname, const char *extension)
+ {
+     const char *q = inname;
+     char *p;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.16.03.bb b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
index 729dfe8916..d2608e3e20 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
@@ -9,6 +9,9 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://CVE-2026-6067.patch \
+           file://CVE-2026-6068-1.patch \
+           file://CVE-2026-6068-2.patch \
+           file://CVE-2026-6068-3.patch \
            "
 
 SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
-- 
2.43.0

