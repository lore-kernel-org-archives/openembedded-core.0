Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 43B6D745C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 04:26:30 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c126-v6so1563721qkd.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 21:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7HQVZFUJyz/xtNE5CzNEkUTS0QjcHlRN9TsX1Jv7UI4=;
	b=N+IqzcKH+wFRMrRrQzv+qnS5qd5a57V0blEg8ZFeHk/9HwcxeAEj066Cq7ZctLp9eE
	ZSQMCR/gNXwc3y6bFEx66YnOvNAub5f+SG1IQJXWbHjTMsParHiD/H2ptZHX4fJYdhh/
	alzH0w9Ab5vD/dJfiqS+6oKptMrrHqTu5XNA+ZcKwc64FGvxKIhSXAQQrWNYv2ozq50o
	fp4g8FrhuuvrPPmqnPS32RkLSQdeigYwtHp9Tq2viT917KoL6pV1OeA522h1meekjAjw
	+QSB8MeksTHldY2AZY0t6TP9v6IUZn9nhFi2pVvAIZ8z31J/81sGnyR/UhhzOLQ67MUg
	6L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7HQVZFUJyz/xtNE5CzNEkUTS0QjcHlRN9TsX1Jv7UI4=;
	b=cDQZBLttspqVML86NqVnGNtAGZddSODusBqmaHwRsJbzPeMlNMs4BDMaMb2ZeECzLz
	/m/90xq1gWdA5NjCWGcAcQcc/V/uggFoxqX4KvqkttjlEwVUYobO6cK/qPfhrX7MdRRL
	lwaRGaWWzMpTt+TiDA9h1enGbzZyVR6nnxgqyIyYM0kKO/0+VR0mYuiPcUb5tnPtKbxL
	U0sXVC3Psd9SY9go/oNdkrvYrsRoD0t7jB62pwK8pxtlykJX2ZUWPz0uAwwa02zaWwAk
	kX7J4oZ6+wpu7trWdJ6CQY/iyC2fCIIeTGLiQSeWNkx8Z7yJ7RNpHYxt3MkxJvPf/uUR
	DBMA==
X-Gm-Message-State: APzg51Alw+C0bju6vKOyEs07e2FLykFN1ZGL619ak4dHH8FZXKFaNabb
	+LVkRvi7RxFHyq5hnLD+Bzo1oSSq4qMaGUpIw9Y=
X-Google-Smtp-Source: ANB0Vdb9Kv86sw3AUBy72aGStRiV3p8ahs9SxOpwNsM7uks3IKbs0PIB123FGwjwLYKEM0d/w/Qlqf2VHpLbd1pFA3A=
X-Received: by 2002:a37:60c7:: with SMTP id
	u190-v6mr16237599qkb.222.1536035190930; 
	Mon, 03 Sep 2018 21:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<010e93a91991128a31f1dd4e30c08e425f733ec4.1535451643.git.alex.kanavin@gmail.com>
	<8e690a6b-467b-a25e-c5f0-5b29147fbb4f@gmail.com>
	<CAJ86T=XRqQ=_z3Mqwox5kfe4ngyBrZW8rw=+t-G-B94S+xk8MA@mail.gmail.com>
