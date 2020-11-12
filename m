Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web12.1141.1605166832328343435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 23:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@opengear.com header.s=selector1 header.b=hJ1o3hUE;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: dan.callaghan@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101]) by mx4.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 12 Nov 2020 07:40:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJ0DlY/Jbb/kAPcoVKP2728ajXu5pmTO5jVgCL3D/ar+RPrQIt152ra8tvQHzoHa0TsWSKQd9ehg1zwzmhDw4fLCtuburhXSFfgH57+bQ43SppO/DhXJzIYGQ0NVZ3vmzSShTYOC1UChQ7lGzk4NDomz+FCf9V4IIQHjWm/xeWd/Rz7tnfVZlfwO60l8JseAJ2fpOACTOwFnXUeh5QYTUJnoY6qMsRvZqvoxqtSZC9sUQo5R5dyf2A5JOJTFkYuPoPJZ3sKtfGdRDSBX80I5DMW3TywpqYmIGghocAT8UqOZ1MAD7w1DtvEcvNwZklsAuIXjpcVvvQiIC/2dxvC1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X05iS7dlxAkfCXYjpip7k1zDC5Tp1xD4p0vNtapVO1Y=;
 b=c1/aA6apHv/lcw8xO1EwcHcPt61ugE5EopCS9D+tKilfE59Ohzo+nZSOn1mfcVxRqOctMSXZNJ9sfDbXK1fKFfuHygg2Z4N3lrxnnmxIao7EYLpd8hjznmfd//O1/OtS+awrJ+VT1CGov8nJjgGUf6Zh/D8G9EhXxeI02bP7iT4OqPoKlFFqvkO27zJP6ZV3KNppnwiXZS69Y8qYg4kbPKKdXtnPEefyGr3BmneAcUuaY7WseGATQ0IayJZEHi9410Cyyd01VN3LPjWyvHCRMsEiAdHp/kaQl/JDy4uAyO5xBABGchAtpjYqjU0LjDoLDYa6nUg2xlWPCKHx6cSwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X05iS7dlxAkfCXYjpip7k1zDC5Tp1xD4p0vNtapVO1Y=;
 b=hJ1o3hUE0jgPwsgeN670d+xj1tOIykY+upqQ99Frd+zasd/j1yrICly6oruR+ebwiMmVqTM1BpkwoVgYArn3jyDu8tpfTK+D5dXl1z8ZyOLD+3vTADEVI2D0IdmUw45fQjTOuKbTjBbZXrgtOusYoNb9eSR774iejVhEuE8E71MVEQ0RPQs0ZvxFzsA06/YEU3P08bNgsRGgqA0uNJtJpaCaY1j3EPXblub3mRnUhXniXhB5zyinJCh/4gC7dNUaoikrhQBuZy2cXlotB8RiQb8vir4UxLjOJ2nu+uVRnFS3vfc+47vdUj1mG7wdc3mQc9QJZjYRDNfvF7MItICrpQ==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=opengear.com;
