Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.57])
 by mx.groups.io with SMTP id smtpd.web11.12233.1593567578955894095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 18:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kXb25Yil;
 spf=pass (domain: windriver.com, ip: 40.107.70.57, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaUxQSm/Vpt27w6LegwrE8/8apGideasqncz425KPvLaLeXHaD2S46R35MPf1tGv1kM5TcocR0MnYH84WXLTFS7nSimxIyNnL8AuW8vuslZLeluwtXb4OvFI87pT9SjFXG0CXsVDNiKNf987pO5fDSR/Jg2JxLnANOALDi/+D7bmD3IyoAWOPgrryt+ug7joxX7BY6CzcmEtXPUr7B8xmlGSrnqiHNXGWPRqD+XGWZfNEpKrCDnZ+VYyCGav73Rc3aj4LCXPLCT3P5nNLajBwWHMNKfOD+or+c7WspJJL92Ckc07X25Cgyo/VeaUgECUUNtFVWXw4J5Ncr4mEXes/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfy6M/ciWrnihRnVj3HpGbLGcQHLpzts2RLdk8Ddo9Y=;
 b=hE80isx/rvQAe9z084a5BY0j+0DOWy+vxEwHTGg92R1ovs3kTHv7ukPk08xjkdGo+3+oXeTtciKllwGqbnXMB1R8z3/qIb4C0JFS7MdScvt9MaUT/mFFdennZiv9Q3bm+JtzoL0SMIVntbWvSr0CWR0jFbjUqcqoIJYdIXGfwc3SQ4UH0aTjUHVs6lfT0Nhral96X/5n+S9cQDcKJi/TmtSAGZ7fPd2xi5EWxPFxT0rTqyQnyWQqHdSaAdlJdvP0EOZ04vziRIxlePG1BKfsSQ0JMuaakD/Yty58QOiEDPsIZCfjoJOiOHuNNZsOzbjfdgmdcLDxkxhW70Y1/OQoAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfy6M/ciWrnihRnVj3HpGbLGcQHLpzts2RLdk8Ddo9Y=;
 b=kXb25Yilxy/ZPNcbWMooz3ZRL6SMH2PVAPI5UeeFa3GBjtedQKV3+NRPio21ggS/qgKD+/i3Rxu2O8N57eFRnhK//5URIVnTRAeJNyBFI3GrxGsLBvP9uIBTbL35UO/ThVbmymBFhZq+YElBQyOPlzr57pSBQ37Ytw4BPNDOzPs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Wed, 1 Jul
 2020 01:39:36 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::cdd9:281d:f264:70b4%7]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 01:39:36 +0000
Subject: Re: [OE-core] [PATCH] gtk-icon-cache.bbclass: update RDEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200630094907.1396284-1-changqing.li@windriver.com>
 <5c6132dcb03b32e9798eb96a437af3dcf650d6c6.camel@linuxfoundation.org>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <61ba6f0c-0bb3-42fa-408e-c2396d5a2773@windriver.com>
