Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 894 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Mar 2017 19:35:46 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0047.outbound.protection.outlook.com [104.47.38.47])
	by mail.openembedded.org (Postfix) with ESMTP id 08397775F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SdcBkva9CNIfuSvdr6tKAAvZpaEje1QGqAydfdxhR2M=;
	b=T3lYVDfQZFysOEX/MtIuZS3staM1tpCrQpB8n8F17r5dwL2bXVSPnY7hk9WCKpa6R/kUIBVAVXMFQNAj1ROiLIVB3dLsjR9Zp1237m3mqkl0tuYmtZ7Djh8ClOcwiIl3IfYRwGMUQCHnuG6q6E3ynko3yAXBSAU45Ldf/0XBzis=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	CY1PR01MB1407.prod.exchangelabs.com (10.163.18.29) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Fri, 3 Mar 2017 19:20:51 +0000
To: <openembedded-core@lists.openembedded.org>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <7f8eeb62-a767-0882-dcc0-9a6882192d82@xevo.com>
Date: Fri, 3 Mar 2017 11:15:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: BN6PR18CA0022.namprd18.prod.outlook.com (10.175.188.32) To
	CY1PR01MB1407.prod.exchangelabs.com (10.163.18.29)
X-MS-Office365-Filtering-Correlation-Id: 8e345098-8489-4f98-031c-08d4626a687d
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:CY1PR01MB1407;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1407;
	3:O2Sr0WB69UM5rQ4+zed67aRsCyG4K/02vmYQJ03ni/mJgmCXuNhAmKK3A4h6TxJiK/7tfpasYb3qBeovIK96mbkkV2dRI18WMjDwfU7ea2YcDRY0/j+WPunAYxPMcsupaVBEU4nbhSa5RC5itOYiOpUMxJR46/4WJnnSMmBG69NjbzeSFMrwveWSdqAIbgPDx/TuzGv2C49FZZoteiBt49J9J93h16YUc5MJGlOS8imMQEWHiPdO2EgXeiVC7ItEObVI716XNkfQYXXJhVKobw==;
	25:su6fLi9WPYbGzDIUS5a6wKVvNXIJfLx0+95kuaAyzTEJiuUEC/E5f39e/ZjqOpuBcq/gJorY2X5Bpcfdzfr1GKGFenyFbsw06LNqROBNOmhL3kJV1elvbsI52sXoOV3axQbjlZpgLDWBYFpjCY8YyfVsAPvpeDiaSoz7XipOtVJLJV+Yyim4GC6EU/HY8tO6JD9/Mey49sLW9ol9kvypod3gWgYUtXy82thuvTFWPUH6piI2wqMxIg5dsThyp//Rimyv8Hji1NNaJp5GAcvwGnJbgVwQDwUge+Ky44qoGszawTiRfpAvUL903vIiN86OCu0Y1y4kJJyjos4Bf0a1fEra1+YnbjUtGfs6RiOHCcctDkKMpczyHjx+e3un7bZGUiptfnRJj17U2Hi32NELDFugUWMZAq3YdA3HWAAICrjV3Mbj0Nk+4uoyZna2tQ3Ggdg/0zTNs+yKRpcwOBarog==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1407;
	31:c/TpXAaaujimxVMoi3ItFOPXJk+xEw0/M/1rhDHtm52t1n40cJocsRsttXwfG3bqVg/FaOi87aolV1bFrtlVDUHZO2o1mZuVZ4hicPQcZUOeZQBxl1KuoDXgrHQr7pOctbT2+lCaCg5fjIDYBqeX0cY+WnqGX8gjYnnja6GX7vILk4nusyKj+wddu2KhTyYSqsGAq7Dh/xiq9uEze2hQ56YD8lyArdjFltVKAawR5094nKTgkpjU8XvQOwCEwcuE;
	20:aL7B0h8uzOzdMTa3rTReuUXDVpc7bF2jNV14NIM4uTRw79q4zMJuRGj0WBCfs7XHFglhDQpOAlwe3lCTIzQE0uV2czAiM8yMtKCBPmt0jTYhcJqbDJSJNFTEzJ+6lQ76ZHVVg/sBiNHxXQuc+bTZ/MGw2BBJ3NYAr8UvRMsvCh6HzkzHvsmhr3/cYARGVaH80++QywjgoT/g2lX8vuwz83G0cFi6m7iNbIeFuFWwUhYdOTwqPQ+aANNnDrF2g+WMKvwuDfdtIbxlNYRqhFqSMswUcqo1IwV/DlkYLB1XBbIUK4Vfgm5wUdAS41HD59aAHDX2zK6qYQyEmcuh7xa0BL2c+pnXrFdoRwSJ2fHg4MTfRBhw9aQIZgrWM1jgokYcZxCZws+FvCokU9sOB/1qP2b63rFOiKGBtpRjwzw+yyA=
