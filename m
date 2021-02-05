Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.94])
 by mx.groups.io with SMTP id smtpd.web09.6519.1612524222564733593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 03:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=jwRT8EAM;
 spf=pass (domain: outlook.com, ip: 40.92.91.94, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCo8XQ9T29LFFjlbNcNAkWxLMoIVlQFfnmG3WSepPfey1OO6IeVaXWd6jEG5LoE4vMDxufyFBySbgRmK0tZ0mI8WFO2dGbreqcyikUDWQ3+YIoelJr8W6dsAUicVXDKs1sei7C0On9fZI5V5qyCMcYnXYZyUtxEaFGRAlGkl3hMW0k2QIq53vs94XzYczPCYYKg7scH3BvJDw62Czo7Z3ckUX/AsjvFSN52Ww9ZGntx/G3l4tnSK7PJtuUT11O8LXVHnI/Bt29iFI42cWXoWCB4XvM4r8XxN1DaFk4drbdXN/3/NhO410VisFIb8fSoDicrysbbXzEUnUXc3NdKvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6CJOe9zd7OwVj1VIOS/SICnIDqclKnggu67Xopo9ig=;
 b=ds8M+Wf83xXj0ikOU+LtpCjmv71g623d4v1oyxTI8ju8ZvAsVu0sBdxnj0NaYGKwaFG0yFJZiS0wAEzQxD7ZW/8ukVjFo19JME4lgbWjbHwu2IbHAzNBc4kXPQAvw8xLAjpr2s43gW8SsMmirltXPfZ6vFAkn0b4fyZZ7oXHCAfUz0NmHYsc45hT9Tfz5FsPKFKhFM6fMDBiDhP2Bb4RkUiAN9bcPHjGsqgQZbbvSvn83A87Cx5mgMwjnJ0o/K/oBBOtdZmYstX4vjGXMJ7bz6CrZPYdHsN4pIujKIhOnjkpdqxDDeZ4hE+K5kLsFGSm/y2KOMxr3E99+A9Zmx0fhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6CJOe9zd7OwVj1VIOS/SICnIDqclKnggu67Xopo9ig=;
 b=jwRT8EAMhqKT856LrGOVWBpyypHkGafr93EY7djDklJueIK7fEyEspQ0078bnW5yBF0CnX/6oZrduJggdhKGn5r8l/k7JDYOu8PCzo/4O/3lfZqSuog6be/gz8xD6w7uc34o9VQ4V1+sIAoua0In67C0aLuZe0vZ7U0lPXOTffoyHbfff0uJZ3CPv2q/Iq7mK/RSSbsxsbpsLlxignm6HqrgFZg2f6MnoqBQgNRdJcQelrxifn5OCh9985qdiADDuYY33IBWUYBwr479h0+nnyDSq/oHE1JNktfxEUR45ECFBYC2pxKdX+ftNkUAtsJ6y0Bd7HQjfanDXrjAi/QtRg==
Received: from VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::41) by
 VI1EUR05HT221.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::301)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 5 Feb
 2021 11:23:39 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc12::53) by VI1EUR05FT025.mail.protection.outlook.com
 (2a01:111:e400:fc12::123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Fri, 5 Feb 2021 11:23:39 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:71DE5E09FCE36DBF8875A602CB04C3C19F86C1B51C472EB2BE05C6358AC002C8;UpperCasedChecksum:E48E4CA71C6EF51E870366C54DB6A28818F7152CD6A7DF4F99F1E3B56382FD5A;SizeAsReceived:8647;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 11:23:39 +0000
Subject: Re: [OE-core] [PATCH] openssl: re-enable whirlpool
To: openembedded-core@lists.openembedded.org, schnitzeltony@gmail.com
References: <20210205111422.932634-1-schnitzeltony@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB4642D7349EB58CBA53C74E37A8B29@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 5 Feb 2021 12:23:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210205111422.932634-1-schnitzeltony@gmail.com>
X-TMN: [UkQ8UaY4iAxuGi+PQAPB3i5KnEpegGOv]
X-ClientProxiedBy: AM6P191CA0041.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::18) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <97edb879-1166-451b-ee87-d586829d8081@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.89.155) by AM6P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 11:23:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 488bc360-0822-4edf-2b38-08d8c9c87caa
X-MS-TrafficTypeDiagnostic: VI1EUR05HT221:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EwyoGyuf0eVCsJUvd+D3HV8LdWUkcZCtdB3NPDRFtbrJ5XQPDBTny2742eE5L+Ap+23DxK0+P2TUYDsgbT6cx5/8qnOd6cK9o0wZfDZRuQHzm3r1JdERuWwz2B363+GE6057EuJ8BqEsU+P44UdT26lY3bziBovXVEiTplLq2WJmcfu2T5tEnLX1WWbtKaWBtS4R1ZQayyPQ6l4L/hKqQlcGEnPqEMAqVx4s+qEkKU5/nbi/CU10rg2WmnzHaorjj3JQzywkjv7DqYfXZd8uspz/H2c8ETTEHOeQmlXT0hi7AMZgAY13AgsSKv/3YxK7tgiN21cu28y+DeLjY276AVMIzK977Y+gBhlmCAdqhe4eHrh4XWq9K8MxifhpqbIakJQVFw0tsHFw4Ha/f4XamDVKeuEsKlFoEZty0i1l05Y=
X-MS-Exchange-AntiSpam-MessageData: 
	1lZrjvSm3EK4QvmG1XaM6DazepmA5Yz/96c/fwZ+Bwyx6vHpOl8LZHPGYV06tel++pgjQ3enp0WYH2eKKmRpAR/3vZKdRYvSBeInfdQTLBKwtt7oT2Rh56/3byiWKf7gX/GXdLMl/bPp8T7F4LXUWQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488bc360-0822-4edf-2b38-08d8c9c87caa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:23:39.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT221
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 05.02.21 12:14, Andreas M=C3=BCller wrote:
> * it breaks KDE's qca and dependencies
> * it is not deprecated. Openssl 3.0 (currently alpha) will deprecate whi=
rlpool
>=20
> [1] https://www.openssl.org/news/changelog.html#openssl-30
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>   meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/=
recipes-connectivity/openssl/openssl_1.1.1i.bb
> index ffa261a1be..774341c719 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> @@ -65,7 +65,7 @@ CFLAGS_append_class-nativesdk =3D " -DOPENSSLDIR=3D/no=
t/builtin -DENGINESDIR=3D/not/bu
>   # rc2 (mailx)
>   # psk (qt5)
>   # srp (libest)

maybe worth adding a comment, like it was done for the other exceptions

> -DEPRECATED_CRYPTO_FLAGS =3D "no-ssl no-idea no-rc5 no-md2 no-camellia n=
o-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
> +DEPRECATED_CRYPTO_FLAGS =3D "no-ssl no-idea no-rc5 no-md2 no-camellia n=
o-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4"
>  =20
>   do_configure () {
>   =09os=3D${HOST_OS}
>=20
>=20
>=20
>=20
>=20
