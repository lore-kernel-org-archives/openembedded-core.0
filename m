Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.78])
 by mx.groups.io with SMTP id smtpd.web10.10756.1599697742648340906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 17:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aOlMZgN9;
 spf=pass (domain: windriver.com, ip: 40.107.223.78, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nogAAGa4dRu/UHcAbqiG3FsG5QbxePF3srFieEIxgqah30jpAwufLfM5D62iafjF9HsLRF549kkBbxy50mDsFyzPnSyR/hllBmoZdypyT7/Tpa/SpBwzKa7X+o/kwAZHfgYpoXPTrcRzsqOtJ30vwUM/Pj/JWmGU+UQF6u5sQXt769fg46wMs+kndqTD1GA5IwvJi5yLiA3fWcEwbAMVzNuVvpV1J2p2Jkwogv1ZqThaqM4/9L/mFe7lOCKQV5XRch1O4qYk3bsYQi0ot7b7VFWqi0fawYl6qwT+APRrG5H9ZPtEbK13liXpNk0HKGzXUnH+PtfZKp6PZGZTTvhepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYrIOFrtWNmAwzL4gPZb3QbXO2UvDdydIkCqde76qCg=;
 b=dcCE0Ig9mWMYiAwa5MggoDYNVucAp0T22UQaQruVXpwkn3bD6vRzWAOXNaLbKag9oHCTH7/u+gD7jGiT3a+ZsrwiwLVi/hOAL963iJLH+C1DnzaOX+rM4SbjQf7BVJas5dNEkU8rcc49J9xgB0F+/kYWlGLDCpVYpmTrMb+sbLUIzSOOG6OlaPo+f3xu6U56gvS+aN0tvOUsOoOlURQiBVreJvaSX4bu7t/DUghlHFfFpvxCF3dK5mUaZrqxn2E29+hDvbgamM9PXK8MDTYFRKSDLrzPAEi1y4GgGVonFcP1asBVSqyaRunGG42bunmXJ8G57EJAysYtsxwCMFv6rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYrIOFrtWNmAwzL4gPZb3QbXO2UvDdydIkCqde76qCg=;
 b=aOlMZgN96/A9Jl3BfZj2nzIfFvIzWQDHO9WY5KVDkKz04BRwPF8mRnH8HGGMnuXzwuwV5RHdG6MxXkMFYBj6UaDE2rXaQdWh+cvAX9FXS8S+pu/lXUTz87Q7222j3jn1OOvLF6ro/NBEEccUr0M9RftFqjaEo/VllAP+loKfSRo=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19)
 by BN7PR11MB2580.namprd11.prod.outlook.com (2603:10b6:406:b5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 10 Sep
 2020 00:29:00 +0000
Received: from BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::cd91:7651:99ab:2fa7]) by BN6PR11MB1873.namprd11.prod.outlook.com
 ([fe80::cd91:7651:99ab:2fa7%11]) with mapi id 15.20.3348.019; Thu, 10 Sep
 2020 00:28:59 +0000
