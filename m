Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.67])
 by mx.groups.io with SMTP id smtpd.web12.5338.1618674303220683037
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Apr 2021 08:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RCyI9S9e;
 spf=pass (domain: windriver.com, ip: 40.107.237.67, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wf2a3/cYYH/+lqz7yW5EBDitqbhvoWg7GNFpT5GQAXh3E0xzGU8ByqNSb0VHMhS24b6OURLgIDBo8R+XkUGZm2NN4WGt5LBgAbcctwQ/3KlE0cFIe1eClY13as2ioUBhJhREUrOq8olq6sIXdj6SFb2oxh0d4OPsnRTlFjL/26xWG3q6xBqnw3W63YhH4rgI+psXXo2dIr8nm/G28D095VuQe/ge3WzK8cydz3K9rq4UDz96aXeZaeI79C7QMSi9XrGtbbaSQNbBg+M0gkTHvACqSZS8pVHB14bHJKLaqG3JfY7t79phapo6UJcGaTfmFo4SW8uL8rPI4DS8rneXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxqRlHjoBhij3EcubHOTlby+UwFubdklAUEschC8crY=;
 b=QtT8iys8eAbeWIdzs+L60kuoFG7bpBf2zHeImM4Nza2qLLAAShxe5LBm0fbXpFJ+W+9oh2wlT+2Vmbvgz3/M5nuDcPnyaI31D+L5wLMN8Tpf9UshcmJDGYJC+CUICAzE/cqKT0Q5Cf+rZy2BAObg351E92Rmm5rpY+HLrgZEwws/NrlB4UHTmjgn25Xr1csr4qmZRazKlsWOSZFmmNJfTFTnNQf1hkMXeyBW0kHzYLx5TJWdxn5b8cm8aQhFfH+t5uE5V26xngQuXZ8ypfVqXLVtxMGjSIn7yhawN3dohZT4YH36Gwwglfm809mq8U0v7u0mKKZVR8PFNVCe69cDSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxqRlHjoBhij3EcubHOTlby+UwFubdklAUEschC8crY=;
 b=RCyI9S9eVR/uIAOcr2aT/NG3t7j2iG+ZjN8+ujUJADhS00mZAlo0PGSKSEtHlY5q1MSa3rKEpWULOvzotxovKVX5qaXito5Y1yoGmNpLaHTr3rfACh6M15IxYjA2suvZNochJqLUb4Tcx0QVEYNzTDcpr5kal+KdHfoR9uPyEQU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB0026.namprd11.prod.outlook.com (2603:10b6:4:62::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Sat, 17 Apr
 2021 15:44:59 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4042.018; Sat, 17 Apr 2021
 15:44:59 +0000
Subject: Re: [OE-core] [PATCH] packagegroup-core-base-utils.bb: check the gplv3 license
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 "Yu, Mingli" <mingli.yu@windriver.com>
CC: openembedded-core@lists.openembedded.org
References: <20201218053641.17017-1-mingli.yu@windriver.com>
 <CANNYZj9ymh8oCeQjPjY_bM5SCi3qLUNgHD908xbmrApdH7B_LQ@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <c6f53093-14bc-c429-4567-4efc3ca430d9@windriver.com>
Date: Sat, 17 Apr 2021 11:44:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CANNYZj9ymh8oCeQjPjY_bM5SCi3qLUNgHD908xbmrApdH7B_LQ@mail.gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0262.namprd03.prod.outlook.com (2603:10b6:a03:3a0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18 via Frontend Transport; Sat, 17 Apr 2021 15:44:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0240128d-4fae-4103-e1c5-08d901b7c20a
X-MS-TrafficTypeDiagnostic: DM5PR11MB0026:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0026C9C002BB78A67E11B868F84B9@DM5PR11MB0026.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YDpPzf58dSVpjUg3fT+FIGwh9h/llPVbCN8+Cf2k7k0oR8CB90ZrObcLESL/IGuFrWV35oHFTzbY+ihtjJ7I5ks3XoQ7Oy+LBHxl60uuMjxSMPoIQQ+rzST5R/lpBZqbwG6zBUciCBHKkOrRlSRQhjB+Y7bEHUj2nwZ0YMYye8e1+9ki/x0TCswAScGW8n/aVyB2VtiUJmtVCJkKn9WnXPAYU2KJ7OSj2umIo8Uch5/P7jXmXfk3aTkR+EZNBfRPAE1mUo0Zn5GZHPW+J1zC6imbb9OEOxX3E/0igmBcrIWRiRw4gvzuQgj/hnVpBnKwSoeeUFJdkz4OtLiUwOAxJ/wP4xHoMlzd4bPco2z3ADicaRSUOhJdrn0/fYZrl+oPaRrhPFKwa0wVnth7zuGmKD2NubcLhPWq7O028S1kTe/8q+fpU+SeEdQ43WewmN3jWC4sl1N34qXs1xpzcLWd/EuupnfaiOjLr7ZkAkewjfpxbPAyFYZsJLpyyVKRHAjEilizWbv1Wo67eBccvaP4DNSX1Ucs1eDfNbYsmKesJxH+WVi+Ja+rdTdZo42AvchaU2L6MMKRmkJY9WcmjfBTO5eGjXpouJ2WR/BlkcOVCWj4MfVnvp5WyG7/yepIzWQORrRGxpZSjcyal1D4+co8DA6gQY1KEt1jPgzU4aNbixGGE/G94ruFmvP1YUDWWxpMcb5IbwsppIYzeKkYxx9X0w6MU9+pJZl3vFPtdNoaGcTPwKVEJZcHLkdnX85eM7ZdREn2qeW6EudzMMzXNA2Nqim10XiOf9SNpjOLOdqldJ8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(366004)(376002)(136003)(53546011)(52116002)(83380400001)(38350700002)(6486002)(38100700002)(4001150100001)(8936002)(36756003)(956004)(31696002)(31686004)(2616005)(16526019)(186003)(316002)(478600001)(6636002)(966005)(26005)(4326008)(16576012)(110136005)(2906002)(66946007)(66476007)(66556008)(5660300002)(8676002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZwI2TAwsKyaXW9jO0YBUvQjOP3cUsPQfwLmXVZXyLJIYlLcuCENw194/27WR?=
 =?us-ascii?Q?zwO81FvMhLqgF4/yEFPMbaCsWNhWcuT5VD4b7T+IZ/yKgl5yHAPaedkslAdJ?=
 =?us-ascii?Q?7Lw4+9Zl4gFUlCyrW/vCO4pCFaj6wd+kbPzoHHWIM2NXT3uDr6nxJikoRJBh?=
 =?us-ascii?Q?1dyZWvSar7ujNwj69xvkiAPOWtcbleSn6OGWVjTC12j9AkUejp24PMtrxlz7?=
 =?us-ascii?Q?f0Rbb7VqfoF9p6FII/xHrShAvkH5z//eVq8N5jXRoCnr5L4nhk/ol6H3/Tq7?=
 =?us-ascii?Q?6pEKjLaDq3T991/rKWCGExO1UAIM5AkIkbq4PpYQn59hnpeF9HDeOIVaWqRL?=
 =?us-ascii?Q?qolwHevJvdbf0BOXQcN9Ttq5c84AVAM/XFD27UMDicp6KZo3LwY0OJwBHCMn?=
 =?us-ascii?Q?uzgxx3bE8qiVVlA/aZdNyuOxVUEmeNHmMMP3bAj9yhtgbiG+2Y3zczfMC0H5?=
 =?us-ascii?Q?RNMepQdZkuF+aAKvBi9lwD44LEwVqOrwxHeP8WXXQ1i3IeM8KgFg04bwkGwu?=
 =?us-ascii?Q?u+vFAPajKC0RjlzbFKwgUt6DhkU/Q7ftCcNx/iDBsf2A5vmX7f3Q6w1Bwzib?=
 =?us-ascii?Q?mBq0cSIkJ9QNzmoKCQzObo0xadiwd6v9GYIblcNhrmhoXzrvCkJobVllRxx0?=
 =?us-ascii?Q?Z/5GvfD4dFvzRrDTuKnxe7/XUZV1Vh80n6DF5OJ7+IJy8319iPJinyH3Wmf0?=
 =?us-ascii?Q?fUMzBsE8SicHj37ChHuISF6R7XXk+MfWRsp+gphx+eiqU/1JFnAvWujOJURj?=
 =?us-ascii?Q?nmjdBnMTV+XuhnMZpAgsLp+WXs8CqBon/cNxpjwn6uAsyXaPPP1JcI7b2zHo?=
 =?us-ascii?Q?WfjRqxf5hPhnPYG7X07J23mEtd3GVvWgogiyz977OHOc1X4WhAfs+I1L7gcJ?=
 =?us-ascii?Q?UMj3seBG0EFqKR1XrG5hqlBxLezKfhhClMq/T1+R0K87cr7s0A1vdfWpZWpT?=
 =?us-ascii?Q?F71cK0TRbJJg74QogD7RIN2ibr86w3osd0yHm3VqnzypalfAKTOXljpHTX9M?=
 =?us-ascii?Q?IO0dmQIQNNLLCR4/QJBCFK1sEuhlUqzheVU26OZI4JnV1dlDjHCflSjZmCHp?=
 =?us-ascii?Q?IVLOGzGjSyzBMRgdbOwdTnlSbK+o7kV+n9CK0yv0AlvdJojMwMZXTnWMFbkU?=
 =?us-ascii?Q?soRlj961H0306U/tQ9L7lL0+drHZgvAnpL4AhxJ5v/XLs/ts0VifZoorf4Uw?=
 =?us-ascii?Q?OaG4+415IVEYC/x1kJ9RJ/XAw0gjiOGkwtjmLVhvCP0TehiggXhWfqaFId1O?=
 =?us-ascii?Q?/F+l1IH2ZgQAJP0II4HY4X+yJRVXv214s18Ty86cuR7pdLq5/DaGnQSkrYrk?=
 =?us-ascii?Q?FeBIwuOZhozPcvzjqhzUzSU6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0240128d-4fae-4103-e1c5-08d901b7c20a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2021 15:44:59.7690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EFyq8O7n67qsifybOMTTiYPAHWBurk+UA8tOXBjPaamY5uvPN6i+0pV6tPrSOsKf7PPxWig4JQAQ/5Q4bdCOOAhowgPDKGUCFoecpXbfDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0026
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2020-12-18 2:47 a.m., Alexander Kanavin wrote:
> I=E2=80=99m not sure I like this approach. It doesn=E2=80=99t look like =
the right place=20
> to decide whether to include or not some packages based on specific=20
> licensing requirements, licenses for these and other items change over=
=20
> time, and there may be more undesirable licenses than just this one.
>=20
> Why not simply create a new package group?
>=20
> Alex

Makes sense to me, Mingli?

I'm replying months later because I see that we fixed this locally
without getting agreement with Alex and other oe-core devs. Not a
big deal but we want to minimize our collection of WR specific patches.

../Randy
>=20
> On Fri 18. Dec 2020 at 6.37, Yu, Mingli <mingli.yu@windriver.com=20
> <mailto:mingli.yu@windriver.com>> wrote:
>=20
>     From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>=20
>     packagegroup-core-base-utils repends on some packages which are
>     gplv3 compatilbe.
>=20
>     Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>     ---
>      =C2=A0.../packagegroups/packagegroup-core-base-utils.bb
>     <http://packagegroup-core-base-utils.bb>=C2=A0 | 14 +++++++-------
>      =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
>     diff --git
>     a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.b=
b <http://packagegroup-core-base-utils.bb>
>     b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.b=
b <http://packagegroup-core-base-utils.bb>
>     index 1e63da7f16..0a3cb63bc2 100644
>     ---
>     a/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.b=
b <http://packagegroup-core-base-utils.bb>
>     +++
>     b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.b=
b <http://packagegroup-core-base-utils.bb>
>     @@ -33,18 +33,18 @@ RDEPENDS_${PN} =3D "\
>      =C2=A0 =C2=A0 =C2=A0grep \
>      =C2=A0 =C2=A0 =C2=A0gzip \
>      =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains("DISTRO_FEATURES", "system=
d", "",
>     "ifupdown", d)} \
>     -=C2=A0 =C2=A0 inetutils \
>     -=C2=A0 =C2=A0 inetutils-ping \
>     -=C2=A0 =C2=A0 inetutils-telnet \
>     -=C2=A0 =C2=A0 inetutils-tftp \
>     -=C2=A0 =C2=A0 inetutils-traceroute \
>     +=C2=A0 =C2=A0 ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3',=
 '',
>     'inetutils', d)} \
>     +=C2=A0 =C2=A0 ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3',=
 '',
