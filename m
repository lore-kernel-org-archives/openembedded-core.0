Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.84])
 by mx.groups.io with SMTP id smtpd.web11.1679.1631643884499110076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 11:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=c+25m2aG;
 spf=pass (domain: outlook.com, ip: 40.92.75.84, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvgtWNrPZQAkBp5JVq8mE6gtv8WXbsscCIdyb8RkcNv+wSVYsZzo9Cd+VB/oe1r5DHOr+ujV8oCEd7RKhUtBRiQqZ5gTI+vRYmhuVkcJ5XgLu7GMwsbaCLpNX8RP+QuLBHbqr6EWH+nMlq8DAs5c9TsV4655GesbY/gu5/IR8EPE3sm6vqBOQX5Xeu2BCk3xsRHAjnxZGknvWUCQshkwFmKH50c9VuXyRSSzEmYuci8hGQFIMRj5ZU7JAA2xOU7Q5R82p+jSkifuLnzxhhHwRHL2oO2xo6NkqRFtFCyy/dYBqYG1QjuW1OVy7nRMPbp3zOOyyoB8j0updWQUp4bDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cbXanl+BsHhhfZajigE+wk/Q0vBurCugIOXn4eUb+0o=;
 b=doE0Qjyf8r1dux4oxzw80MU9y3jMMzJbOSTuuTmX3y/Q8zxcKjW0FvrMvqUmHBBfmwZIyG+IHXpiWVzH/ico8qoki5mNl+9JvZdMoFxe/a8hVRyWUbQkFYzceLNDCkuQfqcFAI07vZvgi8DD97porCr2radyiI52IvX8hFERxKvwxc9ohaTr7Mz3l6diEISra820JVLNkCuP8TxwjnDnq4Ndu4QhPXctXR0f0dRrIvfQc380HSfGHnIBXVgdxoA/TXRUZwyChQyIJRkky8wCRdXhOZxv2c+eF2rR9NDyU6LY1Thz/NaH0rZ6vQ50qYroWNCOlQwAzTAL9jbuZ4M4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbXanl+BsHhhfZajigE+wk/Q0vBurCugIOXn4eUb+0o=;
 b=c+25m2aGapdtat9/7S1h44u0hs/zkfCv/2JmODoCRI16leCb08K/+VA/xlqu1rke4coUhqTgy9KEe+RLFjnn18xP8JW0G1uEsBdADz0cHfkj/AsBNS6fQaTkdHeYWFMJEGNDkcxwFXlb2WEyEPmDElWDLPbjVGvJ/xxRRa1/jre4UHtuUVCgMmlDWYyjms+esTa2uaeIMTESvrdSm6molxIK3bwiqWTGa8q1GRSSubIDvVxdQNhmGJlel45IAorn0a1D7G7itS4UOTNkw0SXyv8lKcyymDNaADmwVdgV4xYc5bnxDnoXOrfu5aVSvonsRAGKEZFtK6Fx7QAW2dmkRw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3921.eurprd09.prod.outlook.com (2603:10a6:208:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 18:24:42 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::79a5:dec1:4b6a:6e33%3]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 18:24:42 +0000
Subject: Re: [OE-core] [PATCH] create-spdx.bbclass: Search all license directories for licenses
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 openembedded-core@lists.openembedded.org
References: <20210914181115.28873-1-pkj@axis.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464295BE11528525CCF2D962A8DA9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 14 Sep 2021 20:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210914181115.28873-1-pkj@axis.com>
X-TMN: [mIiWZUw1GpSVraA4IiK5D6r223h6ZGVlLaKoJ+KhnJAWKb/VfrHqPw53vRU3TuCM]
X-ClientProxiedBy: PR3P193CA0036.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <8d3e6319-85a6-92a0-f4ca-9ba44be0390f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:a1eb:75b:510d:e742] (2a02:8109:9a80:3b94:a1eb:75b:510d:e742) by PR3P193CA0036.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 18:24:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf2f33a4-1e2b-43f3-1de0-08d977aceb77
X-MS-TrafficTypeDiagnostic: AM0PR09MB3921:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gp12QF1v1xvirwwMOvZScOnqdFJq6U7aN9+UK5IZvX7sL/WJHuwErPJh27iKyBguUl9akPgfNH24v156iGVVMKDTrCBTaIZnDze4EMdwxSFJJOvSVVc61ylvi2RqL5+TTh4lUu0PQRZGgQ77s+CyywvTwUjQ7DICSCjMIkh2IKJWjxE0j/EGMEQv72hUWczBtFs0g+C+CaOwyoTw9pas5UhhaCo77gn9/ChQVRi/8JqZjTyUI5qjOpohOLyJraHAiXCHZ/7D1bkawieUf4xuindhwtuTFGsg6VeDgsLJK6soK7v+MMntykfLCtHa8a82r/Q8BLSpVG1GtCglMSuxIcU7ezrvFOypqVdjzcEwAo+b24UMfeqaGURd2g7uXce3v83NzNwJr0YT2/bRb2iDqR2Il5rKgoTlHfwDQwozJU2RlCARj0rk9qKSzYpw0cimgAsXpwiUIgZ7fYFBB/Bv6jCoAJups94xQsWLO6iJTDY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UfHsLguCSPdIYgDREqUtd671S7W2v2aCXSTIQiMUPqPKPXkLrIYOewhskLYyf9F1FDXR9b85IwX4NQj3ne/wrP1clTANX+Njp4sDnNLzGXsVX9l3GmCYZ93jG0MeAUDo15icX9tJzWYj8dHd5gh8EhOanBV2TOE9bPWPnuTXB67qeLyUAje5ETkck1AjsrmXlxTWMSQqDsX7q5G2BHmFEQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2f33a4-1e2b-43f3-1de0-08d977aceb77
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 18:24:42.0567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3921
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 14.09.21 20:11, Peter Kjellerstedt wrote:
> Before, even if the code was seemingly written to search through all
> licenses in ${COMMON_LICENSE_DIR} and ${LICENSE_PATH}, it would
> actually bail out after only searching ${COMMON_LICENSE_DIR} due to
> the exception handling.
> 
> Also refrain from using f-strings.

