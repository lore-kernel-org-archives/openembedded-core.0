Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3E6C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:15:25 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.26])
 by mx.groups.io with SMTP id smtpd.web12.6369.1634804124578083607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 01:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=hNwh5d6l;
 spf=pass (domain: outlook.com, ip: 40.92.64.26,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM3EiDKH8QrzlwQRIMglYjUtYFTrTpq0zgeD3cqMyJB60tPlbP4OLrxPluJkz6uYhqkFuHP7k+AhhhfOOjktVPKpkdTO2eN0oPv02vxp5ao92o3iudigm/txz+S0AIaUeALPkA7WsPYJagQmhG7gAKssN5KLDU/GWaW0jVgxm/DsBpZNa/5qpTbcF+YcXNNI+ZyBF4ZRmq05wRTTunNngMZx+NraNv07+kSZmuiklZZtb7Z19PMgR4Cz6hVaE3fx/FSSCMzgdgnysPIOosXKK5OpOn5+XZwj6eiQ38lAGCJfOG5qn+s4PFHdEv6FKT1CyrjR+NOXlOiYYMyS8AdEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlcweXwkV0q489r7umUZtyGgWMF4uV2hTJvImCC95gQ=;
 b=l5AfSeKSL7HPbYo0IK75LHtmrjZ4aFxcB72TUnDLN2nBdW8nsdqPiLgdzpuzQx8R2P5YMdSxF5XPj6Sws5r/1R95RxQhcyN3E0XPNfYqb6CuW7JPU4mo66rPXjkTR/HxMVN8bJA0z/W2hv0tohmaRQMJ1+qvHWDK6xmZ/gMCKP5Zw/JTUS3G2vEkC4Y6N9LESHGNe04ldWf/HEY3FTCMjZ7iZ7i4wbJGN3/3Z9VZAWcCYkhuX5m4cDmdJrHjlWSxmBukbDeQDMTmHelHNy3XLxcbzjpfhbZ4ODBFS3Dc+H7I36IEuh5RPgKfQQQ6JHGEsOY4MZkkmI4QkYJ9hscvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlcweXwkV0q489r7umUZtyGgWMF4uV2hTJvImCC95gQ=;
 b=hNwh5d6lG+B6D35tcL/4Kj4cnIbqSHfvDNxnGNP+J5gQsqefyI6OjDCaz8d0tLseJaclfZuUGfe+lvkpBtDTqdw3AqUb5h9FxuNig4PivPkwCOjjXOcLpPwqWqMPacXVXXkOMSYQ3pfZwrxcjOFuG2SXltdHZMbC//STFu9Obh8OpgAZBEKPThia+pE5NJittap55Ah2nSjZLp8JKpR15foyRU1kDLufQNfO+UyNaMz1dziCP2+ZMmIuLgMlOa8HAc5YPcH0WleVl2a1Nhez/cGvfZqz1CQ1CUDW0hIaHxuZ+H59QPwodpH5G3ZcS7qTCFErghIHRYxAl6hG/SNjkA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4465.eurprd09.prod.outlook.com (2603:10a6:20b:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 08:15:22 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 08:15:22 +0000
Subject: Re: [OE-core] [PATCH 1/2] waffle: convert to git, website is down
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211021070242.16025-1-alex@linutronix.de>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642829AB7DD59DEB0524D6CA8BF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 21 Oct 2021 10:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211021070242.16025-1-alex@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [5LdZMFydB9sfkZ6cNg4AsXeuQ+HXbVw4Jmy50fBeRlHVcEHv61vo/EgLG12gVKOG]
X-ClientProxiedBy: AM6P191CA0091.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <e9b95489-2694-69cd-88c1-7bb87bcbf50e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM6P191CA0091.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 08:15:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03a658c3-ffca-4b23-abf4-08d9946aeda5
X-MS-TrafficTypeDiagnostic: AM0PR09MB4465:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aabRyQKZu/lNM0XSOnIYD+61Dc/2er60UbZdFp0tELJwfq2TL4Pa4H+6Dly9L3R/kmZfPr+1AsRN57o8AoOzACPk09A7ZgpQLS7apyMZXGra0A32opHu+toiOu+Z1qMKu2ZXArd7WdiuQbZYVXNekawoPuquMBKozKs/Cthut7G0tozo2kDqYJ/+9zBOvgRAosOD3EZ9nL16UBsMZdAxe1mfNCh/RejrgbhfcWjiUrpsONTFi8HFRcBYCZzyUujWewFLR896Q4CN995MK1tjcQUEmVyhrW+Fe7Z/xZvZQtHqXoD+/MezSHI7VB3AFRH8PazIc16hvYsPMqyJR0hMAjzjFkJSVtDso9ILdXJYIpE2/uYh+U5aIQgADr/PsbvnfCShRM8uPddmlgAUTUJhCISeRyrz1Z7tjUzW0bWLiFOetQREa61RT4UckdXpzeB06Lzww8CQ8CnhiDdAzRdmWeiVL/giQMukgIGNt83GPK/o8iOIVaCl1Luc4eSECCoagjKNMmJQQu0IE5n0cBK9F6dTXgOxU1DL4kyklUHf8CL800TxLEEo7veBX5/emmB6Q46GrMjwIYNazDg7JtiH8g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WA73aJAfBODR9rPNs/Qt/8DF7Uxtrrl0z6pU/zClnNmo3VHUFjq+QxjYAUgxHZfJehITq/14Kwnjbp0+QiBLMO9RLFvA0GsK6udQ7nrnSxGeAgz/AZ+y1JGMtl9lPTclDtkpcyUhpd2mtNlmwsssGZkWo/s3bukgiKv6O/zxXegKhpljGN0K50XhRte1yoKsicymElSz3N+gIi9XAgPXZXk9oWqL5XEfyqGrmOnQsxO7fIQXH7+XM/XaGahzTzKEmFKKvUIFfjuJDMT2HchrdNPmYEL3VCE5QPIoN1CcsapQVTYl3LJlG8Yg+zD9MRn1DpG3wNkNdeu0BRrxabn/0nROaeef9DMduOwycSdZ0Ygvi4mpUVnwKAvub4YcCF4cA0LQAkAtWjpLSKmusnwxrUvLxxiTltC2ymX9AGcAxDPe3CU6+OUOHM1NMs2n4JcM2EyYIl4pT1hD+/x/dtKFU6mWaihVX3zRTNGfF/XI1cuckxuSpHkysV9KZijFlJe4XqZhJgEqt5HpaYlxnghDthmSMywyd/Stf+LMMadAIxELNc09QQhLjWL/WoGbAY9VukphjYYHbfI+vUnzH9NwJ48jDdR79aUy6y7N0Hw7Esm6Nn731R0JSU6AHfqmNBS5VRUkG0ifypb6cJhHrj+m+BYsrA98an2l77mMASMCPyqhYiZbGsfpLUauTAWo8e8yOpVbcZ3qeCA3d9S87M/PPvyQA7snFo60k0CPkKoGLixK1ZLUWTbq6MuLrwVYFinSnkkmcoAmbnwW4MjmQ6+cAvz2zHiyicAT9i3M5VTwsY4qlhUyXKn0rVdO4HXfiZ0TROfFhHn6CFTmDBoxOg3wvH5i1aPJ03KPu2rTR/9bXRmGyRztRo1gsjQNWeHOIk4S
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03a658c3-ffca-4b23-abf4-08d9946aeda5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 08:15:22.6238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-UserPrincipalName: kweihmann@outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4465
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 08:15:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157276

Same here, the HOMEPAGE point into nirvana now, pls adjust

On 21.10.21 09:02, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/recipes-graphics/waffle/waffle_1.6.1.bb | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-graphics/waffle/waffle_1.6.1.bb b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
> index 395494018a..12984f5068 100644
> --- a/meta/recipes-graphics/waffle/waffle_1.6.1.bb
> +++ b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
> @@ -9,11 +9,9 @@ LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
>                       file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
>   
> -SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "c91529e579483f44fb330052872b9c73"
> -SRC_URI[sha256sum] = "31565649ff0e2d8dff1b8f7f2264ab7a78452063c7e04adfc4ce03e64b655080"
> -
> -UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
> +SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.6"
> +SRCREV = "d7e8c4759704b3c571fa3697c716279c26fd05eb"
> +S = "${WORKDIR}/git"
>   
>   inherit meson features_check lib_package bash-completion pkgconfig
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157272): https://lists.openembedded.org/g/openembedded-core/message/157272
> Mute This Topic: https://lists.openembedded.org/mt/86484338/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

