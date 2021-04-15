Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.46])
 by mx.groups.io with SMTP id smtpd.web11.4737.1618480374354930030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 02:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=C7YfawjQ;
 spf=pass (domain: outlook.com, ip: 40.92.16.46, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZoctxP5ANYKs4xWadvcDZxZS53tbZvWg4+f8moa7DnmKEI+V7G2yqWaybyI1MiWkg66X4APEdoiXVfse1Zr03BYgCUS976Qr7/i0wuJqM/AaNd+dBBJTlTGLqlkZPWoeAmsdIfvtnKiSZ3m7ImIqbael1ulSxiD0A9U5ThR8EufwYYv6iJx3diTfUMoaPjFE4yuwjV2QbPI6erAWKjzqcC8nnicX+kwOLXvocfZRVXKJmTsZ/ObxWCc4bpFwwW1msz5F6j9TEN7tMHLxh7EFte2z21kfGXSoAD7SRgz62iU3KOGaRE7rj6GeDTGek97GcZvoK1CgtUgiCp8gW4fEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=558YNEawHyMl8MLijtdMtiVXeUQC8hmvoRN+CvcXSkw=;
 b=Kln3EH2zEppe0VTxC+QVfQ9fX6Zha8knUARYEo6OTiAuh2RWqNNnf8uwHySVolXOo53iKfhnS7XVQjolhr5TEBIYuOU+/myqo/yYKZzO6xl8Zh3NSsxcIwNvTPq8O58MdXkDEHl5IRfIOOQ9Dv3hYLZPEVov0uVQX3Zesd5CeDregji6yt+Sl6wSeQLKHR3dmjSwKNNxtJpJGbz9eXBLDyG8jnzWVTfTxttAqEhMw53LQUo85K2igX08oKSEQdkJzrN43Lm38cTD/G1CaJNsd+xBfFtsDq+y+r3hBQPC6UBemPw+aA6AzvNhme4ArjUkmX1SJYdOWZkJYsaWCPMF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=558YNEawHyMl8MLijtdMtiVXeUQC8hmvoRN+CvcXSkw=;
 b=C7YfawjQqxr9gxs5fBOEyEckE3K80k0MHTgy5ap1NfL5+fzWsjGDJaxlKKaMLuSSrmXo8w6JJHWdn1aj647viTsgSWpB8P0wyBpMDDRjmhtv2KinUXwApoMku1ekuhRrVcW0uyCSWXzL8yInKZQm+INwmR18WZNq8hcqUwtAkLpH4yzgilXSUvz4iLhM+D6Q2Qf2r/ewkg+CMn7F3i9mrzNVZWlt6J+uzBeqmn3VczrrfCAZj7B+pgcfZNGGvvNds6YacXK6VEhFVM5NHLk39lMYYoUf3kiSJk6HH5y2Bq6DaYfcbR0+le2im/iCB3yG/ryoNVpfMH00oJXzUoaUVw==
Received: from DB8EUR06FT030.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::44) by
 DB8EUR06HT208.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::65)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 09:52:52 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc35::43) by DB8EUR06FT030.mail.protection.outlook.com
 (2a01:111:e400:fc35::316) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 09:52:52 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:EBBF7DEF06BF7E572EC621285F708CFB9432B63BFD5C2E09A012ABC12EC2DC6C;UpperCasedChecksum:B1B49E2E6A4FB7D14857E7D1014E6924E28BC4098EC3EF0A8E7808F13D27E10B;SizeAsReceived:8874;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4%4]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:52:52 +0000
Subject: Re: [OE-core] [PATCH 5/8] There are some error messages like, "error: linker `cc` not found" got fixed by adding "cc" in hosttools.
To: Vinay Kumar <vinay.m.engg@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com>
 <20210415093227.175608-5-vinay.m.engg@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46425FBA22E1F732F504C397A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 15 Apr 2021 11:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210415093227.175608-5-vinay.m.engg@gmail.com>
X-TMN: [n+MY9jvkKYNrKPUUbexAoDml5ICyILUF]
X-ClientProxiedBy: AM6PR01CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::27) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <a3c9a583-7dcb-a7cb-39c1-8e926c882a68@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.85.88) by AM6PR01CA0050.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 09:52:51 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3aed1c11-9363-4753-91c9-08d8fff43c49
X-MS-TrafficTypeDiagnostic: DB8EUR06HT208:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w6CTZ1PqCE+8oZdHu/npHVrhL0I76QsdMfInV1dQpGuUz66o600FxB/uFj0eKqfVseyaW1+/pqe/blIM2dVtDvnjYuE62wyz/y2WtyICpal+MdKYHf5huIKH6xEbBt5a2hLqzzTPhdUeb8OUECYQRqmqR8jDeqxJi7RiyNxTZw/JPixYm/iFj7Cvmpr16K1Oi+QGE0EVJaH1wv1AoMB8XJNboECvQjFq9tiOV+aqS6gr6K11/76uyU5ByWBkr0Lnpxcc2z9H1sBo27wAxVROJGTeTwoxFArG2iLx0ILj7A0kPJRrUtEulMZRC7m0Pq7FMYd0c1r+uWzHnUdVcjTKDlwFTcz+VEzNK4Xgm7FUOQI4gS0irQ6f1XOEJzDpXSMDX2dXVjiwuBlT1E/aVmwa4rDakuyDRsXUJy1+vYXpO/oaFLZCrcpd4vc/zgF0WKzv
X-MS-Exchange-AntiSpam-MessageData: 
	ke/yYACP6B/acEPMyjCKgqTrbL8GxA+VGDknOas5sQJAe7IuuvqR/EAOCvSp+dMWdkKN0WDNV/ws5em/ebwtzhGaijRiQVo9r80ptGMuG581BTXpKiD34K38ZtMDSHnKKkzrcAKtPI8GhibGpy/WwQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aed1c11-9363-4753-91c9-08d8fff43c49
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:52:52.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT030.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT208
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

That doesn't look right to me - or it's not properly described - IMO CC 
should be picked from the recipe sysroot not the host tools, otherwise I 
see cases where cc silently falls back to host sided cc even for target 
recipes.
Instead of patching host tools this should be addressed in the scope of 
rust invocation only

On 15.04.21 11:32, Vinay Kumar wrote:
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 3438be92b7..83e1b68071 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -483,7 +483,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
>   HOSTTOOLS += " \
>       [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
>       cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> +    fgrep file find flock g++ gawk gcc cc getconf getopt git grep gunzip gzip \
>       head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
>       mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>       python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> 
> 
> 
> 
> 
