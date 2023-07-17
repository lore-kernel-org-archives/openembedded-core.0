Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AB3EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 05:07:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.43])
 by mx.groups.io with SMTP id smtpd.web10.1878.1689570468065808778
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 22:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.8.43, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7MQ++r0sp8VQpVkeApO7rnRE4UIU3t63ATYqZMMYTiybAgnatPMkM4fM6vVQXrxl7BJc2s6zjD8vYZw32DA2P+2eX7aZMF9LRl+HCdJ58NzWgPIaahcYadcum2RoSA27P4dQd4IJwD69anxz1MeIzoDgJ9L0RUN2B4YsgOZOcQX4VOkaohktLZSmOk7EDUzF9lPLJBwKiXp7XOGRTQSaOcgBFz70mLehLxlj/j3bg1YADJVn14m7rW0oCqz3diRZ5MwxrRKflJcnDNFZyvvvW56Nrk5e/f2YKpGDf8ocgwCbk8+HIztw1NIQHY8qbhe3iKjs5udexvNmFNWbBbWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7JhKvH+4eiiWAp8De4IgpW1joP4rz7jcBQAMfOkuZQ=;
 b=kYvmEXHamAsKbYLdtTuSYlDSgfUlsO8asT6R3LnTUG9Kcj8oDhOYpTrRTEQ7I9l6knLT9fRfMrD2gwpcLm2Yg+JEc61aFwig5L19sWscZ4AtP9yfzC5IkTL1pgWLJcNIe/vCJ71z5FCXosVaFEEZWkUjmx/BK+L5v8rhwLfLkUBuVXQATfdPMPQue+WONKslPic8+RJlA9aS/Jg41JnxMWo160uUESeRAQMVocixydtOiJInmsy6HSfpjA2zOfW9P9zzs1fdSxUa//eHjtJ+blQn+1RH+h8HEyGhcUO4XYeJLIazb4FvZt5TozzCf9RlnmJ94VJiyQVyj4dDNP/65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7JhKvH+4eiiWAp8De4IgpW1joP4rz7jcBQAMfOkuZQ=;
 b=gSc2aqrdw6sRq1EOiHrwROq/hE0EFmmAVBsNrbFiadgKSy0+DTdWYeP4fMoKINn7bM0mfpY7mhVVE/y0VflkzIlmEDfkaYcUXxEPQCM80IcgShQE6huepmyjyNPalWbpMKqNk3gI43UuytkyM7Khx6GV0UGhLLTF6PfgRpLVB0g=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 05:07:43 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::59fb:77a5:f72e:d4fc]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::59fb:77a5:f72e:d4fc%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 05:07:43 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZuGyekzHqMul5f0mnOAb2KMU37A==
Date: Mon, 17 Jul 2023 05:07:43 +0000
Message-ID: 
 <VI1PR04MB53733A07BF96397321E80A32913BA@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230716213857fea03b3e@mail.local>
