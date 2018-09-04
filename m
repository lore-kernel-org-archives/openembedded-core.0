Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB0C71BA0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 03:17:14 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id u11-v6so1734212uan.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 20:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tpzNKRo8dqZ8tHLLs+O6fwM3w9UStMjPaEcloLVe5xE=;
	b=ZKCNb+qnRu6x6MnOyBqC+WuxDyjSDF+614cr1QMhtpAUVxp7jl3pMA8p+gC0aFMQzT
	8NAWlyfHsIc26KAp3iLBMUSs6+aN1xyedh6Gji0MsGyaz6d04qhgM4yGho8OX8GaU/Zv
	HkjmVUOC4l5hyDPunbAq/+pg4D6SNnCcwnAdIzIHqVvaTMYRRdtceQKEw8cLgoJ155Fd
	RdT67VO5BlJHZjw/90gRIMymuthrdZI6KxDj8ceNkDSlxF3PcnVgpNEZbixZ+QiG+w0A
	nVXzrk+Mj1E6UMcSEDzzXxj6929boYUCezdumwJ3b4jc6Wy1svbqhVuBpw3RNgv+IN7+
	PBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tpzNKRo8dqZ8tHLLs+O6fwM3w9UStMjPaEcloLVe5xE=;
	b=ZGLDLSorbmXa3nQTkNpb3UHcJ+sjUd1lx3CaGeRdlWNO1tJDCzxZ34Xgf5fkNp4F72
	GyjOv/4yOrs7lBJ9D29IxoOTcnkZ2j76xcjvfDlvuPU8PZL2eRXOrpM1JuU0+IK96HDe
	cOzPi/t8fgqirv0+5BaX5vHBoA6RuOKTZ4H3VpqJBFGwSNqt85ZLliNs/En3WMk2w1Bd
	pmGlMe9XUIlVrsIb87lJTYecm4glGmlTU5QvrgiaaxT3H9tWkOLHaF9ncPOq+4UC6AhZ
	+SzuZ8JBoIaYIvHMm+HZVaGmJU5WAoweR6nlkIXSmsIrt1+TKG2Az2RSfx2z9OpsMmIr
	21jQ==
X-Gm-Message-State: APzg51AhJcZOieqmVTWubVcyb4sqtm8uEZzEhf5ViQsXE8Oz2WoI2EwY
	dTQ74sVTKnGk513Q8M/lRxg8JexLz5HOlhWXwp8=
X-Google-Smtp-Source: ANB0VdbLBs10s6hcuXm1V56i2cEHBMG/DUd1un6WgmJqMPx4lL0KfHY7Llv362ao9eAbVjVG++k2iJUkqbfbGriEsxw=
X-Received: by 2002:a9f:3f8c:: with SMTP id
	k12-v6mr17061983uaj.38.1536031034968; 
	Mon, 03 Sep 2018 20:17:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:2b46:0:0:0:0:0 with HTTP;
	Mon, 3 Sep 2018 20:17:14 -0700 (PDT)
In-Reply-To: <8e690a6b-467b-a25e-c5f0-5b29147fbb4f@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<010e93a91991128a31f1dd4e30c08e425f733ec4.1535451643.git.alex.kanavin@gmail.com>
	<8e690a6b-467b-a25e-c5f0-5b29147fbb4f@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 3 Sep 2018 20:17:14 -0700
