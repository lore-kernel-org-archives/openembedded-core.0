Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6EAC7EE23
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 14:49:33 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.90955.1684162164135772607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 07:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAmjOLgFax+hq7ktdQpEra49azqJFClopAPAZLbxY6snlIcnZJC7cwX+TjYs4881k8oDgkLEdJJyZHAeezpyJSY1esghIIAbEdUmuAESiYAYLFihEjNkctyZIYCLlmaZTVTNiub/lQjQDl6MPmCJgGOz0hmEhWnUNoMiJC90wcYFDK0Xk7fwGL/efTQgrdem7VjLyG71fuYP9rCJm0Pzv+/GIotBlzKBBOEl+7Ysw36jroQ0VfZoYOQOCE725CxNf5v442H1T5F5qvZT490DM0Hc+dZAxy2pd9Ug5FJ3LvF+FGoA0M3e7wiiE3BTK1F/zdvY2fPiFcF9oQ9u7F/BaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teSWa8H4srXPQLu9W/5yvJRdr61Wb0AVHwNzUs7l7a8=;
 b=Lw9i2TJ6qknixcw/dy1kEIrDeGsNMJS+8I0bN70VfSQgg+4cV7yC2RsuHY82VTmLimG1l3Q9mkDhHsIC7IL9WLDzIHMmPbwvBcRMXQHIx8coPowvOAEbmd3QzsSa7LfaZ2eBC6Bmvb7nzNspeOgWLeEtnkP07/JforxBA8BX7PS4mJ2i0cfEH/SdkLdogw3zV9tmT0hiWftciF7DureXrvSLbTU+rIMre5uW/uGJ2FMnIKb12xoDerSgQyFttDReGpipve/qF498ndXwO5yWNGn7pnA8K9XG9NdyIX5iGXN9TZMXnqwPt8YE1D/sHmNbqYtF8Q6cD1o0a+f3tEipXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teSWa8H4srXPQLu9W/5yvJRdr61Wb0AVHwNzUs7l7a8=;
 b=SQypkjVMYBsDu0UVdu13FMn2ABxMuwdDR/Zi3T0SO46sQXo6CtAaIMe6tkoQ7+Qmz17pCCBn2ja8dLae/nPIVrgIQ/8zzunfxtOp5L6R2DN/GnTef05C+UKfZhbgFj2ryrDllQjWK01ViLLUyisLdtQZA5KKv2JUENu1yrN57s0=
From: =?windows-1250?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: Ross Burton <Ross.Burton@arm.com>, "Martin.Jansa@gmail.com"
	<Martin.Jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core][PATCH v5 1/6] gobject-introspection: reduce
 dependencies
Thread-Topic: [OE-core][PATCH v5 1/6] gobject-introspection: reduce
 dependencies
Thread-Index: AQHZZhyWLSq8q4OtAESQoXg3e0a3Cq9bd9qAgAAmhYCAAAZXaA==
Date: Mon, 15 May 2023 14:49:19 +0000
Message-ID: <DB4PR02MB100309C46E213B4BD625C20C2E2789@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230403110646.2555294-1-kubiznak@2n.com>
 <CA+chaQf7GPW=GZ4yYG+BjbBOYST2O7R7xwQSstRdC=chzaWU0A@mail.gmail.com>
 <5A51BE7C-AB58-448D-93F2-0AE5EE4C9AA1@arm.com>
