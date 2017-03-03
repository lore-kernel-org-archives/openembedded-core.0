Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 5707 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Mar 2017 20:24:54 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0062.outbound.protection.outlook.com [104.47.32.62])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9BD776F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rheQ+SCSyecRl8at/bOJRnk+xDrfHY1ZNiSIyYEExAs=;
	b=DfAHQV5EQSOSzgUoKW9k0rs00Z9uLCP3RRPLtKUAW9wSHazquZxA0Ta08TD2rTqdNdL6CdWGZWEdPtZDqhkyctR1UNYnNbbABT5jNihU7bXJoI8H1coRO940mzSuKxqFug9Tw0v5u6YEAleV91WeRZ0n9qoX/fDcBP3nW9JVfv0=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	BY1PR01MB1403.prod.exchangelabs.com (10.162.211.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Fri, 3 Mar 2017 18:49:46 +0000
To: <openembedded-core@lists.openembedded.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <119c985a-4527-9ced-6cfe-46ccdecbba67@xevo.com>
Date: Fri, 3 Mar 2017 10:44:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: MWHPR11CA0024.namprd11.prod.outlook.com (10.172.48.162) To
	BY1PR01MB1403.prod.exchangelabs.com (10.162.211.152)
X-MS-Office365-Filtering-Correlation-Id: fb505389-de9f-4d57-b49f-08d462661084
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BY1PR01MB1403;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	3:cHfu1GV/F7/oXlL5DfqafjsgmmY1/tAqsYuDn4ATG4FmDL2ld3ZLnfmNOp3ZbUiER1/M3yYGp35HUZ61Go5YccPKNdIIQ+lzNvvlluMpDqL3xDaVTRBlU3tkoHxtrPa6ZxmT+uni2ZKkmXRDdwsdSgUDLIyWhYF97PXSCuxmAy9szqfnZ+enXeYyjBR23k3LttZpPZxTWS5jIshiHl7xz0LYrHtn/j7kQskIr7816tz3TK/wL9xb+PGsnKs1VEVWkM3YDcXltXJmOitSmfSI0w==;
	25:HLV+QLbyaTKk0gQmj1baAeoygSAAbmQsNtKMVZqPrQa5FeXxC/cHkPT73szx/e2QiP8dCHo5xvkJvCfh2+3N2BT2EHxRLG+3DWNi5f7XyF3G79JkOKfYvIPtGHCz7rBMHtHVc39OenZZdOvwN7hmwKtW9qB9QdtPdHa4BCyIrUlzGuLBU/L6OJU3GRvmvFW1dV4UE3/bwm/PqOVgOu9LmzB+uCrlk3oEBo83VR+WBfX8vLJVQwcoAwDOc26nigHjlonrNe6YdTicAPPX8FzfDez3f8KNBL7Ss+JOyzXzpwGVwhzrerCGx295250mx+Q7JTWrb+1yA9CdDVX6syDlQi65b2qeXS1oO4m7Kb0NnusMgweFisTWp0NCWwT0XMgePYTINi6h8jiKCvGO466fwL6KEviHrrj/zPOhrovNHSYK82/6BgZ0EpCWxE0WCX9YDDGVbduuJrHBdImF/7qBUQ==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	31:mxgqfr50VU4Qrf6Pu4LBTDDrTxWHR/tguh/f1YhAStMbyDvTuuC6sA3Ll1Adujt200cFtBWKiepXAyZV8JolHC84xfWLIRiIXgSKhif4NgOXR/0Y4/NLDZ32uCNCnPmVm7Y40ghOF7wKQcj25ZXPl59cqKpEzritzegmjh+uq6tssu2HGEJMWbDObdHFOe4FIxP4HEugTOgL4WllKa/mket/zWVSsxkwlxwau19mBmCBFrO3Phya/wlbsWWvcqwdR52ji6axa+40MTVfqWv5PkTf1sDwomCBHiFW04s3H64=;
	20:62GlQeX//iVblHBm776PvqD73lL+dZSnDJJminnM+saoaaBJ/Xq/P//ZJWAA8Xe+jpE46cRKfjnkEODZg/CHvCW+agMNIhLixKNMIDyHP94FOXvY2AcxEI8e4HQtALgd3NDQaGrgtLhv/J81XacFEDJ3udoRkUZAd+dm9MLOG0GCRSjVxRh8QPbhnGzitrdJG5zBgA9zJZC9TQCB84DZClrcgEMRb03dinl3gfCL12+3IA2GhBVjIaG8udQzugVcjhYPPYkBdFWZG+cD3Y3fM0s7lIYJYb4gXqDG0m4avUTx/GwOulXZ1eMrFSSMKou8/MiT/NdNpvcvWejxXDopBg==
X-Microsoft-Antispam-PRVS: <BY1PR01MB140341CD15C3C5188EBF80F2AB2B0@BY1PR01MB1403.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123558025)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148)(6042181);
	SRVR:BY1PR01MB1403; BCL:0; PCL:0; RULEID:; SRVR:BY1PR01MB1403; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	4:NoHlRhqsKGU/4xI+hJzszWPvce9EdsMo/ZWPsWG9ogFf/R7bc4lLh59Z5A8mOB/jI7YA3XuARr3AxMOGE9bZ9UhWY5BtRMRpRwD5GnZALRwsTKXWPQ3i2OfcZLkofmxxahnx/JNcynEZXRkj7TUYqA6gcUU0BK6UbXexPVEfK08HtPxyT+UMaq4isobLTqs9RO+bG2/AQk8t8zGQsf5OxEpslb+485TUsn68HjWqseRoKyuqaE33nAy0sjmicl4GqxDq5QXSHG6wxMLH3Osju/cDKiOOCAvNjnFU6NPtaxo26zkhcpMlSBOl8ZxQozjigEXb1pRzmOkBXBym0B/bWpj8TdcWHmhc1veCCJvkit6Nb+5DmL2m+pHLv6l6a0vKZOACPMHT+t0lnAoMlZf6OeanA+yDBgBjlolsLTAdGgOLCR4512oyIgcbDQCeWxbdLV71EhPLjk1QLund1vtfaiYWP9nTQ1odQ71RytF6ph7iOLfesD20wCKk3g750S31bhSwFXo8rFPsXIvT23WG15riXpNm8Pd07BOJqrgq3ZaL0i8XdFImTH90AxfqNVSaU7kfgxoAQOPFH2dDSq93fgMf+ltbMk8mawwC/nE+G1M=
