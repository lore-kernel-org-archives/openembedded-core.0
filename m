Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.46])
 by mx.groups.io with SMTP id smtpd.web10.6466.1598994575077068164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 14:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M66Li5P0;
 spf=pass (domain: windriver.com, ip: 40.107.94.46, mailfrom: mark.asselstine@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHQUpt8+fQ/tjc60TbL89zw296Th7YP2QeNM8T7x70yQIfq1LmZiv8EbPcj8LnfKVuwqp952zMSpzZDkuZu132SRq3FWypk6ExPUYLlWzwD7F66N/7XD2HFUNrA4RIvPUchF4sCErajFSGRty+In5bkZzctAC7T90CVeuEAN81ACRU0P+R21sX7QxQSZa2+Jjsanb7nDBCU8iiIEBFU8ApIn9h/j7rwr3UOkkJWeRo2dFQ48oOQahVi4w9R96Un+I+QsjLZvQ7bCl8gVAY1c+7VzxqivhxmQJOLvhxcNPwZUVNkez1j7RslN3dd8VAFUtIteugkQ5o7+DnMNhOJ+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcoAyoohPsJQCoz5IGRUDGQZwjNvtrw+ccGNrOh47x8=;
 b=NUXyR3dLqy8DAE/IRWwOGfr1VAQBqr+QTQOkw38LtT2FyAl1TrB7mXXvU7AqjXBviFkJagbHp6Pi54NWADP3OvhDjPLSoyfnlqHkL4NwjUoXJCQ3L9RgzKVf13W/LSiuiy6oSpjnLFqdHf7/SRie3Vxk3iWFxKix3Ph0MA1WlbBXEwxHPR372Bl+79lfX2p0skQ4knpNVhb+LAz9mgoW/BaavEWq4W0m4t80X7dO7ubeZ6bHc+vzAxifiYj5uXT94c0C9T6HAgCdqftmhOXYSTfxmvFSYCwZuuJ8vPmnPwWuVAoNKWqTyo3Fg5DKkVrA3ZMACwqw+VbDXMRq4nan/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcoAyoohPsJQCoz5IGRUDGQZwjNvtrw+ccGNrOh47x8=;
 b=M66Li5P0bfrPfqGCNeTpmYa/CNsQ92OUfAzgWcwFvKomvH6duYoOXQLS76/eRaN7RlPTgDy0AFCQHj3qF8IcIWOgLkhaJ7KpwhCqfMdow2Ro03LJbZgBxURj0niiTDGmjzIZ1b+epKHe2PXHgrf32fCcXRGY48ZtEXJM6oiBTqw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4347.namprd11.prod.outlook.com (2603:10b6:5:200::15)
 by DM5PR1101MB2105.namprd11.prod.outlook.com (2603:10b6:4:51::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Tue, 1 Sep
 2020 21:09:33 +0000
Received: from DM6PR11MB4347.namprd11.prod.outlook.com
 ([fe80::5b8:e591:c798:6446]) by DM6PR11MB4347.namprd11.prod.outlook.com
 ([fe80::5b8:e591:c798:6446%6]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 21:09:32 +0000
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [OE-core][Patch v2 1/2] xinput-calibrator: avoid defunct process
Date: Tue, 01 Sep 2020 17:09:30 -0400
Message-ID: <2823092.BEx9A2HvPv@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <162F8BE25BC47348.17615@lists.openembedded.org>
References: <162F8BE25BC47348.17615@lists.openembedded.org>
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To DM6PR11MB4347.namprd11.prod.outlook.com
 (2603:10b6:5:200::15)
Return-Path: mark.asselstine@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 21:09:32 +0000
X-Originating-IP: [198.84.181.245]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfb5e1c8-7e4d-4d4d-fad6-08d84ebb5275
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB210556F7BF142CCC85F4BA7FED2E0@DM5PR1101MB2105.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OTGFzvMoKwNbO/AA9EAMpGSJr7rSfoHfyAUH7ivgEHxamt0iRLaAfJ6Pw1X8tu4fHbMkf8Rv3oQ0MAybic9bpG3n65hyzKJsbe7pnT0DhRoDxc9ITPjYzPpcQI1l/J/kA69bWryb7l2QejzAmWVJUyk3aOTBk8IUeQUWg6BTrhuNH39dIizpKHW/5rl25HYHyxgz3fJ/XTipQ2ILhVDZjwxxi2klb2XGlTmusVJhmfLYrNCgg0YLEZ9kCZXJMHrhlRUAmkrE81BSngJTqt6+EN0FBCPK9JY6DXsojyeEcCXgFr15kT87V2IriduFBHHSMLHbz8vD3ArNLG5m6aaRNESM+UYInUbziuK9QqUHfG5n+ND/Hw6jdH8m5WMKAzyq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4347.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(136003)(39850400004)(396003)(346002)(366004)(4326008)(86362001)(66556008)(478600001)(53546011)(66946007)(8936002)(33716001)(6916009)(316002)(83380400001)(52116002)(16576012)(36916002)(66476007)(107886003)(2906002)(44832011)(9686003)(956004)(6486002)(5660300002)(26005)(8676002)(186003)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0BS0rsUYWYT7O5+MqkYIgkqooiQFCR6wZhByaCxK9p1onOuKkIeqyTxFbSn5OpENesUtRxqvUtwp0gUHP6518HQTQNtuCe//gjUCJYZWM4NcAQClluv9+mReDidNiq0jVns3UWXeRhfyKSlBhzU/QlXgilBPuSDaxS0BOn0LQcBlr13N8CzOOvUXIul4HGsL2p0g0TnnH70Cacy4kZyPd/hHQZEsZLXuYgRmYgAHZCU23OdGXB6oM2Xq0/gS3WHu9rIb4l6gfQoQL35BdKaVhd2Y8SP5i5T0txEh/XTmxGFMzPy4OPw429MhWTt3KSJtObmZCAX7AYmSKSSu9S3gwz93+2Xu0UBHwUdRwB9MzPpa/ciOfJqC5ZaUIupLBn5EKZ4xO4kktJn18GeheEp1JMmIivHUQ+lrJOvUtdn3Pm15gBllpyx4ihArEsrfzPT4QlRbXgCcMTdH0qmqTBFlOtcIZb1Nl0/KuWSy25dAotNOgNtl2czYZyiuDs0/PT1WrJGU5P4K+GsJg5l/G3qewEHh3aXJ4bMun7FFxljqb9lh4cN/QTUDG9mr016X+RVyCkypfX0RefY7S9WiVaCOPrUs6pBE5HKZ9TLuJgUQPNdDoM5sAQ7gpSBQVZgCH44ZlITX0omXx2EoZomxGEY8/A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb5e1c8-7e4d-4d4d-fad6-08d84ebb5275
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4347.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 21:09:32.8236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiKq2RW4gaRlFISkSOQFpuzrmfegCg1ce9jVvtQsTU1whUPXFY0C5GZtQ1Ki0SO1Ij0olMW9RqQhZWq1zoGZx6hxkiBt3MYlYSOniOWKv4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2105
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, August 28, 2020 5:29:19 P.M. EDT Mark Asselstine wrote:
> The xinput_calibrator_once.sh script produces output on stdout and
> stderr which the current 'Exec' doesn't consume. This results in a
> [xinput_calibrator_once.sh] defunct process which will remain around
> until we exit the X11 session.
> 
> Add a redirect to the Exec which will consume this output and avoid
> the defunct process.

Hold off on reviewing or merging this. Looking into another .desktop file 
which is causing yet another zombie process we are pretty sure there is a 
deeper issue at play here. I want to confirm and address what we are seeing 
before this is merged as it may not be needed.

Sorry about the churn. Things were only clear once the multiple issues were 
looked at.

2/2 is still valid, so if you want to take that one on its own, then go for 
it.

Thanks,
Mark Asselstine

> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> 
> V2: * no changes
> 
>  .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb index
> 4f831932e7..c59f97895c 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -31,7 +31,7 @@ do_install_append() {
>      install -m 0755 ${WORKDIR}/30xinput_calibrate.sh
> ${D}${sysconfdir}/X11/Xsession.d/
> 
>      install -d ${D}${sysconfdir}/xdg/autostart
> -    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,'
> ${S}/scripts/xinput_calibrator.desktop >
> ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop +    sed -e
> 's,^Exec=.*,Exec=${bindir}/sh -c "${bindir}/xinput_calibrator_once.sh 2>\&1
> > /dev/null",' ${S}/scripts/xinput_calibrator.desktop >
> ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop }
> 
>  FILES_${PN} += "${sysconfdir}/xdg/autostart"