Subject: Re: [OE-core] [PATCH] gnupg: uprev 2.2.22 -> 2.2.23
To: openembedded-core@lists.openembedded.org
References: <1633448F4349234C.23670@lists.openembedded.org>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <deb80113-d8ae-d551-b06b-2d7d0ba047d4@windriver.com>
Date: Wed, 9 Sep 2020 17:28:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1633448F4349234C.23670@lists.openembedded.org>
X-ClientProxiedBy: MWHPR21CA0043.namprd21.prod.outlook.com
 (2603:10b6:300:129::29) To BN6PR11MB1873.namprd11.prod.outlook.com
 (2603:10b6:404:106::19)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.213] (71.238.119.71) by MWHPR21CA0043.namprd21.prod.outlook.com (2603:10b6:300:129::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.0 via Frontend Transport; Thu, 10 Sep 2020 00:28:59 +0000
X-Originating-IP: [71.238.119.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4435b099-1be1-4874-0919-08d8552082e0
X-MS-TrafficTypeDiagnostic: BN7PR11MB2580:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB2580C2FD7E9F056919A3211BEE270@BN7PR11MB2580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ais6wQ70xkt0vo/r9PsIWoFFTi3jbZPGRTu3TEDA0tmzHOmMVJMf7YqH9F4lgig+G3LfOAUeVjmA4LlDn7ifxGThv+QPTzZp4Bofw8xc2Y+ZmaxeEeZrK2a3L61RinUWTyGp3w77D8L2AdHKVMDaA1IaOtIxzyZbU7rcZ0fZ5WaakO3pWAAyLPIb0dFSSWUvBYH5aoqqpWg3grYwkM+j4pIdRiXWobZVxm560GYIa4+gS0tYL47t0Pr4vcTLg3gH01K5SN3jnbW0Vu8LqA5Knc15hMsn1T/vXcH6ETDzWskvJWyd1qIwCsIFESjWIN4C5HlC2khaUC3Taxd9MCDtU5JqKqypkwroOotY5Civ2nutdkCtoOeGNafcrxIvg70xNmtljhawyJk3HrqoULOOh8b0xKICA600/C5uB+Dl3InTNiniVb2RIZwpSJ+XzmfXM1j9/oXIWYD9S1z904vpQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1873.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(8676002)(2906002)(8936002)(6916009)(66476007)(66556008)(36756003)(66946007)(52116002)(31686004)(6486002)(26005)(83380400001)(53546011)(66574015)(16526019)(186003)(5660300002)(31696002)(86362001)(316002)(16576012)(478600001)(2616005)(966005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Rgyz3A6Y0RRRNDjHZXjtoK41VGhpxmF9vrLnn4OJhCfHtwM3pz8Fwato2jIrkNYUWQWciBrF4nWlCNDKdE0sSmSBinET70jKcTE/RYSjIFO737nkDsII3DfEBeNw5nDZHnFbEkozGwAaBKUw+t9bc6my6bvpDnXKR58t2ngqHstjQoF6nIf7/zXq66l85wxcMC93Z6yo/r4SSHgoUkiObkqUKAWJaVJOj3isPuFEOHrV+sk+xlUPwgODJQlGfTmi6LZyr6rcxc7iz35IVKOFuRoLvey65HqgzofRyrZnSaSxy68VQOABR6Wa0qxsSA+BfMQ/F5IpwzpQ+kcqon2EmL8NgDfAlWFANjdgjUlry+S2508pOCXaJFASu5CmnIvGpD4g0KXiWRw8tO9u6qnPdmCqZGw72zpjam5q/ASUYTcQ8hQojKGGjnkLLvGFNJ/uudlYaI3WYSEPGfXiuNqSo/E2eMQRwpQ2EqNzTpALHbksN7pjHkEtazsPHLePm11ONTtCOOJ2YaUdhzY5pAChq+0YMJU5qyx1dqBEPjYvy+SV6r1Grqe7OpEzqhfd3lVLtOtkA84LexV1Oc91zaAcS/K4cqEDVJlyg3YuZbyZL3oYHzZbk7kXDbDDpGASFLnuWZ/zfeJsTw68xvofvT3kHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4435b099-1be1-4874-0919-08d8552082e0
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 00:28:59.7779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6C9OAYYlybIwL0PNdv8z1J/jyl+NwE44ZOwW2Dsw7dQxEYlxY/t75hbFfax55dsTQB4Cd40jlJsn0DvkR9/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2580
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/9/20 5:27 PM, Saul Wold wrote:
> From: Saul Wold <sgw@linux.intel.com>
>=20
Clearly I did not fix all my own addresses!  Will resent shortly!

Sau!

> This addresses CVE-2020-25125 and provides some other minor
> updates and translations.
>=20
> Updated commits for reference:
>    e234d04c3 Werner Koch Release 2.2.23
>    aeb8272ca Werner Koch gpg: Fix AEAD preference list overflow
>    038314665 Werner Koch po: auto update
>    1a4b0fd79 Yuri Chornoivan po: Update Ukrainian translation
>    93d10403a Jakub Bogusz po: Update Polish translation
>    a8a8105bc Werner Koch po: Add key-check.c to the list of translatable=
 sources.
>    cad9955ac Petr Pisar po: Update Czech translation.
>    896c528ba Werner Koch gpg: Fix segv importing certain keys.
>    0a9665187 NIIBE Yutaka scd: Fix a regression for OpenPGP card.
>    bcae9cd4e Nagy Ferenc L=C3=A1szl=C3=B3 po: Minor update to the Hungar=
ian translation.
>    d2fe2ffd7 Werner Koch sm: Fix a bug in the rfc2253 parser
>    f799b3ddb Werner Koch Post release updates
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-support/gnupg/{gnupg_2.2.22.bb =3D> gnupg_2.2.23.bb} | 2 =
+-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-support/gnupg/{gnupg_2.2.22.bb =3D> gnupg_2.2.23.b=
b} (96%)
>=20
> diff --git a/meta/recipes-support/gnupg/gnupg_2.2.22.bb b/meta/recipes-s=
upport/gnupg/gnupg_2.2.23.bb
> similarity index 96%
> rename from meta/recipes-support/gnupg/gnupg_2.2.22.bb
> rename to meta/recipes-support/gnupg/gnupg_2.2.23.bb
> index 161add79f4..c624b67a0b 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.2.22.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.2.23.bb
> @@ -20,7 +20,7 @@ SRC_URI_append_class-native =3D " file://0001-configur=
e.ac-use-a-custom-value-for-
>                                   file://relocate.patch"
>   SRC_URI_append_class-nativesdk =3D " file://relocate.patch"
>  =20
> -SRC_URI[sha256sum] =3D "7c1370565e1910b9d8c4e0fb57b9de34aa062ec7bb91aba=
d5803d791f38d855b"
> +SRC_URI[sha256sum] =3D "10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6=
f486ed23d1cd1da5c"
>  =20
>   EXTRA_OECONF =3D "--disable-ldap \
>   =09	--disable-ccid-driver \
>=20
>=20
>=20
>=20

--=20
Sau!
