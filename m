Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63799C433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:14:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.44])
 by mx.groups.io with SMTP id smtpd.web10.6562.1634804063794133311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 01:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=segHdkij;
 spf=pass (domain: outlook.com, ip: 40.92.90.44,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPaYQsxsrs695PbCqMhswk8oFbx2MaTJK8mxNt6CCRr0vgydtP0Y4aphXzuOjLVD55p+xzDiIyvaoUnE+S1yadkZhb85CxOM2DLvs+B3hkIMKi7bfIRGk/Rf6i1MZ2S79po48uEcQKoU3oWgi6fTL6q8rxDV+XZaCRdmGjtsRrL9Yl4sIvJB6Db7hE4IRYZoKTbARAxi95KYwh1filfCb20grypyuDOzAzwP9WeLllQueZ2rpaVoWcqsqVJbHSiTAwVXDxK10oaBXF31PhK/afu/D/orgIpUv1kd/0JL3FjA97hUQmYA3Nh5ww4q1HdSxGgqtzuAt7/04f1Diu1hxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jz7zSEMaAVgHJMDW5dfke0Ubjp1AUXhMREsyVCeeMXo=;
 b=CmQBFmBS1kk+99twhxFfEIACjwkOj9MDUVFoMcX2YkdMJHlq96P+NDRihkG1Mhr/wpIj+VMIQKTvWnL7TPiH9XoDmcwPFrQTnJN0zY4X7wUkyyqMueFPfrU/4YkIVY4PqGPs8bMza+n1DRCVSo5ze7RK5l1hB/lKo7B+Ojdi3O7JdfjylJG06RvOm7SsCL2ln+opec99wNLk4KmOd6t3k4rnky6f18ZEBCcOkrATY9Hw2amPIn1Zn5LjMtRdfniCuMTyq6CtAI0D6KQyG9MW6GXCZ3gz491PscQAIU0coCSWsdERe+UPQkhxRGklMl1Wc4N4v6ZEhEKCrUqGdeniDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jz7zSEMaAVgHJMDW5dfke0Ubjp1AUXhMREsyVCeeMXo=;
 b=segHdkij3I8dIFop4/MMOsi6SFdASE52snlLpCVE8MfyeFgVtkopYKRf2Gb9fcw4r26ycGv/R3MP4WhZZhszdKQsI6SbfgA4YqtNZDRziCYBbk5RC/EtkKGfAExazfsLGSw9xf/NlAMBLsbBPtHvl7CHHl/xi/tcSdioI7LcOV9Mvdabx56VOkRVMgfYNGBgAFDbaopPeOTsKw4OAsxvu7TN1I21cpzyenCZwTw17VTj3mM3r1EHmcXb+/JGXjvhl5bhIpub2Ucs6zS8vFmesw7MR9Om6N0X2WISEH9KzCnJ61E/WAjyg/HYN04bzY5xuDr/imxhv3a73/WyRVQLAA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB4802.eurprd09.prod.outlook.com (2603:10a6:20b:2de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 08:14:21 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 08:14:21 +0000
Subject: Re: [OE-core] [PATCH 2/2] stress-ng: convert to git, website is down
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211021070242.16025-1-alex@linutronix.de>
 <20211021070242.16025-2-alex@linutronix.de>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642914F1784EAD19A8EFADFA8BF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 21 Oct 2021 10:14:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211021070242.16025-2-alex@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [WE6ttKD42JWdM+iltBD/SktGzX9f9maZcRHX7pN+LVp2klYJzAoAFn+kGKS9IzO6]
X-ClientProxiedBy: AM6P191CA0099.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::40) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <a2d36c66-3716-d1f0-a72c-c931c75c0be0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM6P191CA0099.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::40) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Thu, 21 Oct 2021 08:14:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c1e03a9-95b1-43b6-ee52-08d9946ac8ce
X-MS-TrafficTypeDiagnostic: AM9PR09MB4802:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tzESOHxvjdGujcjNwgFJ9FzSVSa1F9w1FdzIJcby7Vv8kKCCcCRkGlQJsRqnywr9nWBm5VGelNSyaXxItxWsnDMaC2OMgS1rFgUBWnBerVjg3rst02+tEn4Z8Z6H4l2+g4ZGdi3iU3RzFqNCYirBmOyTCKKXT9a6sC1Y6qi2bYm0P25ckBq6aTDsAVkrj4k35k3648MeY3chk8pVTFBp+Gb62TsGz+NBqbbQtPh1ICMLJUf3EJIkXEiCNSKeA69MvpzYwLchnFmEUcV35kIL626jkrNAxeig59byo4ToeeZe3EGdN9ZovxkNoSUhGnDiYcawZRGZGJtkTiJbmqphrli8KCsljMxB7TR+2VMKorflIRa6pfMypHZ1A8IUZIHsa9xThTLW8C3SXanda6g81snIdxwHMO8iEW958wWFMAUHRMRbQkr0idpwctc89VcKUNArMIRHsBu8jEZtPdTwXElPalsrF2PhZWUB66Fp+DAg1qlKgGaWtBVjqgrTXLr8n25wMi3hz2qRaB4eQDN2DEWvfqY+kvc3ugPmi5+mW0shrlejuUFUqiKRa+nOS82va7iWt0cC+9OQVNWP8PLd9w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fo8daz7QmDxHxRgMuq7xNfNWbIQmBThKBsH3EM57y4pyrpHggv8tFSFSDhFkJfsbc6uixaNModUrDoTlHabs77+edGgKzBb808e3c4IUP+kEquTro8PXo/lbHa4LU1sm3ZKpyKYDsaOYUPEGk/2V2fIZ0Nx/TSIImxSEtdqTjvm6a1w3EplD1jvC3c7Ep0Xtgi4r5Ep7znnxn32AueeaJ0rraxTVwzMx317NDnmYwR1K2YmnO/5AbS0TtJzboQi7Bm5kbr36Luw+uKgZhAv9InsZyEDg1wa6QwkFoKkzlQzwMUrwHy71QflOY+QUY5s+vXuoXaDwhmLSR13g6O50hO2uMxU5jvkHjTOgcOy0/YrSclBZJ0Ea4RhW4VRQea9AQY2gkNvdazKgHtp+4vXmsjowgvSAoUVkC5oCKF0IwyHb8geuNVKoyjPP1I5VSedhB5RDMjy1Gr66cnn8GN3piZavYwUPPp8emeKCfatqGv/cvYpuRWLhXkI3AEhsQz3I17ZqGXGSVisGq9jJIM0bLt+yeoO4IdmAyEAYDykafzMORCmQdZFYI1MrCCXzSl9ibVmGbjCL6EYY+M37r4c0sqjghb019Owu62Hd9ysQdiMuzt74wS4xA0WdD825kSPNR2GFu7mL2fK0aU8Q7bYC1jTLjTSZLkLF8I5kJmEseiHUPQKAk5BcUJZWnMSbtlNfaCmnvq0KR3L6P1H2BrClC2mPI1dJzje74PQmZovlzGHogZor0v7kELsXPSlI8ZpPJbMMoKRCoWBiBICwiIbcvSLEW4nKTG0yoZl4RUp0VkB2Yb4bGkHMTjhDVsqaFnowFcJEZebj7/LeOXJEDmF9F7ohZBYY3TXcsFCmWqPjcaT+ChmrO29vlBx6EukEaR1c
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6c1e03a9-95b1-43b6-ee52-08d9946ac8ce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 08:14:20.9489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-UserPrincipalName: kweihmann@outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB4802
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 08:14:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157275

Could you in this case adjust the HOMEPAGE var as well

On 21.10.21 09:02, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> index 198f7e87c7..8a37940bc3 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> @@ -5,10 +5,11 @@ HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
> -SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
> +SRC_URI = "git://github.com/ColinIanKing/stress-ng.git \
>              file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
>              "
> -SRC_URI[sha256sum] = "1cefe4a3057c1522b146e62f61b80ce6e2e99da2d85ebe25bc03fc45228e58cd"
> +SRCREV = "61b454b4a3a9d052e63c78a9574ccf8a650575dc"
> +S = "${WORKDIR}/git"
>   
>   DEPENDS = "coreutils-native"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157273): https://lists.openembedded.org/g/openembedded-core/message/157273
> Mute This Topic: https://lists.openembedded.org/mt/86484339/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

