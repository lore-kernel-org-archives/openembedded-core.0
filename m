Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4627ECAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 03:11:58 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x15so453121pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=DwSVEBfuamHTz/WJ8DPeXWYgY6q2rUUmflTbd7T/uU8=;
	b=pUnGaZuK4lFHz8i2+kjF+ctfBVQtMctUQQAbiCsAT8HMmNYSqmTPhF82K24/u4UPeh
	AnuhI3uIdARRqMcbEg4RS8Cihj7P657oJ1IaofT7RKFLwQxthqA9GFqb3YrbRTA0UCn0
	UfKbK692upCgjmYQCnxLWrE7RPLrPyrdZSeULDosyYxNcUkFC+bTePD37PaRdJegJpsP
	Qx6FNqPlmgCqiW4hEKc4OjnTIgm0noDVDRsK0kA0Dfh043p01Mf2o9xB1JK6t914LGjZ
	6KyXmLskpzY4LWhGS4W5aKJ0cGczFcm1Tj4pmiOGFWyY65N6U0V4NyS93IQoCjaDhRda
	G+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=DwSVEBfuamHTz/WJ8DPeXWYgY6q2rUUmflTbd7T/uU8=;
	b=iDrkLC6nLPxCJyio+TUp1Jb47ZTWn6LPPWquyFGXdXe5VumfjlbWwcfCLWCxq+P3OM
	pWx1TgeCViimtciq+jsUiFaJ5eTNkJJCKTJ8tdPPDUSz2ZgKpPUeTJY+G4B5O4Cqk87B
	gGykIAqyX/XgEOQeBJsIEfRX/jt5W50g40o3hEM1pRUiBypG4iciQzD5ZOMp+HJ1ZhJ1
	uAz7nmtXlrbbnSlBf1GRVkqCzx79XwyFKz+7UYFBim4S24iQWVTtGE81+MpZRaMDjiAS
	5U+GeL79wnTBA44b1NIKwJtGq8wEUcSMtGvRrADpk/lMluzQGanOJDfFMdsanRNFRvK3
	vI+g==
X-Gm-Message-State: APjAAAVgQTyXo8DJoLnjvghiNG0ri6ZNestpmlD03tKl7Rt3euaDuUOQ
	lWyuNmsP5XWv4k5kDKXIXJJcCR1r
X-Google-Smtp-Source: APXvYqz8rBG6EFOmb8drDsnv/9wgIrplLPFJvywtE/GnGOQCVczwHmjyBiS4i13WAr3UJRUC0CjDGA==
X-Received: by 2002:a63:a35c:: with SMTP id v28mr27667376pgn.144.1566357119302;
	Tue, 20 Aug 2019 20:11:59 -0700 (PDT)
Received: from [172.20.6.109] ([12.235.222.84])
	by smtp.gmail.com with ESMTPSA id
	y188sm24351277pfb.115.2019.08.20.20.11.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Aug 2019 20:11:58 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20190821015818.18971-1-anuj.mittal@intel.com>
	<20190821015818.18971-2-anuj.mittal@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6a03321f-535f-97f4-a37d-a34370b73950@gmail.com>
Date: Tue, 20 Aug 2019 20:11:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821015818.18971-2-anuj.mittal@intel.com>
Subject: Re: [warrior][PATCH 2/3] patch: fix CVE-2019-13638
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
X-List-Received-Date: Wed, 21 Aug 2019 03:11:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/20/19 6:58 PM, Anuj Mittal wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> (From OE-Core rev: b59b1222b3f73f982286222a583de09c661dc781)
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

never mind that was 636.

- armin
>  ...-directly-instead-of-using-the-shell.patch | 44 +++++++++++++++++++
>  meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
>
> diff --git a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
> new file mode 100644
> index 0000000000..f60dfe879a
> --- /dev/null
> +++ b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
> @@ -0,0 +1,44 @@
> +From 3fcd042d26d70856e826a42b5f93dc4854d80bf0 Mon Sep 17 00:00:00 2001
> +From: Andreas Gruenbacher <agruen@gnu.org>
> +Date: Fri, 6 Apr 2018 19:36:15 +0200
> +Subject: [PATCH] Invoke ed directly instead of using the shell
> +
> +* src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
> +command to avoid quoting vulnerabilities.
> +
> +CVE: CVE-2019-13638
> +Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +---
> + src/pch.c | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +
> +diff --git a/src/pch.c b/src/pch.c
> +index 4fd5a05..16e001a 100644
> +--- a/src/pch.c
> ++++ b/src/pch.c
> +@@ -2459,9 +2459,6 @@ do_ed_script (char const *inname, char const *outname,
> + 	    *outname_needs_removal = true;
> + 	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
> + 	  }
> +-	sprintf (buf, "%s %s%s", editor_program,
> +-		 verbosity == VERBOSE ? "" : "- ",
> +-		 outname);
> + 	fflush (stdout);
> + 
> + 	pid = fork();
> +@@ -2470,7 +2467,8 @@ do_ed_script (char const *inname, char const *outname,
> + 	else if (pid == 0)
> + 	  {
> + 	    dup2 (tmpfd, 0);
> +-	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
> ++	    assert (outname[0] != '!' && outname[0] != '-');
> ++	    execlp (editor_program, editor_program, "-", outname, (char  *) NULL);
> + 	    _exit (2);
> + 	  }
> + 	else
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
> index 8cf20a3597..8908910f74 100644
> --- a/meta/recipes-devtools/patch/patch_2.7.6.bb
> +++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
> @@ -7,6 +7,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>              file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch \
>              file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
>              file://CVE-2019-13636.patch \
> +            file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
>  "
>  
>  SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"