Received: from CY4PR1001MB2070.namprd10.prod.outlook.com
 (2603:10b6:910:49::28) by CY4PR1001MB2294.namprd10.prod.outlook.com
 (2603:10b6:910:4a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 12 Nov
 2020 07:40:23 +0000
Received: from CY4PR1001MB2070.namprd10.prod.outlook.com
 ([fe80::a8dd:a9d7:1f7c:ade8]) by CY4PR1001MB2070.namprd10.prod.outlook.com
 ([fe80::a8dd:a9d7:1f7c:ade8%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 07:40:23 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gdb: add PACKAGECONFIG for xz (lzma) compression support
In-Reply-To: <20200121012412.6495-1-dan.callaghan@opengear.com>
References: <20200120234818.13068-1-dan.callaghan@opengear.com> <20200121012412.6495-1-dan.callaghan@opengear.com>
Date: Thu, 12 Nov 2020 17:40:15 +1000
Message-ID: <1605166753-sup-2782@galangal.danc.bne.opengear.com>
User-Agent: Sup/git
X-Originating-IP: [120.88.114.229]
X-ClientProxiedBy: SY3PR01CA0101.ausprd01.prod.outlook.com
 (2603:10c6:0:19::34) To CY4PR1001MB2070.namprd10.prod.outlook.com
 (2603:10b6:910:49::28)
Return-Path: dan.callaghan@opengear.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (120.88.114.229) by SY3PR01CA0101.ausprd01.prod.outlook.com (2603:10c6:0:19::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 07:40:22 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id 2F4C9D265F6; Thu, 12 Nov 2020 17:40:15 +1000 (AEST)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32fd07fa-82b3-4bf3-8785-08d886de3689
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2294:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1001MB2294A54C7980FE270F27CF8B90E70@CY4PR1001MB2294.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bhz/M22NQcpgu+ARJcpP+sdWJz86I5O2C1ULSI9TcWXZdQb4qu3MqlqFpgTQtjGFxzD575cScfWVixbYuF5brRKSj1LnUe67pBRMK357trkaiNu9KVc9dmgnRp7MMRiBiGKdDa7UkQTciLMEsMFrfcBISYq+tt/SKkLgDGfv3VyViVsf/7on61st0LLr/fnPDlHj31jD8jA/iJKnUjFtxh25D9UwsLHGWd2+6+lgdUl+8lwVYCCGCcrE3nA1W0sMn8zsdgC/rcQC6IPclsw44K56ySO30augAB4b+wfcG3NzGiNhLWjezSZNh3WeYE/xNrFuHHoOpfPy+PJIpm3mieBMbCcGznwMYN7OJH0LCXaVy9y3c40hXYCLN6v8HGO4UhPeRNF2KYdO7dYAxTXi4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2070.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(366004)(346002)(83380400001)(66476007)(66556008)(478600001)(83170400001)(42186006)(2906002)(316002)(66946007)(5660300002)(6916009)(8676002)(44832011)(186003)(966005)(52116002)(6266002)(8936002)(426003)(42882007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	yM79aMwASxPWEdRVfZ8Ui25NQLONjFok1pC6MtgPH/liJpMPg0HB10MQN+iMmMHHUP64TBRj2DgisCgkoadj/1HJPwOBkBraYFJwQ1SKhpsxc93LnVH1VAEjmwcRQ8i+ier6V9kD9kdp9ZH0w9Tfn06uGqPhZgs7ztamEgkpCsmPSGsnnKoUEwl8yveNzszY2bbev8Ri4yTInMLLvcNERhthySnLLwLT1g7gyoltUhOFlpTl5uUUudlS6idrqFC3Ye8An6EPRUAg1uFVtQU2oVFlki2O8BBqvCaQZb/a3ha7ViDTK9X/tD/AeKB8xZPQEt2wTXcBhcXWBRtdeMmr3CMIzlB0wKaNPTCxlJjx3epjZJNLqXFEy+0JYQt8taJS/S0C37jp6hUWToWNAdZHbzwo2pRngp4Jr1rJtYwa8Aq8YBeJJqcR+R2jiWtvtZlD15pTirguO5TCBnk3rX4gNrP7rYaUo39TiNfxy6Clg3mt7ixrjL/sjGW35nECWhd9f5JBYS4R79qxih0don65HMQe6IyI31a0050g2ae+dtANabctwek9fIEU6V6n8RgrNn2Vp9ma0WCW7JZ+zVKdpDW7PsE6/lyRBhn4B4rgqyc7DEh+oI0G8ytqMCkiaBo/o/V7X/3yMhsrbCGLAu3yEA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fd07fa-82b3-4bf3-8785-08d886de3689
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2070.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 07:40:23.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9+VcVGdkWQtMpx1ejmnp+Awc344zGpGEIjKbxBCpq63TtZOQTwingdxXUN17qIozAyE95wWg8ayAV7kjy+OcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2294
X-BESS-ID: 1605166827-893006-32766-29860-1
X-BESS-VER: 2019.1_20201112.0059
X-BESS-Apparent-Source-IP: 104.47.55.101
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.228136 [from 
	cloudscan18-139.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Bump... I just noticed this patch was never applied. I have been=20
carrying it locally all year and it still applies cleanly. Any issues=20
preventing it from being applied?

Excerpts from Dan Callaghan's message of 2020-01-21 11:24:12 +10:00:
> Similar to elfutils, when xz support is built into gdb it will be able
> to read xz-compressed ELF sections containing debuginfo. This is used by
> the "mini debuginfo" format:
> https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
>=20
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devt=
ools/gdb/gdb-common.inc
> index 08f615addf..878a03715c 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -21,7 +21,7 @@ EXPAT =3D "--with-expat --with-libexpat-prefix=3D${STAG=
ING_DIR_HOST}"
> =20
>  EXTRA_OECONF =3D "--disable-gdbtk --disable-x --disable-werror \
>                  --with-curses --disable-multilib --disable-sim \
> -                --without-lzma --without-guile \
> +                --without-guile \
>                  ${GDBPROPREFIX} ${EXPAT} \
>                  ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--=
enable-64-bit-bfd', '', d)} \
>                  --disable-rpath \
> @@ -37,6 +37,7 @@ PACKAGECONFIG[python] =3D "--with-python=3D${WORKDIR}/p=
ython,--without-python,python
>  PACKAGECONFIG[babeltrace] =3D "--with-babeltrace,--without-babeltrace,ba=
beltrace"
>  # ncurses is already a hard DEPENDS, but would be added here if it weren=
't
>  PACKAGECONFIG[tui] =3D "--enable-tui,--disable-tui"
> +PACKAGECONFIG[xz] =3D "--with-lzma,--without-lzma,xz"
> =20
>  GDBPROPREFIX =3D "--program-prefix=3D''"
> =20

--=20
Dan Callaghan <dan.callaghan@digi.com>
Software Engineer
Opengear <https://opengear.com/>
