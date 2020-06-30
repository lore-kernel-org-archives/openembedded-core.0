Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.58])
 by mx.groups.io with SMTP id smtpd.web11.16256.1593526395579266535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 07:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Pzt2AkY9;
 spf=pass (domain: windriver.com, ip: 40.107.237.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NE4kHtV7pWtkPPpal/KERQlU1shuU3Uzghrc+mj4g6/aeOAKP+u2GpgAqQcE4e89+iedXG97HI1mdMUEDRq4jN4siYJBKY00khCtnK3+c2r9/XKPfszr1DFQsClkcoSzMg20AWKgl/5H5VTlub1ew1WCXxoT6CHihpoCWh8iuYwX+ncICmNWZoDf4gISZEU1onrTLOMObKs+GFhdNmfY2X6ETzdb9wiEhO67UldwQ+aEwVKtxYyPxWhcLXAGZF9oB3K/r/YwZSwvAb6Q1N1ulCG2w5fQ1tIwmosmyv47K0YPzZJjWyGI6vAzE4w/ABv4FWZEKFLPwzrORfPIjpxJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnPh1/O/WzEaRhlGdXSNNQ8cVUwfssmnF288Lrwgogk=;
 b=BTCvRlIFNS7ZlJ2AVLS+6DhTMeiqXkus31BuSTaefJR8jI4zJnU8q56/sS04+i9ghZaxOTsbd5bs1BkU5MfzOWyIRikq5WolswQeidK+Lsse6TtCgqg6nLCxvycAfE48MQaFThWdCl+f6bdgw3+7CdbLdNuvuinuXGHBKgZnVMzTooyhKYY084W9C4aICqTZGyxHonfRwLjpAlIBjwrGuADsVWIdv3zG/svVLchm+2IG0XFCvXWaSmZsHilbLCq3V4KKzY+iiWulf29jBxRwS8DGZKLaBWJNxP3fPYFYMBpyDX+UbO9FatnbCDSq58mhXPAaBwhTkGkGmVXV1BJyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GnPh1/O/WzEaRhlGdXSNNQ8cVUwfssmnF288Lrwgogk=;
 b=Pzt2AkY9YJqUm9ZnMwkLh8KV7E8xLtgaDvt4euISGWHo+xw9t8+oJbJxlyuf7qpEsH+AGUONQT3ZE3KpVGYGhK9a9Uq+AsriPSaR+HKaI9M/1HToTgBmbmFHBTGRZTMUEhiDVczScaPHJAddkE11M7JKeC232kqxdHI9Dlwt4tE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR1101MB2165.namprd11.prod.outlook.com (2603:10b6:910:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 14:13:13 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 14:13:13 +0000
Subject: Re: [OE-core] [PATCH 29/30] Revert "python3-setuptools: patch entrypoints for faster initialization"
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
 <20200626071844.29134-29-alex.kanavin@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e64c6f47-c724-841c-e8ff-dc7feb8aa19d@windriver.com>
Date: Tue, 30 Jun 2020 10:13:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626071844.29134-29-alex.kanavin@gmail.com>
X-ClientProxiedBy: YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::18) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Tue, 30 Jun 2020 14:13:12 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ce87685-0bfc-4bf6-a3a9-08d81cffb9bd
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2165:
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB21655AA4C1B9FA1BB474454E9F6F0@CY4PR1101MB2165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+rYBWQD+GU32l+5lxbLU6lR9hfZGauOvEicqyFgfZ3v2htXhE1iHQIl5+2YT1dSVOhzqLIwg7OP1/lVEBZ7FzBY+GLFaVP1etRrbB8EysQ6SLJEqM8SDBA64QXKcR6DVRjXhChK7wPVmlgayauxkTuaataelVobFPE3ShORU3mP2jbqeASF4bnUHMff2kwlLjncFz4H0lvDLTZxk7UyJYTV9RHpaWEen5/Le6b4ilKbfZ4fhX/DeXxQgcAg088jG6FZNfLKkaRzvnUOwSzhgRseC9wcft2LrqB1rMUnMSWuDIVvhMRNiCxOl5e+kowSWn8ivuRrhgTMI/s435Var/KUhHOGQU997s00urldyUsDY5ZQx8yMxBI5xSckAlI+9UzoquQpFI159Eeplmeu3cahBAckbIO/DAzO22YXVcyw2wQBN5lQKW1sF7gLAM/lMAfQaV7Zf2nCPomg8FI6Yk/IV8Yopc+vSvHNWV1K+ZAQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(366004)(396003)(136003)(16526019)(6666004)(26005)(66556008)(66946007)(2616005)(966005)(186003)(8936002)(31686004)(8676002)(33964004)(166002)(66476007)(52116002)(316002)(86362001)(31696002)(478600001)(6486002)(44832011)(36756003)(16576012)(83380400001)(2906002)(53546011)(5660300002)(956004)(43740500002)(460985005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2rL6eiQ//elS7TfsoD9+E6F04/YjU9UwiZCTQCTlpez+slxYHVMrwM+CiWxQO42NtAwDHhZOEcUUyO8OJ1xUyNlYnx4KHur1ycapTt5fuuAoCLHh8vn9UU88XsaZzeQV88AmOKefDk645f3NvdeH6hoZO4DHUQ9FxxJAgID0ypaEeJYMKPGtAaRtgTxp8QZMsmqLrKO+knPyMufOpOwlOsF0jkT7ekHCptMC4bED1IZUvhrEuOEXWLIEWkAjBMgZDNfpt/FyKmUdZC61jLPRHyBGYBNuYB8ecVqFvuugLBHTKfFW2KzMBWvsopIHDXz31ncsK83F9RPcmwyg4HE51jTM/petpTH6ykgFLiwHOuQ62eoLflfryURB985Ay0+GAngd8CDsBbNAq70If6bNmQqVDw7ZU/kQzd0hoJ0dJCRxTM4v+CdgVAhRA3+tfvXsQ7p6i9V5GzfmCDsARScSgkxwFuJfYgQ2amPff7C9hVmJS/9Kn/ewOXY9baP9BNUf
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce87685-0bfc-4bf6-a3a9-08d81cffb9bd
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 14:13:13.5773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6KXRLC4gUrMT55BLLIq8ZcVwmq9OYHd3vOAs5cat6ALycNUOOq2oxUHxQwvVgjxkdRJ38ZeMKNCMAjnLkl+i2TOujGuC3TvoHWmIqRNCa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2165
Content-Type: multipart/alternative;
 boundary="------------E3581EE617F0545CBF6F3ABE"
Content-Language: en-US

--------------E3581EE617F0545CBF6F3ABE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 3:18 AM, Alexander Kanavin wrote:
> Apologies, but the patch is not possible to rebase onto the new setuptools,
> as the code has changed too much. Please get it accepted upstream first.

That's fine. Their changes to setuptools actually address the same 
issue, although it's not as significant an improvement (the patch file I 
had submitted was about 2x as fast). Still, carrying the official fix is 
the better option.

Trevor

>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   .../python/python-setuptools.inc              |  4 +-
>   ...nt-usr-bin-wrappers-signoff-included.patch | 62 -------------------
>   2 files changed, 1 insertion(+), 65 deletions(-)
>   delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
> index 3222de7079..9322ca9a05 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -10,9 +10,7 @@ inherit pypi
>   
>   SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
>   
> -SRC_URI += "file://0001-change-shebang-to-python3.patch \
> -            file://0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch \
> -            "
> +SRC_URI += "file://0001-change-shebang-to-python3.patch"
>   
>   SRC_URI[md5sum] = "6e9de90b242fdd60ef59f497424ce13a"
>   SRC_URI[sha256sum] = "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
> diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
> deleted file mode 100644
> index 7e931c845c..0000000000
> --- a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From aae8cd3de3f289cea3db01212579913c925191e8 Mon Sep 17 00:00:00 2001
> -From: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
> -Date: Thu, 26 Mar 2020 14:24:25 +0000
> -Subject: [PATCH] ScriptWriter: create more efficient /usr/bin wrappers
> -
> -Upstream setuptools writes scripts to /usr/bin that do insanely much
> -stuff at runtime. https://github.com/pypa/setuptools/issues/510
> -
> -Since the script entry points are already known at build time, we can
> -just write those directly into the /usr/bin wrapper, avoiding the
> -expensive 'pkg_resources' import at runtime. The idea is from
> -https://github.com/ninjaaron/fast-entry_points but patched directly into
> -the native build of setuptools here, so that all Python modules under
> -bitbake automatically use it without needing additional build time
> -dependencies.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
> -Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ----
> - setuptools/command/easy_install.py | 14 ++++++--------
> - 1 file changed, 6 insertions(+), 8 deletions(-)
> -
> -diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
> -index 8fba7b41..03a72714 100755
> ---- a/setuptools/command/easy_install.py
> -+++ b/setuptools/command/easy_install.py
> -@@ -2023,17 +2023,12 @@ class ScriptWriter(object):
> -     """
> -
> -     template = textwrap.dedent(r"""
> --        # EASY-INSTALL-ENTRY-SCRIPT: %(spec)r,%(group)r,%(name)r
> --        __requires__ = %(spec)r
> --        import re
> -         import sys
> --        from pkg_resources import load_entry_point
> -+
> -+        from %(module)s import %(ep0)s
> -
> -         if __name__ == '__main__':
> --            sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
> --            sys.exit(
> --                load_entry_point(%(spec)r, %(group)r, %(name)r)()
> --            )
> -+            sys.exit(%(entrypoint)s())
> -     """).lstrip()
> -
> -     command_spec_class = CommandSpec
> -@@ -2068,6 +2063,9 @@ class ScriptWriter(object):
> -         for type_ in 'console', 'gui':
> -             group = type_ + '_scripts'
> -             for name, ep in dist.get_entry_map(group).items():
> -+                module = ep.module_name
> -+                ep0 = ep.attrs[0]
> -+                entrypoint = '.'.join(ep.attrs)
> -                 cls._ensure_safe_name(name)
> -                 script_text = cls.template % locals()
> -                 args = cls._get_script_args(type_, name, header, script_text)
> ---
> -2.24.1
> -
>
> 

--------------E3581EE617F0545CBF6F3ABE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 3:18 AM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626071844.29134-29-alex.kanavin@gmail.com">
      <pre class="moz-quote-pre" wrap="">Apologies, but the patch is not possible to rebase onto the new setuptools,
as the code has changed too much. Please get it accepted upstream first.</pre>
    </blockquote>
    <p>That's fine. Their changes to setuptools actually address the
      same issue, although it's not as significant an improvement (the
      patch file I had submitted was about 2x as fast). Still, carrying
      the official fix is the better option.</p>
    <p>Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:20200626071844.29134-29-alex.kanavin@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
---
 .../python/python-setuptools.inc              |  4 &#43;-
 ...nt-usr-bin-wrappers-signoff-included.patch | 62 -------------------
 2 files changed, 1 insertion(&#43;), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 3222de7079..9322ca9a05 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
&#43;&#43;&#43; b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,9 &#43;10,7 @@ inherit pypi
 
 SRC_URI_append_class-native = <a class="moz-txt-link-rfc2396E" href="file://0001-conditionally-do-not-fetch-code-by-easy_install.patch">&quot; file://0001-conditionally-do-not-fetch-code-by-easy_install.patch&quot;</a>
 
-SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://0001-change-shebang-to-python3.patch\-file://0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch\-">&quot;file://0001-change-shebang-to-python3.patch \
-            file://0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch \
-            &quot;</a>
&#43;SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://0001-change-shebang-to-python3.patch">&quot;file://0001-change-shebang-to-python3.patch&quot;</a>
 
 SRC_URI[md5sum] = &quot;6e9de90b242fdd60ef59f497424ce13a&quot;
 SRC_URI[sha256sum] = &quot;145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74&quot;
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
deleted file mode 100644
index 7e931c845c..0000000000
--- a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
&#43;&#43;&#43; /dev/null
@@ -1,62 &#43;0,0 @@
-From aae8cd3de3f289cea3db01212579913c925191e8 Mon Sep 17 00:00:00 2001
-From: Lauri Tirkkonen <a class="moz-txt-link-rfc2396E" href="mailto:lauri.tirkkonen.ext@nokia.com">&lt;lauri.tirkkonen.ext@nokia.com&gt;</a>
-Date: Thu, 26 Mar 2020 14:24:25 &#43;0000
-Subject: [PATCH] ScriptWriter: create more efficient /usr/bin wrappers
-
-Upstream setuptools writes scripts to /usr/bin that do insanely much
-stuff at runtime. <a class="moz-txt-link-freetext" href="https://github.com/pypa/setuptools/issues/510">https://github.com/pypa/setuptools/issues/510</a>
-
-Since the script entry points are already known at build time, we can
-just write those directly into the /usr/bin wrapper, avoiding the
-expensive 'pkg_resources' import at runtime. The idea is from
-https://github.com/ninjaaron/fast-entry_points but patched directly into
-the native build of setuptools here, so that all Python modules under
-bitbake automatically use it without needing additional build time
-dependencies.
-
-Upstream-Status: Pending
-
-Signed-off-by: Lauri Tirkkonen <a class="moz-txt-link-rfc2396E" href="mailto:lauri.tirkkonen.ext@nokia.com">&lt;lauri.tirkkonen.ext@nokia.com&gt;</a>
-Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
----
- setuptools/command/easy_install.py | 14 &#43;&#43;&#43;&#43;&#43;&#43;--------
- 1 file changed, 6 insertions(&#43;), 8 deletions(-)
-
-diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 8fba7b41..03a72714 100755
---- a/setuptools/command/easy_install.py
-&#43;&#43;&#43; b/setuptools/command/easy_install.py
-@@ -2023,17 &#43;2023,12 @@ class ScriptWriter(object):
-     &quot;&quot;&quot;
- 
-     template = textwrap.dedent(r&quot;&quot;&quot;
--        # EASY-INSTALL-ENTRY-SCRIPT: %(spec)r,%(group)r,%(name)r
--        __requires__ = %(spec)r
--        import re
-         import sys
--        from pkg_resources import load_entry_point
-&#43;
-&#43;        from %(module)s import %(ep0)s
- 
-         if __name__ == '__main__':
--            sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
--            sys.exit(
--                load_entry_point(%(spec)r, %(group)r, %(name)r)()
--            )
-&#43;            sys.exit(%(entrypoint)s())
-     &quot;&quot;&quot;).lstrip()
- 
-     command_spec_class = CommandSpec
-@@ -2068,6 &#43;2063,9 @@ class ScriptWriter(object):
-         for type_ in 'console', 'gui':
-             group = type_ &#43; '_scripts'
-             for name, ep in dist.get_entry_map(group).items():
-&#43;                module = ep.module_name
-&#43;                ep0 = ep.attrs[0]
-&#43;                entrypoint = '.'.join(ep.attrs)
-                 cls._ensure_safe_name(name)
-                 script_text = cls.template % locals()
-                 args = cls._get_script_args(type_, name, header, script_text)
--- 
-2.24.1
-
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E3581EE617F0545CBF6F3ABE--