X-Microsoft-Antispam-PRVS: <CY1PR01MB14073E21090D8CDDD0C116FBAB2B0@CY1PR01MB1407.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041248)(20161123562025)(20161123558025)(20161123560025)(20161123555025)(20161123564025)(6072148);
	SRVR:CY1PR01MB1407; BCL:0; PCL:0; RULEID:; SRVR:CY1PR01MB1407; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1407;
	4:459Sgtv1IaxJ7NtTbABnPCoo5rRhy+gO8JnnzLAGobn1YjLO6oiARq36RKqbtUEXuxWMvNhJjTrqXJy8rYW17+RJVTXbL93zYSywLENbkH31jX7d/HhSKpNL+H5WrKmwC8K9urg1lOUqwgWYBm5egkkFADVJ9Az746v4A3FINcPJyADEhLNenoSyEF+ffloYfC/PdFevMGMMCCuEgoJEGxhakmZn28XV2DupYs0IeHwRvJPDmRE5zdUZQfyRr5Y9MMsZEigvljm29B0VNNOWSxLcw4/wKLMgDxpzuk4FogimGVXrh2s4T6zSlIEAcIIYDePXRv9GhQhZuN47ZGmZlELOTTa5cjrDn+N+0K84GhPLEs9MC09oz3FjUF3keAbUstwDbzy6alkD09yyaNc25EwLJL+yAocVkPf9DZwg//rpa4EgiBKdKFEVcDjntnl+R53f52Y1XhVOVMoD1DInDukltEoYvvzHDM6gDZ5kkFFZHhfif2dpSque2eU3ao3qnCml3gAQg66UdZ7RSLaiKkKD/bZ7y7KAFTeRE2b4GCsM2yc57oCikKSDwHUXlFGLtQ5c0WDSw+xobjB38HPNeg==