Message-ID: <CAJ86T=XRqQ=_z3Mqwox5kfe4ngyBrZW8rw=+t-G-B94S+xk8MA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 04 Sep 2018 03:17:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 3, 2018 at 3:53 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 8/28/18 3:23 AM, Alexander Kanavin wrote:
>> At the moment 1.1.1 is in pre-release stage, however the final release
>> should be available within a few weeks. The major selling point is that
>> it supports the new TLS 1.3 specification. It will also be the new long
>> term support version. More information:
>>
>> https://www.openssl.org/policies/releasestrat.html
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch | 43 ----------------------
>>  ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch | 39 --------------------
>>  .../{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb}   | 23 +++++++-----
>>  3 files changed, 14 insertions(+), 91 deletions(-)
>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
>>  rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb} (83%)
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch b/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>> deleted file mode 100644
>> index 6ce4e47..0000000
>> --- a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From 08face4353d80111973aba9c1304c92158cfad0e Mon Sep 17 00:00:00 2001
>> -From: Alexander Kanavin <alex.kanavin@gmail.com>
>> -Date: Tue, 28 Mar 2017 16:40:12 +0300
>> -Subject: [PATCH] Take linking flags from LDFLAGS env var
>> -
>> -This fixes "No GNU_HASH in the elf binary" issues.
>> -
>> -Upstream-Status: Inappropriate [oe-core specific]
>> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ----
>> - Configurations/unix-Makefile.tmpl | 2 +-
>> - Configure                         | 2 +-
>> - 2 files changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
>> -index c029817..43b769b 100644
>> ---- a/Configurations/unix-Makefile.tmpl
>> -+++ b/Configurations/unix-Makefile.tmpl
>> -@@ -173,7 +173,7 @@ CROSS_COMPILE= {- $config{cross_compile_prefix} -}
>> - CC= $(CROSS_COMPILE){- $target{cc} -}
>> - CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
>> - CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
>> --LDFLAGS= {- $target{lflags} -}
>> -+LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
>> - PLIB_LDFLAGS= {- $target{plib_lflags} -}
>> - EX_LIBS= {- $target{ex_libs} -} {- $config{ex_libs} -}
>> - LIB_CFLAGS={- $target{shared_cflag} || "" -}
>> -diff --git a/Configure b/Configure
>> -index aee7cc3..274d236 100755
>> ---- a/Configure
>> -+++ b/Configure
>> -@@ -979,7 +979,7 @@ $config{build_file} = $target{build_file};
>> - $config{defines} = [];
>> - $config{cflags} = "";
>> - $config{ex_libs} = "";
>> --$config{shared_ldflag} = "";
>> -+$config{shared_ldflag} = $ENV{'LDFLAGS'};
>> -
>> - # Make sure build_scheme is consistent.
>> - $target{build_scheme} = [ $target{build_scheme} ]
>> ---
>> -2.11.0
>> -
>> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch b/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
>> deleted file mode 100644
>> index 67d06fc..0000000
>> --- a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From 26e98beb8a987cdc69699aaffc5599926fb1b293 Mon Sep 17 00:00:00 2001
>> -From: Andre McCurdy <armccurdy@gmail.com>
>> -Date: Fri, 17 Aug 2018 20:33:44 -0700
>> -Subject: [PATCH] allow OPENSSLDIR and ENGINESDIR CFLAGS to be controlled
>> -
>> -Upstream-Status: Inappropriate [OE Specific]
>> -
>> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ----
>> - Configurations/unix-Makefile.tmpl | 6 +++++-
>> - 1 file changed, 5 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
>> -index 034d93e..2310d12 100644
>> ---- a/Configurations/unix-Makefile.tmpl
>> -+++ b/Configurations/unix-Makefile.tmpl
>> -@@ -156,6 +156,10 @@ LIBDIR={- #
>> - ENGINESDIR={- use File::Spec::Functions;
>> -               catdir($prefix,$libdir,"engines-$sover") -}
>> -
>> -+# Intermediate variables so the values defined via CFLAGS can be controlled.
>> -+OE_DOPENSSLDIR=$(OPENSSLDIR)
>> -+OE_DENGINESDIR=$(ENGINESDIR)
>> -+
>> - # Convenience variable for those who want to set the rpath in shared
>> - # libraries and applications
>> - LIBRPATH=$(INSTALLTOP)/$(LIBDIR)
>> -@@ -174,7 +178,7 @@ HTMLSUFFIX=html
>> -
>> - CROSS_COMPILE= {- $config{cross_compile_prefix} -}
>> - CC= $(CROSS_COMPILE){- $target{cc} -}
>> --CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
>> -+CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OE_DOPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(OE_DENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
>> - CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
>> - LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
>> - PLIB_LDFLAGS= {- $target{plib_lflags} -}
>> ---
>> -1.9.1
>> -
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
>> similarity index 83%
>> rename from meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
>> rename to meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
>> index a03f6ff..1917c33 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
>> @@ -13,26 +13,30 @@ DEPENDS = "hostperl-runtime-native"
>>  SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>>             file://run-ptest \
>>             file://openssl-c_rehash.sh \
>> -           file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
>> -           file://0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch \
>>             "
>>
>>  SRC_URI_append_class-nativesdk = " \
>>             file://environment.d-openssl.sh \
>>             "
>>
>> -SRC_URI[md5sum] = "9495126aafd2659d357ea66a969c3fe1"
>> -SRC_URI[sha256sum] = "ebbfc844a8c8cc0ea5dc10b86c9ce97f401837f3fa08c17b2cdadc118253cf99"
>> +SRC_URI[md5sum] = "6aa32e976e2c9a4aee858ced135d2573"
>> +SRC_URI[sha256sum] = "95ebdfbb05e8451fb01a186ccaa4a7da0eff9a48999ede9fe1a7d90db75ccb4c"
>>
>>  inherit lib_package multilib_header ptest
>>
>>  #| ./libcrypto.so: undefined reference to `getcontext'
>>  #| ./libcrypto.so: undefined reference to `setcontext'
>>  #| ./libcrypto.so: undefined reference to `makecontext'
>> -EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
>> +CPPFLAGS_append_libc-musl = " -DOPENSSL_NO_ASYNC"
>
> This change actually does not work. Correct way to disable async would
> be to add -no-async option to configure, something like below works
>
> EXTRA_OECONF_append_libc-musl = " -no-async"

That should be " no-async", ie without the leading "-".

  https://github.com/openssl/openssl/blob/OpenSSL_1_1_0i/INSTALL#L233

> Otherwise we get undefined refs to {get|set}context APIs encoded into
> libcrypto.so
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

