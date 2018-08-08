Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id CF4CD78DEB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 10:40:02 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id s198-v6so2836549oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 03:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nl/aTT5Ug2aHFbG657iI0ZUp7lTFFKGe8Fhc/qT/J7w=;
	b=IQiUe2XpoC7UqbALm2Qi9FTbZT9qkl6xu1gEHHLy9lhyEB9xZ13Avt2X46nU2e2/zM
	tsALoz1UxhJAPfU8P5emJlFxGxIJssTk2meTnkl6qP9DQsfPc+Qu/woEj5UPRf33K0MR
	26rPpyWSt/jFQog8wjubLuYwBo9O9/MuHkehiFM9HpeNAq1X/0T+iq4DvFxdOE9qxkxX
	wyUwt5MsR1Il0LiOpyybszKV8328eykqjEOpeE6yzCsJyshF1S7p+3otOUoin7gQZx+m
	HrJTrFWZF+tVaQGT+OuQZzUa+Srs/Rx8n2YnQo3QOg4h5SJwazL/Cd5CJ3qn63QW6pUm
	NTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nl/aTT5Ug2aHFbG657iI0ZUp7lTFFKGe8Fhc/qT/J7w=;
	b=JqeVsh6kX80fqyZXdAjlbYr4EGhvRdAayJU8AJVce1m9aRk6PHbwLAogcqGc5eVzly
	+0w70FZdCBbHGCE62QbMtkYfLMB3aSEqCh/uoRNrYfe1PaOrQsVBd6CJ9lTORTlzRPzW
	u6S0HMjPz1anKl4/sbB6h5OpJ1aAFRH6tNrDoml5hMdROjZv4Ltb4yZ0Um+w0qYIfeil
	zDUsYqDGAA3ZtEFGYvd31l6Mbj5O7VFJArV7E9kYJ/UBPi2SK6WSpzuianjcK/okBHau
	a+YNyTh8xTy4EVWPJqiS7h6vlwcjW3wEs+t5V2EWqYR+owDWA4aMG7M2b+uCf6bcWw+h
	ZCmQ==
X-Gm-Message-State: AOUpUlFA9DdrkyPs7QI93l2CpL1X+aZzhwfKUm2V5DjRZLI2d6lCP7b0
	/oEXK7woc1kwPEreGZ0rCVqWHMw6GlXEfdlApdo8Ew==
X-Google-Smtp-Source: AA+uWPxrODwSAnoz1BHNRBvpiV4mp1EfgzX/+P54Gv4/Otm69JILaqbK4Hvbs7fk6WFOWp27t85AQ7nBqjXn4FhJmfs=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr2514753oih.102.1533724803823; 
	Wed, 08 Aug 2018 03:40:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 03:39:43 -0700 (PDT)
In-Reply-To: <06c361481025023e6ad962759e5968bd9c19c0b7.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
	<06c361481025023e6ad962759e5968bd9c19c0b7.1533595822.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2018 11:39:43 +0100
Message-ID: <CAJTo0LZcy+LcFu0stiT5ve4mOy3KCYDH_JRONAxxYAZxY343Pg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/18] ppp: Use openssl for the DES instead of the libcrypt / glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 10:40:03 -0000
Content-Type: text/plain; charset="UTF-8"

Why not use libxcrypt?

Ross

