Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web10.38587.1600681653391739348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 02:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=F8Tq/5ql;
 spf=pass (domain: arm.com, ip: 40.107.20.44, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+0q7k+Bzy+up+gnycw1aY7mnnO2lTo/UphMKMHgUTA=;
 b=F8Tq/5ql4q5HVj13osTAOQT7KhDo1XMgtkORpIScKssotyUxnrjGpgXuGBNss1NuVcfFdmrejcWPM/9BVbgqbBrenK6RKPXdWG5OOT22k9i675vNjngEblRO3OrFRiVRBVjYsVat4WCirjDGy7k+JAiync5S8uhrTHWaLopfp4w=
Received: from DB8PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:10:110::37)
 by DB7PR08MB3177.eurprd08.prod.outlook.com (2603:10a6:5:26::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Mon, 21 Sep
 2020 09:47:30 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::84) by DB8PR04CA0027.outlook.office365.com
 (2603:10a6:10:110::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Mon, 21 Sep 2020 09:47:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 09:47:30 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Mon, 21 Sep 2020 09:47:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14d81ef7bd224744
X-CR-MTA-TID: 64aa7808
Received: from de5a8c86b9d2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 674C4E06-9E2C-4B73-A3F7-5715D6437C25.1;
	Mon, 21 Sep 2020 09:47:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de5a8c86b9d2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Sep 2020 09:47:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaJiSKBjKZ4f9PbOsGDTKAniHEZ13kQeqFAaDtiLpRV4TVy6iwtOcmOUcA1oPH+Ac8Wo75cpTKPW25jbP9V1Qhm7M7+kZ+mxKrsoof1NPlD2sw6kD7qNA+bsK366xXxZFrXtFUfcNvQcjDY8lAt5lMosLuCNG4Dpj8HJofF0iyh885/aKGmsujbPZXoEXBtP1B2ywvzLjcwvXKBR8PmXVZUkGv+qqe5oJSVOKXioI+ONcqi9jbM7EZhceV3W+6099Cc8WX+Iq3HAw3H03Pr34mUJ7bvGRMb5i06ns2+MYkARZvn8xQJ8c3VoaSLGEIysHJbED7XCB5LSiZv8JDLUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+0q7k+Bzy+up+gnycw1aY7mnnO2lTo/UphMKMHgUTA=;
 b=S4Z7eVOTkbStpYxTNVPfFbD90evXgmqku5f53WEesVpMK66L4tGw7zlssKFCqVGr5uWYhcjbSJ1AjhTUGjQ3aBXW5AsLTdHUpRnHULkVq2CuB0QDaIQfJe55C1Lo+AjG8HZiPpg6VokjuWrRL5nkR2iFyAS27Ogm33aFeLopXKqQTctfnnuHdzRhstHWB8wex1Kx3f+Gvzl5bbRhFjYXkLQENFkJ/JkLpPO19cnV7lIAb1z93zC2yEzAmKr4LSOiZUaAN8i9rH5LYrTAgTJNmLzsJuqbiXJyDOBzaGoyszGn0+G+CY9jGcktoIJoWkz4nNmHhLr827cz6LYC5VWdwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+0q7k+Bzy+up+gnycw1aY7mnnO2lTo/UphMKMHgUTA=;
 b=F8Tq/5ql4q5HVj13osTAOQT7KhDo1XMgtkORpIScKssotyUxnrjGpgXuGBNss1NuVcfFdmrejcWPM/9BVbgqbBrenK6RKPXdWG5OOT22k9i675vNjngEblRO3OrFRiVRBVjYsVat4WCirjDGy7k+JAiync5S8uhrTHWaLopfp4w=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB6PR08MB2775.eurprd08.prod.outlook.com (2603:10a6:6:17::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Mon, 21 Sep
 2020 09:47:15 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc%9]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 09:47:15 +0000
Subject: Re: [OE-core] [PATCH] kernel-fitimage: generate openssl RSA keys for signing fitimage
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
CC: nd@arm.com
References: <20200908122835.38284-1-usama.arif@arm.com>
 <1632CF861F095801.32160@lists.openembedded.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <56b0fa9f-e88e-0d6a-3ac0-d454a64d8d03@arm.com>
Date: Mon, 21 Sep 2020 10:47:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1632CF861F095801.32160@lists.openembedded.org>
X-ClientProxiedBy: LO2P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::19) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.53) by LO2P265CA0079.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Mon, 21 Sep 2020 09:47:14 +0000
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 077134f2-1a67-424e-7d0a-08d85e135b4c
X-MS-TrafficTypeDiagnostic: DB6PR08MB2775:|DB7PR08MB3177:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB317735A7F8E2F25DDAAFCB6B923A0@DB7PR08MB3177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JZGko4J7Ae4Q8uW8cRJ00UEEv0N6lO5I3lihltgK63zAMhJAOAgxJ5sOKADMonzqgBEL9MxO04MLGjPys6DZuQr6ANlb7nf4bayCTU0u+Y40CGMFvjDPFM6V0X4Ramc0VlpJ88MQYO2y0Psja/qACmT4FIBEJbknvOyhpORfStUCFnBv9Kk4xrrVChq25rzT0jxvVlTkffMAIV6NBdVPQitY21u+8Jv8Ib9fwj4ia3OiezB3jkpIAfjPXWhpwkS7+V/kw81xm/DytvXID/2iXVGbEzxQnE3JC/lT4rgTD+bfnGrgrUxK9RlDtLeqqt5+oYHzlfOSMJfyGy55PLvb1Zb29zhiLsACCGovk3a19CMherpuHOMz9jvfbWHBVKXqjmK4ezkFOu1fnPJbZOdG3rdxtzIAPlTJghymI7Ta8NboD89oWs+5AoEwyD72sW3r9wxjysFF5heYvMy6OSiGcQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(2906002)(86362001)(4326008)(83380400001)(8676002)(31696002)(8936002)(31686004)(5660300002)(66556008)(2616005)(186003)(966005)(6916009)(66946007)(53546011)(316002)(6486002)(16526019)(16576012)(26005)(44832011)(66476007)(52116002)(478600001)(956004)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fuJ6v3TsHk5yt1gYDiP5KC/0rOMImCp8pTgVEK9b8nKvWIIpfhoPUrM+R1R5+uqnT66O+NAK91WFZropcXsypZkMvmJPFye7QYtAHJV416TCFzOxN2m1zcPa/9VWcL9O7bJNWddSnMNnJ+7O9hYkRVCjn3dDtPcdL5nx/vXjd3eg0f2kbkOSJH6zwN8cyDn0yBA5q8Uj8hnZiiLdDMgHfikaDEECgeLOawjQ0eTnZu8U4cfwOhiUi5c9/VcWm7DVFqHQrkSO7w3wVjb5K1zBPTqJSRHp6Jkd6NGfJHIjqO2dDbYud3TGwqcp3uRhf2nMvWD22RPJ58LZGrzQrMOyFW0kargzF+GlgkPh7KGBO7vmUCfAaH6IpPGshjcd92MQCAOtBPZtU9niv6uI40GT1uK2ELzTQXlEklyf9bqjWB1L80Lz8qw9n40Uvb4Lk+41L0mO4n5M1hsIWvxRiEiz9YUVo2tMnh3I+y8CwILWoIrkVTTn3478AYyRBDjYNS5VAKd9T7yGnbqPL6Jo+ntQpYp5JHNoideV3GgGCf2ompaTYiEuwqEyGPWsb+n89K2AseY10PygEHcyKhxOe/CMatdKN9JJD+Tb2lVqKWaMS+L/pO1CubmITaoqiRScsDXkmygu097JeM9QGa4RRRHeTw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2775
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	72cac57a-cf8f-437e-2159-08d85e1351de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K/lgu7QFuPZnAe2zFhIpqYDYFFsh7wzwNR/ybv/PGD3pTHZi9YdjXOrMhe0hJrhk3SKCn56dIgiTMsD5nRJop2ahAPyvT8rCLdTmug/EXC6P1Ux4mZVrkedYXH/PEei+Af0XRusm9xVq3yL6uDz8TFiT/FxFroDnQ/iYpGqbtSj3hqhHA7lE02r7xKXwjmfXuJ9bt1+kd58kfndgjjZdzBxKoh8SSv/AFwkWrv7jML0eT7JSe7e12zm38BXULZEVCiTUDd/BuNoXsC75+Yb3EeiRFIQ6E5seB9/RLb2Jkw05cP3rBjlmjCBF2xp/QIZlqeWFlaLNgim+PiHYufOgN7EhAAskYqq3B/PA7jfFHzUM94mLNN73O6S6p3j7WTvysWr6giONPZSRpU9Gp66vMBBxKhhMQ5FcGFHdOTT0CYsT44oaIKQMRMyubSZJ19+1w/vqlN5dXbtNHc9MpZWlnnmYWKrua4Hud5keuCCdltewMAEihVRYLoEQ7TsuwvIzETSLjJdCzPD2k+s96t/mHhPe2c3Tq4LmGBnRtmwSDv6ONiFUGUM7xWs4Eef7tek1
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(8676002)(316002)(36756003)(478600001)(8936002)(70206006)(70586007)(31696002)(83380400001)(336012)(4326008)(6862004)(82740400003)(2616005)(5660300002)(956004)(44832011)(2906002)(47076004)(26005)(356005)(966005)(81166007)(31686004)(16576012)(186003)(16526019)(82310400003)(86362001)(53546011)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 09:47:30.1984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 077134f2-1a67-424e-7d0a-08d85e135b4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3177
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

