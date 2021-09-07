Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.32800.1631000120553973426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E3UXeDMs;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4884f50412=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1877TId0028522
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 07:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=to : cc : from :
 subject : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=B7dzejX2z6mlvUIMfr1hIkTXWnoQzXobgiw3Ug2QROQ=;
 b=E3UXeDMspMd3W+g25MPFq/lAj95HX86N76Vb39G/9i6Tal+s5/lS7HqzUWRdf1m3hTFe
 hNIJwTu0020CKEac0WCePhhscbZfhlLGIpknZXcaD0NzkuJsuf9u9ntZUCz0nEnAqEsr
 0J5pBNb9btWh7ljCMSyZYguBYrJofp3ObAezWKdHh6ro8j984OFj/hycVSmj+sLIOhxp
 mRqvY9StWVNGYct1foq1yLg8d5Kp9/tddVbWfdYRMKCdjl0YP39ljLUJe42KAFMxuzf8
 BNfnzXa374iXwIlm5+kyP6ZGARpKYJWbduLDpr+JCbPuhEPmrF9l3NruK7DiE2tZD9f2 nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3awjhyghak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 07:35:19 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1877ZIr7009565
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 07:35:19 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3awjhyghah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Sep 2021 07:35:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dF5Lh2x52rWeirH+qEu0RmIzISENPm0zh+Uaquux6NaLYlYuCsVV9kcqiQGjKN3AFKA9WzMp4Gqi7+A2jD+wi/lIetTbHSV1Zl8RDnCHeG2JfyrDYKbun5TvibHmw+D7b89NqlGTiltQkdUYYjEKAdeQk5gxl7SA9WFNO1LeHmUf6m5TkqsfAxMT8IKAnhtdoS5bsHscPoWjPvDDTPFbofoKhByM4GLSxVGPkFkbLqqS1WYbMDaxxZlqop6LXjazdwywWPK1kXFCmao4qgoa/49nJh3+3NHzeE8p9gA891L07Q7WhLmXX2rqabXQawOXZscGMEVlt5WMR0LazmVLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=B7dzejX2z6mlvUIMfr1hIkTXWnoQzXobgiw3Ug2QROQ=;
 b=hYP1i868ZqmCGen4IrxnoVWgBfwF3vsVD8QE9n9wzPhdzI/O2ExtrgOpA0YWlHtdy+OZYgpAXJpIKJD/HMEWha2oZAqkf+WGmshY+ABLjH6xmSGvTEht7WSb4RpP0qz3q8LZ4WYgmYk79Cp0uMbu72Hcaqa/8smS2GE6n2G0PNUeGMV3hsxO0zn6Gxe1dmzYFaBdmvncnruz2nfOPujtavbNno7zo944myqP9jMF5BUVtdBDmp08DNFcY8eeb2tJJb9cOT9OG8M54d5seJuUfTYe2C2cSVbraiVSG6tooiwC70dzDeYqUcc3t3U/AyR7lmmqsH5cke+hKiNEGPG/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM4PR11MB5470.namprd11.prod.outlook.com (2603:10b6:5:39c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 07:35:17 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%5]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 07:35:17 +0000
