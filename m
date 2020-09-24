Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.66])
 by mx.groups.io with SMTP id smtpd.web12.9996.1600927230067734130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 23:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aigb22zF;
 spf=pass (domain: windriver.com, ip: 40.107.223.66, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uljf6/v8+2LNmNMvGJapw/EHwcH8rwq5ywhCWxsQLsF7oP+MZxxM57qf1f7s/tC6b9Lhkk5E6PDH5qJcWD89GCIkGaS8Y3KqOSxv0BNIqeVsMI1soGxBHOaLFnthuXAlu8IykQTTdGlaE6uqs0cSoOUxR2v6JSpZ7fRdVuqKfZzZwDxHzBVBAwfVrh7XEOexqhWY8rZYW9X+4njwzLdCntj+yTImRvjfZGC6UIemSWixrWc7RU3smWeN9teiyjOO9ZsqbPqxiys0utMqi8WJjTnpq4hlr02P5Kf93XbNReXT1Dv/LMdtzbGDXQ1XdE8IgdSuIERXJVkfYKQVC0lsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qjql9JgJo2pXRyq5oDqWHF1dST1akdJ6YvOKsEyrak8=;
 b=anx0nYT85c9SSjt/rAVqUD6HSzIqPgieOzCMZdrgkdkxjPSeN1gcywkuiq3009DrPo0sVCO9PUhXuodFPl+sm8ccwUok8OF5EUsQxzYbhL8ZNjAjySEbSgcSHQ3grjAA3jYC2MbYREnW+RATlFtdz6jHnppBbhBQgxI+VCenmfmqStJ4X122oNgzO5tctPIK2RB9BOyHliXizB2L1elxa9RPrQ7bGnN/Y07IrTkjm2aoFxBtWgZbc3748WhrxZGUi7u2E/htCJQaHd3du8YxRzURZMLhkQc5Bt14Vp8bcH5V4UPnCqksjDR3hriGbbAkIbqISVGjgWwsXtTwB/3+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qjql9JgJo2pXRyq5oDqWHF1dST1akdJ6YvOKsEyrak8=;
 b=aigb22zF5gumttb4H7Scr72rVBmZp7QaN4pZN6lPE4yJzqrJpNi7mCkNQ0elXcf1qJuqTcC7opNhNlK6fH5pN1vFWhqXwWSN6Mfdryo0jhykX9Z8K60fJwl7pMK5dmFbmoF+YQ+VVy4rU8R3EVx7Jtff7Xu1U4kBt06iPNhdC4Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 24 Sep
 2020 06:00:26 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::dc3d:f132:1438:7e10]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::dc3d:f132:1438:7e10%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 06:00:26 +0000
Subject: Re: [OE-core] [PATCH] bash: fix CVE-2019-18276
To: Anuj Mittal <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20200924023944.48941-1-mingli.yu@windriver.com>
 <25e019e30ea0a91d4c6f9d85a9beeb21f4470953.camel@intel.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <a70aa029-fd52-f9a0-1cf8-6403e9370ee1@windriver.com>
