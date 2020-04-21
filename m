Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1746.1587436271379563435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 19:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r2+7hqe3;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id r14so5940699pfg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 19:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=VC5sytaE/Y9BLFZYCmA4ZSKHgDbsBD+7wPW2IuY7p10=;
        b=r2+7hqe35hdjH4t4M8u6DCFuscIWpt3tTIeoxv9LeP/h8KE2d5zAvmZLCwc1KjHnyr
         3T7REmUzO910GxbIY5C61nHbuWWxlKOu+B3bjeGmtEr4CUAx18EliNTChttRQOQ1lqd4
         mBUJLALY4kvBNYVl5cIhyC4gFLsEm8/Y5nDt2/xN7FG7dLCSpUQk4FJEaBQY5aPONTpn
         gnwCFrrUj2LTO0wDviOcGRQ3hXFhkj2Ers1mM1VT5FiD2+ZFQPoBupaGQ60ESCGO4gjr
         CsWHayxLoSem1MECoqzuu3meEsiQb+B/DtHHglfoFzQtQpP9o5yDMPQafkMMb171F1Sy
         2PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=VC5sytaE/Y9BLFZYCmA4ZSKHgDbsBD+7wPW2IuY7p10=;
        b=E9xKTzKtixOHsDoQimhtLK/wwNu0oMaRr9cZXVMcInhV6A7zgTRW3rq/GDu4zjxKCo
         YdIcLOx+osfNw1XY4oxH1uFSJOHoEurwdLj0MzHeSwnS2u+gswLVUHKecTHqzBmvnoW7
         r4xnm/DKtFRXJYhb9OYLNJW8mjOWB4yvyoIHQvCznKx090+i/EXZGSCFJ1KZkFor5cjX
         3jUoJgEs24u4vSgL5M1nwnTgoqsPZRrlPlEqQ0XHIyVjH6CwXiiGgYGWXHsIS+XS36nP
         OwG4eRQR4ijTm21PtA1Js9LfKTkKXVRasbqJm7VPA2XU+dqGtyK6G6jqfyACFZgC5W2y
         J9eg==
X-Gm-Message-State: AGi0PubUZGTeNs1S67EnqCPM+TglfL516Xf3rI3HSEedhLRmlboYpISj
	HFbmKmA94twa/ZiJue9HL1Vcvc8l
X-Google-Smtp-Source: APiQypK2iv/ZC2iT55TdN/Iaq4CpbkSiyzcFsNkUxDALKppU8cy1s6tkj5/GLC/5Lee+WrqENqA2dg==
X-Received: by 2002:aa7:9429:: with SMTP id y9mr8166339pfo.8.1587436270622;
        Mon, 20 Apr 2020 19:31:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:356e:ada7:6577:9bd? ([2601:202:4180:a5c0:356e:ada7:6577:9bd])
        by smtp.gmail.com with ESMTPSA id r128sm882965pfc.141.2020.04.20.19.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 19:31:10 -0700 (PDT)
Subject: Re: [ZEUS][OE-core][PATCH] glibc: CVE-2020-1751
To: Zhixiong Chi <zhixiong.chi@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200420095802.15290-1-zhixiong.chi@windriver.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <ff30484f-76fc-544b-0dc7-2cbf0631cf00@gmail.com>
Date: Mon, 20 Apr 2020 19:31:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200420095802.15290-1-zhixiong.chi@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------4CDA1C80EC25856D56E8FC5E"
Content-Language: en-US

--------------4CDA1C80EC25856D56E8FC5E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 4/20/20 2:58 AM, Zhixiong Chi wrote:
> Backport the CVE patch from upstream:
> git://sourceware.org/git/glibc.git
> commit d93769405996dfc11d216ddbe415946617b5a494

Is Dunfell or Master affected ?