On 6 August 2018 at 23:57, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../ppp/ppp/ppp-2.4.7-DES-openssl.patch       | 84 +++++++++++++++++++
>  meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  5 +-
>  2 files changed, 87 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
>
> diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> new file mode 100644
> index 0000000000..e53f240543
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp/ppp-2.4.7-DES-openssl.patch
> @@ -0,0 +1,84 @@
> +Used openssl for the DES instead of the libcrypt / glibc
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: ppp-2.4.7/pppd/Makefile.linux
> +===================================================================
> +--- ppp-2.4.7.orig/pppd/Makefile.linux
> ++++ ppp-2.4.7/pppd/Makefile.linux
> +@@ -38,7 +38,7 @@ LIBS =
> + # Uncomment the next 2 lines to include support for Microsoft's
> + # MS-CHAP authentication protocol.  Also, edit plugins/radius/Makefile.linux.
> + CHAPMS=y
> +-USE_CRYPT=y
> ++#USE_CRYPT=y
> + # Don't use MSLANMAN unless you really know what you're doing.
> + #MSLANMAN=y
> + # Uncomment the next line to include support for MPPE.  CHAPMS (above) must
> +@@ -132,7 +132,7 @@ endif
> +
> + ifdef NEEDDES
> + ifndef USE_CRYPT
> +-LIBS     += -ldes $(LIBS)
> ++LIBS     += -lcrypto
> + else
> + CFLAGS   += -DUSE_CRYPT=1
> + endif
> +Index: ppp-2.4.7/pppd/pppcrypt.c
> +===================================================================
> +--- ppp-2.4.7.orig/pppd/pppcrypt.c
> ++++ ppp-2.4.7/pppd/pppcrypt.c
> +@@ -64,7 +64,7 @@ u_char *des_key;     /* OUT 64 bit DES key w
> +       des_key[7] = Get7Bits(key, 49);
> +
> + #ifndef USE_CRYPT
> +-      des_set_odd_parity((des_cblock *)des_key);
> ++      DES_set_odd_parity((DES_cblock *)des_key);
> + #endif
> + }
> +
> +@@ -158,25 +158,25 @@ u_char *clear;   /* OUT 8 octets */
> + }
> +
> + #else /* USE_CRYPT */
> +-static des_key_schedule       key_schedule;
> ++static DES_key_schedule       key_schedule;
> +
> + bool
> + DesSetkey(key)
> + u_char *key;
> + {
> +-      des_cblock des_key;
> ++      DES_cblock des_key;
> +       MakeKey(key, des_key);
> +-      des_set_key(&des_key, key_schedule);
> ++      DES_set_key(&des_key, &key_schedule);
> +       return (1);
> + }
> +
> + bool
> +-DesEncrypt(clear, key, cipher)
> ++DesEncrypt(clear, cipher)
> + u_char *clear;        /* IN  8 octets */
> + u_char *cipher;       /* OUT 8 octets */
> + {
> +-      des_ecb_encrypt((des_cblock *)clear, (des_cblock *)cipher,
> +-          key_schedule, 1);
> ++      DES_ecb_encrypt((DES_cblock *)clear, (DES_cblock *)cipher,
> ++          &key_schedule, 1);
> +       return (1);
> + }
> +
> +@@ -185,8 +185,8 @@ DesDecrypt(cipher, clear)
> + u_char *cipher;       /* IN  8 octets */
> + u_char *clear;        /* OUT 8 octets */
> + {
> +-      des_ecb_encrypt((des_cblock *)cipher, (des_cblock *)clear,
> +-          key_schedule, 0);
> ++      DES_ecb_encrypt((DES_cblock *)cipher, (DES_cblock *)clear,
> ++          &key_schedule, 0);
> +       return (1);
> + }
> +
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> index a1bb7d71c1..f4646bd693 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> @@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
>  SECTION = "console/network"
>  HOMEPAGE = "http://samba.org/ppp/"
>  BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
> -DEPENDS = "libpcap"
> +DEPENDS = "libpcap openssl"
>  LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
>  LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
>                      file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
> @@ -32,6 +32,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
>             file://fix-CVE-2015-3310.patch \
>             file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
>             file://0001-ppp-Remove-unneeded-include.patch \
> +           file://ppp-2.4.7-DES-openssl.patch \
>  "
>
>  SRC_URI_append_libc-musl = "\
> @@ -49,7 +50,7 @@ EXTRA_OECONF = "--disable-strip"
>  # Package Makefile computes CFLAGS, referencing COPTS.
>  # Typically hard-coded to '-O2 -g' in the Makefile's.
>  #
> -EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${S}/include"'
> +EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl -I${S}/include"'
>
>  do_configure () {
>         oe_runconf
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

