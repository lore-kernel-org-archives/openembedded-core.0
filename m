Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.236.1622070492863512581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 16:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sWgHmuol;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id t11so1669835pjm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 16:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w+P7nqVZLEVg4wvvnoTXSUrLebYc/8TdG3LFClU+sBc=;
        b=sWgHmuolUeONUvw3om8LVuGMFM4+L+bMzx+r9nGHSVpC5XnecrLyYH2KOeGxsMHt0A
         VSrQ3e+jpPBON3Ef/Q1NpoMv62byuxOWCOrBss350SghHVoMWg/q5AGCCtVLJkBt3JuB
         D4rIEluWWFRgxRqC4DYqS501oP5Vi2uaIx+eqjYwbXSOYgBWzFGnqlMS8Plj+tVBvPuu
         zoJnXnNmEeztH8YXFrTY1uIN8GA64U5213/WDSzM7UPjkT1XW+Sb28Qx/sm1UvOUb3pi
         D0CVNNnbPcs0rzOscdfBa0Rf9PDd8qZRWC6QubDisLd/BD2XvdkMOw84o5hCDkc6y7qk
         oDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=w+P7nqVZLEVg4wvvnoTXSUrLebYc/8TdG3LFClU+sBc=;
        b=XLixiIbO+jz39leqKogjUcLp/P9rXnZdyyvvyE5ns88KQ00FAkhztBx0rnQd66AB50
         IFlSuS8xrDMk9JF+H1/MnJOBedWlOZCoB3MlN110mWnileVPkOhMyC0FaB6b4csj8uCD
         FaDI0fmCHLNnAhQ3GalvACtpR6Yyi7+YelcCl6Qf2yo3o3OGSCdJUKb0YwV4ZqeNY3ms
         /L5cnVIrZ0v93iOSl8poj3mxovt3GAu5mXA7v+IGVIW0nQJ/z7WC+9lz8ReoZ3M6yS7E
         MeQS2gypCmteHFXtkGcQkAfR44ysBTC2Omdi6Esb8lDoaBukU5PYssjQYbzR2jxjSb2/
         eRcw==
X-Gm-Message-State: AOAM530ijMfLs86a7u2hRUtAjiIIZtgPunq4dgY2VIhqe25umWobnshV
	/Ggju8H19UFSYVZ7Ap4RTQZ8I/3Mc0HGjw==
X-Google-Smtp-Source: ABdhPJzNY9YZQXNDoLKGrMQWF6yhNyF7ktOWU9LAJRVrD4+fobY75IKp7EDFzunBAEymE/Dsd5awqg==
X-Received: by 2002:a17:902:b10a:b029:f9:a0d:14a5 with SMTP id q10-20020a170902b10ab02900f90a0d14a5mr428864plr.44.1622070491917;
        Wed, 26 May 2021 16:08:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:1d7:355f:d5bb:1bea? ([2601:646:9200:a0f0:1d7:355f:d5bb:1bea])
        by smtp.gmail.com with ESMTPSA id u4sm134098pgl.43.2021.05.26.16.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 16:08:11 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] gcc: revert libstc++-gdb.py installation changes
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20210526211132.1058543-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a5ce41c0-9996-cfaf-a815-f5bd6e91ba3b@gmail.com>
Date: Wed, 26 May 2021 16:08:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526211132.1058543-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/26/21 2:11 PM, Ross Burton wrote:
> Commit dbb87d in the GCC 11 branch was intended to make the installation of
> this Python module more robust, but for unknown reasons the library_name
> in libstdc++.la in baremetal builds (for example, Zephyr) is unset, so the
> module is just installed as "-gdb.py".
> 
> This may be a GCC bug, or a bug in our build. Until that is resolved,
> revert the commit to fix the packaging.
> 