In-Reply-To: <20230716213857fea03b3e@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PA4PR04MB8064:EE_
x-ms-office365-filtering-correlation-id: 7b470c96-e0f3-4660-563f-08db8683c098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e1Bv9ejWGusewQojS2tmwWxUgEjcL6661ymudwfWTtUEAGp6N1CK+4Yml3SQHm2pO4+ALU+KRe6fZ4GKGg3u5iVo446Y988TdaJI+nOUgW8KERVrTJnWbrkAhza+Fezs9bZS/tLwfZbyu8wD28By/ptmQ0KZu1LZxh9LaatjGYOz6a7fnOhcsRXoNy5xiE+WnVQSAzS2LEnLsu1u+UB+xeILZlTaCo9IIXVMA/bxMRO+u6kDq1HRDug686k6rmIGEN9ne6tkmW5fQBjtNoTVpcWZ/maODEjUFDJFQQFmPLifO07FQdBgmQtkJtaKlEEPgIFb+n4Y23LUEzPRVlrKhQOFatxhk6qWgcY5rs19mMvJB4Hq6FRn8FNkBhTaY82/M8ilEDdwzMIWgbowCvIBa7sdYZVp6sFPIpteA5FSLtY/SAE7XmbJOJYxQS4fEHVLvbErMlwA0IsDDnamw9xN5Oad4nrx6NJTz77gcTOmqFOWjqBqweZ/G+Tv/QBn8AyUwOdEvgYzo6Wi32+mFh6A894kQJM0mGCvN4LvsAICacfRPj9Td7psrQpoU6BSxV6zAYmjQEwh5I98wBGRomWiNzg9X2+GHHM8YOiwaYhN83M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(346002)(396003)(136003)(366004)(376002)(451199021)(55016003)(71200400001)(122000001)(54906003)(38100700002)(7696005)(166002)(478600001)(41300700001)(45080400002)(5660300002)(8936002)(52536014)(8676002)(66946007)(66556008)(66476007)(64756008)(6916009)(66446008)(91956017)(76116006)(316002)(4326008)(66574015)(186003)(83380400001)(966005)(53546011)(9686003)(26005)(6506007)(86362001)(33656002)(38070700005)(30864003)(2906002)(66899021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?tvYC8PdwIBiT4y/tC8ODnsYbjsHtaoSPGJgTs19KagpdkPUzakqM8WW/?=
 =?windows-1250?Q?fm1dmeWmASiurNA9i3Y4geswFTrgE8r6D5rEmOHfcNxPb5GdsGJbDWHE?=
 =?windows-1250?Q?gNfmBtbExmFnrT1nbEVe8yCxOt9DweBG6YF3iILZv159uehy4agVIhOg?=
 =?windows-1250?Q?SkC9iWOGHBNjlGJFk2nJDFqfr+yF821yR36PlWyZOXu1no6qIJa0GRW8?=
 =?windows-1250?Q?stp/NYhBViaBT3yUx2Uq4l4NO3MwMDak+sj6v9LOqj0wV4Qc6sH32kbs?=
 =?windows-1250?Q?uBA/BCvQdYJf6u66StyqnF1djJSi4h37czrRU2VBGqsip16eM7HdWCRT?=
 =?windows-1250?Q?Dz0IcIP9/mbhBuzWX6QXdHq5cvwBHABhDl2LSXcfu9wcmTQnHHg72J4T?=
 =?windows-1250?Q?3ilsIekCm8ywFSELS9x5qj7mZrTWIzUhrOSr+bKSzSBMLZJvR/XeLqbL?=
 =?windows-1250?Q?AA9T5SrgiNxHmMcmJOE3bZU4kBTCfoSxqXUVfrvaPeXGOSluYUGvwmhi?=
 =?windows-1250?Q?HmF5NfbnBEM0JKwmUlTOh+OXt6dGXFXlhs/QvTwpEeJewnNjZDzbrpik?=
 =?windows-1250?Q?k2TmCsMP3SuOdMf7+YsD66dYtyjDTK+ip6hgWnHXGYUPW8AckDSTgd7q?=
 =?windows-1250?Q?4YH7AMOxZ35gi4z3C/A+pqkJ7KRR6mPa5FpP/EjGP/W5Sw7iWaWdBIVG?=
 =?windows-1250?Q?EexeEpBy/wnjmOiLYjUCVqDxmPR/Qu1NCG00dz0JCZrWKnNEqVD3Psn7?=
 =?windows-1250?Q?4UHn98MGkY2/X9tzXcFzH8DTrmcrjEJ151EdY1PZVVqfj/bTIHVsPQV9?=
 =?windows-1250?Q?byamkjOLnYQ+Q43P3oeFoq5ItaaNgTyuUGlavdRuRE/n0+/Ptrbutuk2?=
 =?windows-1250?Q?YcldARmBat0VavSGYppZm9WZZ+3WxIra1Def5iMpGUuPE9MfIXYhQdi+?=
 =?windows-1250?Q?FsMWvVYXOp8i+tjh4oncXFR9pLd42sGMHHkP2Kkk+V9LQ0lIDVBWdC74?=
 =?windows-1250?Q?owRU+XC6VBzJwaYcnOolNweOfWhAHeYbrZr/5yLUOo8KyqMcRS5oGnb/?=
 =?windows-1250?Q?o9ytgSdQM6tG7ZADIYlfLY7OtMCInEz1jR3cpZ7iiw8IQikU6HrUQnEP?=
 =?windows-1250?Q?3o2HWdd2sW76N9rGR4oR042TeuYFSuir1MTpRG2qdTlUswznF+R3UqPz?=
 =?windows-1250?Q?VM2yHmhsqA2KxHAXJRg5+H7qDNWl6BSL4He1p8EHGx2ymH7+jU/Gnyya?=
 =?windows-1250?Q?n6K3MffPkb2C0szoWDPOAC5o9AW0SgqGAhdGzGwhxeCqnIUhdkSA5sXB?=
 =?windows-1250?Q?8yfL8srz+rFaDFhm4i20EAlwVeboTyHr2O4Y3kyqZdjlzjXf7mSnbyRE?=
 =?windows-1250?Q?B9vYvvDXoUfeq7uPhuqQ9QfVxT+rwd8fYbC0593bwZGgHHzHmQ0AmELY?=
 =?windows-1250?Q?Z7WKwFCR0oxPIRPIpFcQIzBwqkMmet+0CluDKL0iOMo83o5DgnU9JRr6?=
 =?windows-1250?Q?KEBumF9bcPv91xnHWRI9wv4PRBGHELCzeoZ9SZbjV4a805pM2GtUpjqY?=
 =?windows-1250?Q?9s/lDO5d9pMmaHHwZ1jj4vf1mB0TDEea7j4WGceCspAYw7CLsQFcdI0e?=
 =?windows-1250?Q?tyXKDoxO+s8Ruj7a/s6J0jhQnIUGuN0vrKXtqRR2bvNWtPPzSdNfLJ7i?=
 =?windows-1250?Q?SugoqRM7vzYwQQuc4QlQYEEc1Aiz6DuZctcWoq5kfrML8Gfx5yp0bg?=
 =?windows-1250?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53733A07BF96397321E80A32913BAVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b470c96-e0f3-4660-563f-08db8683c098
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 05:07:43.3047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+egJRHiynvoqKnyhb1uzIJUdk7IIizAXwMUrq34+T2gUy6DMwQWhfoGM9e9qgDAFGMaOfOLP9z1LYETDEzEqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 05:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184428

--_000_VI1PR04MB53733A07BF96397321E80A32913BAVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Ok, this is odd. Can you tell me how can I reproduce this, step by step on =
my local machine? Because I have to admit that it is not happening for me=
=85

BR
Piotr

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: Sunday, July 16, 2023 11:38:57 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: Alex Stewart <alex.stewart@ni.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Temat: Re: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr dis=
tro native features support

Hello,

On 14/07/2023 10:14:50+0000, Piotr =A3obacz wrote:
> OK so, does any one have any thoughts regarding this patchset?

This still fails on the autobuilder, most of the builds failed:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F37%2Fbuilds%2F7477%2Fste=
ps%2F11%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C10c1276b3f=
d543cc67b708db8645103e%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382514=
03412289373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DzXRK85lPPyJLxmXEhO%2Bgn=
fIiGFrOgxG5caBoqkHILO8%3D&reserved=3D0<https://autobuilder.yoctoproject.org=
/typhoon/#/builders/37/builds/7477/steps/11/logs/stdio>

ERROR: nativesdk-xcb-proto-1.15.2-r0 do_package_write_ipk: Fatal errors occ=
urred in subprocesses:
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-python-xcbgen=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-proto-dev=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-proto-dbg=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]


