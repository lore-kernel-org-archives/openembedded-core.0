Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5764660620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 09:33:59 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id w105so2550751wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=oOGgawonPURFBTxlnwiBpNdcdd1TYTearqIP6GOi0NY=;
	b=P2/rkV6J2js3oQBOfKrMwIM8JQJ6mbl3/hZ6sFaYJnLCd89bY9WXUp2CGP54Dbs9IH
	GIExSSu8YvDoJyaZAvX6UrZhdMWHbDpOku7ZF9pjWb4zR+QT1tKmu9HoYllLMgFAfJzT
	6zZnA7GJt5/tZaL3r7ZwuavGtf6OK07RnmSMZCTCUCEv9psMJE8NpO3Cfo9fwV/dAiJf
	oIbuc8Lq2xrLre7pFzoKqnsqDIYpmVuw0mb22iEOaGVoiPiZtS8l6qZ0KhiPt9AQHJ1r
	/UVoH/h/LONgTIg2K79rCFu4f6Urv3Xuvr7whzvAksuXGSKiEvUsu5Bxfcchy6xIEn8W
	JOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=oOGgawonPURFBTxlnwiBpNdcdd1TYTearqIP6GOi0NY=;
	b=YnroUiWxBzjLjP5ijtsqhiMOhFwJM0Bfp9wzT4IVFRIwypA+uKzr4+Sx6l6lgTGDd1
	eyowHajEqqDhLpYixWaBIpyzRzQwDSgvUjtTyaShNe4sxeCWEOYbxFYplUk6lwtJspHa
	GTZfsN6HifGjxfN3xsIrfsYSlUQ5GWeJ3k1yj76ykswKyzf5xdEPVAFxT8fsT+WuYY9J
	uRJvw1eLtN1sJF7bSrqMk8Y5yjfpVOW6MACrK8La2FG8WO6k2vDyQTjgThsd5POIODU3
	zl9VdsNhAYvb9eoThJiEzQcR6O1w2CtJjCBbCgLv0AjMrayqPboynSthN+1WZ5spvtUa
	AsKQ==
X-Gm-Message-State: AMCzsaUOxHikJydY4KSQwp3k23Ul0/EyfHfLKuvqsjkXTygoQXa5xZcz
	dNX+uZ6eMWrRXeEMBMJmYFtztFI=
X-Google-Smtp-Source: ABhQp+SzWHfMUXJyLUw3oEosWDHKB+3w845mu1VioB+r0r7pedJw/OqsfIbJvfdIInQylri3RCFeOw==
X-Received: by 10.223.162.139 with SMTP id s11mr4844788wra.231.1509010440931; 
	Thu, 26 Oct 2017 02:34:00 -0700 (PDT)
Received: from pohly-mobl1 (p54BD545B.dip0.t-ipconnect.de. [84.189.84.91])
	by smtp.gmail.com with ESMTPSA id v9sm4327043wre.12.2017.10.26.02.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Oct 2017 02:34:00 -0700 (PDT)
Message-ID: <1509010439.25153.128.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2017 11:33:59 +0200
In-Reply-To: <20171019201047.148436-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171019201047.148436-1-leonardo.sandoval.gonzalez@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] qemu: upgrade to 2.10.1
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
X-List-Received-Date: Thu, 26 Oct 2017 09:34:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-10-19 at 13:10 -0700,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> All CVE patches removed because these are already integrated in
> 2.10.1.
...
>  meta/recipes-devtools/qemu/qemu/glibc-2.25.patch   |  14 -
diff --git a/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
> b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
> index a6908bdbf9..25569449e4 100644
> --- a/meta/recipes-devtools/qemu/qemu/glibc-
> 2.25.patch
> +++ b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
> @@ -72,17 +72,3 @@ diff -uNr qemu-2.8.0.orig/configure qemu-
> 2.8.0/configure
>   # Hold two types of flag:
>   #   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting
> the name on
>   #                                     a thread we have a handle to
> -diff -uNr qemu-2.8.0.orig/include/sysemu/os-posix.h qemu-
> 2.8.0/include/sysemu/os-posix.h
> ---- qemu-2.8.0.orig/include/sysemu/os-posix.h	2016-12-20
> 21:16:48.000000000 +0100
> -+++ qemu-2.8.0/include/sysemu/os-posix.h	2017-02-21
> 19:07:18.009090381 +0100
> -@@ -34,6 +34,10 @@
> - #include <netdb.h>
> - #include <sys/un.h>
> - 
> -+#ifdef CONFIG_SYSMACROS
> -+#include <sys/sysmacros.h>
> -+#endif
> -+
> - void os_set_line_buffering(void);
> - void os_set_proc_name(const char *s);
> - void os_setup_signal_handling(void);

Instead of removing just this hunk from the glibc-2.25.patch, please
remove the entire patch. It is already in 2.10.0.

I was about to send a patch doing just that when I saw your version
update. Here's the commit message for my patch:

    The patch is already present in the upstream 2.10.0. Patching during a
    build succeeds by adding the same hunks again to configure (which
    seems to cause no problems during build) and skipping the one which it
    detects as already applied, but "devtool modify qemu-native" is more
    picky:
    
    ERROR: Applying 'glibc-2.25.patch' failed:
    checking file configure
    Hunk #1 succeeded at 4986 with fuzz 2 (offset 259 lines).
    checking file configure
    Hunk #1 succeeded at 6047 with fuzz 1 (offset 352 lines).
    checking file include/sysemu/os-posix.h
    Reversed (or previously applied) patch detected!  Assume -R? [n]
    Apply anyway? [n]
    Skipping patch.
    1 out of 1 hunk ignored
    ERROR: Function failed: patch_do_patch
    ERROR: Logfile of failure stored in: .../devtooltmp-6_22hcm3/temp/log.do_patch.31897
    NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and 1 failed.
    ERROR: Extracting source for qemu-native failed

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



