Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.54])
 by mx.groups.io with SMTP id smtpd.web08.1718.1626371831912100393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=nyQNXd6t;
 spf=pass (domain: outlook.com, ip: 40.92.91.54, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdXghucWR6m0Dsuohx6EyH7lT9FiDaEYglbPJ7/5GwR3WhfemOtml0DxjRQWyT2bXPzufnToCgaWZemt/sCuEkUOFdEcsu57E0Cb/56sX9e1JPLAbAlmIGPV9jfKg1cRgMNw/rqEYB3lnei08nsRaSx0la5qFbiKG0am9E/mtd4jzSJR9pO4gvQlCXqssofQ4LyEdkovPI1hTRNTvcxorY9Qc1NoGU22Iru+3G4ACQqdICTq7Qka76jHXH6Yi078CobZbDcJNJiNimGPjdSNctDT5ZzUPUBGlby6jRMPaE2HTbeYMVYBjY3cScwtJVxVbAnOV7r6lNAxMGxnMjRXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhamssMwW8gt867NwXBoFgUTx9xqr8tupa8XoL/mqIQ=;
 b=M/MmWQJvmk4uZH0yVj5lnY2k5XHgLr4UaHiyc8B4RDCUhUgNNAN+Lc8atdhhgWqS0pOvGOCHwiWTb2V6VNIKp/XRNhVTDEX1rqroB6uc+Rf33KoVlHbkR2F35YmTX+91tsUbY8jjd/wiaBgxQG6riZoEAVb62zDpkR553a6ubysGvKNWscCupt7UEN88UUuDB0OgxMbIWtXYCGwRLqhEZqaX3yyejcd7A7Gqtiw4h65ysfMyqfs+SP+FBGyQkWCpnU8pS5uf1TImJRipme/1oXkc6Y6o71jWvcLAvEREtVbHDz+Ixm+EZRrXvhBH1h1DP0B93v7JFdYfyIhus9cZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhamssMwW8gt867NwXBoFgUTx9xqr8tupa8XoL/mqIQ=;
 b=nyQNXd6tBgw8WhmmkGHL8IgvC83cIrtHH/JvBwBZ5hWFqWnAb7RMr94Dj+L2WuTIhzKqFMrBd9NazqDLRXwaTZA08DnTZ2ueLJ6jaQ8Qva+f0/6UpWhpskanEYv06NliBaa6jztWGdMGhDGsM4sXDawjXhj6vzAVzA8WCuRpwhFOLMo/Qk6tk4zQyxwqJ7GF8aY6sOXxJ9WLw3QEAMWjd+bxcZD+1d7ZZyYrgxIAcr3Yz5sD5W1TD/oWiOZTD9cfe4fx+U5d/e7kC2OgArSL1HKwvGdlSSR1cZ+uw0H/r8QHgKARGguLdglcWTlFip6qMbJNZChEtXSleCToK5kFAQ==
Received: from AM6EUR05FT024.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::53) by
 AM6EUR05HT115.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 17:57:09 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc11::50) by AM6EUR05FT024.mail.protection.outlook.com
 (2a01:111:e400:fc11::90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 17:57:09 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:5F44DA15DA5DDFBE9283EB3DF4D9BC87921A91E4E4AFFEB96B9EE6FA5712F8C9;UpperCasedChecksum:98652F454374B3115903FE74A35CBB67C3A8D10AB953899163607EB6A0109345;SizeAsReceived:9065;Count:48
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::411f:efb1:4a12:95b7]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::411f:efb1:4a12:95b7%8]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 17:57:09 +0000
Subject: Re: [OE-core] [PATCH v4] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>,
 wangmy <wangmy@fujitsu.com>, Leon Anavi <leon.anavi@konsulko.com>,
 Derek Straka <derek@asterius.io>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
 <CA+chaQfWtGf7gsUCLXcTuB985YYHM=FQszdX1d2y4fcjjEepOg@mail.gmail.com>
 <17064fad-db99-80e0-f9b7-ab8c4685ec7d@gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB46422B3F8BEFD4663D00D74DA8129@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 15 Jul 2021 19:57:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <17064fad-db99-80e0-f9b7-ab8c4685ec7d@gmail.com>