X-Forefront-PRVS: 0235CBE7D0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(7916002)(66066001)(189998001)(305945005)(117156001)(47776003)(3846002)(23676002)(4001350100001)(6116002)(7736002)(230700001)(50466002)(2906002)(5660300001)(64126003)(83506001)(33646002)(38730400002)(2351001)(110136004)(81166006)(4326008)(53936002)(36756003)(54356999)(50986999)(6666003)(31686004)(31696002)(25786008)(42186005)(86362001)(6916009)(8676002)(6486002)(92566002)(77096006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR01MB1403; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjAxTUIxNDAzOzIzOmVoQzN0enV6MWRkUVdzekhLaDVsbmx2ZFg3?=
	=?utf-8?B?cjdGejhjeS9PbVNyMnkraGM3aXBGT29NQ1MxMW1rWTB0Vm5rbnF0WEt6NGVh?=
	=?utf-8?B?K3Q4NTI2VkhKR3BQQlFRaGVwcGs1NmRLMzdTQXdUUGJZWTVpWlZySGpUQnVy?=
	=?utf-8?B?UXAxeHBDaURHSWJXNUJTelV1eVhNYWxob0xldzZxckZ4L3dwLyt6dFNtaVph?=
	=?utf-8?B?dDFKcG9EdmNWQk5PM1pUKy9ZOWJTOHNxZkVYS2hzU0pOcC9CS2F0ZEZZcnBm?=
	=?utf-8?B?bk0zTXdkbFpKVVpYUWtBKzYzSUsyVFhUVDhUZUQ1b3A0SEttQitYOTVaYTcy?=
	=?utf-8?B?ekcrcENNVXZxMUc2S3F2UnJWY1ZRdWRWNnEyR2tPSnBuYkI2TW1sWWVEejZy?=
	=?utf-8?B?blRQcFltQWMraGRyS05KeGYxcXV4bElJRWJ0cXRHSzJKODFhLzllNUdRa0Yz?=
	=?utf-8?B?UWpncURFT0kzdGZLbkRrZExVcW1sbnphYU0zcmpVRFVoUjBMNzJ2RkdYQVdI?=
	=?utf-8?B?R1NHakZtVUMvVUJBRWllSUxhRG43Tnk3NmEzbzdkT0txcVlOZGlQNnFXM3RM?=
	=?utf-8?B?bEdDbTI4WGJxVW1rTVI4WEpkenpiNUdRWnZ0bEoyUW0xU053TTFvd0NLSHFj?=
	=?utf-8?B?WitLWDA5YUYrdHVuMi81RXFRU1c1RWR1MkE3cGFNeGdjbmIrVm1jU01FTjEx?=
	=?utf-8?B?K3FsL1E0NzRFakFMcHphZUpMOHhRY3Y2S3hqUVZXZlljNGF0SVhwb1BYZUNV?=
	=?utf-8?B?QThZT3lORGNENk1laEhEb3BRTWVtNzZVMnU0RkFIcG44TDEzVHA0YkZ3ZFpB?=
	=?utf-8?B?a05iZTR5Q1ZydDJnMHA3V240S2NIVFo0RTMyUlU1aUZPVlB1ZUJ4cEJpRzdH?=
	=?utf-8?B?bXdzaDY1dmt6eG5IeVFXS3R1U01lRElva0JkOTNQRUZuSGJHWkhxQk1BdU5P?=
	=?utf-8?B?V1FVaGg0SXh0NjVmbUpjQkhLaVBtRTlQekxTbmVuTkNnMUpPSnEwMlZtRUx4?=
	=?utf-8?B?Rm1CczA5bGc2dERKai9NTnBjZFN0N2M3U25qMWtubEtqM3kzMkpUUy9SazA4?=
	=?utf-8?B?bEYxNFhMUE9YYU13ekJXWnVqeG5yUG1qc1hOZW5mQVlYUXpWbTBMaVRDRXph?=
	=?utf-8?B?MXgyUzVuU2tOcXEyTzBzTXhpcWRsbnI5TytJdCt0Nkl6eE9pTXFvUkFrZnZo?=
	=?utf-8?B?MDVNcXJZbGVYZVlQRE84bFJyVlo3T05qaVc5NGZkTVBvMDdNSWpOZmtWTHhj?=
	=?utf-8?B?Q0ZKekg0L1g2Nm9zckY2SkxYb0xIQ1BMUWVwdWZRYVhrTkhXWFk3TWExK1Rt?=
	=?utf-8?B?ZWYzZ01pa1ZqZDFBUGljK1ZVUCttcHZxWnZDVE9JVkpIWisySlVDS0JNdTU4?=
	=?utf-8?Q?N2nlo9IL?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	6:pw+0Du5KuNXOkj5patuWA9BILY8NxVkaFRe3kkqmOG0vRVkpfqAxvEqWQ+eOb43UPuNClRw3OC9+kBbq7VjdCDj9zhlkjjOZR/18zuAlHKqxMOJAxsxcnxC6h1t/plhKmSxebnpBvr0Y2gRCGAQP4uwBHe+sKndJ13Sw8daXOJH+5wrr3OR8qfjcnd4nwKUwXq77jusFcp5L9LUJRbsl1AFiUR+gX/g14OSbJWuJenbdraJI9kxe85+YQ4jNr0use09gNxlmuccST+SdExCmwxDQULJjUB/qg2jrD9+3HEgUuJ7zlaE1SRD4NSrBaMmBIma/rP52oA+L1T4gbX2pI1pFyGAdmWUPm1zEg9JGyK3TqB+MGBSGD5zES+ZG//n7WDQxJzOQnH8Lv4B57Rt+GQ==;
	5:6eLQoPgp+ZJGyZwYK1SNboMcudy0xAXaSS0JsXE95pl3u66DYNPjIBAA+zhDMBf9RREd/Ff2c9bnMPmtpMFarJVfr3Knr5C6ji1g3+gz2ZrPZJ8joe5ruJhlGnE/8tJCC4GgIO+WMKVE6Bpz0Q2azA==;
	24:0zs8a0qt0BI/qqqJ5y1q3GJXH1pJmQpSVTI8ZtdrZ+jc+/BDtmXmqjaXAMu1nlNGTAXKbbcl9PRL5+fl9OoIGUzF9SntMxUS5eUzpxdAZS4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	7:uRn1DP4CdzGvOhloIt9a/siWwkqHKdct9GKREBTaKipD8nKblCBd9rYJkE3Gq1TvudzBY7rCdu/+kyUbJhfPqNCu0zCxZ1t7R2Zgch8a9Rvg0sULqoxvUJsrx3C97uyJqVsiG8MlmQ0DEvpnaXRh1W2e/rXiDwl29cbwUNmob8nlpHFqUYQonBKAF4JOsk5+4wCZEasdVfWEaAzbO2rfcpN8EP8PU11H6bUohfQttpp5HABt9kyBKFnToXbhz4nC4/uvlbM5sQuI9DwYPIQpldAFgLt6jXnctzRpjNcjE8QgnMoEPLEehkixgGvsfvbur2DcK/wOAHN61adETsNKNg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2017 18:49:46.7838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB1403
Subject: [meta-clang] clang/LLVM versioning
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
X-List-Received-Date: Fri, 03 Mar 2017 20:24:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm attempting to build a recipe using the LLVM/clang cross toolchain 
provided in meta-clang. However, I'm hitting issues with the llvm-config 
wrapper in llvm-common. Specifically, it looks like the wrapper was 
copied over from the LLVM recipe in meta-oe, but the versioning logic 
was not updated, so when the wrapper attempts to exec the versioned 
llvm-config-${WANT_LLVM_RELEASE}, it fails. Notably, LLVM_RELEASE is not 
set in meta-clang/recipes-devtools/clang/clang.inc.

I'm looking into fixing the wrapper, but before I go too far down that 
path, I wanted to get clarification as to the intention of how 
versioning is handled in meta-clang. Specifically, the original LLVM 
recipe was clearly built to support multiple side-by-side LLVM versions 
on the same system. Do we have the same goal for meta-clang? IOW, should 
I make sure that the versioning logic works for meta-clang, or should we 
instead just abandon the versioning (and the wrapper) and support a 
single version of clang/LLVM?

Thanks,
Martin