- armin
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../glibc/glibc/CVE-2020-1751.patch           | 70 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.30.bb         |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch b/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
> new file mode 100644
> index 0000000000..0ed92d50e9
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
> @@ -0,0 +1,70 @@
> +From d93769405996dfc11d216ddbe415946617b5a494 Mon Sep 17 00:00:00 2001
> +From: Andreas Schwab <schwab@suse.de>
> +Date: Mon, 20 Jan 2020 17:01:50 +0100
> +Subject: [PATCH] Fix array overflow in backtrace on PowerPC (bug 25423)
> +
> +When unwinding through a signal frame the backtrace function on PowerPC
> +didn't check array bounds when storing the frame address.  Fixes commit
> +d400dcac5e ("PowerPC: fix backtrace to handle signal trampolines").
> +
> +CVE: CVE-2020-1751
> +Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + debug/tst-backtrace5.c                | 12 ++++++++++++
> + sysdeps/powerpc/powerpc32/backtrace.c |  2 ++
> + sysdeps/powerpc/powerpc64/backtrace.c |  2 ++
> + 3 files changed, 16 insertions(+)
> +
> +diff --git a/debug/tst-backtrace5.c b/debug/tst-backtrace5.c
> +index e7ce410845..b2f46160e7 100644
> +--- a/debug/tst-backtrace5.c
> ++++ b/debug/tst-backtrace5.c
> +@@ -89,6 +89,18 @@ handle_signal (int signum)
> +       }
> +   /* Symbol names are not available for static functions, so we do not
> +      check do_test.  */
> ++
> ++  /* Check that backtrace does not return more than what fits in the array
> ++     (bug 25423).  */
> ++  for (int j = 0; j < NUM_FUNCTIONS; j++)
> ++    {
> ++      n = backtrace (addresses, j);
> ++      if (n > j)
> ++	{
> ++	  FAIL ();
> ++	  return;
> ++	}
> ++    }
> + }
> + 
> + NO_INLINE int
> +diff --git a/sysdeps/powerpc/powerpc32/backtrace.c b/sysdeps/powerpc/powerpc32/backtrace.c
> +index 7c2d4726f8..d1456c8ae4 100644
> +--- a/sysdeps/powerpc/powerpc32/backtrace.c
> ++++ b/sysdeps/powerpc/powerpc32/backtrace.c
> +@@ -114,6 +114,8 @@ __backtrace (void **array, int size)
> +         }
> +       if (gregset)
> + 	{
> ++	  if (count + 1 == size)
> ++	    break;
> + 	  array[++count] = (void*)((*gregset)[PT_NIP]);
> + 	  current = (void*)((*gregset)[PT_R1]);
> + 	}
> +diff --git a/sysdeps/powerpc/powerpc64/backtrace.c b/sysdeps/powerpc/powerpc64/backtrace.c
> +index 65c260ab76..8a53a1088f 100644
> +--- a/sysdeps/powerpc/powerpc64/backtrace.c
> ++++ b/sysdeps/powerpc/powerpc64/backtrace.c
> +@@ -87,6 +87,8 @@ __backtrace (void **array, int size)
> +       if (is_sigtramp_address (current->return_address))
> +         {
> + 	  struct signal_frame_64 *sigframe = (struct signal_frame_64*) current;
> ++	  if (count + 1 == size)
> ++	    break;
> +           array[++count] = (void*) sigframe->uc.uc_mcontext.gp_regs[PT_NIP];
> + 	  current = (void*) sigframe->uc.uc_mcontext.gp_regs[PT_R1];
> + 	}
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/glibc/glibc_2.30.bb
> index c9e44a396d..84a6538ea1 100644
> --- a/meta/recipes-core/glibc/glibc_2.30.bb
> +++ b/meta/recipes-core/glibc/glibc_2.30.bb
> @@ -43,6 +43,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
>             file://CVE-2019-19126.patch \
>             file://CVE-2020-10029.patch \
> +           file://CVE-2020-1751.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>
> 


--------------4CDA1C80EC25856D56E8FC5E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/20/20 2:58 AM, Zhixiong Chi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200420095802.15290-1-zhixiong.chi@windriver.com">
      <pre class="moz-quote-pre" wrap="">Backport the CVE patch from upstream:
git://sourceware.org/git/glibc.git
commit d93769405996dfc11d216ddbe415946617b5a494</pre>
    </blockquote>
    <br>
    Is Dunfell or Master affected ?<br>
    <br>
    - armin<br>
    <blockquote type="cite"
      cite="mid:20200420095802.15290-1-zhixiong.chi@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Zhixiong Chi <a class="moz-txt-link-rfc2396E" href="mailto:zhixiong.chi@windriver.com">&lt;zhixiong.chi@windriver.com&gt;</a>
