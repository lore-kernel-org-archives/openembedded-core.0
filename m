Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.43])
 by mx.groups.io with SMTP id smtpd.web12.21241.1591580248627925352
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 18:37:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=arF6zAfG;
 spf=pass (domain: windriver.com, ip: 40.107.220.43, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxh0NnGIqoAsRL9ys0g65C0fVGvdJNyZI8Lavg5nVP1I8U7Vn1zusZkGzUFcog0+LTPfRbn+qnwaCDupLbiFzHPA9RjgOrhWjkzwTYHaJ5Eq3isUu5thXTExn7GxyYtunR74CmKFMwg+FQH8NccSiJkM9DDpKmd877zNRPeFORvrdz3RHcDVksFz78HQKMqQvUNXJcGlpgPFRWLZOUBYnhoKmvMQcc3loa26YBcUfaRHZ5qXhHZV00IP+ZpKgKrzGFm+XyumpBWdOYCJ71Y0Zs6Ec62xrSiXtJQiwmUhyUPTKqNiSbk6UlaOHJMJQltmnNDZZiSQcToEF7zbIv/1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp7I/WZWP2whPTUvFkHmF+ILoxNITlUSuNnczEnWkk8=;
 b=UlUnuGXHr1LEZWDxciRqjVDl8HXiZZVjr96meCY199wH/12wss5zhIZUbHlVkwAuPnHgOyk+nmNucveRcdLEU8wqvdU1PSYoBMhuKb0Ney1w3cw9ZjRGMFthfsmVeqUJ5AvX9dxFuB9dwe2JPH0SOaH9OPPphV4bI8Kba24LKRTSyX2s9NwhpBKLyEuYUpmLDG0P11bQKmuHCXPtySkcwjcGRq5IvwYjfJn33MOw0dGdYVI1qPM3VOZkcT80l4svgvykWzPUc1xtiO7M/heHmIeaYaRt1LJKC8WlnhNt1GG7Do9LgiOk0eQw6SQkyqNdMEb34DuJLrJlaLjj+8/aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp7I/WZWP2whPTUvFkHmF+ILoxNITlUSuNnczEnWkk8=;
 b=arF6zAfGRuZtdte173r66ZNxmzIABVIxSiUGR4fE4/E9hNn9HKYECXdKdokqaS0CBoulhMj9DX3WUNsEaoA+vX8/GxGosfxtGtfM/FdFnKvQdeM8cE6hkOOzA/ICq6iLCk1S94lMuuwlTxhZMSZsnTlV2tjN4+VScNei7SOu0LI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3848.namprd11.prod.outlook.com (2603:10b6:a03:fd::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Mon, 8 Jun
 2020 01:37:27 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::ddb1:52c7:c1f9:a70c%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 01:37:27 +0000
Subject: Re: [OE-core][PATCH] Revert "vim: do not adjust script paths building for target"
To: openembedded-core@lists.openembedded.org
References: <16166D1BB62580C3.8402@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <ada0a193-0d03-c742-87d6-33e5d6f42654@windriver.com>
Date: Mon, 8 Jun 2020 09:40:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <16166D1BB62580C3.8402@lists.openembedded.org>
X-ClientProxiedBy: HK2PR06CA0023.apcprd06.prod.outlook.com
 (2603:1096:202:2e::35) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR06CA0023.apcprd06.prod.outlook.com (2603:1096:202:2e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 01:37:26 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb06926-389c-4134-f322-08d80b4c806c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3848:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB38480A4ACCA657AD4AAE076BED850@BYAPR11MB3848.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:193;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qgrjm9XCUtCCfOPH5mHEbt88FHmFsQeC6oOgmxWjys8cAUmZaFeF6Zk+AIlEy8viTQERoCUM5nS2IUucqoux8/+lz9r8mPrkZbINOJCQ0Gv2WGRGZP7zETCJyT2If8/3EzezDCN2DcWjvYeB97znali2hxK2guWsuoQHPwRvrC1mkhagimSk8Y5DB8GL9UYOPd4tnUTRF0OrCkUd+sqcHqK/qQ++MHzfdUkhVZh7kfQaby2cOxYfuPHlMs/PgRCnkd4ID4GNTTpXNzGpuHbA2ycPBr3le9ZuTVFPBy2dfFHLELAQatKDwZkbqvzKHnp3kp3Ep4yWzwLFSc118GKbsnyz8dxckG3ovk+iS8RIL7N98VRyZLKN16pFfaX9ZjVLRPu7ogk6mT788G3hi7g2Wj1M1EuOF3qmX6IRJxAXZ6cF8o8i5Ii6yPthtgELMBGgJkZ6SMp2toJKFXJlqX4w4zUXs4pp1yRIDMIapyuTZZo30aGVEP5oZWHQa/9AcO4Xsn9fNqTvtp2w7aYK1p8YSg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(136003)(39840400004)(346002)(366004)(83380400001)(36756003)(6666004)(5660300002)(16576012)(2906002)(53546011)(33964004)(31686004)(8676002)(52116002)(316002)(2616005)(26005)(956004)(66476007)(66556008)(166002)(478600001)(31696002)(966005)(6486002)(8936002)(86362001)(6916009)(6706004)(186003)(16526019)(66946007)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rG0nMb56dQDHIvlAOrax/pAzotsY0NmiitDm/HNtO7k0hXG75UkKeJ3EHkA6PNDR104YyLFrzdeeWvwIahAwmXfcIeUsKjKrY+2sElMpbCc6JJWZnZ/cgMv2urA41AAoHupcSRKy/p2O9DLehCVPlM++bt5T1NR6wiXd1vLrYliwYR9bFlqIMJ7rzZ01TF6eDioy/DqULSlruw09HNzE4syQCyxtiHu0iDIelWNA8DoKpsZmMGUfPtqor0xtW5idXSloZ623htHRQxr2z4SO7ezNeXMH5CpBs5QrZC8iT67TQNfevWKp10neWrnzkOfsjDOZMJ3uJrjSE0m6d3qU4GIbBGn8vuDOW3tOws/ZSkK0BFw4ash9qge6Kja7IBCjWS7sW0cjEZIrq1DCm1C6dPbU2N04ceVv8LNjAhwmq3+L8G2sqKQlIMcoSKpjUxoYE0U6gyEzeOzM0aoLFRob8ZbQrAd51zfUG2LiRSvkepw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb06926-389c-4134-f322-08d80b4c806c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 01:37:27.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6DgQq6XoAV+3brc6G7TKS74pptpRoDJ85sUuqRpglOUYp+M3ir4uOTPYz/5Koo6/l+BB+UdHka/vx+xpEMHhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3848
Content-Type: multipart/alternative;
 boundary="------------D0AF36364208B1E92A8004A2"

--------------D0AF36364208B1E92A8004A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this patch. Something is wrong with my thunderbird client.

On 06/08/2020 09:24 AM, Chen Qi wrote:
> This reverts commit 8972fe5581b9fe8ef14d539001758bb13bca6737.
>
> The above commit causes regression when vim-tools is installed.
> The error is like below.
>
> Error:
>   Problem: conflicting requests
>     - nothing provides /bin/csh needed by vim-tools-8.2-r0.corei7_64
>     - nothing provides /usr/bin/nawk needed by vim-tools-8.2-r0.corei7_64
>     - nothing provides /usr/bin/python needed by vim-tools-8.2-r0.corei7_64
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../vim/files/no-path-adjust.patch            | 27 -------------------
>   meta/recipes-support/vim/vim.inc              | 12 ++++-----
>   2 files changed, 6 insertions(+), 33 deletions(-)
>   delete mode 100644 meta/recipes-support/vim/files/no-path-adjust.patch
>
> diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
> deleted file mode 100644
> index 05c2d803f6..0000000000
> --- a/meta/recipes-support/vim/files/no-path-adjust.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -vim: do not adjust script pathnames
> -
> -When cross-compiling, we do not want to reference the host versions of
> -things like perl and awk.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -2507,11 +2507,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
> - 		 rm -rf $$cvs; \
> - 	      fi
> - 	-chmod $(FILEMOD) $(DEST_TOOLS)/*
> --# replace the path in some tools
> -+
> -+# replace the path in some tools, but not when cross-compiling
> -+ifneq ($(CROSS_COMPILING),1)
> - 	perlpath=`./which.sh perl` && sed -e "s+/usr/bin/perl+$$perlpath+" $(TOOLSSOURCE)/efm_perl.pl >$(DEST_TOOLS)/efm_perl.pl
> - 	awkpath=`./which.sh nawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
> - 		awkpath=`./which.sh gawk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; if test -z "$$awkpath"; then \
> - 		awkpath=`./which.sh awk` && sed -e "s+/usr/bin/nawk+$$awkpath+" $(TOOLSSOURCE)/mve.awk >$(DEST_TOOLS)/mve.awk; fi; fi
> -+endif
> - 	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
> -
> - # install the language specific files for tools, if they were unpacked
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 9f3dc08027..78e3f9528d 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -11,7 +11,6 @@ SRC_URI = "git://github.com/vim/vim.git \
>              file://disable_acl_header_check.patch \
>              file://vim-add-knob-whether-elf.h-are-checked.patch \
>              file://0001-src-Makefile-improve-reproducibility.patch \
> -           file://no-path-adjust.patch \
>   "
>   SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
>   
> @@ -83,6 +82,12 @@ EXTRA_OECONF = " \
>   do_install() {
>       autotools_do_install
>   
> +    # Work around file-rdeps picking up csh, awk, perl or python as a dep
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> +
>       # Install example vimrc from runtime files
>       install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
>   
> @@ -105,12 +110,7 @@ FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
>   FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
>   FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
>   FILES_${PN}-data = "${datadir}/${BPN}"
> -
> -# We do not want to complain if perl or gawk are not on the target.
> -#
>   FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
> -INSANE_SKIP_${PN}-tools = "file-rdeps"
> -
>   FILES_${PN}-common = " \
>       ${datadir}/${BPN}/${VIMDIR}/*.vim \
>       ${datadir}/${BPN}/${VIMDIR}/autoload \
>
>
> 



--------------D0AF36364208B1E92A8004A2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Please ignore this patch. Something is
      wrong with my thunderbird client.<br>
      <br>
      On 06/08/2020 09:24 AM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:16166D1BB62580C3.8402@lists.openembedded.org" type="cite">
      <pre wrap="">This reverts commit 8972fe5581b9fe8ef14d539001758bb13bca6737.

The above commit causes regression when vim-tools is installed.
The error is like below.

Error:
 Problem: conflicting requests
   - nothing provides /bin/csh needed by vim-tools-8.2-r0.corei7_64
   - nothing provides /usr/bin/nawk needed by vim-tools-8.2-r0.corei7_64
   - nothing provides /usr/bin/python needed by vim-tools-8.2-r0.corei7_64

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 .../vim/files/no-path-adjust.patch            | 27 -------------------
 meta/recipes-support/vim/vim.inc              | 12 &#43;&#43;&#43;&#43;-----
 2 files changed, 6 insertions(&#43;), 33 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/no-path-adjust.patch

diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
deleted file mode 100644
index 05c2d803f6..0000000000
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
&#43;&#43;&#43; /dev/null
@@ -1,27 &#43;0,0 @@
-vim: do not adjust script pathnames
-
-When cross-compiling, we do not want to reference the host versions of
-things like perl and awk.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
-
---- a/src/Makefile
-&#43;&#43;&#43; b/src/Makefile
-@@ -2507,11 &#43;2507,14 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_
- 		 rm -rf $$cvs; \
- 	      fi
- 	-chmod $(FILEMOD) $(DEST_TOOLS)/*
--# replace the path in some tools
-&#43;
-&#43;# replace the path in some tools, but not when cross-compiling
-&#43;ifneq ($(CROSS_COMPILING),1)
- 	perlpath=`./which.sh perl` &amp;&amp; sed -e &quot;s&#43;/usr/bin/perl&#43;$$perlpath&#43;&quot; $(TOOLSSOURCE)/efm_perl.pl &gt;$(DEST_TOOLS)/efm_perl.pl
- 	awkpath=`./which.sh nawk` &amp;&amp; sed -e &quot;s&#43;/usr/bin/nawk&#43;$$awkpath&#43;&quot; $(TOOLSSOURCE)/mve.awk &gt;$(DEST_TOOLS)/mve.awk; if test -z &quot;$$awkpath&quot;; then \
- 		awkpath=`./which.sh gawk` &amp;&amp; sed -e &quot;s&#43;/usr/bin/nawk&#43;$$awkpath&#43;&quot; $(TOOLSSOURCE)/mve.awk &gt;$(DEST_TOOLS)/mve.awk; if test -z &quot;$$awkpath&quot;; then \
- 		awkpath=`./which.sh awk` &amp;&amp; sed -e &quot;s&#43;/usr/bin/nawk&#43;$$awkpath&#43;&quot; $(TOOLSSOURCE)/mve.awk &gt;$(DEST_TOOLS)/mve.awk; fi; fi
-&#43;endif
- 	-chmod $(SCRIPTMOD) `grep -l &quot;^#!&quot; $(DEST_TOOLS)/*`
- 
- # install the language specific files for tools, if they were unpacked
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9f3dc08027..78e3f9528d 100644
--- a/meta/recipes-support/vim/vim.inc
&#43;&#43;&#43; b/meta/recipes-support/vim/vim.inc
@@ -11,7 &#43;11,6 @@ SRC_URI = &quot;git://github.com/vim/vim.git \
            <a class="moz-txt-link-freetext" href="file://disable_acl_header_check.patch">file://disable_acl_header_check.patch</a> \
            <a class="moz-txt-link-freetext" href="file://vim-add-knob-whether-elf.h-are-checked.patch">file://vim-add-knob-whether-elf.h-are-checked.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-src-Makefile-improve-reproducibility.patch">file://0001-src-Makefile-improve-reproducibility.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://no-path-adjust.patch">file://no-path-adjust.patch</a> \
 &quot;
 SRCREV = &quot;98056533b96b6b5d8849641de93185dd7bcadc44&quot;
 
@@ -83,6 &#43;82,12 @@ EXTRA_OECONF = &quot; \
 do_install() {
     autotools_do_install
 
&#43;    # Work around file-rdeps picking up csh, awk, perl or python as a dep
&#43;    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
&#43;    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
&#43;    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
&#43;    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
&#43;
     # Install example vimrc from runtime files
     install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 
@@ -105,12 &#43;110,7 @@ FILES_${PN}-help = &quot;${datadir}/${BPN}/${VIMDIR}/doc&quot;
 FILES_${PN}-tutor = &quot;${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor&quot;
 FILES_${PN}-vimrc = &quot;${datadir}/${BPN}/vimrc&quot;
 FILES_${PN}-data = &quot;${datadir}/${BPN}&quot;
-
-# We do not want to complain if perl or gawk are not on the target.
-#
 FILES_${PN}-tools = &quot;${datadir}/${BPN}/${VIMDIR}/tools&quot;
-INSANE_SKIP_${PN}-tools = &quot;file-rdeps&quot;
-
 FILES_${PN}-common = &quot; \
     ${datadir}/${BPN}/${VIMDIR}/*.vim \
     ${datadir}/${BPN}/${VIMDIR}/autoload \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------D0AF36364208B1E92A8004A2--