In-Reply-To: <5A51BE7C-AB58-448D-93F2-0AE5EE4C9AA1@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|AM7PR02MB6098:EE_
x-ms-office365-filtering-correlation-id: 25b9f39c-f30a-4fdb-31d0-08db5553902d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LeQlvCe6ZQjMHF4eSflc6YCvnIraJ/A6vodhrZPC0Rri2T1goxxgmS18N0rPoKKJOB3Fz88+QdK9EDjdaiXGl/r6RxBHEbdRCpmnzQsTeRxvNWTTh25ZZB/xhAG1Ybfb3/RPQ7BvAmVns2iMz/ndCxFykhMCL8G9zG8LyeuZnw7fFVbSotzodC5txpjVgGMWs1r/TO4CaeXRd6lL9j159NPeGxD8wAsoNx/KyqsbnC3LgEHkoiGewrdc7OCJn3Y4YlErRn+yG8sabBns1o1px01yfXXv8N/DfzNliGPfzIINE8cOLq7xyqZ3FDj+UClUI0+aC04ESgd9WohZbHBRGge2KsxH+8ejSPELu+hwXVGnL7l8dtRdhaVO2Dh86BsjKPfwL0qWg6YH0CvWiTJrKwJQy2lt6uAt1cGQiMU7VCL7NZndZNxpF4ojBPX8PHM4Ww2KMIMrqYuvVzbzYwrfVO26u951xwsaos8n9EMb/v72ULzDVBAWxscl8jH2ZfyK2gZwRqLwq6QY1ZdytgyKAIOG2QJ1h2Pkpv7TG/m4xnTTx1XxxJU2RkP1tBMXnnPk1qTPvjpuiOdy9CyhEdGxml1XiVGDgqWZeYZUTHSVf1E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(376002)(396003)(346002)(136003)(451199021)(316002)(64756008)(2906002)(66946007)(76116006)(4326008)(5660300002)(52536014)(8676002)(8936002)(66556008)(66476007)(66446008)(91956017)(41300700001)(86362001)(54906003)(110136005)(478600001)(55016003)(966005)(7696005)(71200400001)(26005)(186003)(6506007)(53546011)(83380400001)(33656002)(9686003)(122000001)(38070700005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?windows-1250?Q?snTDT+czea9//LTN63LLJOQvc80oPllFI6pYjRXlBZ/H98g48tvZIhmo?=
 =?windows-1250?Q?nHgVscJJp4lyEq8mRzrPhfblbnv0YxNasoP/sROh2se3ThS1dVqBOdo1?=
 =?windows-1250?Q?bHCu7y4Apg0xAvBuR//MPxHlxqNayhaAjb2A6FAl2ASKjNAOIPIwRx1+?=
 =?windows-1250?Q?uQDzcEgpPz5T/feligdoiaiEWcPUp1aGNHTlO4lvlcJL/ROW1mf/GQ2N?=
 =?windows-1250?Q?JZ0HIGm1pSVdepAhNkXHw7YNEvBBY4M+mOMnHuVWdrAVpqsNmaVQPtf1?=
 =?windows-1250?Q?I4MpVw77XJGBfMUqU0z0XHN3I2wkWPe6f5ZDwphhC4NJ66i3BtzCYYsJ?=
 =?windows-1250?Q?8GFMxyzD+6HtzKA2GYlaTcxFM75moDyFzIsieix2tEHvEVDlNLntb9O0?=
 =?windows-1250?Q?LrGrKm+c8dKr2ZUeg0UlhECZ6qTKlgbM1Cg1A5PfA7WpL7GXwwoJ5eFo?=
 =?windows-1250?Q?yA/A4iY7ese+Loxcs0zH9J7FMD8hnH3qiUQFreZ9UW8wPOs/XEf1FOHu?=
 =?windows-1250?Q?5sdiI0sGwnKi8Gd9e8x8WdUq6BuoaCNKzOeZxR60ym2rvCLe/PdFkSkO?=
 =?windows-1250?Q?2Hp4oqg8qfLCLkQZp4TdnjCfKiV7r3I0b1NIP9iMU3B+aMOlyoJuNAEI?=
 =?windows-1250?Q?3eLNWXJXkZ1AA+ociKyxX2TsmCK9k3FC70MNZvJ6+k2spLCjw2reu7Oi?=
 =?windows-1250?Q?xhhQaEkazXaUWVFQ+FhmfpPNLo+hp1agTq6ny3/IZV9s/XGM6RG2dHAl?=
 =?windows-1250?Q?+WhS2IQb4M6pnY3kOA3NWlhM6/G4R9KDgE/eJZjjcjE/RAzLdTAvgDXm?=
 =?windows-1250?Q?XJO+Vw/MmIoY11xWWrJJh2WULLG+jwZjUAmIdKWeUU+HohaU6H4U35gE?=
 =?windows-1250?Q?j2gY1zN68Ww7Xzyn7oK0RgVw6YtCbGPvNmamF7vSx9gS4AhVGQ7YDk70?=
 =?windows-1250?Q?1g4uzccEmhU5A0D/5gYnn44eYSdw1Bo2fSQZNwXu9NmpwmIGG3jm5DJy?=
 =?windows-1250?Q?miajoEqkNicd1c6bnjPYXgcEmApe1fvbbEfzPgjZZL3Wi0tHYPDOwxZK?=
 =?windows-1250?Q?sERtV5wzNupoydmUPU112YQ3lEkUP/LBRrCHtXQJzCWg9Iv3tyS2u0pM?=
 =?windows-1250?Q?KFb+gt4l8uKp3k82rcH2ouwzLcTP+W2SAKamWesDkbZLBE8ih7pS4sl+?=
 =?windows-1250?Q?vR7aro3/yppnT/BA+d8iRZETuZJxnwbOb6cO9DIJ5CtWWL7QgF7c9HVI?=
 =?windows-1250?Q?FaU3+eNE8upjyBs3fGXWmaGmBpB1DUKr91yWB7kGubfC4QQEjGVspsVG?=
 =?windows-1250?Q?6/RgZFmZYgaX3y4lwPqN213i72X/m/mPhvEkDiI58bpsuN91nIiStsQ0?=
 =?windows-1250?Q?vImdKi1AyzH4CI89KfaseGny6jTMwVOHa7EVf6kDeZSbbYFJoTa2TKp7?=
 =?windows-1250?Q?AB1S4Vdn1tJVdhqGGSyPetsCrBInpnlsexxHD92jRMlTWgS24fXwCXjo?=
 =?windows-1250?Q?nn7xXnKr9+g2yUEsNHJEYoGJMRS57Lpa8P5JrkbceIIghug2UGD/Dfrh?=
 =?windows-1250?Q?Log+aysReWItkJw4jWVJ7N0KE5+AECeq3WTyz8quYJNTaxK27i4EUJzF?=
 =?windows-1250?Q?97Prjq43SymOKJTg3XwJVVL2ySgTl2uG2SvBRmA3f1I67IpXpX7uLX9+?=
 =?windows-1250?Q?81+2AxoSS4o=3D?=
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b9f39c-f30a-4fdb-31d0-08db5553902d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 14:49:19.2578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bTyOwZA5mP7rVJ6TwditOIu3w0a5Uz+LDeSsqL8+13d0OMaLcgHL6gYETdGVs4ft
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 14:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181263

Hi Martin and Ross,

My original intention was to only condition the dependency on gobject-intro=
spection but the reviewers were convinced the -native packages should be ha=
ndled the same, see https://lists.openembedded.org/g/openembedded-core/mess=
age/175475 . That triggered a set of patches like https://lists.openembedde=
d.org/g/openembedded-core/message/179620 . The result is passing the builds=
 but honestly I'm not surprised about side-effects, sorry for that.

The key question is whether the problematic packages have intrinsic depende=
ncy on g-i-native, which can (and should) be fixed by adding the package in=
 DEPENDS directly, or g-i-native is always needed as Ross says, which would=
 imply g-i-native should not be conditioned by GI_DATA_ENABLED in the class=
.

I'm not an expert on g-i so I didn't have strong arguments but feel free to=
 convince Alex that g-i-native should be always in DEPENDS.

Petr

________________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Monday, May 15, 2023 3:58 PM
To: Martin.Jansa@gmail.com
Cc: Petr Kubiz=F2=E1k - 2N; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v5 1/6] gobject-introspection: reduce dependen=
cies

