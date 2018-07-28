Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0DE602D9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 20:36:07 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id h1-v6so3201671uao.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6HBnIq13bFsPP0bJeud4OB3Nd/qXUtJpSR/OSqZT9YY=;
	b=WktXqP6DrTD1mX+cOsz98NpEOrNX2gkxEcDWV5B/Ljx570wBQ6/X572oHQSIFDJUpZ
	sYqm2+8GhHPprm9h4CvuOu0DBvVPJyMhSCjq8QYLEompjwcnKODXEhDXVoXxtO7qb3gj
	FxJXcW7DkWSz3vKhsAnVosmhEcQhnfY4DheAoPRGXXxhLJouqZ8g/TlhHeYPqy7gq6Qm
	kMm06Z3F4i6g8ToyQ5wxyxBK1QQVVQ8yWfl0P2aMswFns9BON7pnvR5qudaUg5b76mLM
	dRDowvLh9yzndrbqZspAkeBK3Wq6I9HMA4oP0OvIffaic/kEY3N6NBQsOncmVvDofAes
	rzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6HBnIq13bFsPP0bJeud4OB3Nd/qXUtJpSR/OSqZT9YY=;
	b=nvcTk8QlHkjHu7ea1FqzUXQOUXH6W/aWxJ/UhnYb/T3ZxMcwYyJ8msY4L1ufdn6Mdi
	wIdh6YztutZcZsCSFOq0IugGSku3M9ht1GrXAUhLgpX7DWLQzyTJo8HjWIPzUVdzuwAV
	VB6ncewiF66ep+lUM1aYK3YjEECkC2GG7O7bUROGILDS3jqb1Ks5skrgpzvMqqpT9+11
	Gm4OQl75XLDo1BV77Izng1nQ9oCdIFZPihSfz/RmP9xbddBowS/Yrh2B+4ttiE132eBw
	imU7AOkG4avMsyds9gUKPwOMLanpPY9qClzDH5T+uuwKwqYUUbIVU5HUamhfeLy4kT1F
	GHvg==
X-Gm-Message-State: AOUpUlFGEn0sXToaid5lwK/V1N8OR7++0lZrKgAVCnknuo3T/lSOWOUH
	5GmqGtzkrmBIBmaPfAII98wrdMe1irZrMPFI9Ek=
X-Google-Smtp-Source: AAOMgpfCeuyxFBbn23n+pDXs4I3fdeLVUqdsvKwv2iGBBJgAam1rfjIzphj3L9SPyX02g/cdxVX3Rhf2jNWzx2xyiWM=
X-Received: by 2002:ab0:1544:: with SMTP id p4-v6mr8249685uae.81.1532810166555;
	Sat, 28 Jul 2018 13:36:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Sat, 28 Jul 2018 13:36:06 -0700 (PDT)
In-Reply-To: <CAJTo0Lb1N4=WQ0hXWKEGM3kPr-_BkG-SNN-00yTOEc31u7mJ_w@mail.gmail.com>
References: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
	<1532734081-24485-4-git-send-email-armccurdy@gmail.com>
	<CAJTo0Lb1N4=WQ0hXWKEGM3kPr-_BkG-SNN-00yTOEc31u7mJ_w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 28 Jul 2018 13:36:06 -0700
Message-ID: <CAJ86T=VO0mnnMk1aw1cnbRdKFX3ii9Q4K6x4B4aBCcu19Yv3ng@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] openssl_1.0: add PACKAGECONFIG option to control manpages
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
X-List-Received-Date: Sat, 28 Jul 2018 20:36:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 28, 2018 at 4:57 AM, Burton, Ross <ross.burton@intel.com> wrote:
> You might want to use the manpages class here.

Thanks. I was wondering if I could justify disabling the manpages by
default for the target builds too and the api-documentation distro
feature does exactly that :-)

> On 28 July 2018 at 00:28, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Creating the openssl manpages, which happens as part of do_install(),
>> can take a significant amount of time (e.g. ~50 seconds on a quad
>> core laptop). Provide a PACKAGECONFIG option to allow creation of the
>> manpages to be skipped completely if not required. Leave manpages
>> enabled by default for target builds, but disable by default for
>> -native and -nativesdk.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  .../0001-allow-manpages-to-be-disabled.patch       | 31 ++++++++++++++++++++++
>>  .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  8 ++++--
>>  2 files changed, 37 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
>> new file mode 100644
>> index 0000000..3f7d649
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
>> @@ -0,0 +1,31 @@
>> +From e1c39b80b01d4d18feeadfdc6e45a3e1dd110634 Mon Sep 17 00:00:00 2001
>> +From: Andre McCurdy <armccurdy@gmail.com>
>> +Date: Fri, 27 Jul 2018 21:41:06 +0000
>> +Subject: [PATCH] allow manpages to be disabled
>> +
>> +Define OE_DISABLE_MANPAGES (via environment or the make command line)
>> +to skip creation and installation of manpages.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> +---
>> + Makefile.org | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile.org b/Makefile.org
>> +index ed98d2a..747d8cb 100644
>> +--- a/Makefile.org
>> ++++ b/Makefile.org
>> +@@ -549,7 +549,7 @@ dist:
>> +       @$(MAKE) SDIRS='$(SDIRS)' clean
>> +       @$(MAKE) TAR='$(TAR)' TARFLAGS='$(TARFLAGS)' $(DISTTARVARS) tar
>> +
>> +-install: all install_docs install_sw
>> ++install: all $(if $(OE_DISABLE_MANPAGES),,install_docs) install_sw
>> +
>> + install_sw:
>> +       @$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> index 2804203..527be72 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> @@ -43,6 +43,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>>             file://Use-SHA256-not-MD5-as-default-digest.patch \
>>             file://0001-Fix-build-with-clang-using-external-assembler.patch \
>>             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
>> +           file://0001-allow-manpages-to-be-disabled.patch \
>>             "
>>
>>  SRC_URI_append_class-target = " \
>> @@ -61,17 +62,20 @@ UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
>>
>>  inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
>>
>> -PACKAGECONFIG ?= "cryptodev-linux"
>> +PACKAGECONFIG ?= "cryptodev-linux manpages"
>>  PACKAGECONFIG_class-native = ""
>>  PACKAGECONFIG_class-nativesdk = ""
>>
>> -PACKAGECONFIG[perl] = ",,,"
>>  PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
>> +PACKAGECONFIG[manpages] = ",,,"
>> +PACKAGECONFIG[perl] = ",,,"
>>
>>  # Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
>>  # vulnerability
>>  EXTRA_OECONF = "no-ssl3"
>>
>> +EXTRA_OEMAKE = "${@bb.utils.contains('PACKAGECONFIG', 'manpages', '', 'OE_DISABLE_MANPAGES=1', d)}"
>> +
>>  export OE_LDFLAGS = "${LDFLAGS}"
>>
>>  # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

