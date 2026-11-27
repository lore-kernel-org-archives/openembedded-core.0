Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11642.1795762047627327133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sJKMHt0b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6RFvw505046
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=X4amSbaK0cSTque+DCMb
	nTUiNd9H3B234ZkEKw0GjEc=; b=sJKMHt0bjliiy8yFls9CaXjeEGwyUSrH+hgQ
	jUMC19xsiduxkiXpFj3vwYAJUYFivVbbGbK+t7bFZxXQOgP2o5XemCoZnu3590fQ
	NpBk6n8crV6QMWiMDynACuFaKtLyFf6nPkfJYg58zJvyfnHJWaTi1UQ41ChLIyxj
	KJEDTOxYBa4t5DTS3a8g4sFa/RX2OY5MhRLzQK+kdrM8luhy+4nMsHsJbAk0dEJe
	7w5tcXCXO6OsSdPs7Z0nb+omdahmEof/u822Z0NqIc6ZXVom7ujZyS4mQT/Hjmia
	89UvbZhw1EWEqWldTLQkUsXOv85LEPXgJykF1Pmh8R/7m5/k5w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023099.outbound.protection.outlook.com [40.93.201.99])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j516wym5h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/MEIdtG/U0wRxQnjULgfsiD4g/LzHKqKyv4PkqJRu4W9Tvpc4+ylIkHHY4Arn0yDKIMavB2637oL7XyplrMXHCzECljxJGRnlftfB3W59gKYiW7lxQD6OyFc9p1sG64kTffC/Rb7xWMQImJG9U4DhLhCOiMP3CZMA5VupNOp36u9Zzt/dwgMxXAjvGuIoJWKD4QoPbD7TEb4zniVygdDmThNL67oq4WJeZsvOUCSvDrIm7aJZF1mBh9TjsHZdPHxnIQl47E0nhtdYcHlQjtkGFzzvjl/pV0Yetb0xV1mViwzrGjfGGI1D81vjA8FBH3q8VBdd4MisQuLBD0fzbEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4amSbaK0cSTque+DCMbnTUiNd9H3B234ZkEKw0GjEc=;
 b=ZRwgZB4LlpvqwQUsdAv1gyt+tFGHJ8sor2Lq5VqyGoupC3FE25EQmq3fhgx4E6Lx+ggFD4/5l3CJIemJOgVnMMTt6dTmXFXM39KmrfLn/w/9/mv7GgHFDEtQlSkg28mMz1OXQsYCl60NpskL0OJp/RzqBw0+Rhj8pC3/EtrqhzSMNCp88FCAlhxe2jr6vwADsDFMoTTDb8oYMW+7H6ZrFqWcHp/UAb2D/fBK9sf+KQ9bvd+jHj45DQSbv/AgHfN/56SOjPMugUyUfUeXGlx7eFk3u0QNWr8DVyidWI4j8XWcAPITYbczjIG8x7TlNN9XDjs5UYVMsilTB6zCQpqleA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:23 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:23 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 0/8] libconvert-asn1-perl: fix 8 CVEs
