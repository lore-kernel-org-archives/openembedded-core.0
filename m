Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.80])
 by mx.groups.io with SMTP id smtpd.web11.21124.1591580287088687066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 18:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JbJPI6vo;
 spf=pass (domain: windriver.com, ip: 40.107.220.80, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkMr03g7NkNadQIxbRZ3RDv/UK0Pp3OCECV80Ce1L7SV2MQvt6GL1eFjwa2CbXDgnRc34Di34lpV20pGH0OgXm251VmcOeCV+fyvCLmm+Ock84/trrOtBMR7cGjrAxT1hkckYgfj7ld5rdwK2uSsf+Twx/ZcM+yTQbN96yP/IbXaPt4KzmHoWDaDavUUC9v7z1+w3YhRWCtfuBVuvjzDiIXv4D7bp3PO3wSLNw07CMMlvqGCiM8cnKln7x7VfeH2syu/lDohb7BTTJqXsS+aNCdJf6WGwT25xXRnaMCRy+xYpcJUEuyLEFqsNIKLrwUhr9Ky08c9Dbe65mtFAcV7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFLzQR2+lXCNPx3klzgxPUVv+tk9eS36hprAiNljcA4=;
 b=lGGtqrV+KrTWLi+hNf/sHxiWoge6PgjmhDuvTanN+lshL8NC0cyaMl2J0r00f1+KNOUCSuOYU5C5ofKJCctfpfKLnKJQHkJgtnVNiwRoRqbaX19lzGSu4YBPipr7cIgSQEO66cD/MWis4cpXXphqUlRUKxIISopx+RVsGdLu6drH1YhPv+CUA8G7O/qzgN4eLiXGcxMBhKoZSWUDu2PdkNRfWY01FZvawNXdd0PrKlrJEkgDYHGRTDwqVNOvVbEWsY/hFLvPuqeIqSvj6HzZYX/xNhZZeQlVuuuBWN0eZ8EbtJCCytFa9g9ZqQ4mKQjAZW5msVY0kjzNUDmJ0djU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFLzQR2+lXCNPx3klzgxPUVv+tk9eS36hprAiNljcA4=;
 b=JbJPI6voXZcfa2FmxyVV4j4vCAlf2We8fGWS2WoOo/7YeVqmQcsyjzfBbFeZ/y3tov3lXr9AHwaVonifce+pVc/XDLrME03m1iMA9ZuANkF32yrgPt1j8hAnO7tFqWsnyvNB0ZPYQ91rQ+U+wsQJvTSVkhEC3xibqTI6SuMsefs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3848.namprd11.prod.outlook.com (2603:10b6:a03:fd::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Mon, 8 Jun
 2020 01:38:06 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 01:38:06 +0000
Subject: Re: [OE-core][PATCH] Revert "vim: do not adjust script paths building for target"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200605021331.20630-1-Qi.Chen@windriver.com>
 <b2edd74f0db71f891253828cfca64699a32a6622.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <1e446c43-427d-9a9d-18a0-b3785298120f@windriver.com>
Date: Mon, 8 Jun 2020 09:41:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <b2edd74f0db71f891253828cfca64699a32a6622.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:202:2e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 01:38:05 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a9b990d-bcd8-4642-985d-08d80b4c9773
X-MS-TrafficTypeDiagnostic: BYAPR11MB3848:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB384842F039ABA53CBB3D4C39ED850@BYAPR11MB3848.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OePWzPaeDxAPuWa2ukmZjZkQ9rf+oc3RMjOwslmLsBwMgCM04tgVhyJCjuAHY3zeHglSbl35rHNpbMOz/2DtU6sgzqM1Izy4B9AWJ02ZdnmoNs56a230g13bDw/ENTRv5CRl9Fa1opijSUx4cgbl/s8nXsJv7LMkwilmvOFupCMiyQY5SC5DFYL5vL5KEyCcMqqdH0Tr09Gt25Onhih1xmD5l4eH4uxPUkD/kzKJ7y+/+pcJEx+wqSsXzKXcqXZftlvTTcHEa1rd+PjBpN6oS2xuSlWq8688piw3fjO7fKYjphqoTMqoNgOfIIs8bbEflq3QWrXmKqO2iRK14EKxUq3GnMac54bDadvBFNyQKuIgWzRzsBSfcCHOgBEwxagkhEK/55T7Qze1cNWTYsC+FET7YOyWM3I8ZkTLA866pXW5GHu2SxFJZCGDS5B+Mqto/lDCC/iu2cq3RquhocH3orC5gC1ooAyLfHtGUbCx5mW9zYyROlY+EyZ8z/xxf6XYTfdgl14i/tZyHrr5iRzBaQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(136003)(39840400004)(346002)(366004)(83380400001)(36756003)(6666004)(5660300002)(16576012)(2906002)(53546011)(31686004)(8676002)(52116002)(316002)(2616005)(26005)(956004)(66476007)(66556008)(478600001)(31696002)(966005)(6486002)(8936002)(86362001)(6706004)(186003)(16526019)(66946007)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6qXAjI6mEokG7bXSLJSk2JKkLYGq+I8muJbOs5KyEHE666r6MKbtOLFcw0/VCitLDIalF9H6rJa3PyQ6P1CAwgSFlOEBZctWnUnbDOmj90PPp+w42vK4NUOezC2TiyCZqS8qe9HoxeLBgOGfCPL9TaQhYlY1UcZ1+W07bSrJmIqDZIAXNu2+kSpCzN98yw8sf2NoGguB1nTpU7CmYGi2xrkUZoN2mz0lOUNMYDSRxd2Ruy3vh77H6bf0uis7+RPgME6FOpUSUpTWB7Rhr/F4MyphGWDeJtNnMMR+iN1hcoUnLoKKSPU24i1liaC8EPvjsYUsGTYPyXGbYqaw0R3EzrAYeBV5OT1xdn0NuEt4Tqb0Y10QCEOcRWO6LLFLWNs8Xes8KgF8cTHaADM52b2VKXjLO4bpZorbUg2dEoehfCxFjs6YBTso0eIR5+tsBFsdlx8LZj9fvWrmmw0sw7PpvDvB3LFrciIyio0SdzI4aWU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9b990d-bcd8-4642-985d-08d80b4c9773
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 01:38:06.0879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVTp8qm50npxN9J/J16EfqJIMA5/ulUUQwvVJHtd9RdolQsNeZEF1eL1H0dpWnpPi290gX4oCdfZu5U5Fp7v4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3848
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2020 02:40 PM, Richard Purdie wrote:
> On Fri, 2020-06-05 at 10:13 +0800, Chen Qi wrote:
>> This reverts commit 8972fe5581b9fe8ef14d539001758bb13bca6737.
>>
>> The above commit causes regression when vim-tools is installed.
>> The error is like below.
>>
>> Error:
>>   Problem: conflicting requests
>>     - nothing provides /bin/csh needed by vim-tools-8.2-r0.corei7_64
>>     - nothing provides /usr/bin/nawk needed by vim-tools-8.2-r0.corei7_64
>>     - nothing provides /usr/bin/python needed by vim-tools-8.2-r0.corei7_64
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../vim/files/no-path-adjust.patch            | 27 -------------------
>>   meta/recipes-support/vim/vim.inc              | 12 ++++-----
>>   2 files changed, 6 insertions(+), 33 deletions(-)
>>   delete mode 100644 meta/recipes-support/vim/files/no-path-adjust.patch
>>
>> diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
>> deleted file mode 100644
>> index 05c2d803f6..0000000000
>> --- a/meta/recipes-support/vim/files/no-path-adjust.patch
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -vim: do not adjust script pathnames
>> -
>> -When cross-compiling, we do not want to reference the host versions of
>> -things like perl and awk.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> -
>> ---- a/src/Makefile
>> -+++ b/src/Makefile
>> -@@ -2507,11 +2507,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
>> - 		 rm -rf $$cvs; \
>> - 	      fi
>> - 	-chmod $(FILEMOD) $(DEST_TOOLS)/*
>> --# replace the path in some tools
>> -+
>> -+# replace the path in some tools, but not when cross-compiling
>> -+ifneq ($(CROSS_COMPILING),1)
>> - 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
>> - 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
>> - 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
>> - 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
>> -+endif
>> - 	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
>> -
>> - # install the language specific files for tools, if they were unpacked
>
> If we're going to install these files which you're still doing, we want
> to use target paths, not host ones?
>
> I suspect we therefore need this and your changes rather than removing
> this patch?
>
> Cheers,
>
> Richard

Thanks. I've sent out V2.

Regards,
Chen Qi

>
>> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
>> index 9f3dc08027..78e3f9528d 100644
>> --- a/meta/recipes-support/vim/vim.inc
>> +++ b/meta/recipes-support/vim/vim.inc
>> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/vim/vim.git \
>>              file://disable_acl_header_check.patch \
>>              file://vim-add-knob-whether-elf.h-are-checked.patch \
>>              file://0001-src-Makefile-improve-reproducibility.patch \
>> -           file://no-path-adjust.patch \
>>   "
>>   SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
>>   
>> @@ -83,6 +82,12 @@ EXTRA_OECONF = " \
>>   do_install() {
>>       autotools_do_install
>>   
>> +    # Work around file-rdeps picking up csh, awk, perl or python as a dep
>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
>> +
>>       # Install example vimrc from runtime files
>>       install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
>>   
>> @@ -105,12 +110,7 @@ FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
>>   FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
>>   FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
>>   FILES_${PN}-data = "${datadir}/${BPN}"
>> -
>> -# We do not want to complain if perl or gawk are not on the target.
>> -#
>>   FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
>> -INSANE_SKIP_${PN}-tools = "file-rdeps"
>> -
>>   FILES_${PN}-common = " \
>>       ${datadir}/${BPN}/${VIMDIR}/*.vim \
>>       ${datadir}/${BPN}/${VIMDIR}/autoload \
>> 
>

