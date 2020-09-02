Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.59])
 by mx.groups.io with SMTP id smtpd.web10.9525.1599058611213980557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 07:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c6VD4IG3;
 spf=pass (domain: windriver.com, ip: 40.107.92.59, mailfrom: mark.asselstine@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6hVRdO8QwEIEXNSXadLXQ+UlOrTxOjj6k0iIkPHTRKEeLtrmTd3ohjUtAIYl63QIS35JRuBhNsuaYT5pGmQRGgxrMBXYNpgVW38N10WCXs/X3Bol80G4mUxUnHGCYM/WcY8Um1bABaI1dP7aFiTTGo8FBJAwLCfMRYLMoePTgt7RzRFjKrjAzo3/TlCDMV9QRDxYU+7PYzjFmGiO1j3TyAF8C/v40uGabo+MyQrh9Z3UdWDauRD545lgFGYScpYsQ7HMAkamGJxIC3vZqkukRkBHV0zBay41Ir5bSGVrSI9SzBigDW4M+XUO2Gs0VjMmMM8nD8Ctg317sIoKhTFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Vxvh+qmvXbYQ30+u1wzN1F3QTtok8N61zlZlEqFlZs=;
 b=khhg12Yz2ksDFT88CrY+C2W164Yb9dQIQL96M1DC9FDH+24Bm2JQR/sw+SOtchJyGGw3nYn68V8t6Mz8heNmtr1QuSGts2jyftOwsWB+52cMErDKDcE0CZuZQqrk6hOD3VyxMQzUN1viZfpNWfo4BzdHVGZE2jq2m158669JVPoFYa97rQM/p11+vBTyJ4qecvlVh8ewnPKlOsP6zvcxyLnq5LMWzIt0BMnKvuaBqMYuGRMhWIXnWHe5A7qjxAFJrVzO7H4DIBM8RUIXzP5aRKKHxyoolDYTSn6F1ZVl0h21GvDDi9F1WnYUEI9BavN2TjG65XJBetDsXQlv0o/8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Vxvh+qmvXbYQ30+u1wzN1F3QTtok8N61zlZlEqFlZs=;
 b=c6VD4IG34RY3kfiJiaVFqpf5tpGMxQlzvoGbP1rhg0+avrRV2o6jIxy8JY4dOBhznLMDrBQ3bEBNqhjtDofNMKcQd5yb9xAR4SOTr8wlefbWsqChR1xlRenVqhhKpwYTI4VDtxSHt82s0dOwb6zz0LzXBWkgTs3KrahHD/0gGE4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4347.namprd11.prod.outlook.com (2603:10b6:5:200::15)
 by DM6PR11MB4492.namprd11.prod.outlook.com (2603:10b6:5:201::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 14:56:49 +0000
Received: from DM6PR11MB4347.namprd11.prod.outlook.com
 ([fe80::5b8:e591:c798:6446]) by DM6PR11MB4347.namprd11.prod.outlook.com
 ([fe80::5b8:e591:c798:6446%6]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 14:56:49 +0000
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: openembedded-core@lists.openembedded.org, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][Patch v2 1/2] xinput-calibrator: avoid defunct process
Date: Wed, 02 Sep 2020 10:56:47 -0400
Message-ID: <3514196.V25eIC5XRa@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <7b9cc8aa19ed85ce167fa577bafaa053f1a0e172.camel@linuxfoundation.org>
References: <20200828212920.2919-1-mark.asselstine@windriver.com> <7b9cc8aa19ed85ce167fa577bafaa053f1a0e172.camel@linuxfoundation.org>
X-ClientProxiedBy: YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::23) To DM6PR11MB4347.namprd11.prod.outlook.com
 (2603:10b6:5:200::15)
Return-Path: mark.asselstine@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 14:56:48 +0000
X-Originating-IP: [198.84.181.245]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca3bc981-d0b9-4894-c827-08d84f506afd
X-MS-TrafficTypeDiagnostic: DM6PR11MB4492:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB449289FEDDF5FB2E43D3E70FED2F0@DM6PR11MB4492.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rlqrHCeDZegATHcGrkE7E+ioPvHecjXNHgR2wiJ25vKAjB2pbKhTbYQdvRhwYdMcqroQY/Aowg/jwvflxp4gCG9D9PMAQvDCXA8z/UB6QywipQEHN1ApaBNo2gXUWuDePCalWCoYm+R7etoe2tbJatWBoYN91xGpk+p1eletCQGrqc+1Jdc14P2FGpnAix5Uc39L7/4UWyw8xvkelgAYOFXr5FgvnhcAgOostZblt+iGTT8kZI4ECQ7juWGfbS0JQoo5TpfQThmtNR0t+xzlHj7YrmbG7TzcqyfW45DFTGec7YTeIK0OtoAbDMt7x1toh+wDaUUpD5k7xEhmFOWdL1ji2H+9LQY3mdoefdhQHawdBWY/YDwDdS68/lVGO+iRbr6jHmuFRg1xbE2lGRZwt24YseYMRjgF0PfLa3zTu3RYXZNaRrGXaGa6GckQ+fjWzkrqH5N5jDSAKDHMZrrS7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4347.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(39850400004)(136003)(346002)(376002)(36916002)(16576012)(316002)(52116002)(956004)(83380400001)(2906002)(44832011)(53546011)(966005)(9686003)(8936002)(26005)(33716001)(6916009)(66476007)(6486002)(8676002)(478600001)(86362001)(5660300002)(66946007)(186003)(66556008)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/IXbGp5jWOufttqIHLAnRBCkzVpfzdEdQt7ByTN63JMFeRYYD/Mrovqr8MxMCHnPJdFrFr25nAg50gUHkW2UUZzqmgxhSiTITJ9Bjyip6MBypNPbvyi3zAt8141iWn48Zwjq30v3Cd20WyLrxELS1PqS4hzvDngSSpJYl1cfokzEcaXWBCIdVJWkMG9Ybd0xAM2SJNoWyJ8LhSweUOyP9qVQXwpFJHiTOmmF2YyoIDRn2jP1NykbdF8alEWGpzlV6juhZHg9YTdpbv5+ShERVNUuEzhwxq+Wpiat+zLhV802A64GBG7myPlFHSk4G684ELJQppxmpDLiPPWEe0ZsV5COwjIeWwob0MqDuVfWDofC7o1OPACrOR0XVndTl02SOjcAI96H97pqnmY9VAuo8AcVJfsu1FhhqdM6gbVivdb4kOudIcGh0m1tCwJNmeC6lj4js3pBw7E9wKng14CYfL6YySMbRT8bJ8mCCknQm7XFeYwolEPbKWtAZYXlkFuAUh9i8U2svPY2W0uUlpN4/Sbt/7dsgZvUoUi6i/p8m9OIprRtR6owCrLtmjXTuoqy3vh3pya849wt3tX27/+WFsBUkTC7UUim4ky8eIbkWE4aV5+EaY0e4D6G5cpS034LoyZluiL3+8/0RpKfXYboYg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3bc981-d0b9-4894-c827-08d84f506afd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4347.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 14:56:48.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiXdgToaJskT6wxzAr5c0HLG0pE98RxDXvaEE4/m1j9Fb6AdkRRaw6bAzudsb9p38qbBSYSsJzV1fXtbpMqmPWuuEKe9xugjg1jOiY3S9Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4492
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, September 1, 2020 11:30:23 A.M. EDT Richard Purdie wrote:
> On Fri, 2020-08-28 at 17:29 -0400, Mark Asselstine wrote:
> > The xinput_calibrator_once.sh script produces output on stdout and
> > stderr which the current 'Exec' doesn't consume. This results in a
> > [xinput_calibrator_once.sh] defunct process which will remain around
> > until we exit the X11 session.
> > 
> > Add a redirect to the Exec which will consume this output and avoid
> > the defunct process.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> > V2: * no changes
> > 
> >  .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git
> > a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> > b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb index
> > 4f831932e7..c59f97895c 100644
> > --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> > +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> > @@ -31,7 +31,7 @@ do_install_append() {
> > 
> >      install -m 0755 ${WORKDIR}/30xinput_calibrate.sh
> >      ${D}${sysconfdir}/X11/Xsession.d/
> >      
> >      install -d ${D}${sysconfdir}/xdg/autostart
> > 
> > -    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,'
> > ${S}/scripts/xinput_calibrator.desktop >
> > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop +    sed -e
> > 's,^Exec=.*,Exec=${bindir}/sh -c "${bindir}/xinput_calibrator_once.sh
> > 2>\&1 > /dev/null",' ${S}/scripts/xinput_calibrator.desktop >
> > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop> 
> >  }
> >  
> >  FILES_${PN} += "${sysconfdir}/xdg/autostart"
> 
> That appears to fail in testing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/1281/step
> s/8/logs/step1c
> 
> Presumably it should be base_bindir?

Sorry about that Richard. The configuration I tested with had no issue but 
obviously this wasn't universal. As you should have seen when I was looking 
into another XFCE startup issue it made me question my fix and so we should 
hold off on this change regardless, until I have dug in further to the bigger 
root cause.

Thanks,
Mark

> 
> Cheers,
> 
> Richard