>     'inetutils-ping', d)} \
>     +=C2=A0 =C2=A0 ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3',=
 '',
>     'inetutils-telnet', d)} \
>     +=C2=A0 =C2=A0 ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3',=
 '',
>     'inetutils-tftp', d)} \
>     +=C2=A0 =C2=A0 ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3',=
 '',
>     'inetutils-traceroute', d)} \
>      =C2=A0 =C2=A0 =C2=A0iproute2 \
>      =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains("MACHINE_FEATURES", "keybo=
ard", "kbd",
>     "", d)} \
>      =C2=A0 =C2=A0 =C2=A0kmod \
>      =C2=A0 =C2=A0 =C2=A0less \
>      =C2=A0 =C2=A0 =C2=A0ncurses-tools \
>      =C2=A0 =C2=A0 =C2=A0net-tools \
>     -=C2=A0 =C2=A0 parted \
>     +=C2=A0 =C2=A0 ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3',=
 '',
>     'parted', d)} \
>      =C2=A0 =C2=A0 =C2=A0patch \
>      =C2=A0 =C2=A0 =C2=A0procps \
>      =C2=A0 =C2=A0 =C2=A0psmisc \
>     @@ -55,7 +55,7 @@ RDEPENDS_${PN} =3D "\
>      =C2=A0 =C2=A0 =C2=A0unzip \
>      =C2=A0 =C2=A0 =C2=A0util-linux \
>      =C2=A0 =C2=A0 =C2=A0${VIRTUAL-RUNTIME_vim} \
>     -=C2=A0 =C2=A0 wget \
>     +=C2=A0 =C2=A0 ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3',=
 '',
>     'wget', d)} \
>      =C2=A0 =C2=A0 =C2=A0which \
>      =C2=A0 =C2=A0 =C2=A0xz \
>      =C2=A0 =C2=A0 =C2=A0"
>     --=20
>     2.26.2
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
