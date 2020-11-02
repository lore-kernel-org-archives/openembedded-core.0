Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.99])
 by mx.groups.io with SMTP id smtpd.web08.3665.1604344929758390074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 11:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=K/X3kygb;
 spf=pass (domain: outlook.com, ip: 40.92.68.99, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlSKB5tJs8FmpoUS+5jN3v3zR23119AumEdHSwEwl/2vAXtxuYie1++Iom3L5PU/tjzYAd6EZPX0wmH7GKejCcFEI4p+HrVGEjTd/NAl5M+KHo3F8iDVdebzywfBuPPkTaN/mwTsZB1dcsfFy3GIFhDSRJA1RAyMEV2vxQgkNcsRRsRHZ3BByxoC2bcmb+TNwslgrmYAcdTIL1u9Age/doz36Ni+ssp1mjwBu1iKosOWKcZdE1VBChq8EXj+m9Gtfxuf7PeEPPhArRGMVLjzROCu8mjztBps1GqF4RX3RTQakQKoC3PL6PCEvpqifRWkFdHWdROEZR/MyIKcFaptGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPukPP5MDbJOwTUK+WS7dxBNNRXWXSRvUtNjV/w2LnA=;
 b=g4XXCH/NEj6xH1WbgaiUXJ/xTTKzLbPUqt7xenJEUsbZtxaxrqC+R+mzQOlV/eLMOkdXJzo6sIm677t0CNZ1yG8KXaAu0D7L0TUKVa2K22sVz8xqEUgz/QH+4VH7FQnCbOWqCUUI/Ip1WeXPfemg4PVU6rs8ED/9kKwPlzvwnr4158G6Xx/LVXsNLbFYVOB1obWlv6bB9SAZsHx66jjRjPjXw5YL11gi07KNfQmf0GUoyzjYO270r1X1oFqNYfBKrlCkaOWYGTecrKFQpV+TakZ3GFejR3P5fGTdPjDqEj9JUEq/FjMgDImS1MWzz0NiPxqKgKOlJtcH1Dt93AQPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPukPP5MDbJOwTUK+WS7dxBNNRXWXSRvUtNjV/w2LnA=;
 b=K/X3kygbB2NSqZVRNkHTOw4+dnl0ZVap5poxZNMUPrB4f/kGLit3qDZdkfJ3HIyeCzsSx+voiycKzzHiF4DEk5+OOD7Pnf/4j2BGB50PMAB0HSoRlwv6QXi49pNzU+KCDoOxFADm3V+JUmCxhzNM9PGutjdzYTH8Qcsbh8Q3l+S78q0XjwvucIHnBv5xcfoG5+DrjHrAdgihGrUQKFfrT65ejrVX1H/yEZORbwNtiwCytmeoI+dwWyYwObYu7B+vwIrnfMO7wZU9c2ig4lQ9eXfpA6sKP2wl8y7OJgHAvQ0sZQmn8JZtf8eVQnC8LMoMDivE0zEUh6KiH+ZXj7YdqQ==
Received: from HE1EUR02FT032.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1d::47) by
 HE1EUR02HT080.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1d::343)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3520.15; Mon, 2 Nov
 2020 19:22:07 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:7e1d::48) by HE1EUR02FT032.mail.protection.outlook.com
 (2a01:111:e400:7e1d::135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3520.15 via Frontend
 Transport; Mon, 2 Nov 2020 19:22:07 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:AD95B770E75E1E6AF0E05AB4D5409C543ECEF809469BD5DCF1E54145AEDBAD66;UpperCasedChecksum:E8F551899BCE5965614EB3C0B531605365E18B0B00AF51B82B3445574CA84C86;SizeAsReceived:8761;Count:48
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc%8]) with mapi id 15.20.3455.040; Mon, 2 Nov 2020
 19:22:06 +0000
Subject: Re: [OE-core] [PATCH 2/2] systemd-serialgetty: Switch to TERM=linux
To: openembedded-core@lists.openembedded.org
References: <20201102185921.65148-1-jason.wessel@windriver.com>
 <20201102185921.65148-2-jason.wessel@windriver.com>
Cc: jason.wessel@windriver.com
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <VI1PR01MB6462DFFAC980A40F8A084D6EA8100@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
Date: Mon, 2 Nov 2020 20:22:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201102185921.65148-2-jason.wessel@windriver.com>
X-TMN: [ajZ2JM2OL9iPTCY9Use21m77zRiqwvsX]
X-ClientProxiedBy: AM6P193CA0073.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::14) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <9dcf3d3f-c9bf-6af9-2999-0653883ebc03@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.92.169) by AM6P193CA0073.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 19:22:06 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 0d3f8f7f-2d05-4cd1-c002-08d87f649633
X-MS-TrafficTypeDiagnostic: HE1EUR02HT080:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Mx8tx0zlk3P8tc6ftzncghK9KktUSMd37wqyQegr/tznCctamKGMd1iNNkkmi/ujOh5f76QBuTAUmZf3eRZTnhtSUOTRggMMY/qVTbRntTggcqYN7khII5LVP4eMyCWmZxMOlm3mh6P/Sji3PyssHlbI2eG0EiJewKfcWufA6vXUZPdph58QkihBvyVFJNJI9OCMCJCw5Xl0ut8Qy0Lq7gbBepAWf1+YRXVu1/1eWcQcSCj3DqXHKeLSuqI+nxQ
X-MS-Exchange-AntiSpam-MessageData: 
	KHV6gbC09e65iuf4HApKv+vPgUXXuBwfxnell14hQ08Sb5spgb2pYuLkn+lCsKRYTdiMlmOP94ZYdCKZ1HW9vM0evT+3CyCn6sJX/EgkcnFWj8E1iAOv8WDlbGZurR7xSAboKtu8P9kxd1+cW7ufOw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3f8f7f-2d05-4cd1-c002-08d87f649633
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 19:22:06.9283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT032.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT080
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Why not have it configurable as already done with BAUDRATE?
Especially as it doesn't change the behavior for user without the 
mentioned prerequisites

On 02.11.20 19:59, Jason Wessel wrote:
> Long ago in commit 473ff65c2f69de4ece3204fadfae7c5cb992149a
> (serial-getty service: Add xterm as default TERM), the xterm
> became the default for the serial port terminal.
> 
> Using the version of vim.tiny in oe-core master with the
> serial port connected in xterm version 322 (which is one
> of the most widely deployed versions at the current time)
> causes artifacts and missed characters.
> 
> The example sequence is the following:
>    * Start vim
>    * Press "i" to enter input mode
>    * Type "123"
>    * Press Escape to enter command mode
>    * Press "a" to enter append mode
>    * Type "456"
> 
> At this point if you are using xterm less than version 535 you will
> see on your screen "12456" instead of "123456".
> 
> Changing the TERM variable to "linux" will still allow you to have all
> the same functionality with colorization, ansi character escapes
> etc..., but will avoid the extra xterm specific escape sequence that
> only exists in the most recent versions of xterm.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   .../systemd/systemd-serialgetty/serial-getty@.service           | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> index 549d566009..f2290639a6 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> +++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> @@ -29,7 +29,7 @@ Conflicts=rescue.service
>   Before=rescue.service
>   
>   [Service]
> -Environment="TERM=xterm"
> +Environment="TERM=linux"
>   ExecStart=-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
>   Type=idle
>   Restart=always
> 
> 
> 
> 
> 