Date: Thu, 24 Sep 2020 13:59:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <25e019e30ea0a91d4c6f9d85a9beeb21f4470953.camel@intel.com>
X-ClientProxiedBy: SL2P216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:18::13) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by SL2P216CA0003.KORP216.PROD.OUTLOOK.COM (2603:1096:100:18::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 06:00:24 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04c466ec-119b-402a-98ba-08d8604f21c8
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3894C33736F5509D5110768AF1390@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:97;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QqiOZTRnurNaA0raA3x0a34ejgCthCSMF2q8uoAPDSY5mKwJXnzPK3922pf4aCqfvOxvweP7oZCusiqDA+9rtywLZEf2zhrFEh7gomDWMdu3BlhEMVYWYEpJ4yJbRf5BfqAAThaW/SQEaOtYKvGORfogoBHQFH68cBWokn1uJepoI0gkf4hhthr5mvI/vIKWlJ99/OZq0GcHcXex+YR+F9T8bu4WTWEQ351Ua1u2hprcEIasBvmH+P/F9GhiKmahHm63Vyw9QT58wKEGB2f/uk3PCYbltS4m7Fzi+cWj8ha2yO+9z9OLbx02SqqhVzzNeUhH9NLyStsDZuQNWW2+4dYy+PTZxuPS3erIAgtlBRPiJNXlalUz/XotlBJe7NQ4aEfWzyEzXRMOKQPfCTise7YLReprUowT86pb1rEn9a4ZRimwVt1WWjgbyB5mBlspcQaYfZBsNv7+fhh5MT8ImKWEpZ81Vpu7XI2simRtRq1q/yWV16M3p7Mx9LcneMs8llWrslpClJINulr0yXbc2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39840400004)(346002)(136003)(366004)(6666004)(83380400001)(6486002)(16526019)(26005)(186003)(966005)(31686004)(36756003)(30864003)(316002)(478600001)(8936002)(53546011)(5660300002)(52116002)(6706004)(31696002)(16576012)(110136005)(2906002)(86362001)(66946007)(8676002)(2616005)(66556008)(956004)(66476007)(2004002)(21314003)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mPPwfF35xbPoIk/DZH9bxOqyFhR7WnW+zT3yWY7Iu/EHGOJdMHLXm8noBz3yfALA0YGbo9qxsTqSVdQ5AeAfkebfdflESb/60ZtT1HDp7X6/mlbuNCGJGUCHX0zXfvwN/FwgdWmZzEmIIdKnSdm/kLlit9FzycpTL3lb0Tk8QtfBXIuTvgOR5YXXx2+Kku18c/bfmkmhhd6z1B2+jy4bDYYyOldk1MKMBVbcKhq3IFmV2XnyGzQfqt/70i3XYlMZA+Jh/hzmsAqizQwYcc7UQICB1swANlXT0j4qeaq0EGDXnNH7UQfse2fpu+lhsRexUFcxUBeHNZOtRk3/vfj0G5I/rQveGTx23DERxa1qrrQvCnmUObtNJA15gFD2H4dgKA3ib4x2JkoO34eDymmFLCrfEgjCipUDUh5WG8BxNXku+IAkBrmb+jkvxRSpRcfra5BV10O6IfJwOU84d+fyyVzcskrs5lTGU2+XKb/UfXUJS3mhKe50T782wqV2KUPhDORp8fCeyORFnx9zPFlcJLSD+yiJ5nvz7wiz22MD/AHb+XPNvFAn4CHzQaGN6CZCIl8Iru4W2pEr7TjQeHjqSp7p8fisy9Fq0ZR6IbWrXZspJV30Dj+iB1WluklyJDdrScFcGogAlufjpRpTPgKIAw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c466ec-119b-402a-98ba-08d8604f21c8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 06:00:26.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enAmo2ZCV/6m0tRPZ9dChm/m5N5Yt1ZPgsp73MW9tm+xy5LUouzr2qSgsXdKOCwYcknQdDR1eAJvUhbvgBK2ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Anuj,

On 9/24/20 10:50 AM, Anuj Mittal wrote:
> Hi Mingli,
> 
> On Thu, 2020-09-24 at 10:39 +0800, Yu, Mingli wrote:
>> From: De Huo <De.Huo@windriver.com>
>>
>> An issue was discovered in disable_priv_mode in shell.c in GNU Bash
>> through 5.0 patch 11. By default, if Bash is run with its effective
>> UID
>> not equal to its real UID, it will drop privileges by setting its
>> effective UID to its real UID. However, it does so incorrectly. On
>> Linux
>> and other systems that support "saved UID" functionality, the saved
>> UID
>> is not dropped. An attacker with command execution in the shell can
>> use
>> "enable -f" for runtime loading of a new builtin, which can be a
>> shared
>> object that calls setuid() and therefore regains privileges. However,
>> binaries running with an effective UID of 0 are unaffected.
>>
>> Get the patch from [1] to fix the issue.
>>
>> [1]
>> https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=951bdaa
> 
> Has something changed from last time this patch was submitted and later
> reverted because of the failing ptest? I remember the author saying
> this isn't a real security bug and there were also changes in the patch
> that weren't related to the CVE ...

Changed the patch a little to remove the configure file part to fix the 
reconfigure issue in v1 patch.

Yes, the author saying the patch did fix the issue stated in 
CVE-2019-18276 though the issue actually is't a big deal.

Thanks,

