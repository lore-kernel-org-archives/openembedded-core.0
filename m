Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC957F277
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 18:09:16 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m3so8216227pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RLjW0VwXHeGSpUs/Pu2PPk/btHIWgZNfmcLDbYdawBc=;
	b=RmmVr19vl4lAiSZLK1FIJQihfZK2mXzrr8v+biXMrsUG+9G9KhZFkikfk5yn16Oq4N
	5SDdoylhEjJt6LT75HNB8RM2jCyLhG6P4qRtO1sA376wKr/yoLxY+bcDjyKhb8mw0GoM
	eYQHwLI+cqILcVRFxj6VSRxZatpMhBB63LQsKbNIurCEkd1HjmAX/fcvUtGdkNUD2ryH
	XpQH6HgGGsuRbm618wYFN3LZp/hebtr2syZVcEVGk4GXqrMVwsR12e0p4TJTDY7KSW6W
	O6IJYIuL4BsgcN2FKcOrsC5TSptdK2d23EYbIIyycCwTtKKnJBMOPT48fLjsBgGTQMuD
	tBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=RLjW0VwXHeGSpUs/Pu2PPk/btHIWgZNfmcLDbYdawBc=;
	b=FTp2qToOcJCjlemLVY2fUJt4A7pw1IksdQw8QESzPGTBvLYwSeInyg8uwnAj75GKOF
	38oCfvXGwv89yMFOLRn4hr7w2ccbqONdZv1G9LgzeSPBrlWa8n4ATnFAJDyPPDPOCxTU
	KmDM7GxlSzsX0OcwsxhOmr17yblLbZGMh0SrHsUaSIRgF/UIoAaJto07/hDImQv7aBCX
	ReNUeVZLFv3cl+nVlQ7cB7GvZ/RO97+wo0RabTFSNiuy3KUZHX65GkTNBBPkVbaAl/ZN
	8h9dCmzlGidpr64k8u7K5OcB9ShovN8TlQHirv5xpaG1Z1ioLYgo51CZeEDb1Nah9CtZ
	bVqw==
X-Gm-Message-State: APjAAAXG1YXefZc5UcRBdLzBOtDDxMGbxhtIhinFQdmNWzIVnExby8gP
	9sPkasHxr3DGAmatIa/RJIU=
X-Google-Smtp-Source: APXvYqw7u7iCg/htG06MKUXYkXhwKu0nY+mv6+fsyY0PbkCoU8i8E/LWsIJNJexYqBj9Oqf6+FPl6w==
X-Received: by 2002:a65:6850:: with SMTP id q16mr23636245pgt.423.1568052557826;
	Mon, 09 Sep 2019 11:09:17 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:40d0:e8db:d820:c793?
	([2601:202:4180:c33:40d0:e8db:d820:c793])
	by smtp.gmail.com with ESMTPSA id
	c127sm23610260pfb.5.2019.09.09.11.09.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Sep 2019 11:09:17 -0700 (PDT)
To: Sean Nyekjaer <sean@geanix.com>, openembedded-core@lists.openembedded.org
References: <20190908173117.101506-1-sean@geanix.com>
	<20190908173117.101506-2-sean@geanix.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <0caae0af-496f-98e3-1fba-a6ee727d5630@gmail.com>
Date: Mon, 9 Sep 2019 11:09:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190908173117.101506-2-sean@geanix.com>
Subject: Re: [warrior][PATCH] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Mon, 09 Sep 2019 18:09:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/8/19 10:31 AM, Sean Nyekjaer wrote:
> Based on poky master, but for version 1.35

thanks.

can you include the patch fixup in master too?

https://git.openembedded.org/openembedded-core/commit/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch?id=1418581aa22f37c5d7d9a686c1c387149954e9b2