Just wanted to check if there were any review comments for this patch?

Thanks,
Usama

On 08/09/2020 13:43, Usama Arif via lists.openembedded.org wrote:
>=20
>=20
> On 08/09/2020 13:28, Usama Arif wrote:
>> The keys are only generated if they dont exist. The key
>> generation can be turned off by setting FIT_GENERATE_KEYS to "0".
>> The default key length for private keys is 2048 and the default
>> format for public key certificate is x.509.
>>
>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>> ---
>> =C2=A0 meta/classes/kernel-fitimage.bbclass | 44 ++++++++++++++++++++++=
++++++
>> =C2=A0 1 file changed, 44 insertions(+)
>>
>> diff --git a/meta/classes/kernel-fitimage.bbclass=20
>> b/meta/classes/kernel-fitimage.bbclass
>> index fa4ea6feef..1fa8c8f05c 100644
>> --- a/meta/classes/kernel-fitimage.bbclass
>> +++ b/meta/classes/kernel-fitimage.bbclass
>> @@ -56,6 +56,22 @@ FIT_HASH_ALG ?=3D "sha256"
>> =C2=A0 # fitImage Signature Algo
>> =C2=A0 FIT_SIGN_ALG ?=3D "rsa2048"
>> +# Generate keys for signing fitImage
>> +FIT_GENERATE_KEYS ?=3D "${@bb.utils.contains('UBOOT_SIGN_ENABLE', '1',=
=
=20
>> '1', '0', d)}"
>> +
>> +# Size of private key in number of bits
>> +FIT_SIGN_NUMBITS ?=3D "2048"
>> +
>> +# args to openssl genrsa (Default is just the public exponent)
>> +FIT_KEY_GENRSA_ARGS ?=3D "-F4"
>> +
>> +# args to openssl req (Default is -batch for non interactive mode and
>> +# -new for new certificate)
>> +FIT_KEY_REQ_ARGS ?=3D "-batch -new"
>> +
>> +# Standard format for public key certificate
>> +FIT_KEY_SIGN_PKCS ?=3D "-x509"
>> +
>> =C2=A0 #
>> =C2=A0 # Emit the fitImage ITS header
>> =C2=A0 #
>> @@ -522,6 +538,34 @@ do_assemble_fitimage_initramfs() {
>> =C2=A0 addtask assemble_fitimage_initramfs before do_deploy after=20
>> do_bundle_initramfs
>> +do_generate_rsa_keys() {
>> +=C2=A0=C2=A0=C2=A0 if [ "${UBOOT_SIGN_ENABLE}" =3D "0" ] && [ "${FIT_G=
ENERATE_KEYS}" =3D=20
>> "1" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bbwarn "FIT_GENERATE_KEYS i=
s set to 1 eventhough=20
>> UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they=
=20
>> won't be used."
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] && [ "${FIT_G=
ENERATE_KEYS}" =3D=20
>> "1" ]; then
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Generate keys only if the=
y don't already exist
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ! -f "${UBOOT_SIGN_KEY=
DIR}/${UBOOT_SIGN_KEYNAME}".key ]=20
>> || \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ !=
 -f "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt];=20
>> then
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # m=
ake directory if it does not already exist
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkd=
ir -p "${UBOOT_SIGN_KEYDIR}"
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ech=
o "Generating RSA private key for signing fitImage"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ope=
nssl genrsa ${FIT_KEY_GENRSA_ARGS} -out \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "${FIT_SIGN_NUMBITS}"
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ech=
o "Generating certificate for signing fitImage"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ope=
nssl req ${FIT_KEY_REQ_ARGS} "${FIT_KEY_SIGN_PKCS}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -key "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".ke=
y \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -out "${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".cr=
t
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0 fi
>> +}
>> +
>> +addtask generate_rsa_keys before do_assemble_fitimage after do_compile
>> =C2=A0 kernel_do_deploy[vardepsexclude] =3D "DATETIME"
>> =C2=A0 kernel_do_deploy_append() {
>>
>=20
> The relevant yocto-docs changes for this patch are in=20
> https://lists.yoctoproject.org/g/docs/message/340
>=20
>=20
>=20
