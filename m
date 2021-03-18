Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.70])
 by mx.groups.io with SMTP id smtpd.web08.5409.1616047453766082762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 23:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N33N0L+L;
 spf=pass (domain: windriver.com, ip: 40.107.92.70, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aj2jFAGwYfeFRUcUNiS2r8F1jYaU2/P1lakSqEMfaLPk0VY48kqHInrqTbmKdid3W39UuFQkJONf+dWHHSPj19haiY0ZmeWntW+BocDLYJXMkzotaaXNXsEceyxPCofnOMrDzI1HTa1U4ldjeUwWDlugSI6pnyP4LGq5+zNIifyIQqLCQSLf+OiQBXJ7UrxrUAvs4NRsGK/tTU/FIsYEIj9NQjqvZSPz2kfThVB66jFxLIiIFNjt5g7QJAdcjGrQVQsC/ekE+gaYHV8R6fWqmc+lN+f7+ZH4TlydXJjpCiL5gewHwKTC0DC7P67Tt0k5I9fyTDU7E7rMl4hfcs+kjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyCLJYIhZxSovHRf4yaUe0zyLmhjhNpkk5lmekqC33g=;
 b=ioiXkc6t4GknoKmBsPbr6DhKjnLAIczrpo5miLvEiu597YqykZfq19lG3KjRAvteP+9/xUke93K2Nuyib3gcVHWbdn6r0PqJ2AKGNkpPJdlVwGLqYvBC8AYso/olk39ZjIqvNHTPJr/3m6FtHJxnfm/AM3ENnNlXScBjfCXm14hSrv1NaGcnJWm8W0OoFPfdsMVjjZ/Qc1UDlcLguul0/mJVnGQIOHjth4Rj3cp+5c/sw9dOTn9UyKPxY9EHChNi4JeM7B3ECsXcghJauquGcx7rZYVVcUqswnZduzLTneoKOC5P6o+GckrLhp4IWoDvLMkte0ZUddQA0NSrTRmVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyCLJYIhZxSovHRf4yaUe0zyLmhjhNpkk5lmekqC33g=;
 b=N33N0L+LN9toT0zhrV7JheLWYAEoO67Fe3bCXK3W/JhSl4zAh4zk4k7U9/FRqAbVD7OY2DocV4GDhPqBQV2RY+8l1D6ZjqEnoCbi+MbhBUJnOaSJwpy0ahh954gPZIV04pFrXCQRHGy9Dn0VpVCLIHKYO/dnGoe8Bq+4N9dBHwk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by PH0PR11MB5157.namprd11.prod.outlook.com (2603:10b6:510:3d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 06:04:12 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::447c:865d:de63:389a]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::447c:865d:de63:389a%6]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 06:04:12 +0000
Subject: Re: [OE-core] [PATCH v2] autotools: don't wipe elfutils macros
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <166D505781F5EE94.19946@lists.openembedded.org>
 <166D50DC24E9BAF7.5206@lists.openembedded.org>
 <83c8832f-727d-2d71-2610-fb3d8540f246@windriver.com>
 <CAMKF1sr2=3ip3GjA+touJ0QdVJFBZUwU5z4RGZRCfivhvh63=Q@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <4f991cf2-3e5a-212d-44f6-66c7e754eeb0@windriver.com>