Date: Wed, 1 Jul 2020 09:39:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <5c6132dcb03b32e9798eb96a437af3dcf650d6c6.camel@linuxfoundation.org>
X-ClientProxiedBy: BY5PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:a03:167::48) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by BY5PR17CA0071.namprd17.prod.outlook.com (2603:10b6:a03:167::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23 via Frontend Transport; Wed, 1 Jul 2020 01:39:35 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa1510d0-aa32-49ea-23a9-08d81d5f9ccf
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB45742358ED04A920D7EF1F16826C0@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u49gZwwJWJ7Bl7NYwPId/E+zQxXOf37E6L4Z1ueUYDilepJfsEqzJxcQkBja62pmtaoaJbMrcCfpEgixlg6xF8BzbKs6cCNMSjof3DAJicDOwk6XO4mPPrk/ZF3edA5uZ3pTMMqTYUfifS8rLGJt3D1oni0q5Ke+fU52/XoAsYMhfTEqUl9RfKwKyRDBHfUGDUKyzpJ0NXD+9gAU7edKCDi19wqsme8yL3f+G3U3zIKXm47HQOCHgAJKtNUCnvHorplaBI0CKnSLUfoxyaabCp3Vb7krS8WyrZ5kcEup3KoWLZl5UkI5spUulVTyxSyWZkIfSNDkhw2GdNu7UYFjts3YyQ68QRUc9uy+RecF3Qa2h8xsu2d/9edzdxY4FU0lGfOc7a3zN74d9BtatqDSxdXhaJyjphQ1p4mgfUH+qTcvyPMNLcFVJaiLnWbVgN71
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(136003)(39850400004)(396003)(376002)(66946007)(2906002)(478600001)(6666004)(16576012)(316002)(31696002)(5660300002)(66556008)(66476007)(86362001)(8676002)(36756003)(956004)(2616005)(15650500001)(26005)(44832011)(186003)(31686004)(16526019)(6706004)(6486002)(83380400001)(52116002)(53546011)(8936002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	o01pWQMao7doReXK+vnFsZ+ERXMvZAw8tDh/ZgkGLaOC/yymUrEOG8lxELQVkNCxzAOTGaIYLRYNbe1H8r8KGANbFlQSKOPDG7ipXlI8g7ZnCrk+6WWFd97e6lxkzVyyXrn388jcKPWqRmkn1L74THPMHBsw+Oxj4tfszNaCYK7g/g2xCEkIlAveJP6KOb3E8clxly/Q419Zq8X5s2CjpmeJAMEqbfDmLFDFUMYimyLxxTYLN/iEHi0nH8hX4h9G4uPwPyfddRxPoe9NpOvjQKJCDuUgwGzUx1fEsYGJuGIctsiWplB/4oFFpvwmHalZeotOsqB65XHNIbIaj0grmCp38e/1li7a5eQIyLeuy7aglrKTF2b+xj/ZfBnE9IGKGHiLYo9jZUFsg1c80Y6oAFrtUWKnkkaZ16QB4vuGVhGD/Eq+H6neOoUeqolIF4LRGDMxrTtXpNaZ66tlVco8HdHPQfae+7uGiIOIGSc8X6E=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1510d0-aa32-49ea-23a9-08d81d5f9ccf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 01:39:36.5013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfNckUtIE72jCVr8OX1wSjOb1wvrO/S6Pkn0W2U1XFVbMaBIZs6Gi2og97+nICGI0hBo3fNF4jF/jPX1wUdNCaLaMm7n2IsQLN/G7wbULKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/30/20 6:01 PM, Richard Purdie wrote:
> On Tue, 2020-06-30 at 17:49 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix error:
>> + /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
>> /var/tmp/rpm-tmp.mdYxY6: line 12: /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-
>> query-loaders: No such file or directory
>> %post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961) rc 2961
>> status 7f00
>> warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet
>> failed, exit status 127
>>
>> when install adwaita-icon-theme, which inherit gtk-icon-cache
>> on target, above error reported,  fix by add needeed packages
>> in RDEPENDS
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/classes/gtk-icon-cache.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-
>> icon-cache.bbclass
>> index 91cb4ad409..7f218ce7ae 100644
>> --- a/meta/classes/gtk-icon-cache.bbclass
>> +++ b/meta/classes/gtk-icon-cache.bbclass
>> @@ -4,6 +4,8 @@ DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' ==
>> 'hicolor-icon-theme']} gtk
>>   
>>   PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
>>   
>> +RDEPENDS_${PN} += "gdk-pixbuf gtk+3"
>> +
>>   gtk_icon_cache_postinst() {
>>   if [ "x$D" != "x" ]; then
>>   	$INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG}
>> \
> This isn't quite right since the postinst may be added to a package
> other than ${PN}.
>
> You need to add the RDEPENDS to the code:
>
>          rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
>          d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>
> later in that class.
>
> Cheers,
>
> Richard
Thanks, I will correct it.
>