- armin
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  .../libgpg-error-1.35-gawk5-support.patch     | 160 ++++++++++++++++++
>  .../libgpg-error/libgpg-error_1.35.bb         |   1 +
>  2 files changed, 161 insertions(+)
>  create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
>
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
> new file mode 100644
> index 0000000000..bbb38a60ca
> --- /dev/null
> +++ b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
> @@ -0,0 +1,160 @@
> +From 37069826e497d6af01e3e48fe5d2220ae7f85449 Mon Sep 17 00:00:00 2001
> +From: NIIBE Yutaka <gniibe@fsij.org>
> +Date: Mon, 15 Apr 2019 15:10:44 +0900
> +Subject: [PATCH] awk: Prepare for Gawk 5.0.
> +
> +* src/Makefile.am: Use pkg_namespace (instead of namespace).
> +* src/mkerrnos.awk: Likewise.
> +* lang/cl/mkerrcodes.awk: Don't escape # in regexp.
> +* src/mkerrcodes.awk, src/mkerrcodes1.awk, src/mkerrcodes2.awk: Ditto.
> +
> +--
> +
> +In Gawk 5.0, regexp routines are replaced by Gnulib implementation,
> +which only allows escaping specific characters.
> +
> +GnuPG-bug-id: 4459
> +Reported-by: Marius Schamschula
> +Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
> +Upstream-Status: Backport [https://dev.gnupg.org/T4459]
> +(cherry picked from commit 7865041c77f4f7005282f10f9b6666b19072fbdf)
> +---
> + lang/cl/mkerrcodes.awk |  2 +-
> + src/Makefile.am        |  2 +-
> + src/mkerrcodes.awk     |  2 +-
> + src/mkerrcodes1.awk    |  2 +-
> + src/mkerrcodes2.awk    |  2 +-
> + src/mkerrnos.awk       |  2 +-
> + src/mkstrtable.awk     | 10 +++++-----
> + 7 files changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/lang/cl/mkerrcodes.awk b/lang/cl/mkerrcodes.awk
> +index ae29043..9a1fc18 100644
> +--- a/lang/cl/mkerrcodes.awk
> ++++ b/lang/cl/mkerrcodes.awk
> +@@ -122,7 +122,7 @@ header {
> + }
> + 
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
> + 
> +   if (/^$/)
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 42998e4..0ceac9f 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -281,7 +281,7 @@ code-from-errno.h: mkerrcodes Makefile
> + 
> + errnos-sym.h: Makefile mkstrtable.awk errnos.in
> + 	$(AWK) -f $(srcdir)/mkstrtable.awk -v textidx=2 -v nogettext=1 \
> +-		-v prefix=GPG_ERR_ -v namespace=errnos_ \
> ++		-v prefix=GPG_ERR_ -v pkg_namespace=errnos_ \
> + 		$(srcdir)/errnos.in >$@
> + 
> + 
> +diff --git a/src/mkerrcodes.awk b/src/mkerrcodes.awk
> +index 46d436c..e9c857c 100644
> +--- a/src/mkerrcodes.awk
> ++++ b/src/mkerrcodes.awk
> +@@ -85,7 +85,7 @@ header {
> + }
> + 
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
> + 
> +   if (/^$/)
> +diff --git a/src/mkerrcodes1.awk b/src/mkerrcodes1.awk
> +index a771a73..4578e29 100644
> +--- a/src/mkerrcodes1.awk
> ++++ b/src/mkerrcodes1.awk
> +@@ -81,7 +81,7 @@ header {
> + }
> + 
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
> + 
> +   if (/^$/)
> +diff --git a/src/mkerrcodes2.awk b/src/mkerrcodes2.awk
> +index ea58503..188f7a4 100644
> +--- a/src/mkerrcodes2.awk
> ++++ b/src/mkerrcodes2.awk
> +@@ -91,7 +91,7 @@ header {
> + }
> + 
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
> + 
> +   if (/^$/)
> +diff --git a/src/mkerrnos.awk b/src/mkerrnos.awk
> +index f79df66..15b1aad 100644
> +--- a/src/mkerrnos.awk
> ++++ b/src/mkerrnos.awk
> +@@ -83,7 +83,7 @@ header {
> + }
> + 
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
> + 
> +   if (/^$/)
> +diff --git a/src/mkstrtable.awk b/src/mkstrtable.awk
> +index c9de9c1..285e45f 100644
> +--- a/src/mkstrtable.awk
> ++++ b/src/mkstrtable.awk
> +@@ -77,7 +77,7 @@
> + #
> + # The variable prefix can be used to prepend a string to each message.
> + #
> +-# The variable namespace can be used to prepend a string to each
> ++# The variable pkg_namespace can be used to prepend a string to each
> + # variable and macro name.
> + 
> + BEGIN {
> +@@ -102,7 +102,7 @@ header {
> +       print "/* The purpose of this complex string table is to produce";
> +       print "   optimal code with a minimum of relocations.  */";
> +       print "";
> +-      print "static const char " namespace "msgstr[] = ";
> ++      print "static const char " pkg_namespace "msgstr[] = ";
> +       header = 0;
> +     }
> +   else
> +@@ -110,7 +110,7 @@ header {
> + }
> + 
> + !header {
> +-  sub (/\#.+/, "");
> ++  sub (/#.+/, "");
> +   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
> + 
> +   if (/^$/)
> +@@ -150,7 +150,7 @@ END {
> +   else
> +     print "  gettext_noop (\"" last_msgstr "\");";
> +   print "";
> +-  print "static const int " namespace "msgidx[] =";
> ++  print "static const int " pkg_namespace "msgidx[] =";
> +   print "  {";
> +   for (i = 0; i < coded_msgs; i++)
> +     print "    " pos[i] ",";
> +@@ -158,7 +158,7 @@ END {
> +   print "  };";
> +   print "";
> +   print "static GPG_ERR_INLINE int";
> +-  print namespace "msgidxof (int code)";
> ++  print pkg_namespace "msgidxof (int code)";
> +   print "{";
> +   print "  return (0 ? 0";
> + 
> +-- 
> +2.23.0
> +
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
> index 57ac143fd5..37c298e151 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
> @@ -14,6 +14,7 @@ SECTION = "libs"
>  UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
>  SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
>             file://pkgconfig.patch \
> +           file://libgpg-error-1.35-gawk5-support.patch \
>  	  "
>  
>  SRC_URI[md5sum] = "2808a9e044f883f7554c5ba6a380b711"