> ________________________________
> Od: Alex Stewart <alex.stewart@ni.com>
> Wys=B3ane: czwartek, 13 lipca 2023 00:04
> Do: Piotr =A3obacz <p.lobacz@welotec.com>; openembedded-core@lists.openem=
bedded.org <openembedded-core@lists.openembedded.org>
> Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro=
 native features support
>
> ACK this patchset, assuming the other maintainers are happy with how
> we're handling the DISTO_FEATURES.
>
> I chose not to include Piotr's opkg and opkg-utils ACL/xattr changes
> into the 0.6.2 release, which I have just pushed. They've been merged
> afterward, and can still be applied atop 0.6.2, and they'll be merged
> into the December opkg release.
>
> I have a branch ready to upgrade the opkg and opkg-utils recipes, but
> I'd like to wait for this patchset to clear, because they will otherwise
> conflict.
>
> On 7/12/23 15:04, Piotr =A3obacz via lists.openembedded.org wrote:
> > Include support for ACLs and extended file attributes for native
> > builds, by default.
> >
> > Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> > ---
> >   meta/conf/bitbake.conf | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 9625a6fef4..8daaaad615 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
> >
> >   # Native distro features (will always be used for -native, even if th=
ey
> >   # are not enabled for target)
> > -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> > +DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
> >   DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> >
> >   # Normally target distro features will not be applied to native build=
s:
> >
> >
> >
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184256): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184256&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C10c1276b3fd543cc67=
b708db8645103e%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638251403412289=
373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DzsH6T8BYqh0IgQwSiw2PFvprH%2BvVm=
3Y%2BRLI4rh7qJGI%3D&reserved=3D0<https://lists.openembedded.org/g/openembed=
ded-core/message/184256>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100138221%2F3617179&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DTDg6QY9bBlFoX%2BAjFodWzG%2F%2BV0FcVSiPxeHX3xCNrlE%3D&reserv=
ed=3D0<https://lists.openembedded.org/mt/100138221/3617179>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3D8Da9un7MZzI2lfa0HmdZtFyp4vLWj7X7mfJ10Xwfi%2Fk%3D&reserved=
=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.b=
elloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C10c1276b3fd543cc67b708db8=
645103e%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638251403412289373%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DhuIDJ67qcpI8vUTiPCmD1OkeGYNCfqnbjtJxHx=
eULg4%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB53733A07BF96397321E80A32913BAVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Ok, this is odd. Can you tell me how can I reproduce this,=
 step by step on my local machine? Because I have to admit that it is not h=
