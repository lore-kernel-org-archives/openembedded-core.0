Return-Path: <Stefan.Ghinea@windriver.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
	by mail.openembedded.org (Postfix) with ESMTP id 4981561C45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=JmwW1frpKCRURFJPZWEJ5ye6GfV1WPR4PmZjDtg96ggUhzOPECT2Qap5ivLGmBcYjZCnqKxJiSD8lMNY7cWtnqEXLVne+uvVOCvLXF+DGdfAYHlUBGFvQK5nfIPPG6f8oba3cfSd7NLtxVrqprMTIqFbSC070hLpJaajPQEBzs3+A+ZUR+sawu0407Yohe8uwh68CbxNM1swG40qgkL3aWgdhcUcWi2KPeZV+ZzB7c57VLfVuNbDOPsKlX1HqHvLYZYJqXSI0f+RYuqMiSDLiQqHGX+98kA3luIO3hj0i3q52BqOqX/ftPs//PVe5G5FmpDm5jYULuUTJXWU9oVzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Nli4t9R6FWVlfHi0u6Zb9QCaJqQypdGDf43Yv2H2ou0=;
	b=N3uuvio4xTHjHTE9bGODbQSHkwCO1XGZcRZEkKOoFVa/egkTOrhlsr7lXoEZWwFXACdIvkDiUObiBXtcoVfVp6MrdOgr0NurVyEBVywGUtHO2tj1cbnNN8RV+sJRj/As4R4UbmRJJ8E8+ED0WeTopkPC5CAGXF8je2Mm780KNhYYwggSHGzsV/k3V6dGgRU5qIeKaEweBOUDm6CzWnsuqLztmJMuHogVQzu3sTnWiBVPnz/iuPu7jOhjNN2aawRpm4lr1cUt32d8c90UU2i6LWq3EL1NIBATAnUzG0NJ6RYwbm4iQYeMbxxDzjjTirCg/9uYAt1wHG9b+s2FQO7BhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Nli4t9R6FWVlfHi0u6Zb9QCaJqQypdGDf43Yv2H2ou0=;
	b=Ot9FlH249NLdl5LgINa2lZ8CrKx/rBH0sdDZib41PWXM0AKmNsMZ0Zi7rHROFHoqmYN9uSWkwEQMedCmpEFBFRMz4FNFmYRP1i4/YElr/HzKNS3FheaGKarNTnuCflNQpGb+/SwVp4OmskZggRW+kJKR19ivFDwfGbA9KgqaFG0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Stefan.Ghinea@windriver.com; 
Received: from BN7PR11MB2644.namprd11.prod.outlook.com (2603:10b6:406:ac::13)
	by BN7PR11MB2721.namprd11.prod.outlook.com (2603:10b6:406:ba::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17;
	Thu, 12 Mar 2020 14:36:01 +0000
Received: from BN7PR11MB2644.namprd11.prod.outlook.com
	([fe80::9488:2aa5:431a:d33d]) by
	BN7PR11MB2644.namprd11.prod.outlook.com
	([fe80::9488:2aa5:431a:d33d%7]) with mapi id 15.20.2793.018;
	Thu, 12 Mar 2020 14:36:01 +0000
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20200312092322.28506-1-stefan.ghinea@windriver.com>
	<67257554ffe08ac11b8f1cf3da115ba5a7e35fbd.camel@intel.com>
From: Stefan Robert Ghinea <stefan.ghinea@windriver.com>
Organization: WindRiver
Message-ID: <26a1f113-7348-ba43-837d-32858939ca0d@windriver.com>
Date: Thu, 12 Mar 2020 16:35:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
In-Reply-To: <67257554ffe08ac11b8f1cf3da115ba5a7e35fbd.camel@intel.com>
X-ClientProxiedBy: VI1PR04CA0069.eurprd04.prod.outlook.com
	(2603:10a6:802:2::40) To BN7PR11MB2644.namprd11.prod.outlook.com
	(2603:10b6:406:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.124.146] (46.97.150.20) by
	VI1PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:802:2::40)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15
	via Frontend Transport; Thu, 12 Mar 2020 14:36:00 +0000