X-TMN: [Db+w6DZ1S5w4s2C8xpnCkZ0/sr4qeyQZ]
X-ClientProxiedBy: AS8PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::10) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <0e8d094a-cb9e-9052-dcba-d47c2a18ec94@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.82.32) by AS8PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:20b:312::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend Transport; Thu, 15 Jul 2021 17:57:08 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 816e1eb8-048c-482a-7ecd-08d947b9f727
X-MS-TrafficTypeDiagnostic: AM6EUR05HT115:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gm4gHc4IDwRpvj4EzMdMmnYO/K7RRo/weihzkJEXXjdzZ7PXmAwX1xjp5hHRbvixKEhyqQASGgAE0NdTMDjoC0dy7/MVFl50wHHS/NA4QfMmCHT34dQyOMAze+W7D4RsJDqAaYA/CAoFmUhcfrPW8K/8kxdIn2D9+9IyJC9e1AA4PeBn17qIyzvZKLFuo8wMXHmro0iaGc6BcKuW6zE639Y53TgGa1HZp3DScUQ88FUujtwyiydDKyFAwFer0gx6ELP1wxlUuLsp8NN0axb1gNuNifa9c0893xQmkpj7LmPM/U7v4gLpOP/LmBLTdBdT/H1i2mEL7tVt2yt2w6tz/xrkdNCvbcwC3HUmLTlSPp1hziB4J2BTyYtksemEMljQeX7lZb9Sc/EgVgIwCCwer2zeCpGEcWaUQfT48jDiYo7ORg0vErJWnqPBMQnKc9ppiNnv2T53K5T4boRsjd5o20NZPWec2YFvDbmsCNAnayM=
X-MS-Exchange-AntiSpam-MessageData: 
	xUzBAZtM/AIQxK2V1lZkcI+HJItrJkyGPVbK5mg9feOAdgfwF7HUDa5Xi+I6dTI7X2zNJb2IXG5oW0J//FYnlY2ODmH6O4gL+5dzm+uMNu6kqb41RCvMHrUv+ThCK9Hp36i8b3jpECR6KLpb9JScQA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816e1eb8-048c-482a-7ecd-08d947b9f727
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 17:57:09.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT024.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT115
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 15.07.21 19:22, Khem Raj wrote:
>=20
>=20
> On 7/15/21 7:43 AM, Martin Jansa wrote:
>> On Mon, Jul 12, 2021 at 9:57 AM wangmy <wangmy@fujitsu.com=20
>> <mailto:wangmy@fujitsu.com>> wrote:
>>
>> =C2=A0=C2=A0=C2=A0 reproducibility.patch
>> =C2=A0=C2=A0=C2=A0 deleted since it's been merged upstream.
>>
>> =C2=A0=C2=A0=C2=A0 v57.1.0
>> =C2=A0=C2=A0=C2=A0 -------
>>
>> =C2=A0=C2=A0=C2=A0 Changes
>> =C2=A0=C2=A0=C2=A0 ^^^^^^^
>> =C2=A0=C2=A0=C2=A0 * #2692: Globs are now sorted in 'license_files' res=
toring
>> =C2=A0=C2=A0=C2=A0 reproducibility by eliminating variance from disk or=
der.
>> =C2=A0=C2=A0=C2=A0 * #2714: Update to distutils at pypa/distutils@e2627=
b7.
>> =C2=A0=C2=A0=C2=A0 * #2715: Removed reliance on deprecated ssl.match_ho=
stname by
>> =C2=A0=C2=A0=C2=A0 removing the ssl support. Now any index operations r=
ely on the
>> =C2=A0=C2=A0=C2=A0 native SSL implementation.
>>
>>
>> FWIW: this change=20
>> breaks=C2=A0=C2=A0meta-openembedded/meta-python/recipes-devtools/python=
/python3-cassandra-driver_3.25.0.bb:do_install:=20
>>
>>
>> + people who might be interested in python3-cassandra-driver.
>>
>> | Installed=20
>> /jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc/work/core2-64=
-oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-native/usr/lib/=
python3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x86_64.egg=20
>>
>> | Processing dependencies for cassandra-driver=3D=3D3.25.0
>> | Searching for geomet<0.3,>=3D0.1
>> | Reading https://pypi.org/simple/geomet/=20
>> <https://pypi.org/simple/geomet/>
>> | Download error on https://pypi.org/simple/geomet/=20
>> <https://pypi.org/simple/geomet/>: [SSL: CERTIFICATE_VERIFY_FAILED]=20
>> certificate verify failed: unable to get local issuer certificate=20
>> (_ssl.c:1129) -- Some packages may not be found!
>> | Couldn't find index page for 'geomet' (maybe misspelled?)
>> | Scanning index of all packages (this may take a while)
>> | Reading https://pypi.org/simple/ <https://pypi.org/simple/>
>> | Download error on https://pypi.org/simple/=20
>> <https://pypi.org/simple/>: [SSL: CERTIFICATE_VERIFY_FAILED]=20
>> certificate verify failed: unable to get local issuer certificate=20
>> (_ssl.c:1129) -- Some packages may not be found!
>> | No local packages or working download links found for geomet<0.3,>=3D=
0.1

But that not directly an issue of the setuptools upgrade, but a not well=
=20
written recipe here.
I'm more than lucky that this update revealed the issue, because=20
otherwise no one would have really noticed that the original recipe of=20
cassandra-driver is pulling sources while installing.
So just in case I would rather pull in this upgrade than to mind the=20
broken recipe from meta-python here (just my 2c)

>> | error: Could not find suitable distribution for=20
>> Requirement.parse('geomet<0.3,>=3D0.1')
>>
>>
>=20
> yes its reproduced on AB as well.
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1397
>=20
>>
>>
>>
>>
>=20
>=20
>=20
>=20