appening for me=85</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR</div>
<div dir=3D"ltr">Piotr</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef">Outlook dla system=
u iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> Sunday, July 16, 2023 11:38:57 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> Alex Stewart &lt;alex.stewart@ni.com&gt;; openembedded-core@list=
s.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xa=
ttr distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
On 14/07/2023 10:14:50+0000, Piotr =A3obacz wrote:<br>
&gt; OK so, does any one have any thoughts regarding this patchset?<br>
<br>
This still fails on the autobuilder, most of the builds failed:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/37/build=
s/7477/steps/11/logs/stdio">https://eur04.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilder=
s%2F37%2Fbuilds%2F7477%2Fsteps%2F11%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp.l=
obacz%40welotec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d5a4c51a4=
ca7f8e44011b39%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C=
&amp;sdata=3DzXRK85lPPyJLxmXEhO%2BgnfIiGFrOgxG5caBoqkHILO8%3D&amp;reserved=
=3D0</a><br>
<br>
ERROR: nativesdk-xcb-proto-1.15.2-r0 do_package_write_ipk: Fatal errors occ=
urred in subprocesses:<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/genericx86-64/build/scri=
pts/nativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worke=
r/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk=
-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpat=
h-native:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-p=
okysdk-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wor=
k/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot=
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/c=
rossscripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work=
/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-=
native/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/=
work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysr=
oot-native/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/=
bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools&qu=
ot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; nativesdk-python-xcbgen /home/pokybuild/yocto-worker/genericx=
86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto=
/1.15.2-r0/deploy-ipks/i686-nativesdk' returned non-zero exit status
 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner]
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/genericx86-64/build/scri=
pts/nativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worke=
r/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk=
-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpat=
h-native:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-p=
okysdk-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wor=
k/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot=
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/c=
rossscripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work=
/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-=
native/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/=
work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysr=
oot-native/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/=
bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools&qu=
ot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; nativesdk-xcb-proto-dev /home/pokybuild/yocto-worker/genericx=
86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto=
/1.15.2-r0/deploy-ipks/i686-nativesdk' returned non-zero exit status
 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner]
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
Command 'PATH=3D&quot;/home/pokybuild/yocto-worker/genericx86-64/build/scri=
pts/nativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/bu=
ild/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worke=
r/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk=
-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpat=
h-native:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokys=
dk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-p=
okysdk-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wor=
k/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot=
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/c=
rossscripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work=
/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-=
native/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/=
work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysr=
oot-native/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-s=
ysroot-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/=
bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools&qu=
ot;
 opkg-build -Z xz -a &quot;--memlimit=3D5% --threads=3D8&quot; &quot;&quot;=
 &quot;&quot; nativesdk-xcb-proto-dbg /home/pokybuild/yocto-worker/genericx=
