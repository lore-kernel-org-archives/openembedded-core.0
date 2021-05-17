Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.44])
 by mx.groups.io with SMTP id smtpd.web11.17149.1621248323541345385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=k22tclcT;
 spf=pass (domain: outlook.com, ip: 40.92.74.44, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCIBynj4Id2sf0yH7dyBxxXxVT9ooBcIBb6bcyxlvgqVEb8XMepvPXi0kgHJydB6plpe5KLcxTQ8/WbbIIYZIVYgcwfjTCQ2QkahSMTVVFuxIAPLGp5UnvZdBzitCKlpK7Kd6oecz9tFCaH1pVCiwzzJgUBLn7iCxTk+Z0ggkPS+l3oX4XszDTCqXjn8zEfBe6sTpp+NjJdkjql8vd2mm0cdwXOEVFycUilbXlD2aVtuEEwQuf2OhJW1+AydmA2/iIqzX6ZD6grUq+B5KgUprK0ZFmwuGDMuxLQDflDLecSIaJploPIi+E1Ub4U1ZxAorYSGF6kNCUg6O7GHjw4A2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIk75v/QT1ny1kS6QXh85wMFwlW3vlVejK9waH9VqHI=;
 b=G8GXeenoqCQfjxUH+Tatu0DZDCR0eQOp16VIIvlB3w0qa8n5WyhM2XSoDjKRwgWklRpAi2DwO0aRnt78qjSErG7HQaCp/FiYSBVvPTXEAkHoSPjHb4CZNJSpSWsSnecSSEcXUwXIPYjY1vmxnHv+vBRXQpFwPBvhwoU3YLLw1s2Xf/B9LqURCYOp5Nt1ZYjvY0G/6VORmEOTOH48IzR1QfBZGUCgm8c2BoSa/yy2dT8aYHCTbx2UBmpRvUfKnde8o/r8tqxod3UR4texXrsFSqp0pKxLB7eQz9QTz7KgrcTlCXdyVkBZHU5SpVdktMQTrvbGqaRK2Z66E41FavJAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIk75v/QT1ny1kS6QXh85wMFwlW3vlVejK9waH9VqHI=;
 b=k22tclcT/GyZP99K0S1SxeMR6z4l9caKKTvtVqH71Vy73OdUoTwKoYdlWJOWJ3KgJnlq6FWJRB1TNRUAQcurKKePnNRo/5AlGTiCUNZQjQauqG1/R8XRdzolAWnyjYCKR3E7c75G8jPemvFL88F0qiMSbAV8hAUP4c0nyOa20c+OgRqpHeJZpXZg5HX+/HJ1bAMNaEFPHBrlwa9tDU2Fq7I11f6dZYvk2jB/doe+9+j9ZQkWlGlqIBeG8pRXbswmPgQRlLjwjW8iXhLVBFHmvABlw2NVHN0woL6RNXnj0rISEsHDUQ4mHv6CDLWdeOD5KwcrVLshHC2pPKwYXUbzfQ==
Received: from DB3EUR04FT050.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0c::4a) by
 DB3EUR04HT110.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0c::349)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 10:45:21 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0c::44) by DB3EUR04FT050.mail.protection.outlook.com
 (2a01:111:e400:7e0c::296) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Mon, 17 May 2021 10:45:21 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:C5EC6F5ADCD671E5A85BB1BB2E146A89E741E1B7678AE2E40BF6E19894C66893;UpperCasedChecksum:1CC135529CE7E94C4BDB85EFEFE2D7CA90C5A4A2F10E234850DBC63024E546B5;SizeAsReceived:8951;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 10:45:21 +0000
Subject: Re: [PATCH v2 5/7] oeqa/utils/qemurunner.py: Enable self.use_slirp
To: Vinay Kumar <vinay.m.engg@gmail.com>,
 openembedded-core@lists.openembedded.org, richard.purdie@linuxfoundation.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com,
 vinay.kumar@blackfigtech.com, alex.kanavin@gmail.com
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>
 <20210517103528.24434-5-vinay.m.engg@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642246EE6E73D9336750BE7A82D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 17 May 2021 12:45:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210517103528.24434-5-vinay.m.engg@gmail.com>
X-TMN: [rrch6L0gl7oTZLyckzCifZLXZ4yYFyTS]
X-ClientProxiedBy: AM6PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::17) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <4d8b24c7-83aa-aacd-8d8c-9f806889706b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.93.83) by AM6PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:92::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Mon, 17 May 2021 10:45:21 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ca808035-a53a-4970-8aea-08d91920de9c
X-MS-TrafficTypeDiagnostic: DB3EUR04HT110:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OfBPZkOZmESFWGH+G2ZCkCT7YgsSyjkTA99L9YdK//lH4R/6nm6Xw7kTfaqmQAaWCB5rQ1PL57ywsqYhPhKaQdM26rcznM7W9zf+EtHsiy6H4b4YaPcytgwkfU7t35utP0l6SocMaamb7TqF9aQ87J4+2HJc/f9FFIjXg6mktwCM78PmQbE1+ZPl/wpjhS3kYB3vbh30+4zg5dcc5tZAcQY8ya4gANDWOtHLMh8+CLf8qNiI+JqO8YQDO3wDrgWwn/ldXNoFhf0Q09tW1tjEKVLcbfzTdf0jSDsg7FlZegjifqbSlCsiby6/cSWPD/PF1xrp7jIzq9YHlQ+BnSK2FR2JDYNnF49CB7CS60glYOgooyoK4CbcEdjsA/LNJs/K
X-MS-Exchange-AntiSpam-MessageData: 
	tajDhRYeoMara+LrIGsz0iliHdE9wxcrWup6QwCfxIRkvSgtZHn45f4+6nizsM8/XCjo6m8gpuXnlT9Cq38LKmRzTD9qNGV2JTUwnFqfRJ4vbGOL2KnWt+IaNZfqQO6OvOh2cVXvoiNSRjxdLID8Pw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca808035-a53a-4970-8aea-08d91920de9c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 10:45:21.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3EUR04FT050.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT110
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 17.05.21 12:35, Vinay Kumar wrote:
> The qemu is booted with slirp mode. We are setting "self.use_slirp"
> as "True" to avoid the error during qemuboot.
> 
> ERROR: Couldn't get ip from qemu command line and runqemu output! Here is the qemu command line used:
> 
> We are setting "self.use_slirp=True" only when "slirp" is passed
> "launch_cmd" through "runqemuparams".
> 
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>   meta/lib/oeqa/utils/qemurunner.py | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index 77ec939ad7..13abf6690d 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -184,6 +184,8 @@ class QemuRunner:
>           # and analyze descendents in order to determine it.
>           if os.path.exists(self.qemu_pidfile):
>               os.remove(self.qemu_pidfile)
> +        if "slirp" in launch_cmd:
> +            self.use_slirp=True

That doesn't look right to me - AFAIK slirp mode is activated from the 
outside (by the class constructor) so it's the choice of the user to 
enable slirp or not.
With this change a launchcmd containing 
`image=this-is-a-non-slirp-image.tar.gz` would accidentally activate the 
option.

I truly think this should be only set as part of the init() function and 
not at this point

>           self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
>           if qemuparams:
>               self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
> 