Just out of interest: why that? - I think with the recent bump to python 
3.6 as the minimum required version, there isn't any technical reason to 
avoid usage of f-strings in the class code

> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   meta/classes/create-spdx.bbclass | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index db85677d4c..3c73c21c04 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -67,6 +67,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
>           extracted_info = oe.spdx.SPDXExtractedLicensingInfo()
>           extracted_info.name = name
>           extracted_info.licenseId = ident
> +        extracted_info.extractedText = None
>   
>           if name == "PD":
>               # Special-case this.
> @@ -78,10 +79,12 @@ def convert_license_to_spdx(lic, document, d, existing={}):
>                       with (Path(directory) / name).open(errors="replace") as f:
>                           extracted_info.extractedText = f.read()
>                           break
> -                except Exception as e:
> -                    # Error out, as the license was in available_licenses so
> -                    # should be on disk somewhere.
> -                    bb.error(f"Cannot find text for license {name}: {e}")
> +                except FileNotFoundError:
> +                    pass
> +            if extracted_info.extractedText is None:
> +                # Error out, as the license was in available_licenses so should
> +                # be on disk somewhere.
> +                bb.error("Cannot find text for license %s" % name)
>           else:
>               # If it's not SPDX, or PD, or in available licenses, then NO_GENERIC_LICENSE must be set
>               filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
> @@ -90,7 +93,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
>                   with open(filename, errors="replace") as f:
>                       extracted_info.extractedText = f.read()
>               else:
> -                bb.error(f"Cannot find any text for license {name}")
> +                bb.error("Cannot find any text for license %s" % name)
>   
>           extracted[name] = extracted_info
>           document.hasExtractedLicensingInfos.append(extracted_info)
> 
> 
> 
> 
> 