> 
> Thanks,
> 
> Anuj
> 
>>
>> Signed-off-by: De Huo <De.Huo@windriver.com>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../bash/bash/bash-CVE-2019-18276.patch       | 386
>> ++++++++++++++++++
>>   meta/recipes-extended/bash/bash_5.0.bb        |   1 +
>>   2 files changed, 387 insertions(+)
>>   create mode 100644 meta/recipes-extended/bash/bash/bash-CVE-2019-
>> 18276.patch
>>
>> diff --git a/meta/recipes-extended/bash/bash/bash-CVE-2019-
>> 18276.patch b/meta/recipes-extended/bash/bash/bash-CVE-2019-
>> 18276.patch
>> new file mode 100644
>> index 0000000000..7b2073201e
>> --- /dev/null
>> +++ b/meta/recipes-extended/bash/bash/bash-CVE-2019-18276.patch
>> @@ -0,0 +1,386 @@
>> +From 951bdaad7a18cc0dc1036bba86b18b90874d39ff Mon Sep 17 00:00:00
>> 2001
>> +From: Chet Ramey <chet.ramey@case.edu>
>> +Date: Mon, 1 Jul 2019 09:03:53 -0400
>> +Subject: [PATCH] commit bash-20190628 snapshot
>> +
>> +An issue was discovered in disable_priv_mode in shell.c in GNU Bash
>> through 5.0 patch 11.
>> +By default, if Bash is run with its effective UID not equal to its
>> real UID,
>> +it will drop privileges by setting its effective UID to its real
>> UID.
>> +However, it does so incorrectly. On Linux and other systems that
>> support "saved UID" functionality,
>> +the saved UID is not dropped. An attacker with command execution in
>> the shell can use "enable -f" for
>> +runtime loading of a new builtin, which can be a shared object that
>> calls setuid() and therefore
>> +regains privileges. However, binaries running with an effective UID
>> of 0 are unaffected.
>> +
>> +Get the patch from [1] to fix the issue.
>> +
>> +Upstream-Status: Inappropriate [the upstream thinks it doesn't
>> increase the credibility of CVEs in general]
>> +CVE: CVE-2019-18276
>> +
>> +[1]
>> https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=951bdaa
>> +
>> +Signed-off-by: De Huo <De.Huo@windriver.com>
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + MANIFEST          |  2 ++
>> + bashline.c        | 50 +-------------------------------------------
>> ------
>> + builtins/help.def |  2 +-
>> + config.h.in       | 10 +++++++++-
>> + configure.ac      |  1 +
>> + doc/bash.1        |  3 ++-
>> + doc/bashref.texi  |  3 ++-
>> + lib/glob/glob.c   |  5 ++++-
>> + pathexp.c         | 16 ++++++++++++++--
>> + shell.c           |  8 ++++++++
>> + tests/glob.tests  |  2 ++
>> + tests/glob6.sub   | 54
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> + tests/glob7.sub   | 11 +++++++++++
>> + 14 files changed, 122 insertions(+), 56 deletions(-)
>> + create mode 100644 tests/glob6.sub
>> + create mode 100644 tests/glob7.sub
>> +
>> +diff --git a/MANIFEST b/MANIFEST
>> +index 03de221..f9ccad7 100644
>> +--- a/MANIFEST
>> ++++ b/MANIFEST
>> +@@ -1037,6 +1037,8 @@ tests/extglob3.tests	f
>> + tests/extglob3.right	f
>> + tests/extglob4.sub	f
>> + tests/extglob5.sub	f
>> ++tests/glob6.sub		f
>> ++tests/glob7.sub		f
>> + tests/func.tests	f
>> + tests/func.right	f
>> + tests/func1.sub		f
>> +diff --git a/bashline.c b/bashline.c
>> +index 824ea9d..d86b47d 100644
>> +--- a/bashline.c
>> ++++ b/bashline.c
>> +@@ -3718,55 +3718,7 @@ static int
>> + completion_glob_pattern (string)
>> +      char *string;
>> + {
>> +-  register int c;
>> +-  char *send;
>> +-  int open;
>> +-
>> +-  DECLARE_MBSTATE;
>> +-
>> +-  open = 0;
>> +-  send = string + strlen (string);
>> +-
>> +-  while (c = *string++)
>> +-    {
>> +-      switch (c)
>> +-	{
>> +-	case '?':
>> +-	case '*':
>> +-	  return (1);
>> +-
>> +-	case '[':
>> +-	  open++;
>> +-	  continue;
>> +-
>> +-	case ']':
>> +-	  if (open)
>> +-	    return (1);
>> +-	  continue;
>> +-
>> +-	case '+':
>> +-	case '@':
>> +-	case '!':
>> +-	  if (*string == '(')	/*)*/
>> +-	    return (1);
>> +-	  continue;
>> +-
>> +-	case '\\':
>> +-	  if (*string++ == 0)
>> +-	    return (0);	 	
>> +-	}
>> +-
>> +-      /* Advance one fewer byte than an entire multibyte character
>> to
>> +-	 account for the auto-increment in the loop above. */
>> +-#ifdef HANDLE_MULTIBYTE
>> +-      string--;
>> +-      ADVANCE_CHAR_P (string, send - string);
>> +-      string++;
>> +-#else
>> +-      ADVANCE_CHAR_P (string, send - string);
>> +-#endif
>> +-    }
>> +-  return (0);
>> ++  return (glob_pattern_p (string) == 1);
>> + }
>> +
>> + static char *globtext;
>> +diff --git a/builtins/help.def b/builtins/help.def
>> +index 006c4b5..92f9b38 100644
>> +--- a/builtins/help.def
>> ++++ b/builtins/help.def
>> +@@ -128,7 +128,7 @@ help_builtin (list)
>> +
>> +   /* We should consider making `help bash' do something. */
>> +
>> +-  if (glob_pattern_p (list->word->word))
>> ++  if (glob_pattern_p (list->word->word) == 1)
>> +     {
>> +       printf ("%s", ngettext ("Shell commands matching keyword `",
>> "Shell commands matching keywords `", (list->next ? 2 : 1)));
>> +       print_word_list (list, ", ");
>> +diff --git a/config.h.in b/config.h.in
>> +index 8554aec..ad4b1e8 100644
>> +--- a/config.h.in
>> ++++ b/config.h.in
>> +@@ -1,6 +1,6 @@
>> + /* config.h -- Configuration file for bash. */
>> +
>> +-/* Copyright (C) 1987-2009,2011-2012 Free Software Foundation, Inc.
>> ++/* Copyright (C) 1987-2009,2011-2012,2013-2019 Free Software
>> Foundation, Inc.
>> +
>> +    This file is part of GNU Bash, the Bourne Again SHell.
>> +
>> +@@ -807,6 +807,14 @@
>> + #undef HAVE_SETREGID
>> + #undef HAVE_DECL_SETREGID
>> +
>> ++/* Define if you have the setregid function.  */
>> ++#undef HAVE_SETRESGID
>> ++#undef HAVE_DECL_SETRESGID
>> ++
>> ++/* Define if you have the setresuid function.  */
>> ++#undef HAVE_SETRESUID
>> ++#undef HAVE_DECL_SETRESUID
>> ++
>> + /* Define if you have the setvbuf function.  */
>> + #undef HAVE_SETVBUF
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 52b4cdb..549adef 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -810,6 +810,7 @@ AC_CHECK_DECLS([confstr])
>> + AC_CHECK_DECLS([printf])
>> + AC_CHECK_DECLS([sbrk])
>> + AC_CHECK_DECLS([setregid])
>> ++AC_CHECK_DECLS[(setresuid, setresgid])
>> + AC_CHECK_DECLS([strcpy])
>> + AC_CHECK_DECLS([strsignal])
>> +
>> +diff --git a/doc/bash.1 b/doc/bash.1
>> +index e6cd08d..9e58a0b 100644
>> +--- a/doc/bash.1
>> ++++ b/doc/bash.1
>> +@@ -4681,7 +4681,8 @@ above).
>> + .PD
>> + .SH "SIMPLE COMMAND EXPANSION"
>> + When a simple command is executed, the shell performs the following
>> +-expansions, assignments, and redirections, from left to right.
>> ++expansions, assignments, and redirections, from left to right, in
>> ++the following order.
>> + .IP 1.
>> + The words that the parser has marked as variable assignments (those
>> + preceding the command name) and redirections are saved for later
>> +diff --git a/doc/bashref.texi b/doc/bashref.texi
>> +index d33cd57..3065126 100644
>> +--- a/doc/bashref.texi
>> ++++ b/doc/bashref.texi
>> +@@ -2964,7 +2964,8 @@ is not specified.  If the file does not exist,
>> it is created.
>> + @cindex command expansion
>> +
>> + When a simple command is executed, the shell performs the following
>> +-expansions, assignments, and redirections, from left to right.
>> ++expansions, assignments, and redirections, from left to right, in
>> ++the following order.
>> +
>> + @enumerate
>> + @item
>> +diff --git a/lib/glob/glob.c b/lib/glob/glob.c
>> +index 398253b..2eaa33e 100644
>> +--- a/lib/glob/glob.c
>> ++++ b/lib/glob/glob.c
>> +@@ -607,6 +607,7 @@ glob_vector (pat, dir, flags)
>> +   register unsigned int i;
>> +   int mflags;		/* Flags passed to strmatch (). */
>> +   int pflags;		/* flags passed to sh_makepath () */
>> ++  int hasglob;		/* return value from glob_pattern_p */
>> +   int nalloca;
>> +   struct globval *firstmalloc, *tmplink;
>> +   char *convfn;
>> +@@ -648,10 +649,12 @@ glob_vector (pat, dir, flags)
>> +   patlen = (pat && *pat) ? strlen (pat) : 0;
>> +
>> +   /* If the filename pattern (PAT) does not contain any globbing
>> characters,
>> ++     or contains a pattern with only backslash escapes (hasglob ==
>> 2),
>> +      we can dispense with reading the directory, and just see if
>> there is
>> +      a filename `DIR/PAT'.  If there is, and we can access it, just
>> make the
>> +      vector to return and bail immediately. */
>> +-  if (skip == 0 && glob_pattern_p (pat) == 0)
>> ++  hasglob = 0;
>> ++  if (skip == 0 && (hasglob = glob_pattern_p (pat)) == 0 || hasglob
>> == 2)
>> +     {
>> +       int dirlen;
>> +       struct stat finfo;
>> +diff --git a/pathexp.c b/pathexp.c
>> +index c1bf2d8..e6c5392 100644
>> +--- a/pathexp.c
>> ++++ b/pathexp.c
>> +@@ -58,7 +58,10 @@ int extended_glob = EXTGLOB_DEFAULT;
>> + /* Control enabling special handling of `**' */
>> + int glob_star = 0;
>> +
>> +-/* Return nonzero if STRING has any unquoted special globbing chars
>> in it.  */
>> ++/* Return nonzero if STRING has any unquoted special globbing chars
>> in it.
>> ++   This is supposed to be called when pathname expansion is
>> performed, so
>> ++   it implements the rules in Posix 2.13.3, specifically that an
>> unquoted
>> ++   slash cannot appear in a bracket expression. */
>> + int
>> + unquoted_glob_pattern_p (string)
>> +      register char *string;
>> +@@ -85,10 +88,14 @@ unquoted_glob_pattern_p (string)
>> + 	  continue;
>> +
>> + 	case ']':
>> +-	  if (open)
>> ++	  if (open)		/* XXX - if --open == 0? */
>> + 	    return (1);
>> + 	  continue;
>> +
>> ++	case '/':
>> ++	  if (open)
>> ++	    open = 0;
>> ++
>> + 	case '+':
>> + 	case '@':
>> + 	case '!':
>> +@@ -106,6 +113,11 @@ unquoted_glob_pattern_p (string)
>> + 	      string++;
>> + 	      continue;
>> + 	    }
>> ++	  else if (open && *string == '/')
>> ++	    {
>> ++	      string++;		/* quoted slashes in bracket
>> expressions are ok */
>> ++	      continue;
>> ++	    }
>> + 	  else if (*string == 0)
>> + 	    return (0);
>> + 	 	
>> +diff --git a/shell.c b/shell.c
>> +index a2b2a55..6adabc8 100644
>> +--- a/shell.c
>> ++++ b/shell.c
>> +@@ -1293,7 +1293,11 @@ disable_priv_mode ()
>> + {
>> +   int e;
>> +
>> ++#if HAVE_DECL_SETRESUID
>> ++  if (setresuid (current_user.uid, current_user.uid,
>> current_user.uid) < 0)
>> ++#else
>> +   if (setuid (current_user.uid) < 0)
>> ++#endif
>> +     {
>> +       e = errno;
>> +       sys_error (_("cannot set uid to %d: effective uid %d"),
>> current_user.uid, current_user.euid);
>> +@@ -1302,7 +1306,11 @@ disable_priv_mode ()
>> + 	exit (e);
>> + #endif
>> +     }
>> ++#if HAVE_DECL_SETRESGID
>> ++  if (setresgid (current_user.gid, current_user.gid,
>> current_user.gid) < 0)
>> ++#else
>> +   if (setgid (current_user.gid) < 0)
>> ++#endif
>> +     sys_error (_("cannot set gid to %d: effective gid %d"),
>> current_user.gid, current_user.egid);
>> +
>> +   current_user.euid = current_user.uid;
>> +diff --git a/tests/glob.tests b/tests/glob.tests
>> +index 01913bb..fb012f7 100644
>> +--- a/tests/glob.tests
>> ++++ b/tests/glob.tests
>> +@@ -12,6 +12,8 @@ ${THIS_SH} ./glob1.sub
>> + ${THIS_SH} ./glob2.sub
>> + ${THIS_SH} ./glob3.sub
>> + ${THIS_SH} ./glob4.sub
>> ++${THIS_SH} ./glob6.sub
>> ++${THIS_SH} ./glob7.sub
>> +
>> + MYDIR=$PWD	# save where we are
>> +
>> +diff --git a/tests/glob6.sub b/tests/glob6.sub
>> +new file mode 100644
>> +index 0000000..b099811
>> +--- /dev/null
>> ++++ b/tests/glob6.sub
>> +@@ -0,0 +1,54 @@
>> ++# tests of the backslash-in-glob-patterns discussion on the austin-
>> group ML
>> ++
>> ++: ${TMPDIR:=/var/tmp}
>> ++
>> ++ORIG=$PWD
>> ++GLOBDIR=$TMPDIR/bash-glob-$$
>> ++mkdir $GLOBDIR && cd $GLOBDIR
>> ++
>> ++# does the pattern matcher allow backslashes as escape characters
>> and remove
>> ++# them as part of matching?
>> ++touch abcdefg
>> ++pat='ab\cd*'
>> ++printf '<%s>\n' $pat
>> ++pat='\.'
>> ++printf '<%s>\n' $pat
>> ++rm abcdefg
>> ++
>> ++# how about when escaping pattern characters?
>> ++touch '*abc.c'
>> ++a='\**.c'
>> ++printf '%s\n' $a
>> ++rm -f '*abc.c'
>> ++
>> ++# how about when making the distinction between readable and
>> searchable path
>> ++# components?
>> ++mkdir -m a=x searchable
>> ++mkdir -m a=r readable
>> ++
>> ++p='searchable/\.'
>> ++printf "%s\n" $p
>> ++
>> ++p='searchable/\./.'
>> ++printf "%s\n" $p
>> ++
>> ++p='readable/\.'
>> ++printf "%s\n" $p
>> ++
>> ++p='readable/\./.'
>> ++printf "%s\n" $p
>> ++
>> ++printf "%s\n" 'searchable/\.'
>> ++printf "%s\n" 'readable/\.'
>> ++
>> ++echo */.
>> ++
>> ++p='*/\.'
>> ++echo $p
>> ++
>> ++echo */'.'
>> ++
>> ++rmdir searchable readable
>> ++
>> ++cd $ORIG
>> ++rmdir $GLOBDIR
>> +diff --git a/tests/glob7.sub b/tests/glob7.sub
>> +new file mode 100644
>> +index 0000000..0212b8e
>> +--- /dev/null
>> ++++ b/tests/glob7.sub
>> +@@ -0,0 +1,11 @@
>> ++# according to Posix 2.13.3, a slash in a bracket expression
>> renders that
>> ++# bracket expression invalid
>> ++shopt -s nullglob
>> ++
>> ++echo 1: [qwe/qwe]
>> ++echo 2: [qwe/
>> ++echo 3: [qwe/]
>> ++
>> ++echo 4: [qwe\/qwe]
>> ++echo 5: [qwe\/
>> ++echo 6: [qwe\/]
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-
>> extended/bash/bash_5.0.bb
>> index 12d472be57..257a03bd8b 100644
>> --- a/meta/recipes-extended/bash/bash_5.0.bb
>> +++ b/meta/recipes-extended/bash/bash_5.0.bb
>> @@ -30,6 +30,7 @@ SRC_URI =
>> "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>>              file://run-ptest \
>>              file://run-bash-ptests \
>>              file://fix-run-builtins.patch \
>> +           file://bash-CVE-2019-18276.patch \
>>              "
>>   
>>   SRC_URI[tarball.md5sum] = "2b44b47b905be16f45709648f671820b"
>>
>>
>>
>>
>> 
>>
