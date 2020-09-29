Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.78])
 by mx.groups.io with SMTP id smtpd.web10.13909.1601355742787654304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 22:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lsf6EIa4;
 spf=pass (domain: windriver.com, ip: 40.107.100.78, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg3v+KThKKkyPdIC4ZBwyH8QNOJI252T3HJ2gaPHIaXK7JmJF97mOtrvAgft0vDDa+rWRli1bCXCo6fnr72A/2gwOK0m4eFOJezXl6Je3muCfmadIupd0+ykOIftJZcZ2IbTQrYndGhJUFFTnM+KBhmDOjgEGF8+TFxrnvv2ZTol5YwnPG6GkCSZXuUiph/zTF6SWHOxiUmS/YjB4ckGL0aT3HHJJ8QQOLJkvcGe4Z4T0lyjtgL+GrjfBRDw2aFAaMK9a3EWkdfDAFboK4mNXeD+YShFXUrWYIF+bYgKgRClthEruVCnN6951MMTGd5vgzxMTRM2Ohtk1xH3YHlWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPqz1qfy7BzHmYhYNL+mD7/oB9L4/z8f2poNqtDPzyk=;
 b=goPSMXfEADBU3vPb8nsx3Dw9+zlkD8+T+ZvpPUA3ngCrnVFeHHhDusL8L6vUSQ6tYR4066AtM8mttT4QmXKFfhLgk86jRc053Xc//SwO4D4WUQipfsXo8k/xtSsS6eIjGT7YwH6+lsmitug39w1taBiDsCkOl7hSFefMjpWh+L6eRieAG06L1OG71x+KZZrMYX7CvHd00SQU/Mp3CqeXhNN0qSXb7aRs5GwQirKOMFnE7rFMT552hBdYAs//uQ9eEaEUX/4nXT3PfjDuXLRpCKKiXEqxHA5g9tcVKBojzvtA0ViJyQOEKPmESkkF47Ybnp10EEsOaWZci/vYUsOCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPqz1qfy7BzHmYhYNL+mD7/oB9L4/z8f2poNqtDPzyk=;
 b=lsf6EIa4rtRPsPk3BAE/sHzwirC2TokQM4FYLYkOcgVPJ+VC1rK4m0F8PR9t1aX+0ZYtylalWwdl6ERGmxh+xXwY/VU/xWvVLUWFxmOrk+6qLXTnWBk1OVC/j8kGz4yMoS65t/+zM0f5haK9ANVE1UeY+DpXA+oL6nKsWtlvwuo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3557.namprd11.prod.outlook.com (2603:10b6:a03:b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 05:02:20 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 05:02:20 +0000
Subject: Re: [OE-core][PATCH 3/3] nfs-utils: fix configure error on some hosts
To: Khem Raj <raj.khem@gmail.com>
References: <20200929032216.32161-1-Qi.Chen@windriver.com>
 <20200929032216.32161-3-Qi.Chen@windriver.com>
 <CAMKF1srVBciPuLDgfGKyEVhFX8sbLd=H=CSOTzq-c21XCHH+-g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <6e86ea27-0fe2-91f7-4046-68810c118dbb@windriver.com>
Date: Tue, 29 Sep 2020 13:08:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CAMKF1srVBciPuLDgfGKyEVhFX8sbLd=H=CSOTzq-c21XCHH+-g@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0221.apcprd02.prod.outlook.com
 (2603:1096:201:20::33) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR02CA0221.apcprd02.prod.outlook.com (2603:1096:201:20::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3412.22 via Frontend Transport; Tue, 29 Sep 2020 05:02:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4c77250-2dc5-4571-014c-08d86434d844
X-MS-TrafficTypeDiagnostic: BYAPR11MB3557:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35575B773D4C531B8BD5ABBDED320@BYAPR11MB3557.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fyu73DA1i6zBK5H1LSEwlIeyd1VonAK1p0b5zJHPEuw/8hup21AtWKXnxO93Skbw2DExJpH1hJVRnxUZBzOsCqUy08CtI1Iu6B7Vub6C+9m1BLjqwwP5Oo3THp5DFaNYOEiOXaYP8hxgB7GU2vwe/cgM8SCmCKV1i9U6RKt9MRTOSp3YsBxYzZnr/tKlX6ozpXLejslnZWEitlWE660K+zomr3DvkyC61ayzihHIEO0CbEjRon0DhdvcDoWkl5LgFEH7NZnwEZV/zxTvkQx4yWWJaA6Qla2c0L6U4HtqjuSZLmXhcFeqAmQ06EdqoSeuTK6PWWs+X+8ZU1go5kCe198NAfQdjIzIJq1uXYoM0uFp8k299kVwSwkapSay+Dtq9K+vlwe1KaP/emyFIqtIvhzRSeDZMHI52+0TLHQjgjA/H5ayr7mbVV8xj3w3nRdXfFB1jrN7k09wADklpPsawiSvH5WcIsIcWEUE9d7X8LJ5Vn7b5R8y+OztXWIETb37UjXFejXnWFjS8WSfwwaNyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(396003)(136003)(6706004)(6916009)(2616005)(956004)(31686004)(66946007)(966005)(478600001)(186003)(6666004)(26005)(16526019)(86362001)(316002)(16576012)(4326008)(8676002)(66476007)(2906002)(31696002)(83380400001)(8936002)(52116002)(36756003)(6486002)(53546011)(66556008)(5660300002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KCWjYChdctmwf6vP2tWVCgSzB+iOuNdbLjgJB5H+XRIzxZZMXYcN5lSStSuwUF0fMYbegdoNkoeZqSbHmaYzID4ql1RvDcm5fRinUmos5a1ExKIzUWS51c1adN+RBxH8LkqwTsqevPqhP6bZ4X50PwyTNKgriJY9yH5bZI0gA+SZ3tym9zwgoGwMzr38kjMCpGLw39UIXARMA1ZzrrV4bMYjjh6FnnDMCisG07/i9q7V+epw2kG/nQABayAnSNR6BYJn6VlIvqT+dUDhxNhczk9hOCPoqFnrOzxnzRnaS4zl0avqri30gW1qosQyo4ZMKFw13vs06OkhUB2L8HUrEKVBT5DvQxx9914V12FGmqvd3/7P19LW9Nb3q5q7QhrqWn2ueN8t4STx5cATaaUVmbuo7PCp+EwDqETETNJJSUyoQYmO0vQmWitT1r/8DYf0VZsiPE8XtJIxTqzYJvPncW0gUsQzETBhVnwWaA4qr7wUhWelAvKOKstdpeGZHBubdEtjqk6A9iEk6pUMJLr2bjUHpx7E1h9Pn0aoIHOkHueLAB8/k3FfDEgTVdKN5Nx/LMjUBMdnoAjzqO+nOgTlVS4iE6ZWtxCHVmnNg9xGQN7anVvdcy6uMcbOEu0B/svJC/UtpxDsFTJ1vbRIq7sh/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c77250-2dc5-4571-014c-08d86434d844
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 05:02:20.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbhoxIXVTbfUSwLMp4z7JWg+fUt81A3el/NsVXD3QwupvinV94E2dZlTD1aA35ODe3+4roUetm9rb+zbCMDGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3557
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/29/2020 12:23 PM, Khem Raj wrote:
> On Mon, Sep 28, 2020 at 8:22 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>> nfs-utils' configure.ac hardcodes the rpcgen's searching path. However,
>> on some hosts, rpcgen is missing but SDK provides one. We should avoid
>> the hardcoding so that nfs-utils could be built correctly under SDK.
>>
> perhaps its better to always require --with-rpcgen there is no need to
> look into host paths

I agree. Thanks.
I'll send out V2.

Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   ...gure.ac-avoid-hardcoding-rpcgen-path.patch | 31 +++++++++++++++++++
>>   .../nfs-utils/nfs-utils_2.5.1.bb              |  1 +
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
>> new file mode 100644
>> index 0000000000..5602e5be57
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-avoid-hardcoding-rpcgen-path.patch
>> @@ -0,0 +1,31 @@
>> +From b9049fbf051e559941298afd57ec43d6f6a5490d Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Wed, 29 Apr 2020 08:56:05 +0000
>> +Subject: [PATCH] configure.ac: avoid hardcoding rpcgen path
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + configure.ac | 5 +++--
>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index f9efdb7..8e8aeaa 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -152,8 +152,9 @@ AC_ARG_WITH(rpcgen,
>> +       rpcgen_cflags=-Werror=strict-prototypes
>> +       RPCGEN_PATH=
>> +       if test "$rpcgen_path" = "yes"; then
>> +-          for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
>> +-          do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
>> ++          #for p in /usr/local/bin/rpcgen /usr/bin/rpcgen /bin/rpcgen
>> ++          #do if test -f $p ; then RPCGEN_PATH=$p ; break; fi ; done
>> ++          RPCGEN_PATH=`which rpcgen`
>> +               if test -z "$RPCGEN_PATH"; then
>> +                       AC_MSG_ERROR([Please install rpcgen or use --with-rpcgen])
>> +               fi
>> +--
>> +2.24.1
>> +
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
>> index b8ad23a0d8..b06ce2d0af 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
>> @@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>>              file://bugfix-adjust-statd-service-name.patch \
>>              file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
>>              file://clang-warnings.patch \
>> +           file://0001-configure.ac-avoid-hardcoding-rpcgen-path.patch \
>>              "
>>   SRC_URI[sha256sum] = "0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4"
>>
>> --
>> 2.17.1
>>
>>
>> 
>>

