Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 41D31772E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:07:38 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c10so5067645pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 09:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=3aiFPAoMZKZjSWtv8iEBAxTPLuV1+5u4oxJf6NwHjT0=;
	b=h7zQAVVoTiCeqdl6VkkAGpC1uDHWHfrEj1S7Lim/g+UlHxrwYC/rfwIOOUJaBlaJs1
	5r6WRYtARhj2ju2omHm+GQZOmUH1vMS0nuBhO1YV74u20vdIFGTHirvy0Vz//k4S1XPc
	+MGBXvnRIoLAJ4p6eQDTtrMHNZyp1Yfe6Ez88nviEFFiqQFlZsQvY2U/tYbEXOOCKL17
	KweV2ziODxMfRtBmU61NpPoG2lw6br9Twx8ku+mh7qXjDFUpeo8TMpkRG79I/55hWoDG
	LkmpgMa1bfnEPZYJ4csghmYsYTw/gRZXJjpn1lydnqBKt4kqNWiJQ2r1YYY37pWnW99L
	k7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3aiFPAoMZKZjSWtv8iEBAxTPLuV1+5u4oxJf6NwHjT0=;
	b=F+EDwXzGGhdl1RdP/Ta9ben9RD28wdoMGhQffjwWWLXSWPSBLKNFuqiJd1ehaJx6Ec
	tflYusRzTO+F/Kw1U/lLCyqvJIu9HAMHnS2jG3IS8BFloJ1sKd0wQcjCgzFtnP2jtcAW
	geGU1c8UDCyrZjoiIjff1jdvP5cE6+yXQoSI6R+nS23phYYuNnblqDnYnGH3rpsxMt/W
	FPDDiotnb54JVPJ9WJUBmNFpp2N/bM4zdx0lKh1IfOAbt9CkLLdmMLZrlQQAHIzEjjQb
	PG9savaV50kN/7xvGOm5G3YpWu0s8VabFFanBEUA/777ZsHgokq9eQMcq9BTKVQ0MMIY
	mvYw==
X-Gm-Message-State: AG10YOT6XCnTCHIJoRPNGGC9AttO3FJQTWhmSauxFsb2FjcIvpUSntDDP3VL4qrzIBD3PQ==
X-Received: by 10.98.65.91 with SMTP id o88mr21226750pfa.114.1454692059285;
	Fri, 05 Feb 2016 09:07:39 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	tp3sm25783064pac.16.2016.02.05.09.07.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 09:07:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri,  5 Feb 2016 09:07:17 -0800
Message-Id: <24720bda4e92e2c73930537cb69f852a786fa139.1454691935.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454691935.git.akuster@mvista.com>
References: <cover.1454691935.git.akuster@mvista.com>
In-Reply-To: <cover.1454691935.git.akuster@mvista.com>
References: <cover.1454691935.git.akuster@mvista.com>
Subject: [PATCH 3/4] curl: Security fix CVE-2016-0754
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
X-List-Received-Date: Fri, 05 Feb 2016 17:07:38 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-0754 curl: remote file name path traversal in curl tool for Windows

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/curl/curl/CVE-2016-0754.patch | 417 +++++++++++++++++++++
 meta/recipes-support/curl/curl_7.44.0.bb           |   3 +-
 2 files changed, 419 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-0754.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-0754.patch b/meta/recipes-support/curl/curl/CVE-2016-0754.patch