Date: Thu, 18 Mar 2021 14:03:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1sr2=3ip3GjA+touJ0QdVJFBZUwU5z4RGZRCfivhvh63=Q@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0045.apcprd04.prod.outlook.com
 (2603:1096:202:14::13) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR04CA0045.apcprd04.prod.outlook.com (2603:1096:202:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 06:04:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6fcec66-ebbd-48da-3179-08d8e9d3a6ed
X-MS-TrafficTypeDiagnostic: PH0PR11MB5157:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB51570B20971EED6EC292823FF1699@PH0PR11MB5157.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v1V4XDnqcJ2Nubs116a42diA1TrRblZx9MgsHLGAxC3IROps28z3elwld1kDnL/JYw7zOqCIl7dQv1IYef4uGQbgrVm+xSLEZlbM6sawLkLEw6dlMGuh/78VlC6dJPAkm3p+WYEOR+lnHgp3OaWZtlVI0Lid6dqI58GMTvDnXnLoIluR1JmmVvAMwJWOTHIq21Bgryj3wen43qyAkWwWBnNkZDZFvDKyFMX1e8XpKyEdYqwKnw6WMKVbPmlSDUn4VFSVdwJwYks78RZhGqKHmEmAgdK13LAW1FvZAdbo+njiluPyt4O5YzxNNiaeIbqCnpXtlUUo/Q37/94Bh/kG3xOZVQ3++DphG2ZBcteyaOsDk7VwwtBmWpCGrW4a3pbsacgntUJYhTOBlH0dTceolW0sZw9MSg17oXOf0FwsHa4+14TM4T2ro88ZcduS16+fOlKDLFe8OP1M12FLmu5QJ8d1L+AdJ9rFqKuZ8yON4HVNxbKuW4JCuA2zptQtond/yKPvGPoaZOBNZw04/GygWPOIgkuIKohy8n2zB1AJtEYaQoTXK96E7by++WIRs4E2GZ8lPTAnnZsTSiQyvN9ppAXDYd1TYtFqoTT0D74qBTcB0jqjNGGhWMIO28uJxwk38tzr1DSr/kl3HwBQOP+ifSIdB8wpcSU0tcFNdlVp22fdhkhvLUebw87olvKR2SExEUsc+NZgD4KtP3Eqb16ZNKvqSOWc0bT0811Mer4O5j2WXaY2IBD+RRrkC9Wncn8luEpunizIhJDjrYOKxXEKIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(346002)(376002)(66556008)(86362001)(956004)(31696002)(66476007)(16576012)(66946007)(966005)(52116002)(6706004)(2616005)(478600001)(38100700001)(6916009)(83380400001)(316002)(5660300002)(16526019)(53546011)(186003)(6486002)(2906002)(8676002)(26005)(8936002)(36756003)(31686004)(4326008)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VzBLOFhQbjdRc0pyYTR0UDFlVlFoQk5XYkxTVE5Kam5uY1R3VGFwVnQyYU5t?=
 =?utf-8?B?a0xGZU9tQW9CNXJzTnk5Q2VJZ3o3SFpLeHhadlhFczJZZVVnZE1aUW5OaWRS?=
 =?utf-8?B?NGd4TGJFbXpQdGpvMGRBU1JnZjVyQzFpd2hPRWY1M3drNzNmbjNMbG5UM1gy?=
 =?utf-8?B?Z1Fha3R4WFA2aGhjYUNFeXpBNi9xMlhPcjkzVlk4bXBSU1pGSEE4RWtlWDV3?=
 =?utf-8?B?N2NsdDdLYXlOSjBFdzZuR1ZpM2wxZkZzMHY5VHM4Yk5KNmIzbnIyZWV6SUpK?=
 =?utf-8?B?THpEK3hDa2pNY2FKS3F0QTRkOVpHQ2dmUXA2RGdqSzVLZlY2dXo2U3Q5aGxF?=
 =?utf-8?B?RmRQTnBiSUlVdGkyYVRJU0UzRWlLNERsKytGZ1gyZmZQdHpmemJ5K0hSZzlh?=
 =?utf-8?B?aGc5WnVJUEczK1hSb0x2WG0rR3MxT2haYjNJeEFaZU9sQ1g1WEp5dk82Y1FU?=
 =?utf-8?B?L2F4RVpVYnJKT25sS3VEOFhyVUxVamZzL2hlU3MzNWlwZTlHeERWRzNmeno3?=
 =?utf-8?B?N2FGYnVmellNRFRxQW9IZVBuMzFsQWoraUp1amZ5b2NKSzF0NmNONVNnbXl3?=
 =?utf-8?B?WWlteUNBN1FGS1hJRUM4djhLWHJYZlBGZkprVlV4c3hnQytMQWFqcEdwZUNj?=
 =?utf-8?B?WnJSemxZb0RjWlFSaFFjME5xODlTY2ZSdm9qaTJoYThGT3ZabEJKZHFtTnlU?=
 =?utf-8?B?TE1zTmtDQ250N0luNHlBMVZGV0N4VFNYekE5SGgxQ3hwVEt5alpHSDRteG5l?=
 =?utf-8?B?UXQ5K2Exa3piV1RvRDZXcHJEY3hFUTFuaVUydElCMHczY2tCVi9hNHdlTlBI?=
 =?utf-8?B?K1J3SUxCbWdwNUl1K3dMUW52TkxwWFR1VWF1bEgxNzBNMTVoMy9jMVJvTE9n?=
 =?utf-8?B?V2FkbkE3MVMwWFREbDVMUkVOeHJYb1EyREtHVXV4U3VwOHpCcUcxcWMrR29V?=
 =?utf-8?B?cWIxWktHZVJYNG12ZzNSQm9wZ09adE5BMlR5TmM4MDFJWWU1ekcrV3lLaTd0?=
 =?utf-8?B?a2gvazJlNFBYN1dxTnhhTmN2SkpPY25Uc3pZNFAySS9vd3VHcTF2czNHWit0?=
 =?utf-8?B?cldiaGRzSk1mQk5pOC9FV2ZtT081WXZFcFd5M3libm9ackxpWWg2aVBNa3Yr?=
 =?utf-8?B?WnhlZERxWGYwQ0JpOW1XT1J4TXB3Mk0xUTdITnJKTzhBZkZEWGllY1pVOXlD?=
 =?utf-8?B?emZNZWIycjVCZTI1alkxSlN0a3pVYXhkRmNRTms0Wm1uU3hRM0hBMmVnQVFC?=
 =?utf-8?B?NUFNV2M1K1RLR1dXVVRHQjRMU1pyaGVxcWswRjNNbE1WZW91aEFGM05ReWI4?=
 =?utf-8?B?cW8zNUdTNnpxcVdtWDZ4d2VHRnFTN1NVTkU5K3RhTE5TaHZvN1orWjRaYnJM?=
 =?utf-8?B?c0dMcDBxOXorQXBCTCtSdWVrb1NVZ2RabEFITlhxaWY0N0xoWFJCc1BRS01N?=
 =?utf-8?B?eS9RZHlPbzJVYzR2Rmx3Ukh0WGgzWWVNMXlhMC82dUcwcFc1dmFQT2d0a0hF?=
 =?utf-8?B?VFM0Sy9hcE9uemFDai9OVENXZkFESlR0STQ3cnJhRERqTGRaQVNWbmJDVUZC?=
 =?utf-8?B?eFJVK0JOUXl0Mk9tbGNnM0RIMnBMdnRYa0t6aCtRUnFEQXpyay93MTN4R01k?=
 =?utf-8?B?UTdvTGQ2WU5VdDFmb1BJdDNFZWx6TEJlRHk2aTBrcTJZWThZT1ZtblJZWnJy?=
 =?utf-8?B?RStka05PUE0wNGFLMGhTZ3pxOGpHc2tOTDJpY1BrdmVpeDVaYzA5ZStHSGlY?=
 =?utf-8?Q?yRMa5rW6w++sgskKTP+Y24Xw7rtn+9PdFhdA60E?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fcec66-ebbd-48da-3179-08d8e9d3a6ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 06:04:12.1834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vxh/NFAqdrTBWWat1/yuSAi/ljjcHr8wmMObe+gNNdYKPMkVDbwVLuW405KtLWnCWXT9L3dCP57DT185M7bPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/18/21 1:45 PM, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Wed, Mar 17, 2021 at 10:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Hi Khem,
>>
>> Understood your concern, but skip elfutils here is the least code change
>> and the gettext also use this means previously.
> 
> gettext perhaps can be pardoned since its the one providing these
> macros in first place.
> 
>>
>> Meanwhile, there should as least as possible recipe need to skip wiping
>> macros. If no, we may need to reconsider the related implement in
>> autotools.bbclass. From this perspective, I think we should better
>> record the recipe in this general bbclass.
> 
> I agree, but so far it seems its only elfutils, if there are more then
> please mentioned then to the list
> and perhaps a different solution should be sought.

Currently only found elfutils has this problem in my env. I think 
firstly if only one recipe, it's no big deal to record here as we wipe 
the per recipe macros in this autotools.bbclass(I didn't find other 
distribution wipe the macros). And secondly if there are other recipes 
need to skip the wiping, then it's just right to record here to prove we 
need to reconsider the related implements in autotools.bbclass.

Thanks,

> 
>>
>> Thanks,
>>
>> On 3/18/21 11:05 AM, Yu, Mingli wrote:
>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>> The below m4 macros files shipped with recipe will be removed if the
>>> recipe use AM_GNU_GETTEXT.
>>> gettext.m4
>>> iconv.m4
>>> lib-ld.m4
>>> lib-link.m4
>>> lib-prefix.m4
>>> nls.m4 po.m4
>>> progtest.m4
>>>
>>> After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
>>> commit (dd52d2ab Modernize gettext infrastructure) included, so the above
>>> m4 macros files such as iconv.m4 is removed and it's bad as we need to
>>> patch against iconv.m4 shippped with elfutils.
>>>
>>> So we skip elfutils to not let the elfutils m4 macros removed and also
>>> fix below issue:
>>>    $ bitbake elfutils -cconfigure && bitbake elfutils -cpatch -f
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>    meta/classes/autotools.bbclass | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
>>> index 9dc8ebdaa7..4b462c5aba 100644
>>> --- a/meta/classes/autotools.bbclass
>>> +++ b/meta/classes/autotools.bbclass
>>> @@ -203,7 +203,7 @@ autotools_do_configure() {
>>>                                bbnote Executing glib-gettextize --force --copy
>>>                                echo "no" | glib-gettextize --force --copy
>>>                        fi
>>> -             elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
>>> +             elif [ "${BPN}" != "gettext" -a "${BPN}" != "elfutils" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
>>>                        # We'd call gettextize here if it wasn't so broken...
>>>                        cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
>>>                        if [ -d ${S}/po/ ]; then
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> 
>>>