To: oe-core <openembedded-core@lists.openembedded.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Subject: License issues for assimp_5.0.1.bb
Message-ID: <21fb5d8a-6733-90f4-95dc-b50c1b9df2cb@windriver.com>
Date: Tue, 7 Sep 2021 15:35:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by HK2PR04CA0055.apcprd04.prod.outlook.com (2603:1096:202:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:35:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5d43e1d-3abd-478f-aa8d-08d971d2099b
X-MS-TrafficTypeDiagnostic: DM4PR11MB5470:
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5470BDAF92C811B8AC2CEFC8FFD39@DM4PR11MB5470.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8tAGS3oxFucWS3K9xBsPbIqIjFrGYx2jOPm0+iB/0DeQ3STUVXOrGA7bbdq0MF/OTJDd5PtsYEVPKXjeOje3fYtfp780dssCargpHcXNjHAOYH/JzX83RyBgqDSSJtd5oQNypuGy2ozCtb5+zrsaxHdnN6jfV6xzt2hyr6M7H0LldEQoY9AiCDuRkJKrBolN3SAMAdwOEqY6aXvsEqCZMyeX5V9IjedQGk2RN/4Qr5e0lpK0xdFY+bcqjbSACS0MgMFDvC/3QNHdBqIcCDdz9OU06Zn+sgSpcJ6XRmRPp/8bW2fncSfQylRrZ87wTFkJ1YCkyQ8TzAtlwFjxhxSpk4wNiakrLQ2CLPyDugX+Kx6Dubesga+ok+GehuNAyz3/X29JWVKJ24w6AF5GSNiMNPRMG6O1EPje7/jfXEr6aiBhPHKx3aUGmow+looA9Jj80sEOR2v42BjgPW3nHBXw7Q2OwYhm12DPUj+uCYaHHc/cK1rNrXv0jZqjPD2Nq8oNg1faDoSI44peqTkOz4S6KCt3VrPNUxjl13Ka3k+HcN3zABjjaFC3CKUa2OgByGeyc2+SjvoRyjKhZV+97hp8nlffbPDDf+al9h/qM9Dngyuc7IiKoGzReVlmA9ADSDs6H06B4vtGN7Dd3gvFsl4lVJ4Vn6wyIqYP1p0c4H2iH6vaF58HKOprdNfOfGDmcEnYfbDsPFPPPkmXBpvVtmmx2dKUbfeDItoBPx9ajJiWe9z0J7BDZTxVdhcZNlsivOm5zTlWfoZon7xjGNW5RrSHiJng1VKlRJe4ZoacRgqHVBvOA1VZhyanTStzIpMck04Guuq+Sd105QmHnLke1SHpdbLkzmQabtryWsveQOvUgWyA05F0piwYk9V36+MuHpjs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39840400004)(376002)(346002)(6486002)(52116002)(19627235002)(6706004)(478600001)(2906002)(38100700002)(186003)(6916009)(38350700002)(316002)(16576012)(31686004)(36756003)(6666004)(5660300002)(966005)(26005)(2616005)(956004)(86362001)(31696002)(66946007)(8936002)(83380400001)(66476007)(66556008)(4326008)(8676002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UklwZlExRGVPTHF6NGF0VEtvK3VmWkkvS1dBaWRRV3ljZGR4cjhJWU5WY0FL?=
 =?utf-8?B?WmoySm02cDFPMU1mS3VTWksrTUkyYy9xZTZQS2hpTUZDZUg3by9PMVlBRER1?=
 =?utf-8?B?QmhKdjNvMHRPUGY4eHhPMzRXRndWUitwbkF0S0JmSlFoYWNsdlZCSkI2V1dt?=
 =?utf-8?B?N2xPVWpUelN3OElrN0ZVSDRRQzZQRlc1eEMza3A5WWE1MHlYeWZJLzQyQXhF?=
 =?utf-8?B?c1JsTmFOMnRORU9BRjdGdmV5TW9LcUVXenEyaHFaSmZLQkIrUHNvUmdBNGph?=
 =?utf-8?B?MjhOSDZmZEx5NXBDSmV2eHZNbjhTR090M1REUUZ4UktnNXFZUTlLbXl3VUhW?=
 =?utf-8?B?TjlEemR2R3FEcmhCOEpGKzBWa3VLZXpyalZtNmFDcDhxRXNOTTRreTNyc0Nm?=
 =?utf-8?B?alFaT04xSWp3VnFvSURkTC9LdXA2RExyL3RSc2FlZ1QrNTBqTHNwQUdoRE91?=
 =?utf-8?B?SlFyZmVXLytFOVljUW04c25YaWd1aHhqamtwdE9uY0V1L3lPcnNxN2hDQS9y?=
 =?utf-8?B?L0lTSjhKY0xKcTJtbThCb3ZsTkMrYlF4dTBlc2h3YXpxdVpqTVBuTHBkZE9J?=
 =?utf-8?B?YjhSNlR2Y1RjOFBEY2QwWTlIc0lUK3E3Y2thQ05VNGNjaWhRYkppV0t5Rllw?=
 =?utf-8?B?NldSYWxGU3RPQlI3eG9KS2RCZzlOSjIyL0pBSnIxZlRDMHg0VGYzQUVYYjZm?=
 =?utf-8?B?RE1vMkxjMjN3ZDNNRkhjK1E2WHBJZTV6aUNsR3haYi9YaWJHNXRTZnM3dS9y?=
 =?utf-8?B?TXdiS3JVcE5lanNrMG5XTk5zKzZla0d6VlQraHhyN3pObkxFeWp6UUprN0tY?=
 =?utf-8?B?SmJWQlhtUDBTZHBJSHZWUWtpcnpLSWJPMnhpMFRwU2g1RDQ1cE44akVNRU5I?=
 =?utf-8?B?TzQxanV6dGxsMEMzL0gwUHduWXJOZzh4MCt5NXJoVmdHRmJibHBGQ1ZBbjRM?=
 =?utf-8?B?akZCd2xSOXpqa0F6MnFQSWQ1OUM2MVNxME9xcG41Sm1jWWRRMEZlVUo1RGF4?=
 =?utf-8?B?SzVlQUk5M1p4eHZMOWNhNU5TU2Ztd2NSdElVSExtckphSFJHZmQxNTJIbEhO?=
 =?utf-8?B?bHdFRm1EZngvVWlDUzBzWVBwd0pyZ1ZJa0J3M2F0dVYxbGdScHljWTB5U2ky?=
 =?utf-8?B?UzYzQzBNd2R2cjZscDVkaWswSkVhWmt5cjVXWmlTM0ZTMEF5bkpid1NjWHd3?=
 =?utf-8?B?UkRPdk85a1ZEVXFWMGVyMmE3N1FuWVQ2TUFGcDYwVGgvQWcvM0l2OTNmMWJL?=
 =?utf-8?B?WFpLdXNJYU84cTdEWDEyaWVDT0RHRzFtRUdBQmVNa2tMcWpyMS8zcDVka3Iy?=
 =?utf-8?B?bzBtWHlZUi9BUEZ2aDhEekc3dVIvZUplUTJpM2dFd2V0dTc1ZFNxaExDSnJY?=
 =?utf-8?B?N3VuYlkrSGwzV3BiczdISnVOa0o4QVJNWVBLVzhIQlQ2VXB6aVdjcHk0NDUr?=
 =?utf-8?B?bXIwWXpIaEtxNWRwWWhuZ3R1QlV2MFBnYjYxUDB0T21ia25IZEZYODYrVjQ3?=
 =?utf-8?B?TzM4N1o0cWFEQkNuc1JSTUozWUtLL0Q5anJDaWhMdGlTMjArbkpwUWR5Z0lZ?=
 =?utf-8?B?czQra29NN1VLWk9vUkYzSjlGMEg0RUV4MFBWTmg0blptaEViMUQzT2p3azQ2?=
 =?utf-8?B?cHMwM1hwdGREdFA2TGVGSE8xQVVjSEJaSHNDdXptUE1GUE9QYmlMMkFMZFRN?=
 =?utf-8?B?UlNuRUJ1aWtUUWRSWDl0amExT0pKeG9jd2Q1VTNzZDlpWTVXY0VLc3pISHdP?=
 =?utf-8?Q?e19fOPswqwOeZutdfM2m7RjZogHi1M5ye+tbdZq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d43e1d-3abd-478f-aa8d-08d971d2099b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:35:16.8381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aZFJ2F5gFy30QJ2+5R4InVi2g5XrbXqcs1gLGavuomrNTp29g+4q1rxqwvvs4wNp+H71v20JJpIsQQYRhp2n2TOQ69WNTlAFfUNCvQxads=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5470
X-Proofpoint-GUID: 9nvCSaAGaFaLhyYcpGFEpNNgiXC2ZNcG
X-Proofpoint-ORIG-GUID: rXDTY9KrdYtdBFyIt-eFTQOQEU_RuyUz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxlogscore=633
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070049
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

It seems that meta/recipes-graphics/vulkan/assimp_5.0.1.bb has license issues,
its license is BSD-3-Clause in the LICENSE file, but a few files can't
be redistributed with out written permissions:

* scripts/StepImporter/schema_ifc2x3.exp

Copyright by: International Alliance for Interoperability, 1996-2005 All rights 
reserved. No part of this documentation may be reproduced, stored in a retrieval 
system, or transmitted in any form or by any means, without the prior written 
permission of the owner


* test/models-nonbsd/X/dwarf-Read-Me.txt

RESTRICTIONS: This model pack is available for use in freeware, shareware, 
commercial games/software with the following restrictions:- **You may not 
sell/re-sell this model pack or claim it as your own. ***You may not 
redistribute this pack in some other model pack through a website or on a 
compilation CD of any kind, without my written consent. Psi 
http://www.psionic3d.co.uk

* test/models-nonbsd/B3D/turtle.source.txt

Copyright 2004, Psionic Design e-mail: psionic@blueyonder.co.uk Used with 
permission. RESTRICTIONS: This model pack is available for use in freeware, 
shareware, commercial games/software with the following restrictions:- **You may 
not sell/re-sell this model pack or claim it as your own. ***You may not 
redistribute this pack in some other model pack through a website or on a 
compilation CD of any kind, without my written consent.


It seems that we even can't add these files to a mirror like:

http://downloads.yoctoproject.org/mirror/sources/git2/github.com.assimp.assimp.git/


Maybe we should add LICENSE_FLAGS or remove the recipe?

-- 
Thanks

Robert
