Return-Path: <marek.vasut@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id BB9466C4DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 20:53:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f188so360942wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 12:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=Oa4kT9jEBfgezgQV1cwHu18YhhtmxX25IT8pmJHo7QU=;
	b=tutvJQRASzUli1LVJRrewo76mgZanwYpGaCSM8zfaWIqeLRSsCnygBhNFmYCPkm3L8
	oAdTDc62At9N8cxYbvaAQqTmLYzoJG+v08efBLvGV/WinuekQG8+IojZbBtduoXj2U5N
	7rFzVN5sdOBUpZUtjX0ZungE8xlqs2eboyniJTNWeiFzkTYcuDRvh/rcRCpGPvZ2ukur
	3Szg2oYMxjScnTE2BI6rs4m00yDZDux7eAs+IQBMfcjBhIRq3KuaxYuD1BHtQGnafZoP
	az2R1FOwrUqXwpcz/eujJ6aUuUmFSiS+WVZ1m8ZtDZLV/ecVN+N11+4Cd20xruYDvnYm
	oHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language;
	bh=Oa4kT9jEBfgezgQV1cwHu18YhhtmxX25IT8pmJHo7QU=;
	b=cDu8BU+X0H2bvenpPXolF1MbFeTb3UmcjNtoVQtKUlO9WVw9wPrTegXq9L0RdW17GK
	pLtX0QvqLUXMjXpXsK5HtU7N5INL5h4bONrcGlD9pRcOCp0cSRm+hNbt5tB9nlNx+uJG
	L/xg+ikpS7BJ9doFM4ToWBu3Gr+32UhqnWYjs6BnEVNunuZ6h/sI3kedSZRDOHOokJpJ
	lWZPR4qhevxl0B/yviDd2zscWEEEfJRK0b9pV0qjxAgqtRKvPUaBjKDKHqwWV+T49V2r
	7cspm2qIMGzCkh4LH6Z4KbKc9Zl2/UlEfwzgB1hLHKL8Ly3pmNVt49hguL7WZ9B3CGk/
	72Pw==
X-Gm-Message-State: AJcUukd2YxIa4idSQiVIVdrHcxXpnCIMDMBmRhMSSPs8SAk6JcYgLrrc
	jWDgKUhIPvk8AKMzt5UAFF8ij+s/
X-Google-Smtp-Source: ALg8bN7Q50wxj2VMrhbcn2Q9xMZXkyncANLJ473ihaNXgoTtDn2BT0vW30VmTqAJtqwmnzVSm3VMAw==
X-Received: by 2002:a1c:9c0a:: with SMTP id f10mr303491wme.73.1547153618013;
	Thu, 10 Jan 2019 12:53:38 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
	[86.49.110.70]) by smtp.gmail.com with ESMTPSA id
	c15sm14250700wml.27.2019.01.10.12.53.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 12:53:37 -0800 (PST)
To: akuster808 <akuster808@gmail.com>, Ferry Toth <ftoth@telfort.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <bb4e7e77-fc77-d180-cf50-aecc92c42c24@telfort.nl>
	<af7fc6ac-01d9-8132-6ca7-1586afc3bc57@gmail.com>
	<34a5a2d4-f6bc-328d-d535-54dcbf55af28@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <b1c588b5-ce46-618d-3013-56aa2909c79b@gmail.com>
Date: Thu, 10 Jan 2019 21:52:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <34a5a2d4-f6bc-328d-d535-54dcbf55af28@gmail.com>
Subject: Re: Sudden errors building Sumo
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
X-List-Received-Date: Thu, 10 Jan 2019 20:53:38 -0000
X-Groupsio-MsgNum: 119945
Content-Type: multipart/mixed; boundary="------------696D57AFEA2BCE794C872032"
Content-Language: en-US

