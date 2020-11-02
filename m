Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.41])
 by mx.groups.io with SMTP id smtpd.web12.24793.1604280723707506628
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 17:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OwFOCy38;
 spf=pass (domain: windriver.com, ip: 40.107.220.41, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXkLHK4GOQhJD563cp7PWur9lTDtbGBHVsUB0m/ZZ3fE9nJ6xYcp8FKRhlEEXsL/cuSUqC69ZQWh7JmFDMFhRjdJeGzIVhBEpfWRPUeoIqHAURq++cY8LNRcLhf87SLaPtVIm8JT5icEV8yABt6RPrLjuczFRitcuKRdJCavEvctASl19bFshwygYjYiyEV8EDhddZJJY3QBhZ2BQqnNH8vjxDBAU73Q55RLVHTOM6QZYRsdbghz40qvWjiYM8ES3PRF3knz6DlOlcEzumrqPDWUbRrKQEMD1EAgXV3rUKEujUYmIZ6l+SL/d4ajPOMWu5kfJV41BfyTg3lIaeShoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zev8wt0JFDIqQv/yrZXfRwmEdzpRUfa4yyaY8tO93LI=;
 b=Rm95+TTreC8iZ9dFRocM799SIc6LNYP5K/TgXK3KgBCit3MwTyFt7x/dEG2DW4+IW1hqINL72e49Kr3cd4Xm5MemUxpW09Ae7uSpZ5evggg7YIGkUn+1T2bgD4NhZA6ayea04pPylioxHcMkTypjsVuPXrALBCcdrpSGo8FF7ncJpojEJ+yAb3os01a+fa/jJSjzXeTgXtCLRvt9z+WTpGm9RPKfWCb8Wa0roZELSkJwAVr5YO+TX1+bBoLehISn30EqkcQowiKoyoiGb9PKVxw+Xc1fQJKNLiCjTynbylEG2iKmAwT5p2fkv0lwO+4t0rRaXwpJ4RwOc31nOkSQ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zev8wt0JFDIqQv/yrZXfRwmEdzpRUfa4yyaY8tO93LI=;
 b=OwFOCy384wFWHVxMAqIT3MNi0yDgDlL4raSIMYyTjweBg0Kyn2p0EJjrK4Blx/FIgKMHiEFNxJkG3YrgNTMbt+5SEi0c0UqilW/AuT/q1tB9njy6vo1AxgLLND1hksMorJz/eD88oaJA9JjHKzPda+E+xVtL7bzgIh+L4FUtCfY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 01:32:02 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 01:32:02 +0000
Subject: Re: [OE-core] [PATCH] resolvconf: do not install dhclient hooks
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20201030085852.18227-1-yi.zhao@windriver.com>
 <ca22dfdd-33da-f448-f21b-854c255561b4@gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <9ce2c532-b487-5adc-2890-5b41d854d42a@windriver.com>
Date: Mon, 2 Nov 2020 09:31:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ca22dfdd-33da-f448-f21b-854c255561b4@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:202::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.174] (60.247.85.82) by HK2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:202::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Mon, 2 Nov 2020 01:32:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6132c2b4-2e87-4de8-bc66-08d87ecf19a3
X-MS-TrafficTypeDiagnostic: CO1PR11MB4801:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4801C58333BEF38149A582EAF9100@CO1PR11MB4801.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lM5lXN0kAsuWYduV1YC6q4Y4XRZ7i/bwhZuJ0w/5XqdLY8vCq9jcB8/x69mPI5gPFL27Ife48Cpvxu2Va7XFI2ZrG/CYnUGfF7DBoRk+g0RZgtCW524b/HB5FLecNO1+WyGHUmC1+/QalQA87HOgyFqm7grclfhhZNggddDKvuX3zIyCBT/wOI7MjRvCXc5cHquveJVsCz1Sbgr69MOxnQBGMwx3IAQ0AxQ9JaeT3o+cJTbsEM7ZmD375aGoxK0ZxVm5Yth5LeHtlt31iEbqJEeKrg6pGl8FZVcBRUS0hGc1oU7tvOh6cJ4qyX2gpefaG3BP6k/nukD4z6QCu3XKCvcdiOCrymfsjIcO5PAkpEbEFM+pxUeD39I4KAuUmYRMalr+4q3hKwZf4Yckea19t2hRoIeEtIQS6in7v6z9YiJBlc+PIsQMJrIyQUZpqthJhTQDOFrhUo2tDkfugjP96Qh+5lEzAR7ZQe8Yb9GIDrs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(136003)(366004)(396003)(376002)(346002)(478600001)(316002)(5660300002)(83380400001)(86362001)(16526019)(36756003)(8936002)(2906002)(53546011)(66476007)(2616005)(956004)(52116002)(66556008)(31696002)(186003)(6706004)(66946007)(16576012)(26005)(966005)(6666004)(44832011)(6486002)(8676002)(31686004)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	d+7HTaHeXeUPIcCaFNWCVqsAxryPkIiifaq1CqQbzpdOinE3TI0jOgVzGe44ILqlysKhzx/pZ+0ZnBMaYvE1Rz16gJFs8CBxsiLDRrWm6rU2DXlD+WJIBDZwtQFz18MbkGL3N7rjMCsIPHorRJZm896RwVdFzhvBgrnbPFyvE7yuoefAL23GT7dMobgAwahyLTduSWYFz4dibbuc50pTIPPVvvjM3w7d2UwhgKI9ABNrqiXzUjaqlkCgeaq/EzJfoVpODPRrhOCn373ROR2ndWw2JwVnaIDqU9azMmkgE3Hinp4ERZmeek48P73aJ6hdkE9ZPt4wPRH9Mfa1zdyTJ5EfjyqFOCdRmWEQm7p9Y637BiXLS1gyn4vVznnvEWEkQW0pSEewuOhikpvmMV+zW7KiiLu67tlBAmo9tm/F66N7bT4S1qtQDVDm3+Qz6T0TLtJdXGd4xUHhxAfzSPKUh1YAgpEzKvYgiOkwPkBb/QVFo8D2+cvp8tZhk+4w+Cpf460paOyAWohC2zxeoJdH0WvE/vbnMrrNtiJjB09tCjGNXPGDDI7eS7MRJ28wH1BehcfVzS/Ts1Bpn9h+0GtCw62eKKzwd7sW/8XEsRI2QVE7hHoMhQYyxRVCNYZbQHX7GyKOENfkN9e8Qx0kdY6WEw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6132c2b4-2e87-4de8-bc66-08d87ecf19a3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 01:32:02.7620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCKQEVpDYxe+WPiyABASOszEHfEDVFmPITU1zJ2+SXLn/EPvhLTcKTGVMFj4wUd8czdKIgoGkXyXzUgxifP5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/1/20 1:41 PM, Khem Raj wrote:
>
> On 10/30/20 1:58 AM, Yi Zhao wrote:
>> Do not install the dhclient hooks
>> /etc/dhcp/dhclient-enter-hooks.d/resolvconf because the dhclient has
>> been removed from oe-core.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
>> index f0ffc82241..33ee553d19 100644
>> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
>> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
>> @@ -43,7 +43,7 @@ do_install () {
>>   	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>>   	install -d ${D}${sysconfdir} ${D}${base_sbindir}
>>   	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
>> -	cp -pPR etc/* ${D}${sysconfdir}/
>> +	cp -pPR etc/resolvconf ${D}${sysconfdir}/
> is this the only dir left to copy if we ignore dhcp/dhclient-enter-hooks.d ?

yes, there are only dhcp/ and resolvconf/ directories under /etc/.


//Yi

>
>>   	chown -R root:root ${D}${sysconfdir}/
>>   	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
>>   	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
>>
>>
>>
>> 
>>