On 15 May 2023, at 12:40, Martin Jansa via lists.openembedded.org <Martin.J=
ansa=3Dgmail.com@lists.openembedded.org> wrote:
>  do_configure:prepend:class-target () {
> -    # introspection.m4 pre-packaged with upstream tarballs does not yet
> -    # have our fixes
> -    mkdir -p ${S}/m4
> -    cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/m4
> +    if [ "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '1', '0', d)}"=
 =3D "1" ] ; then
> +        # introspection.m4 pre-packaged with upstream tarballs does not =
yet
> +        # have our fixes
> +        mkdir -p ${S}/m4
> +        cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S=
}/m4
> +    fi
>
> Was this extra .m4 file causing issues in builds without gobject-introspe=
ction-data in DISTRO_FEATURES?
>
> I've noticed some maybe unexpected side-effects from this change, see:
> libblockdev: https://lists.openembedded.org/g/openembedded-devel/message/=
102599
> glade: https://lists.openembedded.org/g/openembedded-devel/message/102601

That would be from:

-DEPENDS:append:class-target =3D " gobject-introspection gobject-introspect=
ion-native qemu-native"
+DEPENDS:append:class-target =3D " ${@bb.utils.contains('GI_DATA_ENABLED', =
'True', 'gobject-introspection gobject-introspection-native qemu-native', '=
', d)}=94

As the comment below explains:

# Even though introspection is disabled on -native, gobject-introspection p=
ackage is still
# needed for m4 macros.

g-i-native will *always* be needed as a build dependency, because packages =
built from git may not have any m4 macros in.

Ross