--------------696D57AFEA2BCE794C872032
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 1/10/19 9:49 PM, Marek Vasut wrote:
> On 1/10/19 9:48 PM, akuster808 wrote:
>>
>>
>> On 1/10/19 8:23 AM, Ferry Toth wrote:
>>> After a new checkout I am experiencing multiple errors building Sumo
>>> that might be related:
>>> bison-3.0.4
>>>
>>> cross-localedef-native_2.27
>>>
>>> coreutils-8.29
>>>
>>> On another machine with slightly out-of-date Sumo these problems do
>>> not occur.
>>>
>>>
>>> Detail below.
>>>
>>>
>>> Any ideas how to fix?
>> Can you provide how you are building this ie, local.conf, MACHINE and host
>>
>> What are your before and after commit hashes used?
>>
>> - armin
>>>
>>> Ferry
>>>
>>>
>>> virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-devtools/bison/bison_3.0.4.bb:do_compile
>>>
>>>
>>> | ../bison-3.0.4/lib/fseterr.c: In function 'fseterr':
>>> | ../bison-3.0.4/lib/fseterr.c:77:3: error: #error "Please port gnulib
>>> fseterr.c to your platform! Look at the definitions of ferror and
>>> clearerr on your system, then report this to bug-gnulib."
>>> | #error "Please port gnulib fseterr.c to your platform! Look at the
>>> definitions of ferror and clearerr on your system, then report this to
>>> bug-gnulib."
>>> | ^~~~~
>>>
>>>
>>> /home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/glibc/cross-localedef-native_2.27.bb:do_compile
>>>
>>>
>>> | /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld:
>>> argp-fmtstream.c:(.text+0x525): undefined reference to `_IO_fwide'
>>> | /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld:
>>> argp-help.o: in function `argp_failure':
>>> | argp-help.c:(.text+0x20b3): undefined reference to `_IO_fwide'
>>> | collect2: error: ld returned 1 exit status
>>>
>>>
>>> virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/coreutils/coreutils_8.29.bb:do_compile
>>>
>>>
>>> | ../coreutils-8.29/lib/freadseek.c: In function 'freadptrinc':
>>> | ../coreutils-8.29/lib/freadseek.c:68:3: error: #error "Please port
>>> gnulib freadseek.c to your platform! Look at the definition of getc,
>>> getc_unlocked on your system, then report this to bug-gnulib."
>>> | #error "Please port gnulib freadseek.c to your platform! Look at the
>>> definition of getc, getc_unlocked on your system, then report this to
>>> bug-gnulib."
>>> | ^~~~~
> 
> Sounds like one of those glibc-2.28 problems ?

Oh, in fact, I have this fixed locally, didn't get to sending the
patches out, see the two attached patches. One is backport from
oe-core/master , the other is something I grab'd from who knows where,
feel free to tweak the patches and post them.

-- 
Best regards,
Marek Vasut

--------------696D57AFEA2BCE794C872032
Content-Type: text/x-patch;
 name="0001-cross-localedef.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-cross-localedef.patch"

From 0c01a1dc3bc821acffb0e00d4831ed3cb94b685d Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Thu, 20 Dec 2018 17:10:54 +0100
Subject: [PATCH] cross-localedef

Signed-off-by: Marek Vasut <marex@denx.de>
---
 .../glibc/cross-localedef-native_2.27.bb      |  1 +
 ...ll-_IO_fwide-if-_LIBC-is-not-defined.patch | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
index 5e92eb71d5..e270675651 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://archive-path.patch \
+	   file://0001-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc/0001-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch b/meta/recipes-core/glibc/glibc/0001-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch
new file mode 100644
index 0000000000..2dac4865cc
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch
@@ -0,0 +1,72 @@
+From 3a67e81d7527363a96af095a5af03b6201b82e9d Mon Sep 17 00:00:00 2001
+From: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
+Date: Thu, 29 Nov 2018 17:56:55 +0000
+Subject: [PATCH] argp: do not call _IO_fwide() if _LIBC is not defined
+
+_IO_fwide() is defined in libio.h file. This file is included only
+when _LIBC is defined.
+
+So, in case of compilation of these files without _LIBC definition,
+the compilation failed due to this unknown function.
+
+Now this function is called when libio.h file is included.
+
+(Change merged from gnulib.  Tested on x86_64.)
+
+	* argp/argp-fmtstream.c (__argp_fmtstream_update): Use [_LIBC]
+	conditional on calls to _IO_fwide and putwc_unlocked.  (Merge from
+	gnulib.)
+	* argp/argp-help.c (__argp_failure): Likewise.
+---
+ ChangeLog             | 7 +++++++
+ argp/argp-fmtstream.c | 4 ++++
+ argp/argp-help.c      | 2 ++
+ 3 files changed, 13 insertions(+)
+
+diff --git a/argp/argp-fmtstream.c b/argp/argp-fmtstream.c
+index e43a0c7cf1..e9e4c0e5cc 100644
+--- a/argp/argp-fmtstream.c
++++ b/argp/argp-fmtstream.c
+@@ -149,9 +149,11 @@ __argp_fmtstream_update (argp_fmtstream_t fs)
+ 	      size_t i;
+ 	      for (i = 0; i < pad; i++)
+ 		{
++#ifdef _LIBC
+ 		  if (_IO_fwide (fs->stream, 0) > 0)
+ 		    putwc_unlocked (L' ', fs->stream);
+ 		  else
++#endif
+ 		    putc_unlocked (' ', fs->stream);
+ 		}
+ 	    }
+@@ -312,9 +314,11 @@ __argp_fmtstream_update (argp_fmtstream_t fs)
+ 	      *nl++ = ' ';
+ 	  else
+ 	    for (i = 0; i < fs->wmargin; ++i)
++#ifdef _LIBC
+ 	      if (_IO_fwide (fs->stream, 0) > 0)
+ 		putwc_unlocked (L' ', fs->stream);
+ 	      else
++#endif
+ 		putc_unlocked (' ', fs->stream);
+ 
+ 	  /* Copy the tail of the original buffer into the current buffer
+diff --git a/argp/argp-help.c b/argp/argp-help.c
+index 2b6b0775d6..a17260378c 100644
+--- a/argp/argp-help.c
++++ b/argp/argp-help.c
+@@ -1873,9 +1873,11 @@ __argp_failure (const struct argp_state *state, int status, int errnum,
+ #endif
+ 	    }
+ 
++#ifdef _LIBC
+ 	  if (_IO_fwide (stream, 0) > 0)
+ 	    putwc_unlocked (L'\n', stream);
+ 	  else
++#endif
+ 	    putc_unlocked ('\n', stream);
+ 
+ #if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
+-- 
+2.19.2
+
-- 
2.20.1


--------------696D57AFEA2BCE794C872032
Content-Type: text/x-patch;
 name="0001-bison-Fix-build-break-with-glibc-2.28.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bison-Fix-build-break-with-glibc-2.28.patch"

From 5c0b240f6c18f14a1793b231f5cdedb417563ea2 Mon Sep 17 00:00:00 2001
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Aug 2018 15:57:04 -0700
Subject: [PATCH] bison: Fix build break with glibc 2.28

(From OE-Core rev: 741415c58b3565764000028c26efd081212eb989)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/bison/bison/gnulib.patch | 21 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb    |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch

diff --git a/meta/recipes-devtools/bison/bison/gnulib.patch b/meta/recipes-devtools/bison/bison/gnulib.patch
new file mode 100644
index 0000000000..7eaf0ce0fa
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/gnulib.patch
@@ -0,0 +1,21 @@
+Fix gnulib issues found with glibc 2.28 libio.h removal
+
+see
+https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: bison-3.0.4/lib/fseterr.c
+===================================================================
+--- bison-3.0.4.orig/lib/fseterr.c
++++ bison-3.0.4/lib/fseterr.c
+@@ -29,7 +29,7 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_flags |= _IO_ERR_SEEN;
+ #elif defined __sferror || defined __DragonFly__ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin */
+   fp_->_flags |= __SERR;
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index 58728f5021..cc155f0fbe 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://dont-depend-on-help2man.patch.patch \
            file://0001-src-local.mk-fix-parallel-issue.patch \
            file://add-with-bisonlocaledir.patch \
+           file://gnulib.patch \
 "
 
 # No point in hardcoding path to m4, just use PATH
-- 
2.20.1


--------------696D57AFEA2BCE794C872032--