86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto=
/1.15.2-r0/deploy-ipks/i686-nativesdk' returned non-zero exit status
 1.<br>
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner]
 [-g group] &lt;pkg_directory&gt; [&lt;destination_directory&gt;]<br>
<br>
<br>
&gt; ________________________________<br>
&gt; Od: Alex Stewart &lt;alex.stewart@ni.com&gt;<br>
&gt; Wys=B3ane: czwartek, 13 lipca 2023 00:04<br>
&gt; Do: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
&gt; Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr dis=
tro native features support<br>
&gt; <br>
&gt; ACK this patchset, assuming the other maintainers are happy with how<b=
r>
&gt; we're handling the DISTO_FEATURES.<br>
&gt; <br>
&gt; I chose not to include Piotr's opkg and opkg-utils ACL/xattr changes<b=
r>
&gt; into the 0.6.2 release, which I have just pushed. They've been merged<=
br>
&gt; afterward, and can still be applied atop 0.6.2, and they'll be merged<=
br>
&gt; into the December opkg release.<br>
&gt; <br>
&gt; I have a branch ready to upgrade the opkg and opkg-utils recipes, but<=
br>
&gt; I'd like to wait for this patchset to clear, because they will otherwi=
se<br>
&gt; conflict.<br>
&gt; <br>
&gt; On 7/12/23 15:04, Piotr =A3obacz via lists.openembedded.org wrote:<br>
&gt; &gt; Include support for ACLs and extended file attributes for native<=
br>
&gt; &gt; builds, by default.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp;&nbsp; meta/conf/bitbake.conf | 2 +-<br>
&gt; &gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; &gt; index 9625a6fef4..8daaaad615 100644<br>
&gt; &gt; --- a/meta/conf/bitbake.conf<br>
&gt; &gt; +++ b/meta/conf/bitbake.conf<br>
&gt; &gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATU=
RES}&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; # Native distro features (will always be used for -na=
tive, even if they<br>
&gt; &gt;&nbsp;&nbsp; # are not enabled for target)<br>
&gt; &gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; &gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;acl x11 ipv6 xattr&quot;<br>
&gt; &gt;&nbsp;&nbsp; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; # Normally target distro features will not be applied=
 to native builds:<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; <br>
&gt; --<br>
&gt; Alex Stewart<br>
&gt; Software Engineer - NI Real-Time OS<br>
&gt; NI (National Instruments)<br>
&gt; <br>
&gt; alex.stewart@ni.com<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184256): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184256">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184256&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DzsH6T8BYqh0IgQwSiw2PFvprH%2BvVm3Y%2BRLI4rh7qJGI%3D&amp=
;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10013822=
1/3617179">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100138221%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3DTDg6QY9bBlFoX%2BAjFodWzG%2F%2BV0FcVSiPxeHX3xCNrlE%3D&amp;reserved=3D0<=
/a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3D8Da9un7MZzI2lfa0HmdZtFyp4vLWj7X7mfJ10Xwfi%2Fk%3D&amp;reserved=3D0=
</a>
 [alexandre.belloni@bootlin.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7C10c1276b3fd543cc67b708db8645103e%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638251403412289373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DhuIDJ67qcpI8vUTiPCmD1OkeGYNCfqnbjtJxHxeULg4%3D&amp;reserved=3D0</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB53733A07BF96397321E80A32913BAVI1PR04MB5373eurp_--