new file mode 100644
index 0000000..f0402de
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-0754.patch
@@ -0,0 +1,417 @@
+From b1bb4ca6d8777683b6a549fb61dba36759da26f4 Mon Sep 17 00:00:00 2001
+From: Ray Satiro <raysatiro@yahoo.com>
+Date: Tue, 26 Jan 2016 23:23:15 +0100
+Subject: [PATCH] curl: avoid local drive traversal when saving file (Windows)
+
+curl does not sanitize colons in a remote file name that is used as the
+local file name. This may lead to a vulnerability on systems where the
+colon is a special path character. Currently Windows/DOS is the only OS
+where this vulnerability applies.
+
+CVE-2016-0754
+
+Bug: http://curl.haxx.se/docs/adv_20160127B.html
+
+Upstream-Status: Backport
+http://curl.haxx.se/CVE-2016-0754.patch
+
+CVE: CVE-2016-0754
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/tool_cb_hdr.c  |  40 ++++++------
+ src/tool_doswin.c  | 174 ++++++++++++++++++++++++++++++++++++++++++++---------
+ src/tool_doswin.h  |   2 +-
+ src/tool_operate.c |  29 ++++++---
+ 4 files changed, 187 insertions(+), 58 deletions(-)
+
+diff --git a/src/tool_cb_hdr.c b/src/tool_cb_hdr.c
+index fd208e8..0fca39f 100644
+--- a/src/tool_cb_hdr.c
++++ b/src/tool_cb_hdr.c
+@@ -26,10 +26,11 @@
+ #define ENABLE_CURLX_PRINTF
+ /* use our own printf() functions */
+ #include "curlx.h"
+ 
+ #include "tool_cfgable.h"
++#include "tool_doswin.h"
+ #include "tool_msgs.h"
+ #include "tool_cb_hdr.h"
+ 
+ #include "memdebug.h" /* keep this as LAST include */
+ 
+@@ -112,22 +113,28 @@ size_t tool_header_cb(void *ptr, size_t size, size_t nmemb, void *userdata)
+       /* this expression below typecasts 'cb' only to avoid
+          warning: signed and unsigned type in conditional expression
+       */
+       len = (ssize_t)cb - (p - str);
+       filename = parse_filename(p, len);
+-      if(filename) {
+-        outs->filename = filename;
+-        outs->alloc_filename = TRUE;
+-        outs->is_cd_filename = TRUE;
+-        outs->s_isreg = TRUE;
+-        outs->fopened = FALSE;
+-        outs->stream = NULL;
+-        hdrcbdata->honor_cd_filename = FALSE;
+-        break;
+-      }
+-      else
++      if(!filename)
++        return failure;
++
++#if defined(MSDOS) || defined(WIN32)
++      if(sanitize_file_name(&filename)) {
++        free(filename);
+         return failure;
++      }
++#endif /* MSDOS || WIN32 */
++
++      outs->filename = filename;
++      outs->alloc_filename = TRUE;
++      outs->is_cd_filename = TRUE;
++      outs->s_isreg = TRUE;
++      outs->fopened = FALSE;
++      outs->stream = NULL;
++      hdrcbdata->honor_cd_filename = FALSE;
++      break;
+     }
+   }
+ 
+   return cb;
+ }
+@@ -179,19 +186,16 @@ static char *parse_filename(const char *ptr, size_t len)
+       return NULL;
+     }
+   }
+ 
+   /* scan for the end letter and stop there */
+-  q = p;
+-  while(*q) {
+-    if(q[1] && (q[0] == '\\'))
+-      q++;
+-    else if(q[0] == stop)
++  for(q = p; *q; ++q) {
++    if(*q == stop) {
++      *q = '\0';
+       break;
+-    q++;
++    }
+   }
+-  *q = '\0';
+ 
+   /* make sure the file name doesn't end in \r or \n */
+   q = strchr(p, '\r');
+   if(q)
+     *q = '\0';
+diff --git a/src/tool_doswin.c b/src/tool_doswin.c
+index dd6e8bb..9c6a7a3 100644
+--- a/src/tool_doswin.c
++++ b/src/tool_doswin.c
+@@ -83,46 +83,110 @@ __pragma(warning(pop))
+ #  define _use_lfn(f) ALWAYS_FALSE  /* long file names never available */
+ #elif defined(__DJGPP__)
+ #  include <fcntl.h>                /* _use_lfn(f) prototype */
+ #endif
+ 
+-static const char *msdosify (const char *file_name);
+-static char *rename_if_dos_device_name (char *file_name);
++static char *msdosify(const char *file_name);
++static char *rename_if_dos_device_name(const char *file_name);
+ 
+-/*
+- * sanitize_dos_name: returns a newly allocated string holding a
+- * valid file name which will be a transformation of given argument
+- * in case this wasn't already a valid file name.
+- *
+- * This function takes ownership of given argument, free'ing it before
+- * returning. Caller is responsible of free'ing returned string. Upon
+- * out of memory condition function returns NULL.
+- */
+ 
+-char *sanitize_dos_name(char *file_name)
++/*
++Sanitize *file_name.
++Success: (CURLE_OK) *file_name points to a sanitized version of the original.
++         This function takes ownership of the original *file_name and frees it.
++Failure: (!= CURLE_OK) *file_name is unchanged.
++*/
++CURLcode sanitize_file_name(char **file_name)
+ {
+-  char new_name[PATH_MAX];
++  size_t len;
++  char *p, *sanitized;
++
++  /* Calculate the maximum length of a filename.
++     FILENAME_MAX is often the same as PATH_MAX, in other words it does not
++     discount the path information. PATH_MAX size is calculated based on:
++     <drive-letter><colon><path-sep><max-filename-len><NULL> */
++  const size_t max_filename_len = PATH_MAX - 3 - 1;
++
++  if(!file_name || !*file_name)
++    return CURLE_BAD_FUNCTION_ARGUMENT;
++
++  len = strlen(*file_name);
++
++  if(len >= max_filename_len)
++    len = max_filename_len - 1;
+ 
+-  if(!file_name)
+-    return NULL;
++  sanitized = malloc(len + 1);
+ 
+-  if(strlen(file_name) >= PATH_MAX)
+-    file_name[PATH_MAX-1] = '\0'; /* truncate it */
++  if(!sanitized)
++    return CURLE_OUT_OF_MEMORY;
+ 
+-  strcpy(new_name, msdosify(file_name));
++  strncpy(sanitized, *file_name, len);
++  sanitized[len] = '\0';
+ 
+-  Curl_safefree(file_name);
++  for(p = sanitized; *p; ++p ) {
++    const char *banned;
++    if(1 <= *p && *p <= 31) {
++      *p = '_';
++      continue;
++    }
++    for(banned = "|<>/\\\":?*"; *banned; ++banned) {
++      if(*p == *banned) {
++        *p = '_';
++        break;
++      }
++    }
++  }
+ 
+-  return strdup(rename_if_dos_device_name(new_name));
++#ifdef MSDOS
++  /* msdosify checks for more banned characters for MSDOS, however it allows
++     for some path information to pass through. since we are sanitizing only a
++     filename and cannot allow a path it's important this call be done in
++     addition to and not instead of the banned character check above. */
++  p = msdosify(sanitized);
++  if(!p) {
++    free(sanitized);
++    return CURLE_BAD_FUNCTION_ARGUMENT;
++  }
++  sanitized = p;
++  len = strlen(sanitized);
++#endif
++
++  p = rename_if_dos_device_name(sanitized);
++  if(!p) {
++    free(sanitized);
++    return CURLE_BAD_FUNCTION_ARGUMENT;
++  }
++  sanitized = p;
++  len = strlen(sanitized);
++
++  /* dos_device_name rename will rename a device name, possibly changing the
++     length. If the length is too long now we can't truncate it because we
++     could end up with a device name. In practice this shouldn't be a problem
++     because device names are short, but you never know. */
++  if(len >= max_filename_len) {
++    free(sanitized);
++    return CURLE_BAD_FUNCTION_ARGUMENT;
++  }
++
++  *file_name = sanitized;
++  return CURLE_OK;
+ }
+ 
+-/* The following functions are taken with modification from the DJGPP
+- * port of tar 1.12. They use algorithms originally from DJTAR. */
++/* The functions msdosify, rename_if_dos_device_name and __crt0_glob_function
++ * were taken with modification from the DJGPP port of tar 1.12. They use
++ * algorithms originally from DJTAR.
++ */
+ 
+-static const char *msdosify (const char *file_name)
++/*
++Extra sanitization MSDOS for file_name.
++Returns a copy of file_name that is sanitized by MSDOS standards.
++Warning: path information may pass through. For sanitizing a filename use
++sanitize_file_name which calls this function after sanitizing path info.
++*/
++static char *msdosify(const char *file_name)
+ {
+-  static char dos_name[PATH_MAX];
++  char dos_name[PATH_MAX];
+   static const char illegal_chars_dos[] = ".+, ;=[]" /* illegal in DOS */
+     "|<>\\\":?*"; /* illegal in DOS & W95 */
+   static const char *illegal_chars_w95 = &illegal_chars_dos[8];
+   int idx, dot_idx;
+   const char *s = file_name;
+@@ -199,39 +263,89 @@ static const char *msdosify (const char *file_name)
+     else
+       idx++;
+   }
+ 
+   *d = '\0';
+-  return dos_name;
++  return strdup(dos_name);
+ }
+ 
+-static char *rename_if_dos_device_name (char *file_name)
++/*
++Rename file_name if it's a representation of a device name.
++Returns a copy of file_name, and the copy will have contents different from the
++original if a device name was found.
++*/
++static char *rename_if_dos_device_name(const char *file_name)
+ {
+   /* We could have a file whose name is a device on MS-DOS.  Trying to
+    * retrieve such a file would fail at best and wedge us at worst.  We need
+    * to rename such files. */
+-  char *base;
++  char *p, *base;
+   struct_stat st_buf;
+   char fname[PATH_MAX];
+ 
+   strncpy(fname, file_name, PATH_MAX-1);
+   fname[PATH_MAX-1] = '\0';
+   base = basename(fname);
+   if(((stat(base, &st_buf)) == 0) && (S_ISCHR(st_buf.st_mode))) {
+     size_t blen = strlen(base);
+ 
+-    if(strlen(fname) >= PATH_MAX-1) {
++    if(strlen(fname) == PATH_MAX-1) {
+       /* Make room for the '_' */
+       blen--;
+       base[blen] = '\0';
+     }
+     /* Prepend a '_'.  */
+     memmove(base + 1, base, blen + 1);
+     base[0] = '_';
+-    strcpy(file_name, fname);
+   }
+-  return file_name;
++
++  /* The above stat check does not identify devices for me in Windows 7. For
++     example a stat on COM1 returns a regular file S_IFREG. According to MSDN
++     stat doc that is the correct behavior, so I assume the above code is
++     legacy, maybe MSDOS or DJGPP specific? */
++
++  /* Rename devices.
++     Examples: CON => _CON, CON.EXT => CON_EXT, CON:ADS => CON_ADS */
++  for(p = fname; p; p = (p == fname && fname != base ? base : NULL)) {
++    size_t p_len;
++    int x = (curl_strnequal(p, "CON", 3) ||
++             curl_strnequal(p, "PRN", 3) ||
++             curl_strnequal(p, "AUX", 3) ||
++             curl_strnequal(p, "NUL", 3)) ? 3 :
++            (curl_strnequal(p, "CLOCK$", 6)) ? 6 :
++            (curl_strnequal(p, "COM", 3) || curl_strnequal(p, "LPT", 3)) ?
++              (('1' <= p[3] && p[3] <= '9') ? 4 : 3) : 0;
++
++    if(!x)
++      continue;
++
++    /* the devices may be accessible with an extension or ADS, for
++       example CON.AIR and CON:AIR both access console */
++    if(p[x] == '.' || p[x] == ':') {
++      p[x] = '_';
++      continue;
++    }
++    else if(p[x]) /* no match */
++      continue;
++
++    p_len = strlen(p);
++
++    if(strlen(fname) == PATH_MAX-1) {
++      /* Make room for the '_' */
++      p_len--;
++      p[p_len] = '\0';
++    }
++    /* Prepend a '_'.  */
++    memmove(p + 1, p, p_len + 1);
++    p[0] = '_';
++
++    /* if fname was just modified then the basename pointer must be updated */
++    if(p == fname)
++      base = basename(fname);
++  }
++
++  return strdup(fname);
+ }
+ 
+ #if defined(MSDOS) && (defined(__DJGPP__) || defined(__GO32__))
+ 
+ /*
+diff --git a/src/tool_doswin.h b/src/tool_doswin.h
+index cd216db..fc83f16 100644
+--- a/src/tool_doswin.h
++++ b/src/tool_doswin.h
+@@ -23,11 +23,11 @@
+  ***************************************************************************/
+ #include "tool_setup.h"
+ 
+ #if defined(MSDOS) || defined(WIN32)
+ 
+-char *sanitize_dos_name(char *file_name);
++CURLcode sanitize_file_name(char **filename);
+ 
+ #if defined(MSDOS) && (defined(__DJGPP__) || defined(__GO32__))
+ 
+ char **__crt0_glob_function(char *arg);
+ 
+diff --git a/src/tool_operate.c b/src/tool_operate.c
+index 30d60cb..272ebd4 100644
+--- a/src/tool_operate.c
++++ b/src/tool_operate.c
+@@ -541,30 +541,41 @@ static CURLcode operate_do(struct GlobalConfig *global,
+           if(!outfile) {
+             /* extract the file name from the URL */
+             result = get_url_file_name(&outfile, this_url);
+             if(result)
+               goto show_error;
++
++#if defined(MSDOS) || defined(WIN32)
++            result = sanitize_file_name(&outfile);
++            if(result) {
++              Curl_safefree(outfile);
++              goto show_error;
++            }
++#endif /* MSDOS || WIN32 */
++
+             if(!*outfile && !config->content_disposition) {
+               helpf(global->errors, "Remote file name has no length!\n");
+               result = CURLE_WRITE_ERROR;
+               goto quit_urls;
+             }
+-#if defined(MSDOS) || defined(WIN32)
+-            /* For DOS and WIN32, we do some major replacing of
+-               bad characters in the file name before using it */
+-            outfile = sanitize_dos_name(outfile);
+-            if(!outfile) {
+-              result = CURLE_OUT_OF_MEMORY;
+-              goto show_error;
+-            }
+-#endif /* MSDOS || WIN32 */
+           }
+           else if(urls) {
+             /* fill '#1' ... '#9' terms from URL pattern */
+             char *storefile = outfile;
+             result = glob_match_url(&outfile, storefile, urls);
+             Curl_safefree(storefile);
++
++#if defined(MSDOS) || defined(WIN32)
++            if(!result) {
++              result = sanitize_file_name(&outfile);
++              if(result) {
++                Curl_safefree(outfile);
++                goto show_error;
++              }
++            }
++#endif /* MSDOS || WIN32 */
++
+             if(result) {
+               /* bad globbing */
+               warnf(config->global, "bad output glob!\n");
+               goto quit_urls;
+             }
+-- 
+2.7.0
+
diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
index f6d350e..852c4dd 100644
--- a/meta/recipes-support/curl/curl_7.44.0.bb
+++ b/meta/recipes-support/curl/curl_7.44.0.bb
@@ -12,7 +12,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 # curl likes to set -g0 in CFLAGS, so we stop it
 # from mucking around with debug options
 #
-SRC_URI += " file://configure_ac.patch"
+SRC_URI += " file://configure_ac.patch \
+             file://CVE-2016-0754.patch"
 
 SRC_URI[md5sum] = "6b952ca00e5473b16a11f05f06aa8dae"
 SRC_URI[sha256sum] = "1e2541bae6582bb697c0fbae49e1d3e6fad5d05d5aa80dbd6f072e0a44341814"
-- 
2.3.5