X-Forefront-PRVS: 0235CBE7D0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(7916002)(39450400003)(23676002)(42186005)(77096006)(64126003)(31686004)(117156001)(25786008)(6486002)(92566002)(6916009)(53936002)(38730400002)(5660300001)(110136004)(50986999)(33646002)(7736002)(2906002)(8676002)(81166006)(305945005)(83506001)(230700001)(31696002)(189998001)(4326008)(3846002)(4001350100001)(86362001)(54356999)(6116002)(2351001)(50466002)(66066001)(36756003)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR01MB1407; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAxTUIxNDA3OzIzOkF6Ly9FbjZ0T2QyYks5d3Bkd2txcklFalgw?=
	=?utf-8?B?Y2V5anFsQTVxeHc4Mml1WEdsZzFLQm9yOTU4Z0RjNysxcUsxcHhHMmo1SmNR?=
	=?utf-8?B?eDVBNHBuUWFwTzVxbUxlVENqN3FHV0V3SU5VZ2hYWjhjNUVOT0dmMmVmem5z?=
	=?utf-8?B?UHR0SENZdUYwdEdCbzA4cm5xRmtiR2w4NDJIMEdZQkNOQ05YWWRkVVFtWVVv?=
	=?utf-8?B?U2xnRGZhbUJrR3BmNmtKWEdXaVZDT3BTK0N2WjQzbHVBRnRUd2FnUnZ1Rzly?=
	=?utf-8?B?Zlp4aG1MRVVRSDVWWUlxSVlhSTlNSHk4TExjcjhFSFNTZ0F1TWtITURYQkxV?=
	=?utf-8?B?TEowNHNOM0t3Q0p4WGVxYnEyd0tTMUhjZCt4bk9PWU5ueFV3S0NyUDRHdGl3?=
	=?utf-8?B?bFFqNlpVV0h3eWx5bmU5U3Z2REt6TE1FT0NZY21nVmZqM2lxdm45WDd5b3po?=
	=?utf-8?B?Z1loWEtEaXNEYUlPREhPeG1TbjZNMmxqNWF2OWNvVHd6UXRFejVqNGN4eTN6?=
	=?utf-8?B?U0Q4UEJjWVAvUE5oWGZETndsTFVwQ2FrakpLSHdJRkMzMXF5NmFBTThSOTdK?=
	=?utf-8?B?UTRTSWlTbW1YYkd4Y1ZpOVdqaURHYmtvYTFsQjdYQWdlTUR3eGxhMXlMYkRh?=
	=?utf-8?B?VkhteldaM3dSYXVvYk5xKzdIY1c5YTJzQ1RCMFV0WXhjeGhJaSt3ODA5NFhW?=
	=?utf-8?B?OWttTW51eFVRWlpJSlBUT1Nlb1J2RytCeFEwWEhjQjhWelpERkxMUFE5RWRs?=
	=?utf-8?B?eTEvOFVidTA0bXV0YjlFU3FpdHFuSVZJcFlMbFpyMGw3bU1JVlREdElSeEVG?=
	=?utf-8?B?KzZYSVFXSEo1dTFvWlJnWitITG45UHdiUVJyaGhNaStwKytvbmd4d0ZnaXly?=
	=?utf-8?B?cGhGRVIxUGpJVG44bWRCRmJUWDF6UXRGcTJyQkJoMmZVYUxTQVVuemdDOTRL?=
	=?utf-8?B?cVpWaDZFeVpLTzNtSU85bEJyMXdTVTRISVFPOXk3SnNKNHVSMWRLYzRwc1o0?=
	=?utf-8?B?VVcvUEtuckJXVENCbnVOWTFtcHROTkYvaFlmNmVGNXpnNkYvOGVhdHNaa291?=
	=?utf-8?B?dy9KM0NFZXRmbmZwNnNaYzRIWEwxZmU5RHYrTEVCbFpnSEdzUnE0ZlN4TEpY?=
	=?utf-8?B?VG9iZnhHQURmbFgyU0xMME9BM2w3Vzh1Z3FRNmpTT0c3TmhGVnRBUXFJN1pI?=
	=?utf-8?B?WVErUWxnRytJWEFmNXJHamMvY3JCY1IvaVYrV2R6cEU3U0ZIWWxYQ2cwMjk4?=
	=?utf-8?B?dzhuWnNoT3hHbkJLYi9mQUxVUkN2cTE5Q1hGWUM2VW1YWk55ZnVaODNGUXVK?=
	=?utf-8?B?REF5RUcrUkdSU1QwTFFvZk91ZGhURXRncjAxck5sWWpXVEI1ekZUaklta0k4?=
	=?utf-8?Q?n/ntOKpP?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1407;
	6:v1XfTL6/lwDoxuq6lWLMIpYN7RqBRol+Mx44XQQzVi3d7GwjQaF5pw2albdzrFkQLNJNfBjLxblp7sqDrkA61VWRGGvL4FTQFd3whtsniFutqTQrh/JbMsu0siWuNtgaKY/ALpNhgOoEyV1vI3MLaZP3u7WGwjRWzgAnX3ERWhx57w/Nzi76NZciFpZP9e0IxZ6bDzjDaLyyYINpUr8VKmO4zNfXD9JZ+yfLlnnO4GAfnoFAP+zPJlsWUvjA2s012LhA4ai4fyHf0wf2KkfY/vgPAHdHrjIa0gDEUX67lQ1fqrQGKJ4wrrYLk5m9c5fBBfxcdELMMPqlVSGmYk8KqsPddojFPAZBRKTGXJaalQkpn/O087FS9nPQSbkjlDzoneUWHEphZPwiIy2xRJXMnA==;
	5:tzWieM6vq8VWfNUzbxB0u4/YkdhA1aNtXTkssPRJ6yaoUv+b0GN77GUFbPy9DmTOuiCm2S67FaouOEsOMdfZ17mzvrj/R9zTNsVfvzPsI1/kD9jjiTM6Nt+9PCg3IiPhhrUPBvV4pPLNmR/egILuqA==;
	24:MPXoZo9QH8PBBo0HsLSSpJbGwvJL7qIFfZ7kOVBigXr/qpTc1gEJGIgtPhzN5tq8L9WkVvWH3xbOVbKZwqgr8S2RjeAqkAwKwii7R4KSpiQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR01MB1407;
	7:gHeUL7iBaKgU5plqi/yGsKIvElK8ezOb7ZpGYGS4ObB7ND52M/UamMAyMK+JXn6jceNIOfowLoswSqMEIdiGB/WhSVG7PJQYMK/r6X7ggjlsW8s0poH++cSsm5M3FJt6/R2RsnJzY+bSVCKihtsSUh+uRxV+1787SQJ5qFKCR2V0vHf1wLAJow5RPUFhCiSiq6t+m89w6MVFy83TvaUfxL/cKI0H0lL4ac0iwMMw3F98On3XUN3W4EMGRqbpM/+Q2eK+BB23UN/ppyIOQgDz/wuhOex/sS8EuZOZy0BPEQItjj4/GaPsPVatqlMhH6I6W2aUtOnEZVYjmTFhFH9+Ag==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2017 19:20:51.5473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR01MB1407
Subject: [meta-clang] LLVM shared library support
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
X-List-Received-Date: Fri, 03 Mar 2017 19:35:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I noticed that meta-clang builds only static LLVM libraries, unlike the 
meta-oe version of LLVM 3.3, which builds shared libraries. In fact, 
this appears to be the LLVM upstream default as well.

What is the reason for the difference? Shared versions of LLVM would be 
useful for reducing the size of programs linked to it and making smaller 
filesystem images.

Thanks,
Martin