This is ok. FWIW this is being tracked with 
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99453 and hopefully this 
will be addressed soon and we wont have to revert this patch but until 
then lets apply this patch to master it does not affect us much.

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/gcc/gcc-11.1.inc        |  1 +
>   ...nstall-libstdc-gdb.py-more-robustly-.patch | 76 +++++++++++++++++++
>   2 files changed, 77 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
> index aa7ac9be59..bf29879ded 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
> @@ -68,6 +68,7 @@ SRC_URI = "\
>              file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
>              file://0036-mingw32-Enable-operation_not_supported.patch \
>              file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
> +           file://0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch \
>   "
>   SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
>   SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
> diff --git a/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch b/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch
> new file mode 100644
> index 0000000000..a3e31e4f9d
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0001-Revert-libstdc-Install-libstdc-gdb.py-more-robustly-.patch
> @@ -0,0 +1,76 @@
> +This change breaks installation on baremetal targets, so whilst the cause is
> +investigated revert the commit.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 8ec52bd0ba2141ef0bcc6f93e26a23d662b40f78 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Wed, 26 May 2021 19:54:29 +0100
> +Subject: [PATCH] Revert "libstdc++: Install libstdc++*-gdb.py more robustly
> + [PR 99453]"
> +
> +This reverts commit dbb87d6a9c37c8eca80d77782717a8144515c16d.
> +---
> + libstdc++-v3/python/Makefile.am | 20 ++++++++++++++++----
> + libstdc++-v3/python/Makefile.in | 14 ++++++++++++--
> + 2 files changed, 28 insertions(+), 6 deletions(-)
> +
> +diff --git a/libstdc++-v3/python/Makefile.am b/libstdc++-v3/python/Makefile.am
> +index 0c2b207b86e..01517a2a522 100644
> +--- a/libstdc++-v3/python/Makefile.am
> ++++ b/libstdc++-v3/python/Makefile.am
> +@@ -44,9 +44,21 @@ gdb.py: hook.in Makefile
> + install-data-local: gdb.py
> + 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
> + ## We want to install gdb.py as SOMETHING-gdb.py.  SOMETHING is the
> +-## full name of the final library.  We use the libtool .la file to get
> +-## the correct name.
> +-	@libname=`sed -ne "/^library_names=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> +-	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> ++## full name of the final library.  We want to ignore symlinks, the
> ++## .la file, and any previous -gdb.py file.  This is inherently
> ++## fragile, but there does not seem to be a better option, because
> ++## libtool hides the real names from us.
> ++	@here=`pwd`; cd $(DESTDIR)$(toolexeclibdir); \
> ++	  for file in libstdc++.*; do \
> ++	    case $$file in \
> ++	      *-gdb.py) ;; \
> ++	      *.la) ;; \
> ++	      *) if test -h $$file; then \
> ++	           continue; \
> ++	         fi; \
> ++	         libname=$$file;; \
> ++	    esac; \
> ++	  done; \
> ++	cd $$here; \
> + 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py"; \
> + 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
> +diff --git a/libstdc++-v3/python/Makefile.in b/libstdc++-v3/python/Makefile.in
> +index 2efe0b96a19..c35dbe55961 100644
> +--- a/libstdc++-v3/python/Makefile.in
> ++++ b/libstdc++-v3/python/Makefile.in
> +@@ -607,8 +607,18 @@ gdb.py: hook.in Makefile
> +
> + install-data-local: gdb.py
> + 	@$(mkdir_p) $(DESTDIR)$(toolexeclibdir)
> +-	@libname=`sed -ne "/^library_names=/{s/.*='//;s/'$$//;s/ .*//;p;}" \
> +-	          $(DESTDIR)$(toolexeclibdir)/libstdc++.la`; \
> ++	@here=`pwd`; cd $(DESTDIR)$(toolexeclibdir); \
> ++	  for file in libstdc++.*; do \
> ++	    case $$file in \
> ++	      *-gdb.py) ;; \
> ++	      *.la) ;; \
> ++	      *) if test -h $$file; then \
> ++	           continue; \
> ++	         fi; \
> ++	         libname=$$file;; \
> ++	    esac; \
> ++	  done; \
> ++	cd $$here; \
> + 	echo " $(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py"; \
> + 	$(INSTALL_DATA) gdb.py $(DESTDIR)$(toolexeclibdir)/$$libname-gdb.py
> +
> +--
> +2.25.1
> +
> 
> 
> 
> 
> 