Date: Fri, 27 Nov 2026 12:16:51 +0530
Message-Id: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0194.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::19) To DM6PR11MB3243.namprd11.prod.outlook.com
 (2603:10b6:5:e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3243:EE_|FT1PR11MB780136:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3a3fb9-c56f-475b-a526-08df4c524a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: G0NQKGJG9BWJT6ibeyYeJul5yae6eDnL5nsOjkU51RFDgnKt6Ww5aqoHY5Krj1hFn7YowtRBDfmuLJA8lfBmuiwRmuffNjLwPgbYqoY3LLtWZc2nfwNqx5qbrtC+h9YP/tBWlJUiYstGtz8GfY0Gy9gTjdnbeYp0vRilA2u1J9CgXbJpkRJ0HdWLcgWLDcWxsvZodekMs0wfmZ109mV/rsaFuyd5vbNePIJL8uP4N6dWtnWYYP8ZRVcg+ZdGj059R4G/INFqS68bQy0GjqWv4U1c6+B0EmL6A3qNTeOjPkBMEdrNBhB97+Mjs3Q9l537YdNhqx0ypnAXZfHKKVuY0kTRooWeDYdLn7OngWD98O3lpxxitCAy336lBeGMC87pZ5aOIsSMVHNTIKthKkkWuM5W30KjoRSQUrEX/RYnjPcfJclb/LLeTjaSC9h5NZsbJjvMbed+FF8FVF5WtF8I014PNtBym6dBtzM6Lg0jQug1YaJctCp+QM+1miNJrVrBscK+mb4umae/4VLCVV4JRRUIzqULmUwhgEChSYV+OBQgAKYRRjUObFs+zYKzEvlfRfmx8KzhMupbdH8UGKN/LIEvfcyAM9Xy3bO1hNxxGnwh1jPWJ0i7OrbgG0//1UeMjftEA9Yf1/D8HpgEFL2Hh9j5cNa8uHV2tCF7vT3uya4oOMDFiSvz81kpf8KcMDpgfgXNzd6FrB3OH1pNQb+6IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kC3hNQgjIdOGSff/+8Y5YrLNKxNNorlQhkE42dwesptBRY1NuKiXkhZ9Mov8?=
 =?us-ascii?Q?LMvWG0Xc+vNT9Tt5+schSSbcv8FK5S/UCZMtD6mUTgbif2ZjFXb/kkyK3Rp9?=
 =?us-ascii?Q?I95vBaY04gbpj4YJ4/+No4MBQRdGhDMtWQmJjmM2CILrGN8Wl7++IGh4lZZk?=
 =?us-ascii?Q?aUWFphEN9wnj2/TU8PCkBEwmqdP6+lNN2milD25jQKmFrMrNu+5HdWD0JFll?=
 =?us-ascii?Q?4+ybxXb0YYX0wkVuTNNKtlea3nUqSaR68Q6WcKlWJcSYD+0dHFXRV790Rhz0?=
 =?us-ascii?Q?LA6pUlPLQeCqbSoeTTT++2bTKGPwI93jGbDxkRhvZLFRa3ddmHarfh1FNWK1?=
 =?us-ascii?Q?rqD+qDbGHidMbeyODCTW+5n7Yllb0rtELaWhL58OVBVURHgFnu/mQvK5dfVT?=
 =?us-ascii?Q?1TH2h4eTbNI/9yEbQN+UFTfgahyOwAKAWJYKfM2jN66dBEAlHPK/0Gy1AxBJ?=
 =?us-ascii?Q?/n2jLjsht/xfabYCVhIPbNsaKR4QJkGoDgLfoOfTaQW+6lJkMYiRglt2vLOG?=
 =?us-ascii?Q?8jf1FKZXaj++LlUmNfAN+VACLf/NMzjBNJnNWi8f71nffC7QVbfUlwW//aeX?=
 =?us-ascii?Q?EjPCrmZgkB6WqKP71bbx33x7U5L8r0G/7qR0PJs0eN+zlRjoPI1wbN0JTA7v?=
 =?us-ascii?Q?bjjDFJgb7rSTPamyMQmhH9PUoNLSbpSSbdOEYRHsxOBdShtffHr5tDD7ogPF?=
 =?us-ascii?Q?9L8egWIP0qF4t7kauyHiuk+DEdM950RwFY5vciL1NfBohJr8xZuQKq44OzB/?=
 =?us-ascii?Q?4V3stAZ2a37tI+CrWIFAISclNpxEedyknE1ffWScrOcTqKH36Cy2Pdrh0OFg?=
 =?us-ascii?Q?HH/0olw1fUB2tBQsWbFZd8Jk/p9P8YOGkWAletqWrLy1pMFqEqlfmUYxwA3Y?=
 =?us-ascii?Q?1rviQcJDOnMvGgKShyv73gq0iNII8dVtgVwU3ztwjexCcF4HtTJq8u5DSXJR?=
 =?us-ascii?Q?vT5fX6kSkNqsFzxOEicY1HMR80CF23F6pvnxTbuDdJmPEE4l5mbTr1x2+Jqo?=
 =?us-ascii?Q?WH2NpEAZXu6XrDwnU4l9YjMrz0ZA7TO6ubCKstQlnWrinR3uo3z169+COClg?=
 =?us-ascii?Q?qFJM9IkXiQx8W36VgBt9pzhDvIXuwaes8O5BhpF1bKmzl8juZ+9gQJitaVGM?=
 =?us-ascii?Q?TRi6jhEnym4NbXcnpVRvRstQVSWaJ1xlxK2UJOwhdaJMYzVYWmpIkASe5AG/?=
 =?us-ascii?Q?0VKPui0A6OjRiUSdhP3IA4mHnHcGOvQSjDjbgSIcKkdsUJpXHW+MM0Yw4QAf?=
 =?us-ascii?Q?TGJWLAbp0UI2fpBTHn18dmqmrCh6DoD8fSVsuPnGKKa4TgWkOHeXazz32gpH?=
 =?us-ascii?Q?5tbUdIQBKFG1CmRshAZZ/bKPZPjSjtejAdV4XBfwb55FZkVGBgkeytS2f2CE?=
 =?us-ascii?Q?F+PBU3PX6kTs8qnN/Agl5rcnzGPIiAhEw0RvN7olnHIHD4UsjpzPETbe90LK?=
 =?us-ascii?Q?ASfZ1DEVisFITkdQDh3NLrhGUeP0baTJC3fmOG+xHZXNIqoorbhMVmk8OwDm?=
 =?us-ascii?Q?9MUr5A15EetbeuldwQ7qCN01lrBPZKO+ujbOc3xtq7mGCA+9OIQjwJRqKnBV?=
 =?us-ascii?Q?G+zVMIRcWdgpRK1WFl6e4RdKfDNyjdVhbRsA0XsxrovEvI22irIMDmzb1bBs?=
 =?us-ascii?Q?AOZeqbwCSCcRk65msc1Rl2YuW7/buHG4RwXrWaQEdA/++6ZC/8ZpxBkZq88h?=
 =?us-ascii?Q?UbN8NzVjfhbERszaQ26z1MP9ZOyXVj2/WIxP/TYh0P9tj1yE5n+GQRetvW9w?=
 =?us-ascii?Q?LGrfsWIu5eF7aDO71KGjncmndWyHxQM=3D?=
X-Exchange-RoutingPolicyChecked: OjY75JMbPH2Fp8P49eGGGulOBuBqiWZPn++UGU76g+4hlh8A3e4t4HalnUC6UJAEuUMPU5jqIA/qg+XwisaBelDX8dLkbRy8mEZ2b1E593b8qEycJS0AuPnSIlMTBLcbCJBZv69fyYv3GJAA0c4KQpst4Sx3meFS6v8qXkEEdJvufwSwc9QqeWPef5dLDoJf13tUlpFFJeJVUNAOeknE47ul5O+9LJkOW4hqY1pj/Fa8e0+wvSEo9g/tcarCmIN0LRYAwO/ApPgo7csn39NCtIaupAxv62yGiUge6CHBVpDJS5LL5siTIxV9j4t6kZe3egfbBwLmLMVxXfyLDHLwow==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3a3fb9-c56f-475b-a526-08df4c524a5e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:23.2061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsBVYXb/+DX2EorENjv+VqSvUIHpGpQeylgQc639KTjIdhSQAC8lT947Q8+oeEASOeM/xvNkowS3VOHDcnPLXd8rhX3S2GhS6eOMVapTTjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Proofpoint-ORIG-GUID: DgpiKJ8f5CBQ60fD0BRk7jYeBqy4Po1n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX2RF3fJ8kZxJ0
 cPitUC2BeCuwpx2WuLc51/3IsmTo6cTclbk4jlFzDb++Lr0LTJNrOP9TUgcqwaQoVefRfZW+62o
 kw004OWPKiXFNrXcGaanCIb6mXbLvVDCn37Q0RKafRObRSVR87it
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX1iqnMxWTbrTr
 W9/dGFfh1PUx2Gk8Pt9atxwe2T+XaO7RC3EbKI/bMZtYl0xlIMmMPIavbG1UcS4CBI8KRyzP0WS
 ygnvRTUhCC48U4TE8/YoIn4/0+goM9Jb3JnoPIMMRgaCgJaiL8CZKTxpk9FtjOnaMi8dRrwH2CH
 XK1Do/KRlq7aM9LAO+5uV44wqrHAW8xd0GvcdWjvYbsZr2S66ugjwkzdcubvDN1ZE6/34rW7maG
 ITzbh8TK2/qudRymg00Y3FyXjt7WiGUBN8MN+wJCQOOpx3/6NVGzEITfgLWb950qEao4F9kHcz4
 MzcPRy0jSJ3UXqkNUr0dNtp9MsGlzj8Kqxuor6S09An8Dh8mH0cq3vI7gZELVwL2V0Iwh7C8ar2
 70X2VRcVk0SJiGi63jGPNZWROLTngXv7VZsKgAKKrruUIQq9zhs6VAax4WvVUWdfYKhKi8vY1xx
 pLO18Ph2eMctKMFZkLg==
X-Authority-Analysis: v=2.4 cv=bofZl0ai c=1 sm=1 tr=0 ts=6b09277e cx=c_pps
 a=ajv5h6Eily4lkhfMD1AUMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=4hqPhvaRloSZ4r_MruoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DgpiKJ8f5CBQ60fD0BRk7jYeBqy4Po1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251344
Content-Type: text/plain; charset="utf-8"

From: Omkar Patil <OmkarAbaji.Ptil@windriver.com>

This series backports the upstream fixes for 8 CVEs in Convert::ASN1
  to the 0.34 recipe on wrynose:

    CVE-2026-126540  cap INTEGER/ENUMERATED decode size
    CVE-2026-126568  fix asn_recv OOM on truncated header or huge length
    CVE-2026-126576  bounds-check REAL exponent length
    CVE-2026-126682  cap INTEGER/ENUMERATED encode size
    CVE-2026-126819  fix zero-length BIT STRING reading past end of buffer
    CVE-2026-126956  add configurable decode depth limit
    CVE-2026-131868  prevent huge allocations in asn_read and asn_get
    CVE-2026-131877  limit OBJECT IDENTIFIER arc size

Why backport instead of upgrading to 0.37:

The fixes are released upstream only in 0.37. The 0.35-0.37 releases
also contain changes that are not suitable for a stable branch:
  -The fixes are released upstream only in 0.37. The 0.35/0.36
   releases change the year interpretation when decoding UTCTime and
   GeneralizedTime (upstream commit 1d6fb48), so some dates decode to a
   different year than with 0.34. That change is not suitable for a
   stable branch and is not included in this series.
  -Note that the fixes for CVE-2026-126540, CVE-2026-126682,
   CVE-2026-126956 and CVE-2026-131877 add new default limits
   (max_int_len, max_depth, max_oid_arc_len), which the 0.37 ChangeLog
   lists under "Incompatible Changes". They are part of the fixes and
   are included; each limit can be changed with configure(), and 0
   disables it.

NOTE:
 CVE-2026-126682.patch has its context refreshed against the CPAN
 tarball, which has a $Convert::ASN1::VERSION line that is not in
 the git tag. Only context and line numbers changed; the code changes
 the same as upstream.

Testing:
  - bitbake libconvert-asn1-perl builds with no patch-fuzz errors.
  - ptest passes on qemux86-64.

Omkar Patil (8):
  libconvert-asn1-perl: fix CVE-2026-126540
  libconvert-asn1-perl: fix CVE-2026-126568
  libconvert-asn1-perl: fix CVE-2026-126576
  libconvert-asn1-perl: fix CVE-2026-126682
  libconvert-asn1-perl: fix CVE-2026-126819
  libconvert-asn1-perl: fix CVE-2026-126956
  libconvert-asn1-perl: fix CVE-2026-131868
  libconvert-asn1-perl: fix CVE-2026-131877

 .../CVE-2026-126540.patch                     | 147 ++++++++++++
 .../CVE-2026-126568.patch                     |  88 +++++++
 .../CVE-2026-126576.patch                     | 125 ++++++++++
 .../CVE-2026-126682.patch                     | 204 +++++++++++++++++
 .../CVE-2026-126819.patch                     |  90 ++++++++
 .../CVE-2026-126956.patch                     | 182 +++++++++++++++
 .../CVE-2026-131868.patch                     | 190 +++++++++++++++
 .../CVE-2026-131877.patch                     | 216 ++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |  11 +-
 9 files changed, 1252 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126540.patch
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126568.patch
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126576.patch
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126682.patch
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126819.patch
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126956.patch
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131868.patch
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-131877.patch

-- 
2.40.0