---
 .../glibc/glibc/CVE-2020-1751.patch           | 70 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.30.bb         |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-1751.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch b/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
new file mode 100644
index 0000000000..0ed92d50e9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-1751.patch
@@ -0,0 +1,70 @@
+From d93769405996dfc11d216ddbe415946617b5a494 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <a class="moz-txt-link-rfc2396E" href="mailto:schwab@suse.de">&lt;schwab@suse.de&gt;</a>
+Date: Mon, 20 Jan 2020 17:01:50 +0100
+Subject: [PATCH] Fix array overflow in backtrace on PowerPC (bug 25423)
+
+When unwinding through a signal frame the backtrace function on PowerPC
+didn't check array bounds when storing the frame address.  Fixes commit
+d400dcac5e ("PowerPC: fix backtrace to handle signal trampolines").
+
+CVE: CVE-2020-1751
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+Signed-off-by: Zhixiong Chi <a class="moz-txt-link-rfc2396E" href="mailto:zhixiong.chi@windriver.com">&lt;zhixiong.chi@windriver.com&gt;</a>
+---
+ debug/tst-backtrace5.c                | 12 ++++++++++++
+ sysdeps/powerpc/powerpc32/backtrace.c |  2 ++
+ sysdeps/powerpc/powerpc64/backtrace.c |  2 ++
+ 3 files changed, 16 insertions(+)
+
+diff --git a/debug/tst-backtrace5.c b/debug/tst-backtrace5.c
+index e7ce410845..b2f46160e7 100644
+--- a/debug/tst-backtrace5.c
++++ b/debug/tst-backtrace5.c
+@@ -89,6 +89,18 @@ handle_signal (int signum)
+       }
+   /* Symbol names are not available for static functions, so we do not
+      check do_test.  */
++
++  /* Check that backtrace does not return more than what fits in the array
++     (bug 25423).  */
++  for (int j = 0; j &lt; NUM_FUNCTIONS; j++)
++    {
++      n = backtrace (addresses, j);
++      if (n &gt; j)
++	{
++	  FAIL ();
++	  return;
++	}
++    }
+ }
+ 
+ NO_INLINE int
+diff --git a/sysdeps/powerpc/powerpc32/backtrace.c b/sysdeps/powerpc/powerpc32/backtrace.c
+index 7c2d4726f8..d1456c8ae4 100644
+--- a/sysdeps/powerpc/powerpc32/backtrace.c
++++ b/sysdeps/powerpc/powerpc32/backtrace.c
+@@ -114,6 +114,8 @@ __backtrace (void **array, int size)
+         }
+       if (gregset)
+ 	{
++	  if (count + 1 == size)
++	    break;
+ 	  array[++count] = (void*)((*gregset)[PT_NIP]);
+ 	  current = (void*)((*gregset)[PT_R1]);
+ 	}
+diff --git a/sysdeps/powerpc/powerpc64/backtrace.c b/sysdeps/powerpc/powerpc64/backtrace.c
+index 65c260ab76..8a53a1088f 100644
+--- a/sysdeps/powerpc/powerpc64/backtrace.c
++++ b/sysdeps/powerpc/powerpc64/backtrace.c
+@@ -87,6 +87,8 @@ __backtrace (void **array, int size)
+       if (is_sigtramp_address (current-&gt;return_address))
+         {
+ 	  struct signal_frame_64 *sigframe = (struct signal_frame_64*) current;
++	  if (count + 1 == size)
++	    break;
+           array[++count] = (void*) sigframe-&gt;uc.uc_mcontext.gp_regs[PT_NIP];
+ 	  current = (void*) sigframe-&gt;uc.uc_mcontext.gp_regs[PT_R1];
+ 	}
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/glibc/glibc_2.30.bb
index c9e44a396d..84a6538ea1 100644
--- a/meta/recipes-core/glibc/glibc_2.30.bb
+++ b/meta/recipes-core/glibc/glibc_2.30.bb
@@ -43,6 +43,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            <a class="moz-txt-link-freetext" href="file://0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch">file://0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2019-19126.patch">file://CVE-2019-19126.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2020-10029.patch">file://CVE-2020-10029.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2020-1751.patch">file://CVE-2020-1751.patch</a> \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------4CDA1C80EC25856D56E8FC5E--
