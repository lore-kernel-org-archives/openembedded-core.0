Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web11.21152.1591580430358195526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 18:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Hn4WIN5u;
 spf=pass (domain: windriver.com, ip: 40.107.223.43, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0GAImAEPGgq+Fa6/LjUyzgaff9r5l7NG0vRIPer+OHPlwke19BMlcvfqlCyv6UkOxpb0dT1w4XNlCYXubF7kGSC27RdpE9GqI8hs2EOHwK1Q+HNkmdiQn0+PV0ms8Gxnv2fLSbsuA0Gq4FS1ozNFSOjxGC8rRrG1GNAkHx0YoZuOvoWOMtHKXDxbQr01KUTh51rvfW7tPg/nMYULyXJ8bwFYcr2XMn+A8XCIAoQNLkxyRQiSp+DYsKgQr8/qbDA83uOosQ6uPzZ7tZU36ux+uyfNWfdOdMvZsmDIh0p9kM4FFMd1mYciQsJ2MkeH6rBv4tphQ7X6nm8r4LYX6t2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipzbv5aSBIXaBUec0/h1XP2/ldSS7aHqC6qmUyNf6z8=;
 b=gnZkM/DCMl1UxjFSCmdfSj8NEiGELgupHXKlGwTehVRKeBiYKlpFUbuV+0wc8M6iR6vwjNVd6VyxHB4IFv+BTP9pV6WlKNNT9l2qm52dhMWulkuYiJnRW+hiKUrcrw6xDBEdCCRi+eRet5nyQg/0T7BUU3qNYnqgSz6CQRzFUX3tVjnT32nEgCPMIgeEHocBBeo+jWZguVEemyPX3XfRwXhcpScHyulw2wfBb24SiUWia0dqge49G4rwQ/nxkdQusgmi8ida6S66ClUSJurqr3NES7zcDMdy0Vmy+w5ikziGvDQI9sMZ9mtS74yTuO+TJKd9OfAe1n5jG7s/eGrCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipzbv5aSBIXaBUec0/h1XP2/ldSS7aHqC6qmUyNf6z8=;
 b=Hn4WIN5uK1RNqX8ooh+dKelIvs+EjC3TjHMQS8PW9jLKax+p9VqBjPoAU+ctsWiDpbHvjY2JVejiFgRKAhTyz5YjqTEkRuAf2wxas7kiBgcNWMFPV1w+97xTOcZd2mmYzJ4JZYmB+DyJ7FCcDVdBeCq9C1zk8zooF7pFjuZSETI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3080.namprd11.prod.outlook.com (2603:10b6:a03:8c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Mon, 8 Jun
 2020 01:40:28 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 01:40:28 +0000
Subject: Re: [OE-core][PATCH] Revert "vim: do not adjust script paths building for target"
To: "Slater, Joseph" <joe.slater@windriver.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20200605021331.20630-1-Qi.Chen@windriver.com>
 <b2edd74f0db71f891253828cfca64699a32a6622.camel@linuxfoundation.org>
 <BY5PR11MB3992F281954BC697CCD5762988840@BY5PR11MB3992.namprd11.prod.outlook.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <70d2cf02-7160-fc23-9082-e74f0ae67006@windriver.com>
Date: Mon, 8 Jun 2020 09:43:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <BY5PR11MB3992F281954BC697CCD5762988840@BY5PR11MB3992.namprd11.prod.outlook.com>
X-ClientProxiedBy: HK0PR01CA0068.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::32) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK0PR01CA0068.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 01:40:27 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf863b2b-2099-48e3-61f6-08d80b4cec77
X-MS-TrafficTypeDiagnostic: BYAPR11MB3080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30801E92C79BA6CA955E2C8BED850@BYAPR11MB3080.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NjA88ucnOtdRdBLIZBfGMs7FSVTn7CaXPHQLIkiWxoIM8CvG2h2XF4n3t9QI6TcF7FNepbd0K/FdP/GzYuF9ZOLEfqsUYcDkGT7Uvp2UV09DmM4pREQK+9Z+t1e3lMl9GmD8UGYlcL8WL0ZOqNidwpytfPQW0p/CxDUOtCs08fWC3dP0cnhXY4UAWaPhPA/QwngzUKrxl+zA3uPC4HBiIBRwcesxLDAqod2jujHVJNwAuF1J2j3/33EYfMm2gI5odrcyHVI9vrRWJbxP89gP1xDZGHjhQpZPLABKqEnOR5XvcnsSs9JyeMJmP2lWRksxNljB811Jm5WNYSWpUA4SHeSCjkjWnP/o8im11GJ/V6XQ3cS5+AhumslAenjWpuUKsc1DRE7tlyKhUCsoi/qKeX7RlICcvdV6BOXuMox337MPRsI3uv3BpTXEb9N8gByoU2JwkXrtLvBRuVOgLxVUWDHpsmBTEu+UFwSOLSfGyws=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(396003)(136003)(376002)(366004)(346002)(26005)(16526019)(186003)(52116002)(478600001)(110136005)(6706004)(53546011)(316002)(16576012)(6486002)(8936002)(31686004)(2906002)(31696002)(66476007)(66556008)(66946007)(83380400001)(86362001)(6666004)(956004)(2616005)(36756003)(8676002)(5660300002)(78286006)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FFJJ2jdZhc4WUURUeyKpZWhQQyHzSaqyMXTNm51Dr3Znq+zAjYhFyLUW1Lkx/Vb0pPROB1YtGk131xUI7H/1wVmtGMX3EwsFkCJyqSGCTGuQNxqaDq+v1hTxlEZOzAut6Cw4bmlqxZEmG5xEM5X1w0JMzfDKU7ILEtNz8XRmN0M5rkqYJMF0AuPGjxwKFjOSdyXD8605iRNSHUck5rkXiYfh2t7p1HoqPMu3Ni0Z354hnJykaHrvBAhCmbWDMHu8OAVmb+cfqElfwFX/bQiM/NwubcAdTDEd6/POrmy6FKkpBHaU3+Z3nb27yJMcEy37twESRwqv1Hj+CJstCSSHDnwNyyR1pTkS9se0w20oSM6YVmQxrnYMVsg2FdlNm6+T31iAutU0TepQoxED8hR+/yUObkbHy1NxyVt1PgOt89Kn2IY1Q1wlTplNV8j617xMBz1b6TvArXC4I4RE/mS+qYuwQfAtDBA8binqYpVInjo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf863b2b-2099-48e3-61f6-08d80b4cec77
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 01:40:28.7500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCc3E56O0sPUBANPCV731DojEhbLJfwfRdXhm8ygntaS7tXJumiEdlPKfgmLqKUTyQ06l3/Q7Q83yFLLj+7Rbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3080
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2020 01:16 AM, Slater, Joseph wrote:
> The INSANE_SKIP is intended to avoid the script dependencies.  Perhaps it is of the
> wrong form or there is now some other sanity check producing the error?
>
> Joe

It solves do_package_qa issue but introduces do_rootfs problem if 
vim-tools is installed.
The dependencies will calculated anyway at do_rootfs step, and it will 
report the 'nothing provides xxx' error.


Best Regards,
Chen Qi

>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: Thursday, June 4, 2020 11:40 PM
> To: Chen, Qi <Qi.Chen@windriver.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] Revert "vim: do not adjust script paths building for target"
>
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
>>     - nothing provides /usr/bin/python needed by
>> vim-tools-8.2-r0.corei7_64
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../vim/files/no-path-adjust.patch            | 27 -------------------
>>   meta/recipes-support/vim/vim.inc              | 12 ++++-----
>>   2 files changed, 6 insertions(+), 33 deletions(-)  delete mode 100644
>> meta/recipes-support/vim/files/no-path-adjust.patch
>>
>> diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch
>> b/meta/recipes-support/vim/files/no-path-adjust.patch
>> deleted file mode 100644
>> index 05c2d803f6..0000000000
>> --- a/meta/recipes-support/vim/files/no-path-adjust.patch
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -vim: do not adjust script pathnames
>> -
>> -When cross-compiling, we do not want to reference the host versions
>> of -things like perl and awk.
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
>> -+# replace the path in some tools, but not when cross-compiling ifneq
>> -+($(CROSS_COMPILING),1)
>> - 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
>> - 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
>> - 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
>> - 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
>> -+endif
>> - 	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
>> -
>> - # install the language specific files for tools, if they were
>> unpacked
>
> If we're going to install these files which you're still doing, we want to use target paths, not host ones?
>
> I suspect we therefore need this and your changes rather than removing this patch?
>
> Cheers,
>
> Richard
>
>
>> diff --git a/meta/recipes-support/vim/vim.inc
>> b/meta/recipes-support/vim/vim.inc
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
>>       install -m 0644 runtime/vimrc_example.vim
>> ${D}/${datadir}/${BPN}/vimrc
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

