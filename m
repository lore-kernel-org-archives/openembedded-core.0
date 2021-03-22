Received: from EUR06-VI1-obe.outbound.protection.outlook.com (EUR06-VI1-obe.outbound.protection.outlook.com [40.92.17.86])
 by mx.groups.io with SMTP id smtpd.web10.663.1616433457447635282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 10:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=IlJzreBC;
 spf=pass (domain: outlook.com, ip: 40.92.17.86, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWwL6FLQKszAPCC4/1i45uoVjj/iVqRUQiAlHuNVC99jvC/m9NESRzpwEs0oZClQ5/NTQXZhzQFLxsBKXkhglf3nxgFq7umKIjySOY+uMlGFhT8JKwsyERnb/WHj950yaMnxDWJIwUM4aY6kl9M3mV5Jx2kV8e8BuvoKMAgehLkoY5IgfT1DzLciY1ejyvq2dxNKMzM76q7NvRuYYFdJ/4s5wrgE60jsENy6wGOH6NZ6ejY3DS5EEeaWrdl/u6loCzsgKPWMqyQkhOyJaXQhzvzDGdTMdwK8gyUF4sAkQNqEcceCQNRI5FQN8TfLb2+/FhhwQJQDKGoYFwkhbN0qYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxd2BNJWoiNp7BC8PQsm5Z2ZHnoMhbX6poHkhZWezvc=;
 b=Ll5TCiM9NIXqrS0K1g5tZemMU5UVyeR0sW8ZOiyfEnG108zSsvgLu5He7yqJEBTVsmNqViw+haNLd2orjiQVqWUAcxGUBuNw3uNCmDMicY66j0bg0Wx8TYVyEIe8VYseStRc7XuNXPYM9vosgWI5HPb/wgzO5WZNC5y7RbWiTfjdYXv8llMG4c6M9YEHpXHqd4CYOSDUPgUMKYRGkz4YLX7kHUecWvQMbL+NuiX1tJcQPcp8QfwZ7SFNn454jkQcGmdK+pWVfjzl8KwTsANb297dFfSRi3oUobIYL8smyTkpqcVAbuXLWz23OwGZBa+zxcQzcGSWAB3wTmuwE4sNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxd2BNJWoiNp7BC8PQsm5Z2ZHnoMhbX6poHkhZWezvc=;
 b=IlJzreBCZsJSVHT5C37Muso5tmU5E29aBWMQldiubEnWafjbzKfhJRFcOBcjALEltlFarujbCu3hB7F4K9R8OvIqhg/DkH2wjXCIJpCk8WvtVP5Z4KUjr3x2JMkL6ZeFb8q3W10Uhjam/kMJq6cdDfLIBXtjAMhwhFvEyQ1s40R+T+nNeGG5Z+wkZI2zxmPQ+wwoiZB8X3bA+9LFU83Nmn6vHbP8yExUnEvCSU/SsTaxzQinwzWniWAfRcSxMw/hbESN5s4HHetvzIlfE+Ja9AZjJJ7zAkaRyV94UhnzOsJ1Cbm9h10fzIqJv4lB1RmGx1NXjg/Moh9PUjOUiUej7g==
Received: from DB8EUR06FT052.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::51) by
 DB8EUR06HT138.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::102)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 17:17:34 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::4a) by DB8EUR06FT052.mail.protection.outlook.com
 (2a01:111:e400:fc35::482) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 17:17:34 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:79D2C9628649465F3A93C553E7E643F413C79D3D979BB6657A8977CF6D238158;UpperCasedChecksum:D3F617A49656B43EADBD4359B9CC18CEC3F2F7668650CCE6BA90B490F5189381;SizeAsReceived:8666;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4%4]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 17:17:34 +0000
Subject: Re: [OE-core] [PATCH] go-helloworld: disable module-aware mode
To: openembedded-core@lists.openembedded.org, changqing.li@windriver.com
References: <20210322032330.32959-1-changqing.li@windriver.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46427137B32F88645D61AE53A8659@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 22 Mar 2021 18:17:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210322032330.32959-1-changqing.li@windriver.com>
X-TMN: [AkG6VWC0wkRERx3fE42nQNuDjITqHV99]
X-ClientProxiedBy: BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::18) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <f6b836dc-4f87-c32f-af3c-e2ef628863a8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.91.211) by BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:14::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 17:17:33 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 582fb87a-956b-47a0-1d46-08d8ed5661e7
X-MS-TrafficTypeDiagnostic: DB8EUR06HT138:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r5wZDDkt8VMG8Edns8w1m4QOO8zOTDPEe3zogdalVjyQ4/9UVaE85IABwj8xOS3Srn8y4wpUbb4b7p2VtNEpLIuOUhfbJ1iw9ZOnWbAW6GgAXjUs24YI57ddxzpUYM4YSQ8D1vHLP6P78a2f39LLNn4dkj9MIKCXItYvtPThldZ/kpxh8y6BIXHq1RRsWFjazt1KTn9+JRBdHNZ6eNjdPlmoUTN3fg6ZN0WUVR2CXfe9oq0GSGVmOoDziOJoUYwOzJ92/ZsykAZwQCf7Lom1tKRGzI2rqIpsSe8EzVvd5NAoEEBJp2BeFIpeKuqwi5F51jr69redaB4eLi5dpTKhupP6g2U7oMGqeQFsQHOYt86k4aY1ic4y0Obgt4mbFv3fDaZJPQseqyu38n68CL0/i3C+7OMi7MEbjBRFimvzGRo=
X-MS-Exchange-AntiSpam-MessageData: 
	WVvhHKJF4q70w+/UY7WYOmG403gJa/Z8gN/tP+O4beCZWH9GGRk3+UWLAWW5hJvSJMYc7fwmUBoBeD3IXXF/wvmg8OznGYjBHMnZb6PPaZgSr9fZIk6LY+SXXd3/I5rJLujgb9BZVsS6Ia2uzjBYDQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582fb87a-956b-47a0-1d46-08d8ed5661e7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 17:17:34.3927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT052.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT138
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.03.21 04:23, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
>  From go 1.16, module-aware mode is enabled by default, regardless of
> whether a go.mod file is present in the current working directory or a
> parent directory.
> 
> Above change makes go-helloworld build fail when doing offline build or
> proxy.golang.org is not accessible.

I'm not a go expert, but I understood the changelog [1] differently and 
IMO export GO111MODULE="auto" would restore the same behavior as before 
the update to go 1.16.
And if not it would make the whole go-mod.bbclass somehow obsolete, 
right - so it should be removed, or at least a sanity check should be 
added, that the class is not safe to be used with BB_NO_NETWORK

[1] https://blog.golang.org/go116-module-changes

> 
> This fix is kind of workaround, as from go1.17, GOPATH mode will be
> dropped, and GO111MODULE is ignored.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> index d3f7525dc9..c51f163e9b 100644
> --- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> @@ -6,14 +6,15 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>   
>   SRC_URI = "git://${GO_IMPORT}"
> -SRCREV = "bcf50bfd7dcd8020c90965747d857ae42802e0c5"
> +SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
>   UPSTREAM_CHECK_COMMITS = "1"
>   
>   GO_IMPORT = "github.com/golang/example"
>   GO_INSTALL = "${GO_IMPORT}/hello"
>   GO_WORKDIR = "${GO_INSTALL}"
> +export GO111MODULE="off"
>   
> -inherit go-mod
> +inherit go
>   
>   # This is just to make clear where this example is
>   do_install_append() {
> 
> 
> 
> 
> 