X-Originating-IP: [46.97.150.20]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2843fb97-4f84-456c-58c2-08d7c692af5a
X-MS-TrafficTypeDiagnostic: BN7PR11MB2721:
X-Microsoft-Antispam-PRVS: <BN7PR11MB2721FF26B0F1B7AB254A4126F2FD0@BN7PR11MB2721.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(136003)(396003)(366004)(39850400004)(346002)(376002)(199004)(2616005)(6706004)(5660300002)(21615005)(478600001)(966005)(86362001)(8676002)(81166006)(8936002)(53546011)(31696002)(81156014)(2906002)(956004)(52116002)(33964004)(6486002)(26005)(36916002)(16526019)(30864003)(31686004)(36756003)(186003)(110136005)(6666004)(16576012)(66946007)(316002)(66556008)(66476007)(78286006)(579004)(559001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR11MB2721;
	H:BN7PR11MB2644.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Xn0vBsgBC+yXQZhSBUGkI96dy4iMeVz++FxP351H+LevWy83u2lU9ZCjin69t8ymWU65vlaV5a5A/ZJ8QfGD/crKg/WqyIEpaylbG5QrwvL23ykBLyH/kPTUn843arNKwH4PwuvNbU2WuW6hhV08l1Un2QAbho2xHoHENFj/y8zE8+/mihTOOvQDVkmy7uwsFEQQxGooyp2Bzrl5xXEKw2ZWlHj8nJMC3BhL5pMEfD4dUZ7XdX8IPi/A0VXEQj1xc8rvbCi1TbFmadR+8q2ajwPw9W8fJmdO2PViaqqJBjhuYbGCssm8sTPm0iVcf7s6mBwpEVHxAUXfMVvwNe4ykXx+GbBU/nTlEFf9Xecwq8O7uq9n2+hEUgg2ux4WugVDbLbSpqIePEKBecrkkrF71p00tr7vAHDlKHSyq4DSbjVHsfPmFjMYF+maBw3gkjB8uvK7/pJryoYI/hTogYlkWRWggH4dWrgzqsHoM+V/fWLrpo47keXhrIz0vRH0N248UmtvN6HVYrW7svuRW4w6kH6ICkFchVmWb1825yvvpbL5toHJKPwcxrIs6ZshpjSaO9Id91VckqrHrqrwpeVVT+c+U4KbZFN8TXIruMFsK0=
X-MS-Exchange-AntiSpam-MessageData: Yff89LVQhPOwr9/u9XWZRlYmtmZB2o6beDzCpuQuNmegTUWBJtPfHBwYs8dXuco7ZScReVMmpPs8mj4jKwC3NCIyC8Dsr4Q4ZFhZP1zxZnCe0031zuFlV7MsdxFsXA35X7x6/1BpwDEv/RtSSVM6Xw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2843fb97-4f84-456c-58c2-08d7c692af5a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 14:36:01.0820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHoDrHdR8cnfCAtvWwbZB/qlyYa7I4MjAdbybrCTYNd7c1M9Av/KFBIMwPUtTk0eGJ846tNwvEBVFfrTWu+iQU8Jy+S7ogS3tu7Mq/XsqVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2721
Subject: Re: [PATCH] [zeus] aspell: CVE-2019-20433
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2020 14:36:03 -0000
Content-Type: multipart/alternative;
	boundary="------------CE74536A59CEFAC2A0F1ECDC"
Content-Language: en-US

--------------CE74536A59CEFAC2A0F1ECDC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I looked for dependent packages in oe-core and in meta-oe with grep and found only enchant
and enchant2 although I was able to build both of them having the aspell patch applied.

Best regards,
Stefan Ghinea

On 3/12/20 14:25, Mittal, Anuj wrote:
> It looks like this is changing the API. I wonder if this would need any
> other change or break something elsewhere in OE-core, meta-oe?
>
> http://aspell.net/buffer-overread-ucs.txt
>
> Thanks,
>
> Anuj
>
> On Thu, 2020-03-12 at 11:23 +0200, Stefan Ghinea wrote:
>> libaspell.a in GNU Aspell before 0.60.8 has a buffer over-read for a
>> string
>> ending with a single '\0' byte, if the encoding is set to ucs-2 or
>> ucs-4
>> outside of the application, as demonstrated by the ASPELL_CONF
>> environment
>> variable.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2019-20433
>>
>> Upstream patches:
>> https://github.com/GNUAspell/aspell/commit/de29341638833ba7717bd6b5e6850998454b044b
>> https://github.com/GNUAspell/aspell/commit/cefd447e5528b08bb0cd6656bc52b4255692cefc
>>
>> Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
>> ---
>>   .../aspell/aspell/CVE-2019-20433-0001.patch   | 999
>> ++++++++++++++++++
>>   .../aspell/aspell/CVE-2019-20433-0002.patch   |  68 ++
>>   meta/recipes-support/aspell/aspell_0.60.7.bb  |   2 +
>>   3 files changed, 1069 insertions(+)
>>   create mode 100644 meta/recipes-support/aspell/aspell/CVE-2019-
>> 20433-0001.patch
>>   create mode 100644 meta/recipes-support/aspell/aspell/CVE-2019-
>> 20433-0002.patch
>>
>> diff --git a/meta/recipes-support/aspell/aspell/CVE-2019-20433-
>> 0001.patch b/meta/recipes-support/aspell/aspell/CVE-2019-20433-
>> 0001.patch
>> new file mode 100644
>> index 0000000000..fd68461e32
>> --- /dev/null
>> +++ b/meta/recipes-support/aspell/aspell/CVE-2019-20433-0001.patch
>> @@ -0,0 +1,999 @@
>> +From de29341638833ba7717bd6b5e6850998454b044b Mon Sep 17 00:00:00
>> 2001
>> +From: Kevin Atkinson <kevina@gnu.org>
>> +Date: Sat, 17 Aug 2019 17:06:53 -0400
>> +Subject: [PATCH 1/2] Don't allow null-terminated UCS-2/4 strings
>> using the
>> + original API.
>> +
>> +Detect if the encoding is UCS-2/4 and the length is -1 in affected
>> API
>> +functions and refuse to convert the string.  If the string ends up
>> +being converted somehow, abort with an error message in DecodeDirect
>> +and ConvDirect.  To convert a null terminated string in
>> +Decode/ConvDirect, a negative number corresponding to the width of
>> the
>> +underlying character type for the encoding is expected; for example,
>> +if the encoding is "ucs-2" then a the size is expected to be -2.
>> +
>> +Also fix a 1-3 byte over-read in DecodeDirect when reading UCS-2/4
>> +strings when a size is provided (found by OSS-Fuzz).
>> +
>> +Also fix a bug in DecodeDirect that caused DocumentChecker to return
>> +the wrong offsets when working with UCS-2/4 strings.
>> +
>> +CVE: CVE-2019-20433
>> +Upstream-Status: Backport [
>> https://github.com/GNUAspell/aspell/commit/de29341638833ba7717bd6b5e6850998454b044b
>> ]
>> +
>> +[SG: - adjusted context
>> +     - discarded test changes as test framework is not available
>> +     - discarded manual entry changes for features that aren't
>> backported]
>> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
>> +---
>> + auto/MkSrc/CcHelper.pm      | 99
>> ++++++++++++++++++++++++++++++++++---
>> + auto/MkSrc/Create.pm        |  5 +-
>> + auto/MkSrc/Info.pm          |  5 +-
>> + auto/MkSrc/ProcCc.pm        | 24 +++++----
>> + auto/MkSrc/ProcImpl.pm      | 57 +++++++++++++++------
>> + auto/MkSrc/Read.pm          |  4 +-
>> + auto/mk-src.in              | 44 +++++++++++++++--
>> + common/convert.cpp          | 39 ++++++++++++---
>> + common/convert.hpp          | 38 +++++++++++++-
>> + common/document_checker.cpp | 17 ++++++-
>> + common/document_checker.hpp |  1 +
>> + common/version.cpp          | 15 ++++--
>> + configure.ac                |  8 +++
>> + manual/aspell.texi          | 58 ++++++++++++++++------
>> + manual/readme.texi          | 70 +++++++++++++++++++++-----
>> + 15 files changed, 409 insertions(+), 75 deletions(-)
>> +
>> +diff --git a/auto/MkSrc/CcHelper.pm b/auto/MkSrc/CcHelper.pm
>> +index f2de991..0044335 100644
>> +--- a/auto/MkSrc/CcHelper.pm
>> ++++ b/auto/MkSrc/CcHelper.pm
>> +@@ -10,8 +10,8 @@ BEGIN {
>> +   use Exporter;
>> +   our @ISA = qw(Exporter);
>> +   our @EXPORT = qw(to_c_return_type c_error_cond
>> +-		   to_type_name make_desc make_func call_func
>> +-		   make_c_method call_c_method form_c_method
>> ++		   to_type_name make_desc make_func call_func
>> get_c_func_name
>> ++		   make_c_method make_wide_macro call_c_method
>> form_c_method
>> + 		   make_cxx_method);
>> + }
>> +
>> +@@ -90,6 +90,69 @@ sub make_func ( $ \@ $ ; \% ) {
>> + 	   ')'));
>> + }
>> +
>> ++=item make_wide_version NAME @TYPES PARMS ; %ACCUM
>> ++
>> ++Creates the wide character version of the function if needed
>> ++
>> ++=cut
>> ++
>> ++sub make_wide_version ( $ \@ $ ; \% ) {
>> ++  my ($name, $d, $p, $accum) = @_;
>> ++  my @d = @$d;
>> ++  shift @d;
>> ++  return '' unless grep {$_->{type} eq 'encoded string'} @d;
>> ++  $accum->{sys_headers}{'stddef.h'} = true;
>> ++  $accum->{suffix}[5] = <<'---';
>> ++
>> ++/******************* private implemantion details
>> *********************/
>> ++
>> ++#ifdef __cplusplus
>> ++#  define aspell_cast_(type, expr) (static_cast<type>(expr))
>> ++#  define aspell_cast_from_wide_(str) (static_cast<const void
>> *>(str))
>> ++#else
>> ++#  define aspell_cast_(type, expr) ((type)(expr))
>> ++#  define aspell_cast_from_wide_(str) ((const char *)(str))
>> ++#endif
>> ++---
>> ++  my @parms = map {$_->{type} eq 'encoded string'
>> ++                       ? ($_->{name}, $_->{name}.'_size')
>> ++                       : $_->{name}} @d;
>> ++  $name = to_lower $name;
>> ++  $accum->{suffix}[0] = <<'---';
>> ++/******************************************************************
>> ****/
>> ++
>> ++#ifdef ASPELL_ENCODE_SETTING_SECURE
>> ++---
>> ++  $accum->{suffix}[2] = "#endif\n";
>> ++  my @args = map  {$_->{type} eq 'encoded string'
>> ++                       ? ($_->{name}, "$_->{name}_size", '-1')
>> ++                       : $_->{name}} @d;
>> ++  $accum->{suffix}[1] .=
>> ++      (join '',
>> ++       "#define $name",
>> ++       '(', join(', ', @parms), ')',
>> ++       "\\\n    ",
>> ++       $name, '_wide',
>> ++       '(', join(', ', @args), ')',
>> ++       "\n");
>> ++  @args = map  {$_->{type} eq 'encoded string'
>> ++                    ? ("aspell_cast_from_wide_($_->{name})",
>> ++                       "$_-
>>> {name}_size*aspell_cast_(int,sizeof(*($_->{name})))",
>> ++                       "sizeof(*($_->{name}))")
>> ++                    : $_->{name}} @d;
>> ++  return (join '',
>> ++          "\n",
>> ++          "/* version of $name that is safe to use with (null
>> terminated) wide characters */\n",
>> ++          '#define ',
>> ++          $name, '_w',
>> ++          '(', join(', ', @parms), ')',
>> ++          "\\\n    ",
>> ++          $name, '_wide',
>> ++          '(', join(', ', @args), ')',
>> ++          "\n");
>> ++}
>> ++
>> ++
>> + =item call_func NAME @TYPES PARMS ; %ACCUM
>> +
>> + Return a string to call a func.  Will prefix the function with
>> return
>> +@@ -103,7 +166,6 @@ Parms can be any of:
>> +
>> + sub call_func ( $ \@ $ ; \% ) {
>> +   my ($name, $d, $p, $accum) = @_;
>> +-  $accum = {} unless defined $accum;
>> +   my @d = @$d;
>> +   my $func_ret = to_type_name(shift @d, {%$p,pos=>'return'},
>> %$accum);
>> +   return (join '',
>> +@@ -148,8 +210,14 @@ sub to_type_name ( $ $ ; \% ) {
>> +   my $name = $t->{name};
>> +   my $type = $t->{type};
>> +
>> +-  return ( (to_type_name {%$d, type=>'string'}, $p, %$accum) ,
>> +-	   (to_type_name {%$d, type=>'int', name=>"$d->{name}_size"},
>> $p, %$accum) )
>> ++  if ($name eq 'encoded string' && $is_cc && $pos eq 'parm') {
>> ++    my @types = ((to_type_name {%$d, type=>($p->{wide}?'const void
>> pointer':'string')}, $p, %$accum),
>> ++                 (to_type_name {%$d, type=>'int', name=>"$d-
>>> {name}_size"}, $p, %$accum));
>> ++    push @types, (to_type_name {%$d, type=>'int', name=>"$d-
>>> {name}_type_width"}, $p, %$accum) if $p->{wide};
>> ++    return @types;
>> ++  }
>> ++  return ( (to_type_name {%$d, type=>($p->{wide}?'const void
>> pointer':'string')}, $p, %$accum) ,
>> ++           (to_type_name {%$d, type=>'int', name=>"$d-
>>> {name}_size"}, $p, %$accum) )
>> +       if $name eq 'encoded string' && $is_cc && $pos eq 'parm';
>> +
>> +   my $str;
>> +@@ -174,7 +242,7 @@ sub to_type_name ( $ $ ; \% ) {
>> + 	$str .= "String";
>> +       }
>> +     } elsif ($name eq 'encoded string') {
>> +-      $str .= "const char *";
>> ++      $str .= $p->{wide} ? "const void *" : "const char *";
>> +     } elsif ($name eq '') {
>> +       $str .= "void";
>> +     } elsif ($name eq 'bool' && $is_cc) {
>> +@@ -186,7 +254,7 @@ sub to_type_name ( $ $ ; \% ) {
>> +       if ($t->{pointer}) {
>> + 	$accum->{types}->{$name} = $t;
>> +       } else {
>> +-	$accum->{headers}->{$t->{created_in}} = true;
>> ++        $accum->{headers}->{$t->{created_in}} = true unless $mode
>> eq 'cc';
>> +       }
>> +       $str .= "$c_type Aspell" if $mode eq 'cc';
>> +       $str .= to_mixed($name);
>> +@@ -214,6 +282,7 @@ sub to_type_name ( $ $ ; \% ) {
>> +   return $str;
>> + }
>> +
>> ++
>> + =item make_desc DESC ; LEVEL
>> +
>> + Make a C comment out of DESC optionally indenting it LEVEL spaces.
>> +@@ -286,6 +355,7 @@ sub form_c_method ($ $ $ ; \% )
>> +     } else {
>> +       $func = "aspell $class $name";
>> +     }
>> ++    $func .= " wide" if $p->{wide};
>> +     if (exists $d->{'const'}) {
>> +       splice @data, 1, 0, {type => "const $class", name=>
>> $this_name};
>> +     } else {
>> +@@ -306,6 +376,21 @@ sub make_c_method ($ $ $ ; \%)
>> +   return &make_func(@ret);
>> + }
>> +
>> ++sub get_c_func_name ($ $ $)
>> ++{
>> ++  my @ret = &form_c_method(@_);
>> ++  return undef unless @ret > 0;
>> ++  return to_lower $ret[0];
>> ++}
>> ++
>> ++sub make_wide_macro ($ $ $ ; \%)
>> ++{
>> ++  my @ret = &form_c_method(@_);
>> ++  return undef unless @ret > 0;
>> ++  my $str = &make_wide_version(@ret);
>> ++  return $str;
>> ++}
>> ++
>> + sub call_c_method ($ $ $ ; \%)
>> + {
>> +   my @ret = &form_c_method(@_);
>> +diff --git a/auto/MkSrc/Create.pm b/auto/MkSrc/Create.pm
>> +index d39b60e..630ede5 100644
>> +--- a/auto/MkSrc/Create.pm
>> ++++ b/auto/MkSrc/Create.pm
>> +@@ -77,8 +77,10 @@ sub create_cc_file ( % )  {
>> +   $file .= "#include \"aspell.h\"\n" if $p{type} eq 'cxx';
>> +   $file .= "#include \"settings.h\"\n" if $p{type} eq 'native_impl'
>> && $p{name} eq 'errors';
>> +   $file .= "#include \"gettext.h\"\n" if $p{type} eq 'native_impl'
>> && $p{name} eq 'errors';
>> ++  $file .= cmap {"#include <$_>\n"} sort keys
>> %{$accum{sys_headers}};
>> +   $file .= cmap {"#include \"".to_lower($_).".hpp\"\n"} sort keys
>> %{$accum{headers}};
>> +-  $file .= "#ifdef __cplusplus\nextern \"C\" {\n#endif\n" if
>> $p{header} && !$p{cxx};
>> ++  $file .= "\n#ifdef __cplusplus\nextern \"C\" {\n#endif\n" if
>> $p{header} && !$p{cxx};
>> ++  $file .= join('', grep {defined $_} @{$accum{prefix}});
>> +   $file .= "\nnamespace $p{namespace} {\n\n" if $p{cxx};
>> +   if (defined $info{forward}{proc}{$p{type}}) {
>> +     my @types = sort {$a->{name} cmp $b->{name}} (values
>> %{$accum{types}});
>> +@@ -86,6 +88,7 @@ sub create_cc_file ( % )  {
>> +   }
>> +   $file .= "\n";
>> +   $file .= $body;
>> ++  $file .= join('', grep {defined $_} @{$accum{suffix}});
>> +   $file .= "\n\n}\n\n" if $p{cxx};
>> +   $file .= "#ifdef __cplusplus\n}\n#endif\n" if $p{header} &&
>> !$p{cxx};
>> +   $file .= "#endif /* $hm */\n" if $p{header};
>> +diff --git a/auto/MkSrc/Info.pm b/auto/MkSrc/Info.pm
>> +index c644028..ace8e21 100644
>> +--- a/auto/MkSrc/Info.pm
>> ++++ b/auto/MkSrc/Info.pm
>> +@@ -60,6 +60,7 @@ each proc sub should take the following argv
>> +     the object from which it is a member of
>> +   no native: do not attempt to create a native implementation
>> +   treat as object: treat as a object rather than a pointer
>> ++  no conv: do not converted an encoded string
>> +
>> + The %info structure is initialized as follows:
>> +
>> +@@ -104,8 +105,8 @@ The %info structure is initialized as follows:
>> +   errors => {}, # possible errors
>> +   method => {
>> +     # A class method
>> +-    options => ['desc', 'posib err', 'c func', 'const',
>> +-		'c only', 'c impl', 'cxx impl'],
>> ++    options => ['desc', 'posib err', 'c func', 'const', 'no conv',
>> 'on conv error',
>> ++		'c only', 'c impl', 'cxx impl', 'cc extra'],
>> +     groups => undef},
>> +   constructor => {
>> +     # A class constructor
>> +diff --git a/auto/MkSrc/ProcCc.pm b/auto/MkSrc/ProcCc.pm
>> +index 47c4338..98cc435 100644
>> +--- a/auto/MkSrc/ProcCc.pm
>> ++++ b/auto/MkSrc/ProcCc.pm
>> +@@ -23,7 +23,7 @@ use MkSrc::Info;
>> + sub make_c_object ( $ @ );
>> +
>> + $info{group}{proc}{cc} = sub {
>> +-  my ($data) = @_;
>> ++  my ($data,@rest) = @_;
>> +   my $ret;
>> +   my $stars = (70 - length $data->{name})/2;
>> +   $ret .= "/";
>> +@@ -33,14 +33,14 @@ $info{group}{proc}{cc} = sub {
>> +   $ret .= "/\n";
>> +   foreach my $d (@{$data->{data}}) {
>> +     $ret .= "\n\n";
>> +-    $ret .= $info{$d->{type}}{proc}{cc}->($d);
>> ++    $ret .= $info{$d->{type}}{proc}{cc}->($d,@rest);
>> +   }
>> +   $ret .= "\n\n";
>> +   return $ret;
>> + };
>> +
>> + $info{enum}{proc}{cc} = sub {
>> +-  my ($d) = @_;
>> ++  my ($d,@rest) = @_;
>> +   my $n = "Aspell".to_mixed($d->{name});
>> +   return ("\n".
>> + 	  make_desc($d->{desc}).
>> +@@ -58,21 +58,26 @@ $info{struct}{proc}{cc} = sub {
>> + };
>> +
>> + $info{union}{proc}{cc} = sub {
>> +-  return make_c_object "union", $_[0];
>> ++  return make_c_object "union", @_;
>> + };
>> +
>> + $info{class}{proc}{cc} = sub {
>> +-  my ($d) = @_;
>> ++  my ($d,$accum) = @_;
>> +   my $class = $d->{name};
>> +   my $classname = "Aspell".to_mixed($class);
>> +   my $ret = "";
>> +   $ret .= "typedef struct $classname $classname;\n\n";
>> +   foreach (@{$d->{data}}) {
>> +-    my $s = make_c_method($class, $_, {mode=>'cc'});
>> ++    my $s = make_c_method($class, $_, {mode=>'cc'}, %$accum);
>> +     next unless defined $s;
>> +     $ret .= "\n";
>> +     $ret .= make_desc($_->{desc});
>> +-    $ret .= make_c_method($class, $_, {mode=>'cc'}).";\n";
>> ++    $ret .= make_c_method($class, $_, {mode=>'cc'}, %$accum).";\n";
>> ++    if (grep {$_->{type} eq 'encoded string'} @{$_->{data}}) {
>> ++      $ret .= make_c_method($class, $_, {mode=>'cc', wide=>true},
>> %$accum).";\n";
>> ++      $ret .= make_wide_macro($class, $_, {mode=>'cc'}, %$accum);
>> ++    }
>> ++    $ret .= "\n".$_->{'cc extra'}."\n" if defined $_->{'cc extra'};
>> +   }
>> +   $ret .= "\n";
>> +   return $ret;
>> +@@ -105,7 +110,8 @@ $info{errors}{proc}{cc} = sub {
>> + };
>> +
>> + sub make_c_object ( $ @ ) {
>> +-  my ($t, $d) = @_;
>> ++  my ($t, $d, $accum) = @_;
>> ++  $accum = {} unless defined $accum;
>> +   my $struct;
>> +   $struct .= "Aspell";
>> +   $struct .= to_mixed($d->{name});
>> +@@ -120,7 +126,7 @@ sub make_c_object ( $ @ ) {
>> + 		"\n};\n"),
>> + 	  "typedef $t $struct $struct;",
>> + 	  join ("\n",
>> +-		map {make_c_method($d->{name}, $_, {mode=>'cc'}).";"}
>> ++		map {make_c_method($d->{name}, $_, {mode=>'cc'},
>> %$accum).";"}
>> + 		grep {$_->{type} eq 'method'}
>> + 		@{$d->{data}})
>> + 	  )."\n";
>> +diff --git a/auto/MkSrc/ProcImpl.pm b/auto/MkSrc/ProcImpl.pm
>> +index b8628fd..3d0f220 100644
>> +--- a/auto/MkSrc/ProcImpl.pm
>> ++++ b/auto/MkSrc/ProcImpl.pm
>> +@@ -45,10 +45,13 @@ $info{class}{proc}{impl} = sub {
>> +   foreach (grep {$_ ne ''} split /\s*,\s*/, $data->{'c impl
>> headers'}) {
>> +     $accum->{headers}{$_} = true;
>> +   }
>> +-  foreach my $d (@{$data->{data}}) {
>> ++  my @d = @{$data->{data}};
>> ++  while (@d) {
>> ++    my $d = shift @d;
>> ++    my $need_wide = false;
>> +     next unless one_of $d->{type}, qw(method constructor
>> destructor);
>> +     my @parms = @{$d->{data}} if exists $d->{data};
>> +-    my $m = make_c_method $data->{name}, $d, {mode=>'cc_cxx',
>> use_name=>true}, %$accum;
>> ++    my $m = make_c_method $data->{name}, $d, {mode=>'cc_cxx',
>> use_name=>true, wide=>$d->{wide}}, %$accum;
>> +     next unless defined $m;
>> +     $ret .= "extern \"C\" $m\n";
>> +     $ret .= "{\n";
>> +@@ -57,24 +60,49 @@ $info{class}{proc}{impl} = sub {
>> +     } else {
>> +       if ($d->{type} eq 'method') {
>> + 	my $ret_type = shift @parms;
>> +-	my $ret_native = to_type_name $ret_type,
>> {mode=>'native_no_err', pos=>'return'}, %$accum;
>> ++	my $ret_native = to_type_name $ret_type,
>> {mode=>'native_no_err', pos=>'return', wide=>$d->{wide}}, %$accum;
>> + 	my $snum = 0;
>> ++        my $call_fun = $d->{name};
>> ++        my @call_parms;
>> + 	foreach (@parms) {
>> + 	  my $n = to_lower($_->{name});
>> +-	  if ($_->{type} eq 'encoded string') {
>> +-	    $accum->{headers}{'mutable string'} = true;
>> +-	    $accum->{headers}{'convert'} = true;
>> +-	    $ret .= "  ths->temp_str_$snum.clear();\n";
>> +-	    $ret .= "  ths->to_internal_->convert($n, ${n}_size, ths-
>>> temp_str_$snum);\n";
>> +-	    $ret .= "  unsigned int s$snum = ths-
>>> temp_str_$snum.size();\n";
>> +-	    $_ = "MutableString(ths->temp_str_$snum.mstr(), s$snum)";
>> +-	    $snum++;
>> ++	  if ($_->{type} eq 'encoded string' && !exists($d->{'no
>> conv'})) {
>> ++            $need_wide = true unless $d->{wide};
>> ++            die unless exists $d->{'posib err'};
>> ++            $accum->{headers}{'mutable string'} = true;
>> ++            $accum->{headers}{'convert'} = true;
>> ++            my $name = get_c_func_name $data->{name}, $d,
>> {mode=>'cc_cxx', use_name=>true, wide=>$d->{wide}};
>> ++            $ret .= "  ths->temp_str_$snum.clear();\n";
>> ++            if ($d->{wide}) {
>> ++              $ret .= "  ${n}_size = get_correct_size(\"$name\",
>> ths->to_internal_->in_type_width(), ${n}_size, ${n}_type_width);\n";
>> ++            } else {
>> ++              $ret .= "  PosibErr<int> ${n}_fixed_size =
>> get_correct_size(\"$name\", ths->to_internal_->in_type_width(),
>> ${n}_size);\n";
>> ++              if (exists($d->{'on conv error'})) {
>> ++                $ret .= "  if (${n}_fixed_size.get_err()) {\n";
>> ++                $ret .= "    ".$d->{'on conv error'}."\n";
>> ++                $ret .= "  } else {\n";
>> ++                $ret .= "    ${n}_size = ${n}_fixed_size;\n";
>> ++                $ret .= "  }\n";
>> ++              } else {
>> ++                $ret .= "  ths-
>>> err_.reset(${n}_fixed_size.release_err());\n";
>> ++                $ret .= "  if (ths->err_ != 0) return
>> ".(c_error_cond $ret_type).";\n";
>> ++              }
>> ++            }
>> ++            $ret .= "  ths->to_internal_->convert($n, ${n}_size,
>> ths->temp_str_$snum);\n";
>> ++            $ret .= "  unsigned int s$snum = ths-
>>> temp_str_$snum.size();\n";
>> ++            push @call_parms, "MutableString(ths-
>>> temp_str_$snum.mstr(), s$snum)";
>> ++            $snum++;
>> ++          } elsif ($_->{type} eq 'encoded string') {
>> ++            $need_wide = true unless $d->{wide};
>> ++            push @call_parms, $n, "${n}_size";
>> ++            push @call_parms, "${n}_type_width" if $d->{wide};
>> ++            $call_fun .= " wide" if $d->{wide};
>> + 	  } else {
>> +-	    $_ = $n;
>> ++	    push @call_parms, $n;
>> + 	  }
>> + 	}
>> +-	my $parms = '('.(join ', ', @parms).')';
>> +-	my $exp = "ths->".to_lower($d->{name})."$parms";
>> ++	my $parms = '('.(join ', ', @call_parms).')';
>> ++	my $exp = "ths->".to_lower($call_fun)."$parms";
>> + 	if (exists $d->{'posib err'}) {
>> + 	  $accum->{headers}{'posib err'} = true;
>> + 	  $ret .= "  PosibErr<$ret_native> ret = $exp;\n";
>> +@@ -118,6 +146,7 @@ $info{class}{proc}{impl} = sub {
>> +       }
>> +     }
>> +     $ret .= "}\n\n";
>> ++    unshift @d,{%$d, wide=>true} if $need_wide;
>> +   }
>> +   return $ret;
>> + };
>> +diff --git a/auto/MkSrc/Read.pm b/auto/MkSrc/Read.pm
>> +index 4b3d1d0..4bf640e 100644
>> +--- a/auto/MkSrc/Read.pm
>> ++++ b/auto/MkSrc/Read.pm
>> +@@ -88,13 +88,13 @@ sub advance ( ) {
>> +     $in_pod = $1 if $line =~ /^\=(\w+)/;
>> +     $line = '' if $in_pod;
>> +     $in_pod = undef if $in_pod && $in_pod eq 'cut';
>> +-    $line =~ s/\#.*$//;
>> ++    $line =~ s/(?<!\\)\#.*$//;
>> +     $line =~ s/^(\t*)//;
>> +     $level = $base_level + length($1);
>> +       $line =~ s/\s*$//;
>> +     ++$base_level if $line =~ s/^\{$//;
>> +     --$base_level if $line =~ s/^\}$//;
>> +-    $line =~ s/\\([{}])/$1/g;
>> ++    $line =~ s/\\([{}#\\])/$1/g;
>> +   } while ($line eq '');
>> +   #print "$level:$line\n";
>> + }
>> +diff --git a/auto/mk-src.in b/auto/mk-src.in
>> +index 0e7833a..eb3353f 100644
>> +--- a/auto/mk-src.in
>> ++++ b/auto/mk-src.in
>> +@@ -608,6 +608,7 @@ errors:
>> + 		invalid expression
>> + 			mesg => "%expression" is not a valid regular
>> expression.
>> + 			parms => expression
>> ++
>> + }
>> + group: speller
>> + {
>> +@@ -650,6 +651,7 @@ class: speller
>> + 		posib err
>> + 		desc => Returns 0 if it is not in the dictionary,
>> + 			1 if it is, or -1 on error.
>> ++		on conv error => return 0;
>> + 		/
>> + 		bool
>> + 		encoded string: word
>> +@@ -715,6 +717,8 @@ class: speller
>> + 		desc => Return NULL on error.
>> + 			The word list returned by suggest is only
>> + 			valid until the next call to suggest.
>> ++		on conv error =>
>> ++			word = NULL; word_size = 0;
>> + 		/
>> + 		const word list
>> + 		encoded string: word
>> +@@ -840,7 +844,6 @@ class: document checker
>> + 		void
>> +
>> + 	method: process
>> +-
>> + 		desc => Process a string.
>> + 			The string passed in should only be split on
>> + 			white space characters.  Furthermore, between
>> +@@ -849,10 +852,10 @@ class: document checker
>> + 			in the document.  Passing in strings out of
>> + 			order, skipping strings or passing them in
>> + 			more than once may lead to undefined results.
>> ++		no conv
>> + 		/
>> + 		void
>> +-		string: str
>> +-		int: size
>> ++		encoded string: str
>> +
>> + 	method: next misspelling
>> +
>> +@@ -860,9 +863,23 @@ class: document checker
>> + 			processed string.  If there are no more
>> + 			misspelled words, then token.word will be
>> + 			NULL and token.size will be 0
>> ++		cc extra =>
>> ++			\#define
>> aspell_document_checker_next_misspelling_w(type, ths) \\
>> ++			    aspell_document_checker_next_misspelling_ad
>> j(ths, sizeof(type))
>> + 		/
>> + 		token object
>> +
>> ++	method: next misspelling adj
>> ++		desc => internal: do not use
>> ++		c impl =>
>> ++			Token res = ths->next_misspelling();
>> ++			res.offset /= type_width;
>> ++			res.len /= type_width;
>> ++			return res;
>> ++		/
>> ++		token object
>> ++		int: type_width
>> ++
>> + 	method: filter
>> +
>> + 		desc => Returns the underlying filter class.
>> +@@ -922,9 +939,30 @@ class: string enumeration
>> + 			  ths->from_internal_->append_null(ths-
>>> temp_str);
>> + 			  return ths->temp_str.data();
>> + 			\}
>> ++		cc extra =>
>> ++			\#define aspell_string_enumeration_next_w(type,
>> ths) \\
>> ++			    aspell_cast_(const type *,
>> aspell_string_enumeration_next_wide(ths, sizeof(type)))
>> + 		/
>> + 		const string
>> +
>> ++	method: next wide
>> ++		c impl =>
>> ++			const char * s = ths->next();
>> ++			if (s == 0) {
>> ++			  return s;
>> ++			} else if (ths->from_internal_ == 0) \{
>> ++			  assert(type_width == 1);
>> ++			  return s;
>> ++			\} else \{
>> ++			  assert(type_width == ths->from_internal_-
>>> out_type_width());
>> ++			  ths->temp_str.clear();
>> ++			  ths->from_internal_->convert(s,-1,ths-
>>> temp_str);
>> ++			  ths->from_internal_->append_null(ths-
>>> temp_str);
>> ++			  return ths->temp_str.data();
>> ++			\}
>> ++		/
>> ++		const void pointer
>> ++		int: type_width
>> + }
>> + group: info
>> + {
>> +diff --git a/common/convert.cpp b/common/convert.cpp
>> +index 1add95a..7ae0317 100644
>> +--- a/common/convert.cpp
>> ++++ b/common/convert.cpp
>> +@@ -541,18 +541,25 @@ namespace acommon {
>> +   // Trivial Conversion
>> +   //
>> +
>> ++  const char * unsupported_null_term_wide_string_msg =
>> ++    "Null-terminated wide-character strings unsupported when used
>> this way.";
>> ++
>> +   template <typename Chr>
>> +   struct DecodeDirect : public Decode
>> +   {
>> ++    DecodeDirect() {type_width = sizeof(Chr);}
>> +     void decode(const char * in0, int size, FilterCharVector & out)
>> const {
>> +       const Chr * in = reinterpret_cast<const Chr *>(in0);
>> +-      if (size == -1) {
>> ++      if (size == -sizeof(Chr)) {
>> +         for (;*in; ++in)
>> +-          out.append(*in);
>> ++          out.append(*in, sizeof(Chr));
>> ++      } else if (size <= -1) {
>> ++        fprintf(stderr, "%s\n",
>> unsupported_null_term_wide_string_msg);
>> ++        abort();
>> +       } else {
>> +-        const Chr * stop = reinterpret_cast<const Chr *>(in0
>> +size);
>> ++        const Chr * stop = reinterpret_cast<const Chr *>(in0) +
>> size/sizeof(Chr);
>> +         for (;in != stop; ++in)
>> +-          out.append(*in);
>> ++          out.append(*in, sizeof(Chr));
>> +       }
>> +     }
>> +     PosibErr<void> decode_ec(const char * in0, int size,
>> +@@ -565,6 +572,7 @@ namespace acommon {
>> +   template <typename Chr>
>> +   struct EncodeDirect : public Encode
>> +   {
>> ++    EncodeDirect() {type_width = sizeof(Chr);}
>> +     void encode(const FilterChar * in, const FilterChar * stop,
>> +                 CharVector & out) const {
>> +       for (; in != stop; ++in) {
>> +@@ -594,11 +602,15 @@ namespace acommon {
>> +   template <typename Chr>
>> +   struct ConvDirect : public DirectConv
>> +   {
>> ++    ConvDirect() {type_width = sizeof(Chr);}
>> +     void convert(const char * in0, int size, CharVector & out)
>> const {
>> +-      if (size == -1) {
>> ++      if (size == -sizeof(Chr)) {
>> +         const Chr * in = reinterpret_cast<const Chr *>(in0);
>> +         for (;*in != 0; ++in)
>> +           out.append(in, sizeof(Chr));
>> ++      } else if (size <= -1) {
>> ++        fprintf(stderr, "%s\n",
>> unsupported_null_term_wide_string_msg);
>> ++        abort();
>> +       } else {
>> +         out.append(in0, size);
>> +       }
>> +@@ -1121,5 +1133,20 @@ namespace acommon {
>> +     }
>> +     return 0;
>> +   }
>> +-
>> ++
>> ++  PosibErr<void> unsupported_null_term_wide_string_err_(const char
>> * func) {
>> ++    static bool reported_to_stderr = false;
>> ++    PosibErr<void> err = make_err(other_error,
>> unsupported_null_term_wide_string_msg);
>> ++    if (!reported_to_stderr) {
>> ++      CERR.printf("ERROR: %s: %s\n", func,
>> unsupported_null_term_wide_string_msg);
>> ++      reported_to_stderr = true;
>> ++    }
>> ++    return err;
>> ++  }
>> ++
>> ++  void unsupported_null_term_wide_string_abort_(const char * func)
>> {
>> ++    CERR.printf("%s: %s\n", unsupported_null_term_wide_string_msg);
>> ++    abort();
>> ++  }
>> ++
>> + }
>> +diff --git a/common/convert.hpp b/common/convert.hpp
>> +index 76332ee..c948973 100644
>> +--- a/common/convert.hpp
>> ++++ b/common/convert.hpp
>> +@@ -7,6 +7,8 @@
>> + #ifndef ASPELL_CONVERT__HPP
>> + #define ASPELL_CONVERT__HPP
>> +
>> ++#include "settings.h"
>> ++
>> + #include "string.hpp"
>> + #include "posib_err.hpp"
>> + #include "char_vector.hpp"
>> +@@ -25,8 +27,9 @@ namespace acommon {
>> +     typedef const Config CacheConfig;
>> +     typedef const char * CacheKey;
>> +     String key;
>> ++    int type_width; // type width in bytes
>> +     bool cache_key_eq(const char * l) const  {return key == l;}
>> +-    ConvBase() {}
>> ++    ConvBase() : type_width(1) {}
>> +   private:
>> +     ConvBase(const ConvBase &);
>> +     void operator=(const ConvBase &);
>> +@@ -56,6 +59,8 @@ namespace acommon {
>> +     virtual ~Encode() {}
>> +   };
>> +   struct DirectConv { // convert directly from in_code to out_code.
>> ++    int type_width; // type width in bytes
>> ++    DirectConv() : type_width(1) {}
>> +     // should not take ownership of decode and encode.
>> +     // decode and encode guaranteed to stick around for the life
>> +     // of the object.
>> +@@ -126,6 +131,9 @@ namespace acommon {
>> +     const char * in_code() const   {return decode_->key.c_str();}
>> +     const char * out_code() const  {return encode_->key.c_str();}
>> +
>> ++    int in_type_width() const {return decode_->type_width;}
>> ++    int out_type_width() const {return encode_->type_width;}
>> ++
>> +     void append_null(CharVector & out) const
>> +     {
>> +       const char nul[4] = {0,0,0,0}; // 4 should be enough
>> +@@ -191,6 +199,10 @@ namespace acommon {
>> +       }
>> +     }
>> +
>> ++    void convert(const void * in, int size, CharVector & out) {
>> ++      convert(static_cast<const char *>(in), size, out);
>> ++    }
>> ++
>> +     void generic_convert(const char * in, int size, CharVector &
>> out);
>> +
>> +   };
>> +@@ -412,6 +424,30 @@ namespace acommon {
>> +       return operator()(str, str + byte_size);}
>> +   };
>> +
>> ++#ifdef SLOPPY_NULL_TERM_STRINGS
>> ++  static const bool sloppy_null_term_strings = true;
>> ++#else
>> ++  static const bool sloppy_null_term_strings = false;
>> ++#endif
>> ++
>> ++  PosibErr<void> unsupported_null_term_wide_string_err_(const char
>> * func);
>> ++  void unsupported_null_term_wide_string_abort_(const char * func);
>> ++
>> ++  static inline PosibErr<int> get_correct_size(const char * func,
>> int conv_type_width, int size) {
>> ++    if (sloppy_null_term_strings && size <= -1)
>> ++      return -conv_type_width;
>> ++    if (size <= -1 && -conv_type_width != size)
>> ++      return unsupported_null_term_wide_string_err_(func);
>> ++    return size;
>> ++  }
>> ++  static inline int get_correct_size(const char * func, int
>> conv_type_width, int size, int type_width) {
>> ++    if ((sloppy_null_term_strings || type_width <= -1) && size <=
>> -1)
>> ++      return -conv_type_width;
>> ++    if (size <= -1 && conv_type_width != type_width)
>> ++      unsupported_null_term_wide_string_abort_(func);
>> ++    return size;
>> ++  }
>> ++
>> + }
>> +
>> + #endif
>> +diff --git a/common/document_checker.cpp
>> b/common/document_checker.cpp
>> +index 5e510c4..0ccf1cd 100644
>> +--- a/common/document_checker.cpp
>> ++++ b/common/document_checker.cpp
>> +@@ -44,7 +44,9 @@ namespace acommon {
>> +   void DocumentChecker::process(const char * str, int size)
>> +   {
>> +     proc_str_.clear();
>> +-    conv_->decode(str, size, proc_str_);
>> ++    PosibErr<int> fixed_size =
>> get_correct_size("aspell_document_checker_process", conv_-
>>> in_type_width(), size);
>> ++    if (!fixed_size.has_err())
>> ++      conv_->decode(str, fixed_size, proc_str_);
>> +     proc_str_.append(0);
>> +     FilterChar * begin = proc_str_.pbegin();
>> +     FilterChar * end   = proc_str_.pend() - 1;
>> +@@ -53,6 +55,19 @@ namespace acommon {
>> +     tokenizer_->reset(begin, end);
>> +   }
>> +
>> ++  void DocumentChecker::process_wide(const void * str, int size,
>> int type_width)
>> ++  {
>> ++    proc_str_.clear();
>> ++    int fixed_size =
>> get_correct_size("aspell_document_checker_process", conv_-
>>> in_type_width(), size, type_width);
>> ++    conv_->decode(static_cast<const char *>(str), fixed_size,
>> proc_str_);
>> ++    proc_str_.append(0);
>> ++    FilterChar * begin = proc_str_.pbegin();
>> ++    FilterChar * end   = proc_str_.pend() - 1;
>> ++    if (filter_)
>> ++      filter_->process(begin, end);
>> ++    tokenizer_->reset(begin, end);
>> ++  }
>> ++
>> +   Token DocumentChecker::next_misspelling()
>> +   {
>> +     bool correct;
>> +diff --git a/common/document_checker.hpp
>> b/common/document_checker.hpp
>> +index d35bb88..11a3c73 100644
>> +--- a/common/document_checker.hpp
>> ++++ b/common/document_checker.hpp
>> +@@ -36,6 +36,7 @@ namespace acommon {
>> +     PosibErr<void> setup(Tokenizer *, Speller *, Filter *);
>> +     void reset();
>> +     void process(const char * str, int size);
>> ++    void process_wide(const void * str, int size, int type_width);
>> +     Token next_misspelling();
>> +
>> +     Filter * filter() {return filter_;}
>> +diff --git a/common/version.cpp b/common/version.cpp
>> +index 414d938..9e60b75 100644
>> +--- a/common/version.cpp
>> ++++ b/common/version.cpp
>> +@@ -1,8 +1,17 @@
>> + #include "settings.h"
>> +
>> +-extern "C" const char * aspell_version_string() {
>> + #ifdef NDEBUG
>> +-  return VERSION " NDEBUG";
>> ++#  define NDEBUG_STR " NDEBUG"
>> ++#else
>> ++#  define NDEBUG_STR
>> ++#endif
>> ++
>> ++#ifdef SLOPPY_NULL_TERM_STRINGS
>> ++#  define SLOPPY_STR " SLOPPY"
>> ++#else
>> ++#  define SLOPPY_STR
>> + #endif
>> +-  return VERSION;
>> ++
>> ++extern "C" const char * aspell_version_string() {
>> ++  return VERSION NDEBUG_STR SLOPPY_STR;
>> + }
>> +diff --git a/configure.ac b/configure.ac
>> +index 60e3b39..a5d51e3 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -73,6 +73,9 @@ AC_ARG_ENABLE(filter-version-control,
>> + AC_ARG_ENABLE(32-bit-hash-fun,
>> +   AS_HELP_STRING([--enable-32-bit-hash-fun],[use 32-bit hash
>> function for compiled dictionaries]))
>> +
>> ++AC_ARG_ENABLE(sloppy-null-term-strings,
>> ++  AS_HELP_STRING([--enable-sloppy-null-term-strings],[allows allow
>> null terminated UCS-2 and UCS-4 strings]))
>> ++
>> + AC_ARG_ENABLE(pspell-compatibility,
>> +   AS_HELP_STRING([--disable-pspell-compatibility],[don't install
>> pspell compatibility libraries]))
>> +
>> +@@ -141,6 +144,11 @@ then
>> +   AC_DEFINE(USE_32_BIT_HASH_FUN, 1, [Defined if 32-bit hash
>> function should be used for compiled dictionaries.])
>> + fi
>> +
>> ++if test "$enable_sloppy_null_term_strings" = "yes"
>> ++then
>> ++  AC_DEFINE(SLOPPY_NULL_TERM_STRINGS, 1, [Defined if null-
>> terminated UCS-2 and UCS-4 strings should always be allowed.])
>> ++fi
>> ++
>> + AM_CONDITIONAL(PSPELL_COMPATIBILITY,
>> +   [test "$enable_pspell_compatibility" != "no"])
>> + AM_CONDITIONAL(INCREMENTED_SONAME,
>> +diff --git a/manual/aspell.texi b/manual/aspell.texi
>> +index 45fa091..f400e06 100644
>> +--- a/manual/aspell.texi
>> ++++ b/manual/aspell.texi
>> +@@ -158,7 +158,8 @@ Installing
>> +
>> + * Generic Install Instructions::
>> + * HTML Manuals and "make clean"::
>> +-* Curses Notes::
>> ++* Curses Notes::
>> ++* Upgrading from Aspell 0.60.7::
>> + * Loadable Filter Notes::
>> + * Upgrading from Aspell 0.50::
>> + * Upgrading from Aspell .33/Pspell .12::
>> +@@ -2206,18 +2207,26 @@ int correct =
>> aspell_speller_check(spell_checker, @var{word}, @var{size});
>> + @end smallexample
>> +
>> + @noindent
>> +-@var{word} is expected to be a @code{const char *} character
>> +-string.  If the encoding is set to be @code{ucs-2} or
>> +-@code{ucs-4} @var{word} is expected to be a cast
>> +-from either @code{const u16int *} or @code{const u32int *}
>> +-respectively.  @code{u16int} and @code{u32int} are generally
>> +-@code{unsigned short} and @code{unsigned int} respectively.
>> +-@var{size} is the length of the string or @code{-1} if the string
>> +-is null terminated.  If the string is a cast from @code{const
>> u16int
>> +-*} or @code{const u32int *} then @code{@i{size}} is the amount of
>> +-space in bytes the string takes up after being cast to @code{const
>> +-char *} and not the true size of the
>> string.  @code{sspell_speller_check}
>> +-will return @code{0} if it is not found and non-zero otherwise.
>> ++@var{word} is expected to be a @code{const char *} character
>> string.
>> ++@var{size} is the length of the string or @code{-1} if the string
>> is
>> ++null terminated.  @code{aspell_speller_check} will return @code{0}
>> if it is not found
>> ++and non-zero otherwise.
>> ++
>> ++If you are using the @code{ucs-2} or @code{ucs-4} encoding then the
>> ++string is expected to be either a 2 or 4 byte wide integer
>> ++(respectively) and the @code{_w} macro vesion should be used:
>> ++
>> ++@smallexample
>> ++int correct = aspell_speller_check_w(spell_checker, @var{word},
>> @var{size});
>> ++@end smallexample
>> ++
>> ++The macro will cast the string to to the correct type and convert
>> ++@var{size} into bytes for you and then a call the special wide
>> version of the
>> ++function that will make sure the encoding is correct for the type
>> ++passed in.  For compatibility with older versions of Aspell the
>> normal
>> ++non-wide functions can still be used provided that the size of the
>> ++string, in bytes, is also passed in.  Null terminated @code{ucs-2}
>> or
>> ++@code{ucs-4} are no longer supported when using the non-wide
>> functions.
>> +
>> + If the word is not correct, then the @code{suggest} method can be
>> used
>> + to come up with likely replacements.
>> +@@ -2236,7 +2245,28 @@ delete_aspell_string_enumeration(elements);
>> +
>> + Notice how @code{elements} is deleted but @code{suggestions} is
>> not.
>> + The value returned by @code{suggestions} is only valid to the next
>> +-call to @code{suggest}.  Once a replacement is made the
>> ++call to @code{suggest}.
>> ++
>> ++If you are using the @code{ucs-2} or @code{ucs-4} encoding then, in
>> ++addition to using the @code{_w} macro for the @code{suggest}
>> method, you
>> ++should also use the @code{_w} macro with the @code{next} method
>> which
>> ++will cast the string to the correct type for you.  For example, if
>> you
>> ++are using the @code{ucs-2} encoding and the string is a @code{const
>> ++uint16_t *} then you should use:
>> ++
>> ++@smallexample
>> ++AspellWordList * suggestions =
>> aspell_speller_suggest_w(spell_checker,
>> ++                                                        @var{word},
>> @var{size});
>> ++AspellStringEnumeration * elements =
>> aspell_word_list_elements(suggestions);
>> ++const uint16_t * word;
>> ++while ( (word = aspell_string_enumeration_next_w(uint16_t,
>> aspell_elements)) != NULL )
>> ++@{
>> ++  // add to suggestion list
>> ++@}
>> ++delete_aspell_string_enumeration(elements);
>> ++@end smallexample
>> ++
>> ++Once a replacement is made the
>> + @code{store_repl} method should be used to communicate the
>> replacement
>> + pair back to the spell checker (for the reason, @pxref{Notes on
>> + Storing Replacement Pairs}).  Its usage is as follows:
>> +diff --git a/manual/readme.texi b/manual/readme.texi
>> +index 669ab8e..531721f 100644
>> +--- a/manual/readme.texi
>> ++++ b/manual/readme.texi
>> +@@ -15,15 +15,16 @@ The latest version can always be found at GNU
>> Aspell's home page at
>> + @uref{http://aspell.net}.
>> +
>> + @menu
>> +-* Generic Install Instructions::
>> +-* HTML Manuals and "make clean"::
>> +-* Curses Notes::
>> +-* Loadable Filter Notes::
>> +-* Using 32-Bit Dictionaries on a 64-Bit System::
>> +-* Upgrading from Aspell 0.50::
>> +-* Upgrading from Aspell .33/Pspell .12::
>> +-* Upgrading from a Pre-0.50 snapshot::
>> +-* WIN32 Notes::
>> ++* Generic Install Instructions::
>> ++* HTML Manuals and "make clean"::
>> ++* Curses Notes::
>> ++* Upgrading from Aspell 0.60.7::
>> ++* Loadable Filter Notes::
>> ++* Using 32-Bit Dictionaries on a 64-Bit System::
>> ++* Upgrading from Aspell 0.50::
>> ++* Upgrading from Aspell .33/Pspell .12::
>> ++* Upgrading from a Pre-0.50 snapshot::
>> ++* WIN32 Notes::
>> + @end menu
>> +
>> + @node Generic Install Instructions
>> +@@ -121,17 +122,62 @@ In addition your system must also support the
>> @code{mblen} function.
>> + Although this function was defined in the ISO C89 standard (ANSI
>> + X3.159-1989), not all systems have it.
>> +
>> ++@node Upgrading from Aspell 0.60.7
>> ++@appendixsec Upgrading from Aspell 0.60.7
>> ++
>> ++To prevent a potentially unbounded buffer over-read, Aspell no
>> longer
>> ++supports null-terminated UCS-2 and UCS-4 encoded strings with the
>> ++original C API.  Null-termianted 8-bit or UTF-8 encoded strings are
>> ++still supported, as are UCS-2 and UCS-4 encoded strings when the
>> ++length is passed in.
>> ++
>> ++As of Aspell 0.60.8 a function from the original API that expects
>> an
>> ++encoded string as a parameter will return meaningless results (or
>> an
>> ++error code) if string is null terminated and the encoding is set to
>> ++@code{ucs-2} or @code{ucs-4}.  In addition, a single:
>> ++@example
>> ++ERROR: aspell_speller_check: Null-terminated wide-character strings
>> unsupported when used this way.
>> ++@end example
>> ++will be printed to standard error the first time one of those
>> ++functions is called.
>> ++
>> ++Application that use null-terminated UCS-2/4 strings should either
>> (1)
>> ++use the interface intended for working with wide-characters
>> ++(@xref{Through the C API}); or (2) define
>> ++@code{ASPELL_ENCODE_SETTING_SECURE} before including
>> @code{aspell.h}.
>> ++In the latter case is is important that the application explicitly
>> ++sets the encoding to a known value.  Defining
>> ++@code{ASPELL_ENCODE_SETTING_SECURE} and not setting the encoding
>> ++explicitly or allowing user of the application to set the encoding
>> ++could result in an unbounded buffer over-read.
>> ++
>> ++If it is necessary to preserve binary compatibility with older
>> ++versions of Aspell, the easiest thing would be to determine the
>> length
>> ++of the UCS-2/4 string---in bytes---and pass that in.  Due to an
>> ++implemenation detail, existing API functions can be made to work
>> with
>> ++null-terminated UCS-2/4 strings safely by passing in either @code{-
>> 2}
>> ++or @code{-4} (corresponding to the width of the character type) as
>> the
>> ++size.  Doing so, however, will cause a buffer over-read for
>> unpatched
>> ++version of Aspell.  To avoid this it will be necessary to parse the
>> ++version string to determine the correct value to use.  However, no
>> ++official support will be provided for the latter method.
>> ++
>> ++If the application can not be recompiled, then Aspell can be
>> configured
>> ++to preserve the old behavior by passing
>> ++@option{--enable-sloppy-null-term-strings} to
>> @command{configure}.  When Aspell
>> ++is compiled this way the version string will include the string
>> ++@samp{ SLOPPY}.
>> ++
>> + @node Loadable Filter Notes
>> + @appendixsec Loadable Filter Notes
>> +-
>> ++
>> + Support for being able to load additional filter modules at run-
>> time
>> + has only been verified to work on Linux platforms.  If you get
>> linker
>> + errors when trying to use a filter, then it is likely that loadable
>> + filter support is not working yet on your platform.  Thus, in order
>> to
>> + get Aspell to work correctly you will need to avoid compiling the
>> + filters as individual modules by using the
>> +-@option{--enable-compile-in-filters} when configuring Aspell with
>> +-@command{./configure}.
>> ++@option{--enable-compile-in-filters} @command{configure} option.
>> +
>> + @node Using 32-Bit Dictionaries on a 64-Bit System
>> + @appendixsec Using 32-Bit Dictionaries on a 64-Bit System
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-support/aspell/aspell/CVE-2019-20433-
>> 0002.patch b/meta/recipes-support/aspell/aspell/CVE-2019-20433-
>> 0002.patch
>> new file mode 100644
>> index 0000000000..9569ddeebe
>> --- /dev/null
>> +++ b/meta/recipes-support/aspell/aspell/CVE-2019-20433-0002.patch
>> @@ -0,0 +1,68 @@
>> +From cefd447e5528b08bb0cd6656bc52b4255692cefc Mon Sep 17 00:00:00
>> 2001
>> +From: Kevin Atkinson <kevina@gnu.org>
>> +Date: Sat, 17 Aug 2019 20:25:21 -0400
>> +Subject: [PATCH 2/2] Increment library version to reflect API
>> changes.
>> +
>> +CVE: CVE-2019-20433
>> +Upstream-Status: Backport [
>> https://github.com/GNUAspell/aspell/commit/cefd447e5528b08bb0cd6656bc52b4255692cefc
>> ]
>> +
>> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
>> +---
>> + Makefile.am | 31 +++++++++++++++++--------------
>> + 1 file changed, 17 insertions(+), 14 deletions(-)
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index 7e15851..19dc044 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -94,18 +94,25 @@ libaspell_la_SOURCES =\
>> +
>> + libaspell_la_LIBADD =  $(LTLIBINTL) $(PTHREAD_LIB)
>> +
>> +-## Libtool to so name
>> +-## C:R:A => (C-A).(A).(R)
>> +-## 16:5:0 => 16.0.5
>> +-## 16:5:1 => 15.1.5
>> +-## 18:0:2 => 16.2.0
>> +-## 17:0:2 => 15.2.0
>> +-
>> ++## The version string is current[:revision[:age]]
>> ++##
>> ++## Before a release that has changed the source code at all
>> ++## increment revision.
>> ++##
>> ++## After merging changes that have changed the API in a backwards
>> ++## comptable way set revision to 0 and bump both current and age.
>> ++##
>> ++## Do not change the API in a backwards incompatible way.
>> ++##
>> ++## See "Libtool: Updating version info"
>> ++## (
>> https://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html
>> )
>> ++## for more into
>> ++##
>> + if INCREMENTED_SONAME
>> +-libaspell_la_LDFLAGS = -version-info 18:0:2 -no-undefined
>> ++libaspell_la_LDFLAGS = -version-info 19:0:3 -no-undefined
>> + else
>> + ## Use C-1:R:A
>> +-libaspell_la_LDFLAGS = -version-info 17:0:2 -no-undefined
>> ++libaspell_la_LDFLAGS = -version-info 18:0:3 -no-undefined
>> + endif
>> +
>> + if PSPELL_COMPATIBILITY
>> +@@ -113,11 +120,7 @@ libpspell_la_SOURCES = lib/dummy.cpp
>> +
>> + libpspell_la_LIBADD = libaspell.la
>> +
>> +-if INCREMENTED_SONAME
>> +-libpspell_la_LDFLAGS = -version-info 18:0:2 -no-undefined
>> +-else
>> +-libpspell_la_LDFLAGS = -version-info 17:0:2 -no-undefined
>> +-endif
>> ++libpspell_la_LDFLAGS = $(libaspell_la_LDFLAGS)
>> +
>> + endif
>> +
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-support/aspell/aspell_0.60.7.bb
>> b/meta/recipes-support/aspell/aspell_0.60.7.bb
>> index b565cb3c6e..1e104c263c 100644
>> --- a/meta/recipes-support/aspell/aspell_0.60.7.bb
>> +++ b/meta/recipes-support/aspell/aspell_0.60.7.bb
>> @@ -8,6 +8,8 @@ PR = "r1"
>>   
>>   SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
>>              file://0001-Fix-various-bugs-found-by-OSS-Fuze.patch \
>> +           file://CVE-2019-20433-0001.patch \
>> +           file://CVE-2019-20433-0002.patch \
>>             "
>>   SRC_URI[md5sum] = "8ef2252609c511cd2bb26f3a3932ef28"
>>   SRC_URI[sha256sum] =
>> "5ca8fc8cb0370cc6c9eb5b64c6d1bc5d57b3750dbf17887726c3407d833b70e4"
>> -- 
>> 2.17.1
>>

--------------CE74536A59CEFAC2A0F1ECDC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>I looked for dependent packages in oe-core and in meta-oe with grep and found only enchant
and enchant2 although I was able to build both of them having the aspell patch applied.

Best regards,
Stefan Ghinea 
</pre>
    <div class="moz-cite-prefix">On 3/12/20 14:25, Mittal, Anuj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:67257554ffe08ac11b8f1cf3da115ba5a7e35fbd.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">It looks like this is changing the API. I wonder if this would need any
other change or break something elsewhere in OE-core, meta-oe?

<a class="moz-txt-link-freetext" href="http://aspell.net/buffer-overread-ucs.txt">http://aspell.net/buffer-overread-ucs.txt</a>

Thanks,

Anuj

On Thu, 2020-03-12 at 11:23 &#43;0200, Stefan Ghinea wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">libaspell.a in GNU Aspell before 0.60.8 has a buffer over-read for a
string
ending with a single '\0' byte, if the encoding is set to ucs-2 or
ucs-4
outside of the application, as demonstrated by the ASPELL_CONF
environment
variable.

References:
<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2019-20433">https://nvd.nist.gov/vuln/detail/CVE-2019-20433</a>

Upstream patches:
<a class="moz-txt-link-freetext" href="https://github.com/GNUAspell/aspell/commit/de29341638833ba7717bd6b5e6850998454b044b">https://github.com/GNUAspell/aspell/commit/de29341638833ba7717bd6b5e6850998454b044b</a>
<a class="moz-txt-link-freetext" href="https://github.com/GNUAspell/aspell/commit/cefd447e5528b08bb0cd6656bc52b4255692cefc">https://github.com/GNUAspell/aspell/commit/cefd447e5528b08bb0cd6656bc52b4255692cefc</a>

Signed-off-by: Stefan Ghinea <a class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>
---
 .../aspell/aspell/CVE-2019-20433-0001.patch   | 999
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../aspell/aspell/CVE-2019-20433-0002.patch   |  68 &#43;&#43;
 meta/recipes-support/aspell/aspell_0.60.7.bb  |   2 &#43;
 3 files changed, 1069 insertions(&#43;)
 create mode 100644 meta/recipes-support/aspell/aspell/CVE-2019-
20433-0001.patch
 create mode 100644 meta/recipes-support/aspell/aspell/CVE-2019-
20433-0002.patch

diff --git a/meta/recipes-support/aspell/aspell/CVE-2019-20433-
0001.patch b/meta/recipes-support/aspell/aspell/CVE-2019-20433-
0001.patch
new file mode 100644
index 0000000000..fd68461e32
--- /dev/null
&#43;&#43;&#43; b/meta/recipes-support/aspell/aspell/CVE-2019-20433-0001.patch
@@ -0,0 &#43;1,999 @@
&#43;From de29341638833ba7717bd6b5e6850998454b044b Mon Sep 17 00:00:00
2001
&#43;From: Kevin Atkinson <a class="moz-txt-link-rfc2396E" href="mailto:kevina@gnu.org">&lt;kevina@gnu.org&gt;</a>
&#43;Date: Sat, 17 Aug 2019 17:06:53 -0400
&#43;Subject: [PATCH 1/2] Don't allow null-terminated UCS-2/4 strings
using the
&#43; original API.
&#43;
&#43;Detect if the encoding is UCS-2/4 and the length is -1 in affected
API
&#43;functions and refuse to convert the string.  If the string ends up
&#43;being converted somehow, abort with an error message in DecodeDirect
&#43;and ConvDirect.  To convert a null terminated string in
&#43;Decode/ConvDirect, a negative number corresponding to the width of
the
&#43;underlying character type for the encoding is expected; for example,
&#43;if the encoding is &quot;ucs-2&quot; then a the size is expected to be -2.
&#43;
&#43;Also fix a 1-3 byte over-read in DecodeDirect when reading UCS-2/4
&#43;strings when a size is provided (found by OSS-Fuzz).
&#43;
&#43;Also fix a bug in DecodeDirect that caused DocumentChecker to return
&#43;the wrong offsets when working with UCS-2/4 strings.
&#43;
&#43;CVE: CVE-2019-20433
&#43;Upstream-Status: Backport [
<a class="moz-txt-link-freetext" href="https://github.com/GNUAspell/aspell/commit/de29341638833ba7717bd6b5e6850998454b044b">https://github.com/GNUAspell/aspell/commit/de29341638833ba7717bd6b5e6850998454b044b</a>
]
&#43;
&#43;[SG: - adjusted context
&#43;     - discarded test changes as test framework is not available
&#43;     - discarded manual entry changes for features that aren't
backported]
&#43;Signed-off-by: Stefan Ghinea <a class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>
&#43;---
&#43; auto/MkSrc/CcHelper.pm      | 99
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---
&#43; auto/MkSrc/Create.pm        |  5 &#43;-
&#43; auto/MkSrc/Info.pm          |  5 &#43;-
&#43; auto/MkSrc/ProcCc.pm        | 24 &#43;&#43;&#43;&#43;&#43;----
&#43; auto/MkSrc/ProcImpl.pm      | 57 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------
&#43; auto/MkSrc/Read.pm          |  4 &#43;-
&#43; auto/mk-src.in              | 44 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
&#43; common/convert.cpp          | 39 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---
&#43; common/convert.hpp          | 38 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
&#43; common/document_checker.cpp | 17 &#43;&#43;&#43;&#43;&#43;&#43;-
&#43; common/document_checker.hpp |  1 &#43;
&#43; common/version.cpp          | 15 &#43;&#43;&#43;&#43;--
&#43; configure.ac                |  8 &#43;&#43;&#43;
&#43; manual/aspell.texi          | 58 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------
&#43; manual/readme.texi          | 70 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----
&#43; 15 files changed, 409 insertions(&#43;), 75 deletions(-)
&#43;
&#43;diff --git a/auto/MkSrc/CcHelper.pm b/auto/MkSrc/CcHelper.pm
&#43;index f2de991..0044335 100644
&#43;--- a/auto/MkSrc/CcHelper.pm
&#43;&#43;&#43;&#43; b/auto/MkSrc/CcHelper.pm
&#43;@@ -10,8 &#43;10,8 @@ BEGIN {
&#43;   use Exporter;
&#43;   our @ISA = qw(Exporter);
&#43;   our @EXPORT = qw(to_c_return_type c_error_cond
&#43;-		   to_type_name make_desc make_func call_func
&#43;-		   make_c_method call_c_method form_c_method
&#43;&#43;		   to_type_name make_desc make_func call_func
get_c_func_name
&#43;&#43;		   make_c_method make_wide_macro call_c_method
form_c_method
&#43; 		   make_cxx_method);
&#43; }
&#43; 
&#43;@@ -90,6 &#43;90,69 @@ sub make_func ( $ \@ $ ; \% ) {
&#43; 	   ')'));
&#43; }
&#43; 
&#43;&#43;=item make_wide_version NAME @TYPES PARMS ; %ACCUM
&#43;&#43;
&#43;&#43;Creates the wide character version of the function if needed
&#43;&#43;
&#43;&#43;=cut
&#43;&#43;
&#43;&#43;sub make_wide_version ( $ \@ $ ; \% ) {
&#43;&#43;  my ($name, $d, $p, $accum) = @_;
&#43;&#43;  my @d = @$d;
&#43;&#43;  shift @d;
&#43;&#43;  return '' unless grep {$_-&gt;{type} eq 'encoded string'} @d;
&#43;&#43;  $accum-&gt;{sys_headers}{'stddef.h'} = true;
&#43;&#43;  $accum-&gt;{suffix}[5] = &lt;&lt;'---';
&#43;&#43;
&#43;&#43;/******************* private implemantion details
*********************/
&#43;&#43;
&#43;&#43;#ifdef __cplusplus
&#43;&#43;#  define aspell_cast_(type, expr) (static_cast&lt;type&gt;(expr))
&#43;&#43;#  define aspell_cast_from_wide_(str) (static_cast&lt;const void
*&gt;(str))
&#43;&#43;#else
&#43;&#43;#  define aspell_cast_(type, expr) ((type)(expr))
&#43;&#43;#  define aspell_cast_from_wide_(str) ((const char *)(str))
&#43;&#43;#endif
&#43;&#43;---
&#43;&#43;  my @parms = map {$_-&gt;{type} eq 'encoded string'
&#43;&#43;                       ? ($_-&gt;{name}, $_-&gt;{name}.'_size')
&#43;&#43;                       : $_-&gt;{name}} @d;
&#43;&#43;  $name = to_lower $name;
&#43;&#43;  $accum-&gt;{suffix}[0] = &lt;&lt;'---';
&#43;&#43;/******************************************************************
****/
&#43;&#43;
&#43;&#43;#ifdef ASPELL_ENCODE_SETTING_SECURE
&#43;&#43;---
&#43;&#43;  $accum-&gt;{suffix}[2] = &quot;#endif\n&quot;;
&#43;&#43;  my @args = map  {$_-&gt;{type} eq 'encoded string'
&#43;&#43;                       ? ($_-&gt;{name}, &quot;$_-&gt;{name}_size&quot;, '-1')
&#43;&#43;                       : $_-&gt;{name}} @d;
&#43;&#43;  $accum-&gt;{suffix}[1] .=
&#43;&#43;      (join '',
&#43;&#43;       &quot;#define $name&quot;,
&#43;&#43;       '(', join(', ', @parms), ')',
&#43;&#43;       &quot;\\\n    &quot;,
&#43;&#43;       $name, '_wide',
&#43;&#43;       '(', join(', ', @args), ')',
&#43;&#43;       &quot;\n&quot;);
&#43;&#43;  @args = map  {$_-&gt;{type} eq 'encoded string'
&#43;&#43;                    ? (&quot;aspell_cast_from_wide_($_-&gt;{name})&quot;,
&#43;&#43;                       &quot;$_-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">{name}_size*aspell_cast_(int,sizeof(*($_-&gt;{name})))&quot;,
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;                       &quot;sizeof(*($_-&gt;{name}))&quot;)
&#43;&#43;                    : $_-&gt;{name}} @d;
&#43;&#43;  return (join '',
&#43;&#43;          &quot;\n&quot;,
&#43;&#43;          &quot;/* version of $name that is safe to use with (null
terminated) wide characters */\n&quot;,
&#43;&#43;          '#define ',
&#43;&#43;          $name, '_w',
&#43;&#43;          '(', join(', ', @parms), ')', 
&#43;&#43;          &quot;\\\n    &quot;,
&#43;&#43;          $name, '_wide',
&#43;&#43;          '(', join(', ', @args), ')',
&#43;&#43;          &quot;\n&quot;);
&#43;&#43;}
&#43;&#43;
&#43;&#43;
&#43; =item call_func NAME @TYPES PARMS ; %ACCUM
&#43; 
&#43; Return a string to call a func.  Will prefix the function with
return
&#43;@@ -103,7 &#43;166,6 @@ Parms can be any of:
&#43; 
&#43; sub call_func ( $ \@ $ ; \% ) {
&#43;   my ($name, $d, $p, $accum) = @_;
&#43;-  $accum = {} unless defined $accum;
&#43;   my @d = @$d;
&#43;   my $func_ret = to_type_name(shift @d, {%$p,pos=&gt;'return'},
%$accum);
&#43;   return (join '',
&#43;@@ -148,8 &#43;210,14 @@ sub to_type_name ( $ $ ; \% ) {
&#43;   my $name = $t-&gt;{name};
&#43;   my $type = $t-&gt;{type};
&#43; 
&#43;-  return ( (to_type_name {%$d, type=&gt;'string'}, $p, %$accum) ,
&#43;-	   (to_type_name {%$d, type=&gt;'int', name=&gt;&quot;$d-&gt;{name}_size&quot;},
$p, %$accum) )
&#43;&#43;  if ($name eq 'encoded string' &amp;&amp; $is_cc &amp;&amp; $pos eq 'parm') {
&#43;&#43;    my @types = ((to_type_name {%$d, type=&gt;($p-&gt;{wide}?'const void
pointer':'string')}, $p, %$accum),
&#43;&#43;                 (to_type_name {%$d, type=&gt;'int', name=&gt;&quot;$d-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">{name}_size&quot;}, $p, %$accum));
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;    push @types, (to_type_name {%$d, type=&gt;'int', name=&gt;&quot;$d-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">{name}_type_width&quot;}, $p, %$accum) if $p-&gt;{wide};
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;    return @types;
&#43;&#43;  }
&#43;&#43;  return ( (to_type_name {%$d, type=&gt;($p-&gt;{wide}?'const void
pointer':'string')}, $p, %$accum) ,
&#43;&#43;           (to_type_name {%$d, type=&gt;'int', name=&gt;&quot;$d-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">{name}_size&quot;}, $p, %$accum) )
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;       if $name eq 'encoded string' &amp;&amp; $is_cc &amp;&amp; $pos eq 'parm';
&#43; 
&#43;   my $str;
&#43;@@ -174,7 &#43;242,7 @@ sub to_type_name ( $ $ ; \% ) {
&#43; 	$str .= &quot;String&quot;;
&#43;       }
&#43;     } elsif ($name eq 'encoded string') {
&#43;-      $str .= &quot;const char *&quot;;
&#43;&#43;      $str .= $p-&gt;{wide} ? &quot;const void *&quot; : &quot;const char *&quot;;
&#43;     } elsif ($name eq '') {
&#43;       $str .= &quot;void&quot;;
&#43;     } elsif ($name eq 'bool' &amp;&amp; $is_cc) {
&#43;@@ -186,7 &#43;254,7 @@ sub to_type_name ( $ $ ; \% ) {
&#43;       if ($t-&gt;{pointer}) {
&#43; 	$accum-&gt;{types}-&gt;{$name} = $t;
&#43;       } else {
&#43;-	$accum-&gt;{headers}-&gt;{$t-&gt;{created_in}} = true;
&#43;&#43;        $accum-&gt;{headers}-&gt;{$t-&gt;{created_in}} = true unless $mode
eq 'cc';
&#43;       }
&#43;       $str .= &quot;$c_type Aspell<a class="moz-txt-link-rfc2396E" href="mailto:if$modeeq'cc';&#43;$str.=to_mixed($name);&#43;@@-214,6&#43;282,7@@subto_type_name($$;\%){&#43;return$str;&#43;}&#43;&#43;&#43;&#43;=itemmake_descDESC;LEVEL&#43;&#43;MakeaCcommentoutofDESCoptionallyindentingitLEVELspaces.&#43;@@-286,6&#43;355,7@@subform_c_method($$$;\%)&#43;}else{&#43;$func=">&quot; if $mode eq 'cc';
&#43;       $str .= to_mixed($name);
&#43;@@ -214,6 &#43;282,7 @@ sub to_type_name ( $ $ ; \% ) {
&#43;   return $str;
&#43; }
&#43; 
&#43;&#43;
&#43; =item make_desc DESC ; LEVEL
&#43; 
&#43; Make a C comment out of DESC optionally indenting it LEVEL spaces.
&#43;@@ -286,6 &#43;355,7 @@ sub form_c_method ($ $ $ ; \% )
&#43;     } else {
&#43;       $func = &quot;</a>aspell $class $name&quot;;
&#43;     }
&#43;&#43;    $func .= &quot; wide&quot; if $p-&gt;{wide};
&#43;     if (exists $d-&gt;{'const'}) {
&#43;       splice @data, 1, 0, {type =&gt; &quot;const $class&quot;, name=&gt;
$this_name};
&#43;     } else {
&#43;@@ -306,6 &#43;376,21 @@ sub make_c_method ($ $ $ ; \%)
&#43;   return &amp;make_func(@ret);
&#43; }
&#43; 
&#43;&#43;sub get_c_func_name ($ $ $)
&#43;&#43;{
&#43;&#43;  my @ret = &amp;form_c_method(@_);
&#43;&#43;  return undef unless @ret &gt; 0;
&#43;&#43;  return to_lower $ret[0];
&#43;&#43;}
&#43;&#43;
&#43;&#43;sub make_wide_macro ($ $ $ ; \%)
&#43;&#43;{
&#43;&#43;  my @ret = &amp;form_c_method(@_);
&#43;&#43;  return undef unless @ret &gt; 0;
&#43;&#43;  my $str = &amp;make_wide_version(@ret);
&#43;&#43;  return $str;
&#43;&#43;}
&#43;&#43;
&#43; sub call_c_method ($ $ $ ; \%)
&#43; {
&#43;   my @ret = &amp;form_c_method(@_);
&#43;diff --git a/auto/MkSrc/Create.pm b/auto/MkSrc/Create.pm
&#43;index d39b60e..630ede5 100644
&#43;--- a/auto/MkSrc/Create.pm
&#43;&#43;&#43;&#43; b/auto/MkSrc/Create.pm
&#43;@@ -77,8 &#43;77,10 @@ sub create_cc_file ( % )  {
&#43;   $file .= &quot;#include \&quot;aspell.h\&quot;\n&quot; if $p{type} eq 'cxx';
&#43;   $file .= &quot;#include \&quot;settings.h\&quot;\n&quot; if $p{type} eq 'native_impl'
&amp;&amp; $p{name} eq 'errors';
&#43;   $file .= &quot;#include \&quot;gettext.h\&quot;\n&quot; if $p{type} eq 'native_impl'
&amp;&amp; $p{name} eq 'errors';
&#43;&#43;  $file .= cmap {&quot;#include &lt;$_&gt;\n&quot;} sort keys
%{$accum{sys_headers}};
&#43;   $file .= cmap {&quot;#include \&quot;&quot;.to_lower($_).&quot;.hpp\&quot;\n&quot;} sort keys
%{$accum{headers}};
&#43;-  $file .= &quot;#ifdef __cplusplus\nextern \&quot;C\&quot; {\n#endif\n&quot; if
$p{header} &amp;&amp; !$p{cxx};
&#43;&#43;  $file .= &quot;\n#ifdef __cplusplus\nextern \&quot;C\&quot; {\n#endif\n&quot; if
$p{header} &amp;&amp; !$p{cxx};
&#43;&#43;  $file .= join('', grep {defined $_} @{$accum{prefix}});
&#43;   $file .= &quot;\nnamespace $p{namespace} {\n\n&quot; if $p{cxx};
&#43;   if (defined $info{forward}{proc}{$p{type}}) {
&#43;     my @types = sort {$a-&gt;{name} cmp $b-&gt;{name}} (values
%{$accum{types}});
&#43;@@ -86,6 &#43;88,7 @@ sub create_cc_file ( % )  {
&#43;   }
&#43;   $file .= &quot;\n&quot;;
&#43;   $file .= $body;
&#43;&#43;  $file .= join('', grep {defined $_} @{$accum{suffix}});
&#43;   $file .= &quot;\n\n}\n\n&quot; if $p{cxx};
&#43;   $file .= &quot;#ifdef __cplusplus\n}\n#endif\n&quot; if $p{header} &amp;&amp;
!$p{cxx};
&#43;   $file .= &quot;#endif /* $hm */\n&quot; if $p{header};
&#43;diff --git a/auto/MkSrc/Info.pm b/auto/MkSrc/Info.pm
&#43;index c644028..ace8e21 100644
&#43;--- a/auto/MkSrc/Info.pm
&#43;&#43;&#43;&#43; b/auto/MkSrc/Info.pm
&#43;@@ -60,6 &#43;60,7 @@ each proc sub should take the following argv
&#43;     the object from which it is a member of
&#43;   no native: do not attempt to create a native implementation
&#43;   treat as object: treat as a object rather than a pointer
&#43;&#43;  no conv: do not converted an encoded string
&#43; 
&#43; The %info structure is initialized as follows:
&#43; 
&#43;@@ -104,8 &#43;105,8 @@ The %info structure is initialized as follows:
&#43;   errors =&gt; {}, # possible errors
&#43;   method =&gt; {
&#43;     # A class method
&#43;-    options =&gt; ['desc', 'posib err', 'c func', 'const',
&#43;-		'c only', 'c impl', 'cxx impl'],
&#43;&#43;    options =&gt; ['desc', 'posib err', 'c func', 'const', 'no conv',
'on conv error',
&#43;&#43;		'c only', 'c impl', 'cxx impl', 'cc extra'],
&#43;     groups =&gt; undef},
&#43;   constructor =&gt; {
&#43;     # A class constructor
&#43;diff --git a/auto/MkSrc/ProcCc.pm b/auto/MkSrc/ProcCc.pm
&#43;index 47c4338..98cc435 100644
&#43;--- a/auto/MkSrc/ProcCc.pm
&#43;&#43;&#43;&#43; b/auto/MkSrc/ProcCc.pm
&#43;@@ -23,7 &#43;23,7 @@ use MkSrc::Info;
&#43; sub make_c_object ( $ @ );
&#43; 
&#43; $info{group}{proc}{cc} = sub {
&#43;-  my ($data) = @_;
&#43;&#43;  my ($data,@rest) = @_;
&#43;   my $ret;
&#43;   my $stars = (70 - length $data-&gt;{name})/2;
&#43;   $ret .= &quot;/<a class="moz-txt-link-rfc2396E" href="mailto:;&#43;@@-33,14&#43;33,14@@$info{group}{proc}{cc}=sub{&#43;$ret.=">&quot;;
&#43;@@ -33,14 &#43;33,14 @@ $info{group}{proc}{cc} = sub {
&#43;   $ret .= &quot;</a>/\n&quot;;
&#43;   foreach my $d (@{$data-&gt;{data}}) {
&#43;     $ret .= &quot;\n\n&quot;;
&#43;-    $ret .= $info{$d-&gt;{type}}{proc}{cc}-&gt;($d);
&#43;&#43;    $ret .= $info{$d-&gt;{type}}{proc}{cc}-&gt;($d,@rest);
&#43;   }
&#43;   $ret .= &quot;\n\n&quot;;
&#43;   return $ret;
&#43; };
&#43; 
&#43; $info{enum}{proc}{cc} = sub {
&#43;-  my ($d) = @_;
&#43;&#43;  my ($d,@rest) = @_;
&#43;   my $n = &quot;Aspell&quot;.to_mixed($d-&gt;{name});
&#43;   return (&quot;\n&quot;.
&#43; 	  make_desc($d-&gt;{desc}).
&#43;@@ -58,21 &#43;58,26 @@ $info{struct}{proc}{cc} = sub {
&#43; };
&#43; 
&#43; $info{union}{proc}{cc} = sub {
&#43;-  return make_c_object &quot;union&quot;, $_[0];
&#43;&#43;  return make_c_object &quot;union&quot;, @_;
&#43; };
&#43; 
&#43; $info{class}{proc}{cc} = sub {
&#43;-  my ($d) = @_;
&#43;&#43;  my ($d,$accum) = @_;
&#43;   my $class = $d-&gt;{name};
&#43;   my $classname = &quot;Aspell&quot;.to_mixed($class);
&#43;   my $ret = &quot;&quot;;
&#43;   $ret .= &quot;typedef struct $classname $classname;\n\n&quot;;
&#43;   foreach (@{$d-&gt;{data}}) {
&#43;-    my $s = make_c_method($class, $_, {mode=&gt;'cc'});
&#43;&#43;    my $s = make_c_method($class, $_, {mode=&gt;'cc'}, %$accum);
&#43;     next unless defined $s;
&#43;     $ret .= &quot;\n&quot;;
&#43;     $ret .= make_desc($_-&gt;{desc});
&#43;-    $ret .= make_c_method($class, $_, {mode=&gt;'cc'}).&quot;;\n&quot;;
&#43;&#43;    $ret .= make_c_method($class, $_, {mode=&gt;'cc'}, %$accum).&quot;;\n&quot;;
&#43;&#43;    if (grep {$_-&gt;{type} eq 'encoded string'} @{$_-&gt;{data}}) {
&#43;&#43;      $ret .= make_c_method($class, $_, {mode=&gt;'cc', wide=&gt;true},
%$accum).&quot;;\n&quot;;
&#43;&#43;      $ret .= make_wide_macro($class, $_, {mode=&gt;'cc'}, %$accum);
&#43;&#43;    }
&#43;&#43;    $ret .= &quot;\n&quot;.$_-&gt;{'cc extra'}.&quot;\n&quot; if defined $_-&gt;{'cc extra'};
&#43;   }
&#43;   $ret .= &quot;\n&quot;;
&#43;   return $ret;
&#43;@@ -105,7 &#43;110,8 @@ $info{errors}{proc}{cc} = sub {
&#43; };
&#43; 
&#43; sub make_c_object ( $ @ ) {
&#43;-  my ($t, $d) = @_;
&#43;&#43;  my ($t, $d, $accum) = @_;
&#43;&#43;  $accum = {} unless defined $accum;
&#43;   my $struct;
&#43;   $struct .= &quot;Aspell&quot;;
&#43;   $struct .= to_mixed($d-&gt;{name});
&#43;@@ -120,7 &#43;126,7 @@ sub make_c_object ( $ @ ) {
&#43; 		&quot;\n};\n&quot;),
&#43; 	  &quot;typedef $t $struct $struct;&quot;,
&#43; 	  join (&quot;\n&quot;,
&#43;-		map {make_c_method($d-&gt;{name}, $_, {mode=&gt;'cc'}).&quot;;&quot;}
&#43;&#43;		map {make_c_method($d-&gt;{name}, $_, {mode=&gt;'cc'},
%$accum).&quot;;&quot;}
&#43; 		grep {$_-&gt;{type} eq 'method'}
&#43; 		@{$d-&gt;{data}})
&#43; 	  ).&quot;\n&quot;;
&#43;diff --git a/auto/MkSrc/ProcImpl.pm b/auto/MkSrc/ProcImpl.pm
&#43;index b8628fd..3d0f220 100644
&#43;--- a/auto/MkSrc/ProcImpl.pm
&#43;&#43;&#43;&#43; b/auto/MkSrc/ProcImpl.pm
&#43;@@ -45,10 &#43;45,13 @@ $info{class}{proc}{impl} = sub {
&#43;   foreach (grep {$_ ne ''} split /\s*,\s*/, $data-&gt;{'c impl
headers'}) {
&#43;     $accum-&gt;{headers}{$_} = true;
&#43;   }
&#43;-  foreach my $d (@{$data-&gt;{data}}) {
&#43;&#43;  my @d = @{$data-&gt;{data}};
&#43;&#43;  while (@d) {
&#43;&#43;    my $d = shift @d;
&#43;&#43;    my $need_wide = false;
&#43;     next unless one_of $d-&gt;{type}, qw(method constructor
destructor);
&#43;     my @parms = @{$d-&gt;{data}} if exists $d-&gt;{data};
&#43;-    my $m = make_c_method $data-&gt;{name}, $d, {mode=&gt;'cc_cxx',
use_name=&gt;true}, %$accum;
&#43;&#43;    my $m = make_c_method $data-&gt;{name}, $d, {mode=&gt;'cc_cxx',
use_name=&gt;true, wide=&gt;$d-&gt;{wide}}, %$accum;
&#43;     next unless defined $m;
&#43;     $ret .= &quot;extern \&quot;C\&quot; $m\n&quot;;
&#43;     $ret .= &quot;{\n&quot;;
&#43;@@ -57,24 &#43;60,49 @@ $info{class}{proc}{impl} = sub {
&#43;     } else {
&#43;       if ($d-&gt;{type} eq 'method') {
&#43; 	my $ret_type = shift @parms;
&#43;-	my $ret_native = to_type_name $ret_type,
{mode=&gt;'native_no_err', pos=&gt;'return'}, %$accum;
&#43;&#43;	my $ret_native = to_type_name $ret_type,
{mode=&gt;'native_no_err', pos=&gt;'return', wide=&gt;$d-&gt;{wide}}, %$accum;
&#43; 	my $snum = 0;
&#43;&#43;        my $call_fun = $d-&gt;{name};
&#43;&#43;        my @call_parms;
&#43; 	foreach (@parms) {
&#43; 	  my $n = to_lower($_-&gt;{name});
&#43;-	  if ($_-&gt;{type} eq 'encoded string') {
&#43;-	    $accum-&gt;{headers}{'mutable string'} = true;
&#43;-	    $accum-&gt;{headers}{'convert'} = true;
&#43;-	    $ret .= &quot;  ths-&gt;temp_str_$snum.clear();\n&quot;;
&#43;-	    $ret .= &quot;  ths-&gt;to_internal_-&gt;convert($n, ${n}_size, ths-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">temp_str_$snum);\n&quot;;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;-	    $ret .= &quot;  unsigned int s$snum = ths-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">temp_str_$snum.size();\n&quot;;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;-	    $_ = &quot;MutableString(ths-&gt;temp_str_$snum.mstr(), s$snum)&quot;;
&#43;-	    $snum&#43;&#43;;
&#43;&#43;	  if ($_-&gt;{type} eq 'encoded string' &amp;&amp; !exists($d-&gt;{'no
conv'})) {
&#43;&#43;            $need_wide = true unless $d-&gt;{wide};
&#43;&#43;            die unless exists $d-&gt;{'posib err'};
&#43;&#43;            $accum-&gt;{headers}{'mutable string'} = true;
&#43;&#43;            $accum-&gt;{headers}{'convert'} = true;
&#43;&#43;            my $name = get_c_func_name $data-&gt;{name}, $d,
{mode=&gt;'cc_cxx', use_name=&gt;true, wide=&gt;$d-&gt;{wide}};
&#43;&#43;            $ret .= &quot;  ths-&gt;temp_str_$snum.clear();\n&quot;;
&#43;&#43;            if ($d-&gt;{wide}) {
&#43;&#43;              $ret .= &quot;  ${n}_size = get_correct_size(\&quot;$name\&quot;,
ths-&gt;to_internal_-&gt;in_type_width(), ${n}_size, ${n}_type_width);\n&quot;;
&#43;&#43;            } else {
&#43;&#43;              $ret .= &quot;  PosibErr&lt;int&gt; ${n}_fixed_size =
get_correct_size(\&quot;$name\&quot;, ths-&gt;to_internal_-&gt;in_type_width(),
${n}_size);\n&quot;;
&#43;&#43;              if (exists($d-&gt;{'on conv error'})) {
&#43;&#43;                $ret .= &quot;  if (${n}_fixed_size.get_err()) {\n&quot;;
&#43;&#43;                $ret .= &quot;    &quot;.$d-&gt;{'on conv error'}.&quot;\n&quot;;
&#43;&#43;                $ret .= &quot;  } else {\n&quot;;
&#43;&#43;                $ret .= &quot;    ${n}_size = ${n}_fixed_size;\n&quot;;
&#43;&#43;                $ret .= &quot;  }\n&quot;;
&#43;&#43;              } else {
&#43;&#43;                $ret .= &quot;  ths-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">err_.reset(${n}_fixed_size.release_err());\n&quot;;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;                $ret .= &quot;  if (ths-&gt;err_ != 0) return
&quot;.(c_error_cond $ret_type).&quot;;\n&quot;;
&#43;&#43;              }
&#43;&#43;            }
&#43;&#43;            $ret .= &quot;  ths-&gt;to_internal_-&gt;convert($n, ${n}_size,
ths-&gt;temp_str_$snum);\n&quot;;
&#43;&#43;            $ret .= &quot;  unsigned int s$snum = ths-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">temp_str_$snum.size();\n&quot;;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;            push @call_parms, &quot;MutableString(ths-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">temp_str_$snum.mstr(), s$snum)&quot;;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;            $snum&#43;&#43;;
&#43;&#43;          } elsif ($_-&gt;{type} eq 'encoded string') {
&#43;&#43;            $need_wide = true unless $d-&gt;{wide};
&#43;&#43;            push @call_parms, $n, &quot;${n}_size&quot;;
&#43;&#43;            push @call_parms, &quot;${n}_type_width&quot; if $d-&gt;{wide};
&#43;&#43;            $call_fun .= &quot; wide&quot; if $d-&gt;{wide};
&#43; 	  } else {
&#43;-	    $_ = $n;
&#43;&#43;	    push @call_parms, $n;
&#43; 	  }
&#43; 	}
&#43;-	my $parms = '('.(join ', ', @parms).')';
&#43;-	my $exp = &quot;ths-&gt;&quot;.to_lower($d-&gt;{name}).&quot;$parms&quot;;
&#43;&#43;	my $parms = '('.(join ', ', @call_parms).')';
&#43;&#43;	my $exp = &quot;ths-&gt;&quot;.to_lower($call_fun).&quot;$parms&quot;;
&#43; 	if (exists $d-&gt;{'posib err'}) {
&#43; 	  $accum-&gt;{headers}{'posib err'} = true;
&#43; 	  $ret .= &quot;  PosibErr&lt;$ret_native&gt; ret = $exp;\n<a class="moz-txt-link-rfc2396E" href="mailto:;&#43;@@-118,6&#43;146,7@@$info{class}{proc}{impl}=sub{&#43;}&#43;}&#43;$ret.=">&quot;;
&#43;@@ -118,6 &#43;146,7 @@ $info{class}{proc}{impl} = sub {
&#43;       }
&#43;     }
&#43;     $ret .= &quot;</a>}\n\n&quot;;
&#43;&#43;    unshift @d,{%$d, wide=&gt;true} if $need_wide;
&#43;   }
&#43;   return $ret;
&#43; };
&#43;diff --git a/auto/MkSrc/Read.pm b/auto/MkSrc/Read.pm
&#43;index 4b3d1d0..4bf640e 100644
&#43;--- a/auto/MkSrc/Read.pm
&#43;&#43;&#43;&#43; b/auto/MkSrc/Read.pm
&#43;@@ -88,13 &#43;88,13 @@ sub advance ( ) {
&#43;     $in_pod = $1 if $line =~ /^\=(\w&#43;)/;
&#43;     $line = '' if $in_pod;
&#43;     $in_pod = undef if $in_pod &amp;&amp; $in_pod eq 'cut';
&#43;-    $line =~ s/\#.*$//;
&#43;&#43;    $line =~ s/(?&lt;!\\)\#.*$//;
&#43;     $line =~ s/^(\t*)//;
&#43;     $level = $base_level &#43; length($1);
&#43;       $line =~ s/\s*$//;
&#43;     &#43;&#43;$base_level if $line =~ s/^\{$//;
&#43;     --$base_level if $line =~ s/^\}$//;
&#43;-    $line =~ s/\\([{}])/$1/g;
&#43;&#43;    $line =~ s/\\([{}#\\])/$1/g;
&#43;   } while ($line eq '');
&#43;   #print &quot;$level:$line\n&quot;;
&#43; }
&#43;diff --git a/auto/mk-src.in b/auto/mk-src.in
&#43;index 0e7833a..eb3353f 100644
&#43;--- a/auto/mk-src.in
&#43;&#43;&#43;&#43; b/auto/mk-src.in
&#43;@@ -608,6 &#43;608,7 @@ errors:
&#43; 		invalid expression
&#43; 			mesg =&gt; &quot;%expression&quot; is not a valid regular
expression.
&#43; 			parms =&gt; expression
&#43;&#43;
&#43; }
&#43; group: speller
&#43; {
&#43;@@ -650,6 &#43;651,7 @@ class: speller
&#43; 		posib err
&#43; 		desc =&gt; Returns 0 if it is not in the dictionary,
&#43; 			1 if it is, or -1 on error.
&#43;&#43;		on conv error =&gt; return 0;
&#43; 		/
&#43; 		bool
&#43; 		encoded string: word
&#43;@@ -715,6 &#43;717,8 @@ class: speller
&#43; 		desc =&gt; Return NULL on error.
&#43; 			The word list returned by suggest is only
&#43; 			valid until the next call to suggest.
&#43;&#43;		on conv error =&gt;
&#43;&#43;			word = NULL; word_size = 0;
&#43; 		/
&#43; 		const word list
&#43; 		encoded string: word
&#43;@@ -840,7 &#43;844,6 @@ class: document checker
&#43; 		void
&#43; 
&#43; 	method: process
&#43;-
&#43; 		desc =&gt; Process a string.
&#43; 			The string passed in should only be split on
&#43; 			white space characters.  Furthermore, between
&#43;@@ -849,10 &#43;852,10 @@ class: document checker
&#43; 			in the document.  Passing in strings out of
&#43; 			order, skipping strings or passing them in
&#43; 			more than once may lead to undefined results.
&#43;&#43;		no conv
&#43; 		/
&#43; 		void
&#43;-		string: str
&#43;-		int: size
&#43;&#43;		encoded string: str
&#43; 
&#43; 	method: next misspelling
&#43; 
&#43;@@ -860,9 &#43;863,23 @@ class: document checker
&#43; 			processed string.  If there are no more
&#43; 			misspelled words, then token.word will be
&#43; 			NULL and token.size will be 0
&#43;&#43;		cc extra =&gt;
&#43;&#43;			\#define
aspell_document_checker_next_misspelling_w(type, ths) \\
&#43;&#43;			    aspell_document_checker_next_misspelling_ad
j(ths, sizeof(type))
&#43; 		/
&#43; 		token object
&#43; 
&#43;&#43;	method: next misspelling adj
&#43;&#43;		desc =&gt; internal: do not use
&#43;&#43;		c impl =&gt;
&#43;&#43;			Token res = ths-&gt;next_misspelling();
&#43;&#43;			res.offset /= type_width;
&#43;&#43;			res.len /= type_width;
&#43;&#43;			return res;
&#43;&#43;		/
&#43;&#43;		token object
&#43;&#43;		int: type_width
&#43;&#43;
&#43; 	method: filter
&#43; 
&#43; 		desc =&gt; Returns the underlying filter class.
&#43;@@ -922,9 &#43;939,30 @@ class: string enumeration
&#43; 			  ths-&gt;from_internal_-&gt;append_null(ths-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">temp_str);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43; 			  return ths-&gt;temp_str.data();
&#43; 			\}
&#43;&#43;		cc extra =&gt;
&#43;&#43;			\#define aspell_string_enumeration_next_w(type,
ths) \\
&#43;&#43;			    aspell_cast_(const type *,
aspell_string_enumeration_next_wide(ths, sizeof(type)))
&#43; 		/
&#43; 		const string
&#43; 
&#43;&#43;	method: next wide
&#43;&#43;		c impl =&gt;
&#43;&#43;			const char * s = ths-&gt;next();
&#43;&#43;			if (s == 0) {
&#43;&#43;			  return s;
&#43;&#43;			} else if (ths-&gt;from_internal_ == 0) \{
&#43;&#43;			  assert(type_width == 1);
&#43;&#43;			  return s;
&#43;&#43;			\} else \{
&#43;&#43;			  assert(type_width == ths-&gt;from_internal_-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">out_type_width());
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;			  ths-&gt;temp_str.clear();
&#43;&#43;			  ths-&gt;from_internal_-&gt;convert(s,-1,ths-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">temp_str);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;			  ths-&gt;from_internal_-&gt;append_null(ths-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">temp_str);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;			  return ths-&gt;temp_str.data();
&#43;&#43;			\}
&#43;&#43;		/
&#43;&#43;		const void pointer
&#43;&#43;		int: type_width
&#43; }
&#43; group: info
&#43; {
&#43;diff --git a/common/convert.cpp b/common/convert.cpp
&#43;index 1add95a..7ae0317 100644
&#43;--- a/common/convert.cpp
&#43;&#43;&#43;&#43; b/common/convert.cpp
&#43;@@ -541,18 &#43;541,25 @@ namespace acommon {
&#43;   // Trivial Conversion
&#43;   //
&#43; 
&#43;&#43;  const char * unsupported_null_term_wide_string_msg =
&#43;&#43;    &quot;Null-terminated wide-character strings unsupported when used
this way.&quot;;
&#43;&#43;
&#43;   template &lt;typename Chr&gt;
&#43;   struct DecodeDirect : public Decode 
&#43;   {
&#43;&#43;    DecodeDirect() {type_width = sizeof(Chr);}
&#43;     void decode(const char * in0, int size, FilterCharVector &amp; out)
const {
&#43;       const Chr * in = reinterpret_cast&lt;const Chr *&gt;(in0);
&#43;-      if (size == -1) {
&#43;&#43;      if (size == -sizeof(Chr)) {
&#43;         for (;*in; &#43;&#43;in)
&#43;-          out.append(*in);
&#43;&#43;          out.append(*in, sizeof(Chr));
&#43;&#43;      } else if (size &lt;= -1) {
&#43;&#43;        fprintf(stderr, &quot;%s\n&quot;,
unsupported_null_term_wide_string_msg);
&#43;&#43;        abort();
&#43;       } else {
&#43;-        const Chr * stop = reinterpret_cast&lt;const Chr *&gt;(in0
&#43;size);
&#43;&#43;        const Chr * stop = reinterpret_cast&lt;const Chr *&gt;(in0) &#43;
size/sizeof(Chr);
&#43;         for (;in != stop; &#43;&#43;in)
&#43;-          out.append(*in);
&#43;&#43;          out.append(*in, sizeof(Chr));
&#43;       }
&#43;     }
&#43;     PosibErr&lt;void&gt; decode_ec(const char * in0, int size, 
&#43;@@ -565,6 &#43;572,7 @@ namespace acommon {
&#43;   template &lt;typename Chr&gt;
&#43;   struct EncodeDirect : public Encode
&#43;   {
&#43;&#43;    EncodeDirect() {type_width = sizeof(Chr);}
&#43;     void encode(const FilterChar * in, const FilterChar * stop, 
&#43;                 CharVector &amp; out) const {
&#43;       for (; in != stop; &#43;&#43;in) {
&#43;@@ -594,11 &#43;602,15 @@ namespace acommon {
&#43;   template &lt;typename Chr&gt;
&#43;   struct ConvDirect : public DirectConv
&#43;   {
&#43;&#43;    ConvDirect() {type_width = sizeof(Chr);}
&#43;     void convert(const char * in0, int size, CharVector &amp; out)
const {
&#43;-      if (size == -1) {
&#43;&#43;      if (size == -sizeof(Chr)) {
&#43;         const Chr * in = reinterpret_cast&lt;const Chr *&gt;(in0);
&#43;         for (;*in != 0; &#43;&#43;in)
&#43;           out.append(in, sizeof(Chr));
&#43;&#43;      } else if (size &lt;= -1) {
&#43;&#43;        fprintf(stderr, &quot;%s\n&quot;,
unsupported_null_term_wide_string_msg);
&#43;&#43;        abort();
&#43;       } else {
&#43;         out.append(in0, size);
&#43;       }
&#43;@@ -1121,5 &#43;1133,20 @@ namespace acommon {
&#43;     }
&#43;     return 0;
&#43;   }
&#43;-  
&#43;&#43;
&#43;&#43;  PosibErr&lt;void&gt; unsupported_null_term_wide_string_err_(const char
* func) {
&#43;&#43;    static bool reported_to_stderr = false;
&#43;&#43;    PosibErr&lt;void&gt; err = make_err(other_error,
unsupported_null_term_wide_string_msg);
&#43;&#43;    if (!reported_to_stderr) {
&#43;&#43;      CERR.printf(&quot;ERROR: %s: %s\n&quot;, func,
unsupported_null_term_wide_string_msg);
&#43;&#43;      reported_to_stderr = true;
&#43;&#43;    }
&#43;&#43;    return err;
&#43;&#43;  }
&#43;&#43;
&#43;&#43;  void unsupported_null_term_wide_string_abort_(const char * func)
{
&#43;&#43;    CERR.printf(&quot;%s: %s\n&quot;, unsupported_null_term_wide_string_msg);
&#43;&#43;    abort();
&#43;&#43;  }
&#43;&#43; 
&#43; }
&#43;diff --git a/common/convert.hpp b/common/convert.hpp
&#43;index 76332ee..c948973 100644
&#43;--- a/common/convert.hpp
&#43;&#43;&#43;&#43; b/common/convert.hpp
&#43;@@ -7,6 &#43;7,8 @@
&#43; #ifndef ASPELL_CONVERT__HPP
&#43; #define ASPELL_CONVERT__HPP
&#43; 
&#43;&#43;#include &quot;settings.h&quot;
&#43;&#43;
&#43; #include &quot;string.hpp&quot;
&#43; #include &quot;posib_err.hpp&quot;
&#43; #include &quot;char_vector.hpp&quot;
&#43;@@ -25,8 &#43;27,9 @@ namespace acommon {
&#43;     typedef const Config CacheConfig;
&#43;     typedef const char * CacheKey;
&#43;     String key;
&#43;&#43;    int type_width; // type width in bytes
&#43;     bool cache_key_eq(const char * l) const  {return key == l;}
&#43;-    ConvBase() {}
&#43;&#43;    ConvBase() : type_width(1) {}
&#43;   private:
&#43;     ConvBase(const ConvBase &amp;);
&#43;     void operator=(const ConvBase &amp;);
&#43;@@ -56,6 &#43;59,8 @@ namespace acommon {
&#43;     virtual ~Encode() {}
&#43;   };
&#43;   struct DirectConv { // convert directly from in_code to out_code.
&#43;&#43;    int type_width; // type width in bytes
&#43;&#43;    DirectConv() : type_width(1) {}
&#43;     // should not take ownership of decode and encode.
&#43;     // decode and encode guaranteed to stick around for the life
&#43;     // of the object.
&#43;@@ -126,6 &#43;131,9 @@ namespace acommon {
&#43;     const char * in_code() const   {return decode_-&gt;key.c_str();}
&#43;     const char * out_code() const  {return encode_-&gt;key.c_str();}
&#43; 
&#43;&#43;    int in_type_width() const {return decode_-&gt;type_width;}
&#43;&#43;    int out_type_width() const {return encode_-&gt;type_width;}
&#43;&#43;
&#43;     void append_null(CharVector &amp; out) const
&#43;     {
&#43;       const char nul[4] = {0,0,0,0}; // 4 should be enough
&#43;@@ -191,6 &#43;199,10 @@ namespace acommon {
&#43;       }
&#43;     }
&#43; 
&#43;&#43;    void convert(const void * in, int size, CharVector &amp; out) {
&#43;&#43;      convert(static_cast&lt;const char *&gt;(in), size, out);
&#43;&#43;    }
&#43;&#43;
&#43;     void generic_convert(const char * in, int size, CharVector &amp;
out);
&#43;     
&#43;   };
&#43;@@ -412,6 &#43;424,30 @@ namespace acommon {
&#43;       return operator()(str, str &#43; byte_size);}
&#43;   };
&#43; 
&#43;&#43;#ifdef SLOPPY_NULL_TERM_STRINGS
&#43;&#43;  static const bool sloppy_null_term_strings = true;
&#43;&#43;#else
&#43;&#43;  static const bool sloppy_null_term_strings = false;
&#43;&#43;#endif
&#43;&#43;  
&#43;&#43;  PosibErr&lt;void&gt; unsupported_null_term_wide_string_err_(const char
* func);
&#43;&#43;  void unsupported_null_term_wide_string_abort_(const char * func);
&#43;&#43;    
&#43;&#43;  static inline PosibErr&lt;int&gt; get_correct_size(const char * func,
int conv_type_width, int size) {
&#43;&#43;    if (sloppy_null_term_strings &amp;&amp; size &lt;= -1)
&#43;&#43;      return -conv_type_width;
&#43;&#43;    if (size &lt;= -1 &amp;&amp; -conv_type_width != size)
&#43;&#43;      return unsupported_null_term_wide_string_err_(func);
&#43;&#43;    return size;
&#43;&#43;  }
&#43;&#43;  static inline int get_correct_size(const char * func, int
conv_type_width, int size, int type_width) {
&#43;&#43;    if ((sloppy_null_term_strings || type_width &lt;= -1) &amp;&amp; size &lt;=
-1)
&#43;&#43;      return -conv_type_width;
&#43;&#43;    if (size &lt;= -1 &amp;&amp; conv_type_width != type_width)
&#43;&#43;      unsupported_null_term_wide_string_abort_(func);
&#43;&#43;    return size;
&#43;&#43;  }
&#43;&#43;
&#43; }
&#43; 
&#43; #endif
&#43;diff --git a/common/document_checker.cpp
b/common/document_checker.cpp
&#43;index 5e510c4..0ccf1cd 100644
&#43;--- a/common/document_checker.cpp
&#43;&#43;&#43;&#43; b/common/document_checker.cpp
&#43;@@ -44,7 &#43;44,9 @@ namespace acommon {
&#43;   void DocumentChecker::process(const char * str, int size)
&#43;   {
&#43;     proc_str_.clear();
&#43;-    conv_-&gt;decode(str, size, proc_str_);
&#43;&#43;    PosibErr&lt;int&gt; fixed_size =
get_correct_size(&quot;aspell_document_checker_process&quot;, conv_-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">in_type_width(), size);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;    if (!fixed_size.has_err())
&#43;&#43;      conv_-&gt;decode(str, fixed_size, proc_str_);
&#43;     proc_str_.append(0);
&#43;     FilterChar * begin = proc_str_.pbegin();
&#43;     FilterChar * end   = proc_str_.pend() - 1;
&#43;@@ -53,6 &#43;55,19 @@ namespace acommon {
&#43;     tokenizer_-&gt;reset(begin, end);
&#43;   }
&#43; 
&#43;&#43;  void DocumentChecker::process_wide(const void * str, int size,
int type_width)
&#43;&#43;  {
&#43;&#43;    proc_str_.clear();
&#43;&#43;    int fixed_size =
get_correct_size(&quot;aspell_document_checker_process&quot;, conv_-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">in_type_width(), size, type_width);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&#43;&#43;    conv_-&gt;decode(static_cast&lt;const char *&gt;(str), fixed_size,
proc_str_);
&#43;&#43;    proc_str_.append(0);
&#43;&#43;    FilterChar * begin = proc_str_.pbegin();
&#43;&#43;    FilterChar * end   = proc_str_.pend() - 1;
&#43;&#43;    if (filter_)
&#43;&#43;      filter_-&gt;process(begin, end);
&#43;&#43;    tokenizer_-&gt;reset(begin, end);
&#43;&#43;  }
&#43;&#43;  
&#43;   Token DocumentChecker::next_misspelling()
&#43;   {
&#43;     bool correct;
&#43;diff --git a/common/document_checker.hpp
b/common/document_checker.hpp
&#43;index d35bb88..11a3c73 100644
&#43;--- a/common/document_checker.hpp
&#43;&#43;&#43;&#43; b/common/document_checker.hpp
&#43;@@ -36,6 &#43;36,7 @@ namespace acommon {
&#43;     PosibErr&lt;void&gt; setup(Tokenizer *, Speller *, Filter *);
&#43;     void reset();
&#43;     void process(const char * str, int size);
&#43;&#43;    void process_wide(const void * str, int size, int type_width);
&#43;     Token next_misspelling();
&#43;     
&#43;     Filter * filter() {return filter_;}
&#43;diff --git a/common/version.cpp b/common/version.cpp
&#43;index 414d938..9e60b75 100644
&#43;--- a/common/version.cpp
&#43;&#43;&#43;&#43; b/common/version.cpp
&#43;@@ -1,8 &#43;1,17 @@
&#43; #include &quot;settings.h&quot;
&#43; 
&#43;-extern &quot;C&quot; const char * aspell_version_string() {
&#43; #ifdef NDEBUG
&#43;-  return VERSION &quot; NDEBUG&quot;;
&#43;&#43;#  define NDEBUG_STR &quot; NDEBUG&quot;
&#43;&#43;#else
&#43;&#43;#  define NDEBUG_STR
&#43;&#43;#endif
&#43;&#43;
&#43;&#43;#ifdef SLOPPY_NULL_TERM_STRINGS
&#43;&#43;#  define SLOPPY_STR &quot; SLOPPY&quot;
&#43;&#43;#else
&#43;&#43;#  define SLOPPY_STR
&#43; #endif
&#43;-  return VERSION;
&#43;&#43;
&#43;&#43;extern &quot;C&quot; const char * aspell_version_string() {
&#43;&#43;  return VERSION NDEBUG_STR SLOPPY_STR;
&#43; }
&#43;diff --git a/configure.ac b/configure.ac
&#43;index 60e3b39..a5d51e3 100644
&#43;--- a/configure.ac
&#43;&#43;&#43;&#43; b/configure.ac
&#43;@@ -73,6 &#43;73,9 @@ AC_ARG_ENABLE(filter-version-control,
&#43; AC_ARG_ENABLE(32-bit-hash-fun,
&#43;   AS_HELP_STRING([--enable-32-bit-hash-fun],[use 32-bit hash
function for compiled dictionaries]))
&#43; 
&#43;&#43;AC_ARG_ENABLE(sloppy-null-term-strings,
&#43;&#43;  AS_HELP_STRING([--enable-sloppy-null-term-strings],[allows allow
null terminated UCS-2 and UCS-4 strings]))
&#43;&#43;
&#43; AC_ARG_ENABLE(pspell-compatibility,
&#43;   AS_HELP_STRING([--disable-pspell-compatibility],[don't install
pspell compatibility libraries]))
&#43; 
&#43;@@ -141,6 &#43;144,11 @@ then
&#43;   AC_DEFINE(USE_32_BIT_HASH_FUN, 1, [Defined if 32-bit hash
function should be used for compiled dictionaries.])
&#43; fi
&#43; 
&#43;&#43;if test &quot;$enable_sloppy_null_term_strings&quot; = &quot;yes&quot;
&#43;&#43;then
&#43;&#43;  AC_DEFINE(SLOPPY_NULL_TERM_STRINGS, 1, [Defined if null-
terminated UCS-2 and UCS-4 strings should always be allowed.])
&#43;&#43;fi
&#43;&#43;
&#43; AM_CONDITIONAL(PSPELL_COMPATIBILITY,  
&#43;   [test &quot;$enable_pspell_compatibility&quot; != &quot;no&quot;])
&#43; AM_CONDITIONAL(INCREMENTED_SONAME,    
&#43;diff --git a/manual/aspell.texi b/manual/aspell.texi
&#43;index 45fa091..f400e06 100644
&#43;--- a/manual/aspell.texi
&#43;&#43;&#43;&#43; b/manual/aspell.texi
&#43;@@ -158,7 &#43;158,8 @@ Installing
&#43; 
&#43; * Generic Install Instructions::  
&#43; * HTML Manuals and &quot;make clean&quot;::  
&#43;-* Curses Notes::                
&#43;&#43;* Curses Notes::
&#43;&#43;* Upgrading from Aspell 0.60.7::
&#43; * Loadable Filter Notes::       
&#43; * Upgrading from Aspell 0.50::  
&#43; * Upgrading from Aspell .33/Pspell .12::  
&#43;@@ -2206,18 &#43;2207,26 @@ int correct =
aspell_speller_check(spell_checker, @var{word}, @var{size});
&#43; @end smallexample
&#43; 
&#43; @noindent
&#43;-@var{word} is expected to be a @code{const char *} character
&#43;-string.  If the encoding is set to be @code{ucs-2} or
&#43;-@code{ucs-4} @var{word} is expected to be a cast
&#43;-from either @code{const u16int *} or @code{const u32int *}
&#43;-respectively.  @code{u16int} and @code{u32int} are generally
&#43;-@code{unsigned short} and @code{unsigned int} respectively.
&#43;-@var{size} is the length of the string or @code{-1} if the string
&#43;-is null terminated.  If the string is a cast from @code{const
u16int
&#43;-*} or @code{const u32int *} then @code{@i{size}} is the amount of
&#43;-space in bytes the string takes up after being cast to @code{const
&#43;-char *} and not the true size of the
string.  @code{sspell_speller_check}
&#43;-will return @code{0} if it is not found and non-zero otherwise.
&#43;&#43;@var{word} is expected to be a @code{const char *} character
string.
&#43;&#43;@var{size} is the length of the string or @code{-1} if the string
is
&#43;&#43;null terminated.  @code{aspell_speller_check} will return @code{0}
if it is not found
&#43;&#43;and non-zero otherwise.
&#43;&#43;
&#43;&#43;If you are using the @code{ucs-2} or @code{ucs-4} encoding then the
&#43;&#43;string is expected to be either a 2 or 4 byte wide integer
&#43;&#43;(respectively) and the @code{_w} macro vesion should be used:
&#43;&#43;
&#43;&#43;@smallexample
&#43;&#43;int correct = aspell_speller_check_w(spell_checker, @var{word},
@var{size});
&#43;&#43;@end smallexample
&#43;&#43;
&#43;&#43;The macro will cast the string to to the correct type and convert
&#43;&#43;@var{size} into bytes for you and then a call the special wide
version of the
&#43;&#43;function that will make sure the encoding is correct for the type
&#43;&#43;passed in.  For compatibility with older versions of Aspell the
normal
&#43;&#43;non-wide functions can still be used provided that the size of the
&#43;&#43;string, in bytes, is also passed in.  Null terminated @code{ucs-2}
or
&#43;&#43;@code{ucs-4} are no longer supported when using the non-wide
functions.
&#43; 
&#43; If the word is not correct, then the @code{suggest} method can be
used
&#43; to come up with likely replacements.
&#43;@@ -2236,7 &#43;2245,28 @@ delete_aspell_string_enumeration(elements);
&#43; 
&#43; Notice how @code{elements} is deleted but @code{suggestions} is
not.
&#43; The value returned by @code{suggestions} is only valid to the next
&#43;-call to @code{suggest}.  Once a replacement is made the
&#43;&#43;call to @code{suggest}.
&#43;&#43;
&#43;&#43;If you are using the @code{ucs-2} or @code{ucs-4} encoding then, in
&#43;&#43;addition to using the @code{_w} macro for the @code{suggest}
method, you
&#43;&#43;should also use the @code{_w} macro with the @code{next} method
which
&#43;&#43;will cast the string to the correct type for you.  For example, if
you
&#43;&#43;are using the @code{ucs-2} encoding and the string is a @code{const
&#43;&#43;uint16_t *} then you should use:
&#43;&#43;
&#43;&#43;@smallexample
&#43;&#43;AspellWordList * suggestions =
aspell_speller_suggest_w(spell_checker,
&#43;&#43;                                                        @var{word},
@var{size});
&#43;&#43;AspellStringEnumeration * elements =
aspell_word_list_elements(suggestions);
&#43;&#43;const uint16_t * word;
&#43;&#43;while ( (word = aspell_string_enumeration_next_w(uint16_t,
aspell_elements)) != NULL )
&#43;&#43;@{
&#43;&#43;  // add to suggestion list
&#43;&#43;@}
&#43;&#43;delete_aspell_string_enumeration(elements);
&#43;&#43;@end smallexample
&#43;&#43;
&#43;&#43;Once a replacement is made the
&#43; @code{store_repl} method should be used to communicate the
replacement
&#43; pair back to the spell checker (for the reason, @pxref{Notes on
&#43; Storing Replacement Pairs}).  Its usage is as follows:
&#43;diff --git a/manual/readme.texi b/manual/readme.texi
&#43;index 669ab8e..531721f 100644
&#43;--- a/manual/readme.texi
&#43;&#43;&#43;&#43; b/manual/readme.texi
&#43;@@ -15,15 &#43;15,16 @@ The latest version can always be found at GNU
Aspell's home page at
&#43; @uref{<a class="moz-txt-link-freetext" href="http://aspell.net">http://aspell.net</a>}.
&#43; 
&#43; @menu
&#43;-* Generic Install Instructions::  
&#43;-* HTML Manuals and &quot;make clean&quot;::  
&#43;-* Curses Notes::                
&#43;-* Loadable Filter Notes::       
&#43;-* Using 32-Bit Dictionaries on a 64-Bit System::  
&#43;-* Upgrading from Aspell 0.50::  
&#43;-* Upgrading from Aspell .33/Pspell .12::  
&#43;-* Upgrading from a Pre-0.50 snapshot::  
&#43;-* WIN32 Notes::                 
&#43;&#43;* Generic Install Instructions::
&#43;&#43;* HTML Manuals and &quot;make clean&quot;::
&#43;&#43;* Curses Notes::
&#43;&#43;* Upgrading from Aspell 0.60.7::
&#43;&#43;* Loadable Filter Notes::
&#43;&#43;* Using 32-Bit Dictionaries on a 64-Bit System::
&#43;&#43;* Upgrading from Aspell 0.50::
&#43;&#43;* Upgrading from Aspell .33/Pspell .12::
&#43;&#43;* Upgrading from a Pre-0.50 snapshot::
&#43;&#43;* WIN32 Notes::
&#43; @end menu
&#43; 
&#43; @node Generic Install Instructions
&#43;@@ -121,17 &#43;122,62 @@ In addition your system must also support the
@code{mblen} function.
&#43; Although this function was defined in the ISO C89 standard (ANSI
&#43; X3.159-1989), not all systems have it.
&#43; 
&#43;&#43;@node Upgrading from Aspell 0.60.7
&#43;&#43;@appendixsec Upgrading from Aspell 0.60.7
&#43;&#43;
&#43;&#43;To prevent a potentially unbounded buffer over-read, Aspell no
longer
&#43;&#43;supports null-terminated UCS-2 and UCS-4 encoded strings with the
&#43;&#43;original C API.  Null-termianted 8-bit or UTF-8 encoded strings are
&#43;&#43;still supported, as are UCS-2 and UCS-4 encoded strings when the
&#43;&#43;length is passed in.
&#43;&#43;
&#43;&#43;As of Aspell 0.60.8 a function from the original API that expects
an
&#43;&#43;encoded string as a parameter will return meaningless results (or
an
&#43;&#43;error code) if string is null terminated and the encoding is set to
&#43;&#43;@code{ucs-2} or @code{ucs-4}.  In addition, a single:
&#43;&#43;@example
&#43;&#43;ERROR: aspell_speller_check: Null-terminated wide-character strings
unsupported when used this way.
&#43;&#43;@end example
&#43;&#43;will be printed to standard error the first time one of those
&#43;&#43;functions is called.
&#43;&#43;
&#43;&#43;Application that use null-terminated UCS-2/4 strings should either
(1)
&#43;&#43;use the interface intended for working with wide-characters
&#43;&#43;(@xref{Through the C API}); or (2) define
&#43;&#43;@code{ASPELL_ENCODE_SETTING_SECURE} before including
@code{aspell.h}.
&#43;&#43;In the latter case is is important that the application explicitly
&#43;&#43;sets the encoding to a known value.  Defining
&#43;&#43;@code{ASPELL_ENCODE_SETTING_SECURE} and not setting the encoding
&#43;&#43;explicitly or allowing user of the application to set the encoding
&#43;&#43;could result in an unbounded buffer over-read.
&#43;&#43;
&#43;&#43;If it is necessary to preserve binary compatibility with older
&#43;&#43;versions of Aspell, the easiest thing would be to determine the
length
&#43;&#43;of the UCS-2/4 string---in bytes---and pass that in.  Due to an
&#43;&#43;implemenation detail, existing API functions can be made to work
with
&#43;&#43;null-terminated UCS-2/4 strings safely by passing in either @code{-
2}
&#43;&#43;or @code{-4} (corresponding to the width of the character type) as
the
&#43;&#43;size.  Doing so, however, will cause a buffer over-read for
unpatched
&#43;&#43;version of Aspell.  To avoid this it will be necessary to parse the
&#43;&#43;version string to determine the correct value to use.  However, no
&#43;&#43;official support will be provided for the latter method.
&#43;&#43;
&#43;&#43;If the application can not be recompiled, then Aspell can be
configured
&#43;&#43;to preserve the old behavior by passing
&#43;&#43;@option{--enable-sloppy-null-term-strings} to
@command{configure}.  When Aspell
&#43;&#43;is compiled this way the version string will include the string
&#43;&#43;@samp{ SLOPPY}.
&#43;&#43;
&#43; @node Loadable Filter Notes
&#43; @appendixsec Loadable Filter Notes
&#43;-
&#43;&#43;             
&#43; Support for being able to load additional filter modules at run-
time
&#43; has only been verified to work on Linux platforms.  If you get
linker
&#43; errors when trying to use a filter, then it is likely that loadable
&#43; filter support is not working yet on your platform.  Thus, in order
to
&#43; get Aspell to work correctly you will need to avoid compiling the
&#43; filters as individual modules by using the
&#43;-@option{--enable-compile-in-filters} when configuring Aspell with
&#43;-@command{./configure}.
&#43;&#43;@option{--enable-compile-in-filters} @command{configure} option.
&#43; 
&#43; @node Using 32-Bit Dictionaries on a 64-Bit System
&#43; @appendixsec Using 32-Bit Dictionaries on a 64-Bit System
&#43;-- 
&#43;2.17.1
&#43;
diff --git a/meta/recipes-support/aspell/aspell/CVE-2019-20433-
0002.patch b/meta/recipes-support/aspell/aspell/CVE-2019-20433-
0002.patch
new file mode 100644
index 0000000000..9569ddeebe
--- /dev/null
&#43;&#43;&#43; b/meta/recipes-support/aspell/aspell/CVE-2019-20433-0002.patch
@@ -0,0 &#43;1,68 @@
&#43;From cefd447e5528b08bb0cd6656bc52b4255692cefc Mon Sep 17 00:00:00
2001
&#43;From: Kevin Atkinson <a class="moz-txt-link-rfc2396E" href="mailto:kevina@gnu.org">&lt;kevina@gnu.org&gt;</a>
&#43;Date: Sat, 17 Aug 2019 20:25:21 -0400
&#43;Subject: [PATCH 2/2] Increment library version to reflect API
changes.
&#43;
&#43;CVE: CVE-2019-20433
&#43;Upstream-Status: Backport [
<a class="moz-txt-link-freetext" href="https://github.com/GNUAspell/aspell/commit/cefd447e5528b08bb0cd6656bc52b4255692cefc">https://github.com/GNUAspell/aspell/commit/cefd447e5528b08bb0cd6656bc52b4255692cefc</a>
]
&#43;
&#43;Signed-off-by: Stefan Ghinea <a class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>
&#43;---
&#43; Makefile.am | 31 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------------
&#43; 1 file changed, 17 insertions(&#43;), 14 deletions(-)
&#43;
&#43;diff --git a/Makefile.am b/Makefile.am
&#43;index 7e15851..19dc044 100644
&#43;--- a/Makefile.am
&#43;&#43;&#43;&#43; b/Makefile.am
&#43;@@ -94,18 &#43;94,25 @@ libaspell_la_SOURCES =\
&#43; 
&#43; libaspell_la_LIBADD =  $(LTLIBINTL) $(PTHREAD_LIB)
&#43; 
&#43;-## Libtool to so name
&#43;-## C:R:A =&gt; (C-A).(A).(R)
&#43;-## 16:5:0 =&gt; 16.0.5
&#43;-## 16:5:1 =&gt; 15.1.5
&#43;-## 18:0:2 =&gt; 16.2.0 
&#43;-## 17:0:2 =&gt; 15.2.0
&#43;-
&#43;&#43;## The version string is current[:revision[:age]]
&#43;&#43;##
&#43;&#43;## Before a release that has changed the source code at all
&#43;&#43;## increment revision.
&#43;&#43;##
&#43;&#43;## After merging changes that have changed the API in a backwards
&#43;&#43;## comptable way set revision to 0 and bump both current and age.
&#43;&#43;##
&#43;&#43;## Do not change the API in a backwards incompatible way.
&#43;&#43;##
&#43;&#43;## See &quot;Libtool: Updating version info&quot;
&#43;&#43;## (
<a class="moz-txt-link-freetext" href="https://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html">https://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html</a>
)
&#43;&#43;## for more into
&#43;&#43;##
&#43; if INCREMENTED_SONAME
&#43;-libaspell_la_LDFLAGS = -version-info 18:0:2 -no-undefined
&#43;&#43;libaspell_la_LDFLAGS = -version-info 19:0:3 -no-undefined
&#43; else
&#43; ## Use C-1:R:A 
&#43;-libaspell_la_LDFLAGS = -version-info 17:0:2 -no-undefined
&#43;&#43;libaspell_la_LDFLAGS = -version-info 18:0:3 -no-undefined
&#43; endif
&#43; 
&#43; if PSPELL_COMPATIBILITY
&#43;@@ -113,11 &#43;120,7 @@ libpspell_la_SOURCES = lib/dummy.cpp
&#43; 
&#43; libpspell_la_LIBADD = libaspell.la
&#43; 
&#43;-if INCREMENTED_SONAME
&#43;-libpspell_la_LDFLAGS = -version-info 18:0:2 -no-undefined
&#43;-else
&#43;-libpspell_la_LDFLAGS = -version-info 17:0:2 -no-undefined
&#43;-endif
&#43;&#43;libpspell_la_LDFLAGS = $(libaspell_la_LDFLAGS)
&#43; 
&#43; endif
&#43; 
&#43;-- 
&#43;2.17.1
&#43;
diff --git a/meta/recipes-support/aspell/aspell_0.60.7.bb
b/meta/recipes-support/aspell/aspell_0.60.7.bb
index b565cb3c6e..1e104c263c 100644
--- a/meta/recipes-support/aspell/aspell_0.60.7.bb
&#43;&#43;&#43; b/meta/recipes-support/aspell/aspell_0.60.7.bb
@@ -8,6 &#43;8,8 @@ PR = &quot;r1&quot;
 
 SRC_URI = &quot;${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
            <a class="moz-txt-link-freetext" href="file://0001-Fix-various-bugs-found-by-OSS-Fuze.patch">file://0001-Fix-various-bugs-found-by-OSS-Fuze.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://CVE-2019-20433-0001.patch">file://CVE-2019-20433-0001.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://CVE-2019-20433-0002.patch">file://CVE-2019-20433-0002.patch</a> \
           &quot;
 SRC_URI[md5sum] = &quot;8ef2252609c511cd2bb26f3a3932ef28&quot;
 SRC_URI[sha256sum] =
&quot;5ca8fc8cb0370cc6c9eb5b64c6d1bc5d57b3750dbf17887726c3407d833b70e4&quot;
-- 
2.17.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------CE74536A59CEFAC2A0F1ECDC--
