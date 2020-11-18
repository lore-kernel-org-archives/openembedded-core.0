Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.88])
 by mx.groups.io with SMTP id smtpd.web11.987.1605738619452796547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 14:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Sll4JMy7;
 spf=pass (domain: windriver.com, ip: 40.107.94.88, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWc/UCxObhz4rspRTboBxl2sV/Caen1CsBuZK0kjuAdozmQ+9iZzklbw10B6v+Kxg6jpJPDO+nwVAgQpC15TkroMUjfKRNInDNJOESJg1SRpTvPZGVncOKrpKMZQLPcx2q+do2TeOc5zhnLIAQzWFq9aqDk1T0zoqaOIy9tFIyaf0j5ySvaErAEFGXM2IkxnGGwhuCNFiZ5R9jyUZPjsIETG0W+tSvrTUNwC13eU9wvZI7ovyRrdAf+lGsQOb1Q144tZZeNSKJTNr0CVCElXD2bD0vOo+l/dGDjQwyfKJT+57cfCao1hjUPJh6CDWdgcJTdiOemWcQWUV2Xq6RTEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtXyV0vzi+OZOYZYiJWFAMEx8fxNW424dNeWcxXIiB4=;
 b=ZRAknEqGYOgxAR+7SCd/T3TTyHsdGbUa017NSCH+F1qkFoQAMhh3Y/6JdfJ/80ANYYnluzR1xMZJ3k6IQdYjZVjTJwTom3vp+iapDO53KrE9Rey6Q7w4fbYuQdtkGqxceIKAlhuUxMserYCPCXPDIAXp0v4FOd4tCNBAh4cpmolTvEf/FP03y8rOuMTdVmXmoy8AV6TN6kjta5c001spw3/RFfWtAPCl8lXMV5vHWMZUpypae9BIVHr5EsrX/JoVjbD3gL+CGKSqbWvf8iCc2TvQCjBsBBiQ7g5wEYBiIiiEIg+DD89CzebRhrYl8Ifw9AqZ2YpEBIi8qLOhLOMpNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtXyV0vzi+OZOYZYiJWFAMEx8fxNW424dNeWcxXIiB4=;
 b=Sll4JMy7215Y4wHa53pSHlQQwPQAm+27p47DcgzJJXVRdJ/lyjHwUqLOvPTHD1llcC3jOLS28PhGQiNqmH8TN+Uy9m69d9kfOf2Avf8hdOKAsMcJkm3XcmS5lo/3RiZxB3VurmmzRYqxfEDjLryCWqTF6lH7Fleh8A99z/qhE8I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR1101MB2276.namprd11.prod.outlook.com
 (2603:10b6:405:4e::18) by BN6PR11MB3938.namprd11.prod.outlook.com
 (2603:10b6:405:79::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 22:30:15 +0000
Received: from BN6PR1101MB2276.namprd11.prod.outlook.com
 ([fe80::217f:7bd0:c2de:ca36]) by BN6PR1101MB2276.namprd11.prod.outlook.com
 ([fe80::217f:7bd0:c2de:ca36%3]) with mapi id 15.20.3564.032; Wed, 18 Nov 2020
 22:30:15 +0000
Subject: YPBZ 14125: busybox wget: where to add openssl-bin dependency?
To: Shachar Menashe <shachar@vdoo.com>, "steve@sakoman.com"
 <steve@sakoman.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <AM7PR08MB5335A3F67A86A99D40F14979C13E0@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <BY5PR11MB4167CE3E6868CDF84B723417EA140@BY5PR11MB4167.namprd11.prod.outlook.com>
 <AM7PR08MB5335FD6327DC339AD370110AC1140@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <BY5PR11MB4167A2717FBFEE9C8838535BEA140@BY5PR11MB4167.namprd11.prod.outlook.com>
 <AM7PR08MB53350F08EB85F0EC65DC7798C1140@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <40be87cf-d621-9382-494e-5d8f7593aded@windriver.com>
 <AM7PR08MB533582E4480B60D11B6DB3A9C1100@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <efebc5dc-c5d4-6279-50f8-629877346691@windriver.com>
 <AM7PR08MB5335CCB3F970B45A09C4C416C1E20@AM7PR08MB5335.eurprd08.prod.outlook.com>
 <471a4868-05a9-5851-d52e-b145011721c5@windriver.com>
 <AM0PR08MB3617FDDCEE0A4B7988EE9986C5E20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <d5af9fd5-4395-df8e-9ab0-a0dff0ce80e2@windriver.com>
 <AM0PR08MB3617976199B253B75D1A7D30C5E10@AM0PR08MB3617.eurprd08.prod.outlook.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <34d371b7-8552-0dec-d322-7ea1932f7bed@windriver.com>
Date: Wed, 18 Nov 2020 17:30:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <AM0PR08MB3617976199B253B75D1A7D30C5E10@AM0PR08MB3617.eurprd08.prod.outlook.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To BN6PR1101MB2276.namprd11.prod.outlook.com
 (2603:10b6:405:4e::18)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR13CA0207.namprd13.prod.outlook.com (2603:10b6:a03:2c3::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.9 via Frontend Transport; Wed, 18 Nov 2020 22:30:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eb1ad92-7596-425f-435a-08d88c118575
X-MS-TrafficTypeDiagnostic: BN6PR11MB3938:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3938754E3B5CD60FE3706A6CF8E10@BN6PR11MB3938.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZKs6EiGIYU8oM4MElVnaZ2tof8EKdZVnPb+gpwGXePxh99xG10qw8gGehkEQ0TeIy8thhXf5lmUbQrzmP3+IX2UFqlOPCEOqdxE4qjOJWuvj01BCoLk6PE2Y67j3YN6iem1kj8npKsoS88MTa0+w3as4rc3e7s7uCq0XA/mpxJ0ARFQuBQEFHBrbFH/4yFaJ1SXzWSTgQI3a8n7uIBer77RXURlJWBX8vFhZFDLHeUabZr/GZ/tAKDxngDDzKBrZs7wtMVYUUt8KOARvQLC33d0OPBVl282Lr6pGzzZHwINAHquBRSvyHH8xv2sCsT/x0mupvF0rclNUwjGFvsbEnzGIFMI/rvTOZ+1IlwvJNQYjBf1RWY+3bYBi7gpTAmU7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1101MB2276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(6486002)(31696002)(186003)(16526019)(83380400001)(316002)(8676002)(16576012)(36756003)(4001150100001)(2906002)(8936002)(956004)(110136005)(52116002)(6666004)(5660300002)(86362001)(478600001)(31686004)(26005)(2616005)(53546011)(66476007)(66556008)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9j+AMhMWVpzvvzf9otg4AYnnZRV7GgVxqWRpTn0cqx0mklA5oyidhVXswQ6WTt5N9l6d+bhwhcu7rdC1Wg5HB2AvuLkYmtcbiH1vUbIfG5Xtb1jYSfFq4VTWRFJuyD251N94EQLMphw94IgmR9pmFQXSiqYBKlrdfVhexsDO1z/K5Kk+lXCf0p4EHM9Z9pJ8ZF9M6WEOHUQWS3i7TWrwroRUvk0vRbOJLJnzPF3eesnU0nCSMyJc8v6+i+VYQTBVdc/S2nK92US1Qp/9ng0rS1hILObefBrsoSdZZS/aVbPPI0BveWjKeH0OfSY93D5OuN+1wSNFj6LYJ2vGni3sJvDcbKVWcH3QZp8iaQIv5AjQOBekwU76YD6QIUhWUNAkL1r57JasQ0V/xPAYEi4v5B9yGd6BTm3oaisKLO1I5jx4IJjETNmoKDbyuvGoJ6h/8EfRCMtnlWVXT8XZJg+KwT9Ah5Xmrf1DlvLmCRSDNxbIi3KMC00TbfGovW4HCQFudkK/nVs64xJtnCoh1n/xXo3V0WAm5bi55048wXVCuO8vyOLH0nJMXYPiQCPAZW6Wj6GdP23BCSJHkvyvnw4YMK3VsVBaw94KrHJyl/iGQgdNFjLhEnIIcpq7Yz/5whKB63X3mFn1/3vy9LrhwBkQ/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb1ad92-7596-425f-435a-08d88c118575
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1101MB2276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 22:30:15.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTB8ztpX+wI2GByDbh8a9RCpKcMQbIlYlxAucqTxMhlsIzxEknyTJlJs+oKlPmiGxo2f3ophc9x3AyY8sVwhkEfofJNf2m7isaEN2j4vQPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3938
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-CA

Hi Shachar,

On 2020-11-18 1:49 p.m., Shachar Menashe wrote:
> About the busybox patch, I realized that Dunfell doesn't come with the "o=
penssl" binary built-in (only the library) but this fix will actually requi=
res having the openssl binary (busybox invokes the openssl binary directly)
> Do you think it's reasonable to add it? The library is already getting bu=
ilt, so I don't think it's a huge deal to add the binary as well

For dunfell, you need to ask Steve and the oe-core list.
I've CCed both Steve and the list here.

Typically we would not add components to an image after release
but since you have a bug that adding openssl-bin fixes, that's
a different story. You would need to add a dependency
on openssl-bin from busybox. That seems wrong since it'll
increase the size of core-image-minimal.

>
> I'm thinking we would need to add "openssl-bin" to the openssl recipe som=
ewhere, right?

The openssl recipe on master already produces:

$ ls tmp-glibc/work/core2-64-wrs-linux/openssl/1.1.1h-r0/packages-split/
libcrypto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 libssl.shlibdeps=C2=A0 openssl-bin.shlibdeps=20
openssl-dev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openssl-engines.shlibdeps=C2=A0 o=
penssl-src
libcrypto.shlibdeps=C2=A0 openssl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 openssl-conf openssl-doc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
openssl-locale=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 openssl-staticdev
libssl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 openssl-bin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 openssl-dbg=
 openssl-engines=C2=A0=20
openssl-misc


An example of a dependency on openssl-bin is:

$ cd .../oe-core.git
$ rg openssl-bin
...
meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
87:RDEPENDS_${PN}_class-target =3D "openssl-bin"
89:RDEPENDS_${PN}_class-nativesdk =3D "nativesdk-openssl-bin"

so without looking carefully at the busybox recipe, I do wonder
if you just need an *optional* dependency on ca-certificates.

Looking at the busybox recipe, it would be better to have busybox-wget
depend on openssl-bin like:

# busybox's unzip test case needs zip command, which busybox itself does=20
not provide
RDEPENDS_${PN}-ptest =3D "zip"

of course a busybox-wget only component/alternative doesn't seem to=20
exist yet:

$ ls tmp-glibc/work/core2-64-oe-linux/busybox/1.32.0-r0/packages-splt
busybox=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 busybox-dev=C2=A0 busybox-httpd=C2=A0=
=C2=A0=C2=A0 busybox-locale=20
busybox.shlibdeps=C2=A0 busybox-staticdev=C2=A0 busybox-udhcpc
busybox-dbg=C2=A0 busybox-doc=C2=A0 busybox-hwclock=C2=A0 busybox-mdev=20
busybox-src=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 busybox-syslog=C2=A0=
=C2=A0=C2=A0=C2=A0 busybox-udhcpd

so you'd have to separate that out like we have for -syslog and -httpd, etc=
.

It's more work than you signed up for but I'm pretty sure that people
are not going to want to have our default core-image-minimal include
openssl-FOO and increase in size.

$ grep busybox=20
tmp-glibc/deploy/images/qemux86-64/core-image-minimal-qemux86-64-2020111723=
2559.rootfs.manifest
busybox core2-64 1.32.0-r0
busybox-hwclock core2-64 1.32.0-r0
busybox-syslog core2-64 1.32.0-r0
busybox-udhcpc core2-64 1.32.0-r0

$ grep openssl=20
tmp-glibc/deploy/images/qemux86-64/core-image-minimal-qemux86-64-2020111723=
2559.rootfs.manifest
NULL
$

Hopefully someone opinionated about busybox will make a suggestion
on how to resolve this bug.

../Randy


# Randy MacLeod
# Wind River Linux