In-Reply-To: <CAJ86T=XRqQ=_z3Mqwox5kfe4ngyBrZW8rw=+t-G-B94S+xk8MA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Sep 2018 21:26:04 -0700
Message-ID: <CAMKF1sooRaTSH7YgK3+B1W1sd1OwKkCyxu1fe=kUw49mUUmgtQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 3/6] openssl: update to 1.1.1
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
X-List-Received-Date: Tue, 04 Sep 2018 04:26:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 3, 2018 at 8:17 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Mon, Sep 3, 2018 at 3:53 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On 8/28/18 3:23 AM, Alexander Kanavin wrote:
> >> At the moment 1.1.1 is in pre-release stage, however the final release
> >> should be available within a few weeks. The major selling point is that
> >> it supports the new TLS 1.3 specification. It will also be the new long
> >> term support version. More information:
> >>
> >> https://www.openssl.org/policies/releasestrat.html
> >>
> >> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> >> ---
> >>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch | 43 ----------------------
> >>  ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch | 39 --------------------
> >>  .../{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb}   | 23 +++++++-----
> >>  3 files changed, 14 insertions(+), 91 deletions(-)
> >>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
> >>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
> >>  rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb} (83%)
> >>
> >> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch b/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
> >> deleted file mode 100644
> >> index 6ce4e47..0000000
> >> --- a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
> >> +++ /dev/null
> >> @@ -1,43 +0,0 @@
> >> -From 08face4353d80111973aba9c1304c92158cfad0e Mon Sep 17 00:00:00 2001
> >> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> -Date: Tue, 28 Mar 2017 16:40:12 +0300
> >> -Subject: [PATCH] Take linking flags from LDFLAGS env var
> >> -
> >> -This fixes "No GNU_HASH in the elf binary" issues.
> >> -
> >> -Upstream-Status: Inappropriate [oe-core specific]
> >> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> ----
> >> - Configurations/unix-Makefile.tmpl | 2 +-
> >> - Configure                         | 2 +-
> >> - 2 files changed, 2 insertions(+), 2 deletions(-)
> >> -
> >> -diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
> >> -index c029817..43b769b 100644
> >> ---- a/Configurations/unix-Makefile.tmpl
> >> -+++ b/Configurations/unix-Makefile.tmpl
> >> -@@ -173,7 +173,7 @@ CROSS_COMPILE= {- $config{cross_compile_prefix} -}
> >> - CC= $(CROSS_COMPILE){- $target{cc} -}
> >> - CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
> >> - CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
> >> --LDFLAGS= {- $target{lflags} -}
> >> -+LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
> >> - PLIB_LDFLAGS= {- $target{plib_lflags} -}
> >> - EX_LIBS= {- $target{ex_libs} -} {- $config{ex_libs} -}
> >> - LIB_CFLAGS={- $target{shared_cflag} || "" -}
> >> -diff --git a/Configure b/Configure
> >> -index aee7cc3..274d236 100755
> >> ---- a/Configure
> >> -+++ b/Configure
> >> -@@ -979,7 +979,7 @@ $config{build_file} = $target{build_file};
> >> - $config{defines} = [];
> >> - $config{cflags} = "";
> >> - $config{ex_libs} = "";
> >> --$config{shared_ldflag} = "";
> >> -+$config{shared_ldflag} = $ENV{'LDFLAGS'};
> >> -
> >> - # Make sure build_scheme is consistent.
> >> - $target{build_scheme} = [ $target{build_scheme} ]
> >> ---
> >> -2.11.0
> >> -
> >> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch b/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
> >> deleted file mode 100644
> >> index 67d06fc..0000000
> >> --- a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
> >> +++ /dev/null
> >> @@ -1,39 +0,0 @@
> >> -From 26e98beb8a987cdc69699aaffc5599926fb1b293 Mon Sep 17 00:00:00 2001
> >> -From: Andre McCurdy <armccurdy@gmail.com>
> >> -Date: Fri, 17 Aug 2018 20:33:44 -0700
> >> -Subject: [PATCH] allow OPENSSLDIR and ENGINESDIR CFLAGS to be controlled
> >> -
> >> -Upstream-Status: Inappropriate [OE Specific]
> >> -
> >> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> ----
> >> - Configurations/unix-Makefile.tmpl | 6 +++++-
> >> - 1 file changed, 5 insertions(+), 1 deletion(-)
> >> -
> >> -diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
> >> -index 034d93e..2310d12 100644
> >> ---- a/Configurations/unix-Makefile.tmpl
> >> -+++ b/Configurations/unix-Makefile.tmpl
> >> -@@ -156,6 +156,10 @@ LIBDIR={- #
> >> - ENGINESDIR={- use File::Spec::Functions;
> >> -               catdir($prefix,$libdir,"engines-$sover") -}
> >> -
> >> -+# Intermediate variables so the values defined via CFLAGS can be controlled.
> >> -+OE_DOPENSSLDIR=$(OPENSSLDIR)
> >> -+OE_DENGINESDIR=$(ENGINESDIR)
> >> -+
> >> - # Convenience variable for those who want to set the rpath in shared
> >> - # libraries and applications
> >> - LIBRPATH=$(INSTALLTOP)/$(LIBDIR)
> >> -@@ -174,7 +178,7 @@ HTMLSUFFIX=html
> >> -
> >> - CROSS_COMPILE= {- $config{cross_compile_prefix} -}
> >> - CC= $(CROSS_COMPILE){- $target{cc} -}
> >> --CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
> >> -+CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OE_DOPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(OE_DENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
> >> - CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
> >> - LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
> >> - PLIB_LDFLAGS= {- $target{plib_lflags} -}
> >> ---
> >> -1.9.1
> >> -
> >> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> >> similarity index 83%
> >> rename from meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
> >> rename to meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> >> index a03f6ff..1917c33 100644
> >> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
> >> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> >> @@ -13,26 +13,30 @@ DEPENDS = "hostperl-runtime-native"
> >>  SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
> >>             file://run-ptest \
> >>             file://openssl-c_rehash.sh \
> >> -           file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
> >> -           file://0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch \
> >>             "
> >>
> >>  SRC_URI_append_class-nativesdk = " \
> >>             file://environment.d-openssl.sh \
> >>             "
> >>
> >> -SRC_URI[md5sum] = "9495126aafd2659d357ea66a969c3fe1"
> >> -SRC_URI[sha256sum] = "ebbfc844a8c8cc0ea5dc10b86c9ce97f401837f3fa08c17b2cdadc118253cf99"
> >> +SRC_URI[md5sum] = "6aa32e976e2c9a4aee858ced135d2573"
> >> +SRC_URI[sha256sum] = "95ebdfbb05e8451fb01a186ccaa4a7da0eff9a48999ede9fe1a7d90db75ccb4c"
> >>
> >>  inherit lib_package multilib_header ptest
> >>
> >>  #| ./libcrypto.so: undefined reference to `getcontext'
> >>  #| ./libcrypto.so: undefined reference to `setcontext'
> >>  #| ./libcrypto.so: undefined reference to `makecontext'
> >> -EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
> >> +CPPFLAGS_append_libc-musl = " -DOPENSSL_NO_ASYNC"
> >
> > This change actually does not work. Correct way to disable async would
> > be to add -no-async option to configure, something like below works
> >
> > EXTRA_OECONF_append_libc-musl = " -no-async"
>
> That should be " no-async", ie without the leading "-".

it does not matter, it ignores it, but for better readability I agree
its better to use as documented

>
>   https://github.com/openssl/openssl/blob/OpenSSL_1_1_0i/INSTALL#L233
>
> > Otherwise we get undefined refs to {get|set}context APIs encoded into
> > libcrypto.so
> >
> >
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

