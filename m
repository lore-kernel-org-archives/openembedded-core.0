Received: from EUR06-VI1-obe.outbound.protection.outlook.com (EUR06-VI1-obe.outbound.protection.outlook.com [40.92.17.86])
 by mx.groups.io with SMTP id smtpd.web12.8139.1613484217450620788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 06:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=D1/rQMSI;
 spf=pass (domain: outlook.com, ip: 40.92.17.86, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sj7qnrNTs2DEimStEfbxj+VpssUDLuTKZ0rnIamwoY/Z9x8Xu59Bd2fyOe9oOg7LId8nLpVuXVMRSfI8WV+hFStSaqaRtQPSDZnoQ1Nt4nkQMy0Wwv1RaFCMHmFayfp4jOFHqA2/2d4i/QwEEdeUK8AYR1qgBQ7oVF1Fs7KJUscmHlrY5xSNqcGeXsjiY1cDuRqfvPBo1aOb+K+gv9TiehSghVF7aaH6zc5EgzTnWGIDB1zucVwD5PiZ15GWZSMWjhSU2YMifmGmyYi6qah7fFvnnJnhy8z1WgJvSHOBOnA9pVe45BEWCALSIKMwtL534WYZiNGvcWRBguURF6M5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro71b+qWgalI0G4eaX00horj26raLdqQhPH4AiuYgSE=;
 b=SQQ7F+CavDVpuJd/W+TDPtE5LGJLNCOXganH/PQGFKO5AdmPaeuRmwKKKqKPclGhtpPydxl5Bjf7RkBRfwBdKyZtqZOvF14T1dyqT/vNY5KOwgb1vO6MHiVp3DmsyN8GOPADFo5kQvDkgnLaNIhlKEdelICu3PjOjOJdCyAlCdO55Pqz4zAC2d/ZPowOAHo9ANUDsevpmQO6NDEyX9UspsD4y0ziBK71u4Jk7wowW726wSpu8YucPgoyVngL/fCrHJaUr7BJbOtw+U7Um4wl+hITTNsk5IWRXsYabFI4wA/Sp0FVW92fo63oeMgLlYGw29BfkGJRJ7qsUonv4MfhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro71b+qWgalI0G4eaX00horj26raLdqQhPH4AiuYgSE=;
 b=D1/rQMSIivem9lpYLGYW8DQe78Q+SqZJ3ky2s4ipicfKLpLhxwju3lektzmS6WGCUUSZ9A+9fsEkTfCO3rquQaHZwSrF/6xOMLKzLV5uUM5lDxNdWCpFI1BEkcC4oe9QhcTdQQ8bwVbIUaAjJzFu2DlGTffyzrzAwJ1xR/x7ErV1MtfeO9GseFAPXJQrR38Jv27CPIOGKWMWYDkOblhpujHwuwe9XXO2/RZ/M1SJieAsbz3lRTwCeUIMaIyFlLnPZ38XqH+PKogw9G3HthoLOJMdPFsCWaWVfnlxXK/Dhhs01rJ8CvDIfnCj9d59YVhBTeU9R9idv3xFHvt6vnxWfQ==
Received: from DB8EUR06FT017.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::43) by
 DB8EUR06HT129.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::150)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 14:03:34 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::49) by DB8EUR06FT017.mail.protection.outlook.com
 (2a01:111:e400:fc35::113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Tue, 16 Feb 2021 14:03:34 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:A0141AD6E285F5E20701D45BB24D23C04F10E4494CFBEDD141D80F77BD3BC138;UpperCasedChecksum:65E01314D7A613C8431BE81161780B41A9C6C048656FF593C8A2DA35A89E741F;SizeAsReceived:8633;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 14:03:34 +0000
Subject: Re: [OE-core] [meta-oe][PATCH] catch2: upgrade to 2.13.4
To: openembedded-core@lists.openembedded.org, patrick@stwcx.xyz
References: <20210216134331.2473571-1-patrick@stwcx.xyz>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46427D7AB75584EE2F517F3BA8879@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 16 Feb 2021 15:03:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210216134331.2473571-1-patrick@stwcx.xyz>
X-TMN: [PRMD8LIwvqyN5ZfZdb6WLCMfFTjBnAnV]
X-ClientProxiedBy: AS8PR04CA0061.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::6) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <d53947aa-430c-ec5d-4652-120cf0e25284@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.84.106) by AS8PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:20b:313::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Tue, 16 Feb 2021 14:03:34 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 90c98b50-bdd6-4ac2-de0e-08d8d283a646
X-MS-TrafficTypeDiagnostic: DB8EUR06HT129:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F4WxmpvxRD8y+o4X/eS45tFpV12Xj3sF6+tYuf2AHvBEYGv8LLHCojT7DQGuCBhOj9hl0nRAXYajW6kD1o8t+syyxPQeyrgjN4Qp6Lp6nWgtF5MIyVnjRJqsnjCVttvrgIGrUuFKHY3m3W/1x0dWvDhBhEk82HAB9knuQRVkcCu9uFQJQyAvH4qBnWyRX7VMqYnfaoBP5xF6SyRS1H74Dk46in5uhx3KzJ2h49ARTSgx7czU3QKvOVi+ridSOOaAnXfgSnz6fQR5vN8evz4PHTTfeY9Y+Rmimb8P4ND7Dv+tuIqtX6Kuf34MkAJvr0xNk8qlsyZpME16leNLi9Za4v72yGC7Q4AZL4BeGs+Gf3qKgsv30dgI+zS1AJKqBtb7fomdyhsMRNjn9WEobk9uv0mQBc9wtMfFPH9bBWEqSxI=
X-MS-Exchange-AntiSpam-MessageData: 
	r/nHgFxtAAt8NPBVfUni1DLSN4hZIHtO+pLS3EXoTuoVWwr3fNnMgApeJi+qvGAxOmBNNjAKfOGHxAiNeF2GZWSb6RwOPbO0IwpHppmRHCrycfDtN7Rt+bTohg9c9bDc5fwctMc/CKDz+lhLrvPeaQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c98b50-bdd6-4ac2-de0e-08d8d283a646
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 14:03:34.8332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT017.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT129
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.02.21 14:43, Patrick Williams wrote:
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>   .../recipes-test/catch2/{catch2_2.9.2.bb => catch2_2.13.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-test/catch2/{catch2_2.9.2.bb => catch2_2.13.4.bb} (84%)
> 
> diff --git a/meta-oe/recipes-test/catch2/catch2_2.9.2.bb b/meta-oe/recipes-test/catch2/catch2_2.13.4.bb
> similarity index 84%
> rename from meta-oe/recipes-test/catch2/catch2_2.9.2.bb
> rename to meta-oe/recipes-test/catch2/catch2_2.13.4.bb
> index 57fc935f77..512c00681f 100644
> --- a/meta-oe/recipes-test/catch2/catch2_2.9.2.bb
> +++ b/meta-oe/recipes-test/catch2/catch2_2.13.4.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
>   LICENSE = "BSL-1.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
>   
> -SRC_URI = "git://github.com/catchorg/Catch2.git"
> -SRCREV = "2c869e17e4803d30b3d5ca5b0d76387b9db97fa5"
> +SRC_URI = "git://github.com/catchorg/Catch2.git;nobranch=1"

Wrong mailing list I suppose - this should go to 
openembedded-devel@lists.openembedded.org - and on a second note I don't 
think using nobranch is a good idea - the branch used "v2.x" or is there 
any reason for this which isn't that obvious?

> +SRCREV = "de6fe184a9ac1a06895cdd1c9b437f0a0bdf14ad"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
> 
