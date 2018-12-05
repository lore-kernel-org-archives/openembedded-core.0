Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A76DE71A88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 17:38:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j2so20600838wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 09:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=F/No8jbaGQnNXRUiWq4gKIXQocU1DstN8NkplPfRKsI=;
	b=Qtiflsy4fi5se5+cc+Clr/CneM4cNnj7mtC3S0YxlQghZVo8Gfor1Uk94K9Qt60Gql
	3Nf9fedduw3dl0E3opviRG7BJNxMJTkzsI0uV/pc9cytlLyTxYvgFoXbeklBuypJc4TK
	O0dcuDiLVwp5BWPrklWbUMHNmCRff55Tp6fyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=F/No8jbaGQnNXRUiWq4gKIXQocU1DstN8NkplPfRKsI=;
	b=rropAKVVRl+rdBXdgd/0g13kSnUIdS9iMIW1JrNu/lKGu0TlXlrwKGUY5T6QbwGm9h
	FvKScNcR3uc1FNinFecS6I2t9Rrdki+vA05kl//9VUGWqfwUtdY5B+XI5iQGJxNmeqvy
	HOaSOLEOnzJFDRM45UFPaMr+aVw36iAHBYAc7aYVxxj9HvxAlNS1D9aSQJTJTfyaraMG
	5+uLLP/rRs0D3pV0/2he9UqLPjpAvpxA/D+NnhHO9PbKUtR7xost289fbu/gEFgbXjHf
	kfH2/PHtEm0/1ostifRkBgrZ3TAYUQJdKtLvX9hXFL+/yIZ4DFRy0ksN2qW8//8KGBxz
	LEfg==
X-Gm-Message-State: AA+aEWbL1NaGd733tM1sWym2bwTY1haHFQg7Msq0I3mEYO1E8fpItHzJ
	yT1NfJIknJt+Kkz38QvUtEx26g==
X-Google-Smtp-Source: AFSGD/VZZasHFRAE2z+0vFOWrkJq+e4sZa7Bk4suDzhLiGIrYEtJY6gH18MzhuZwOGT+De04+6H0nQ==
X-Received: by 2002:adf:f009:: with SMTP id j9mr22159503wro.170.1544031484207; 
	Wed, 05 Dec 2018 09:38:04 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j24sm20062167wrd.86.2018.12.05.09.38.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Dec 2018 09:38:03 -0800 (PST)
Message-ID: <106213de5e5a4b41d4015287629205350ab75ca0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Dec 2018 17:38:02 +0000
In-Reply-To: <5f45b788-2071-fb8f-18de-a083a07b7aac@siemens.com>
References: <20181120111725.4337-1-andrej.valek@siemens.com>
	<20181120111725.4337-2-andrej.valek@siemens.com>
	<fbb2b0ead56624464117557944906cb8ff451d57.camel@linuxfoundation.org>
	<5f45b788-2071-fb8f-18de-a083a07b7aac@siemens.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] nativesdk/sdk: Fix sdk dummy providers for opkg
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
X-List-Received-Date: Wed, 05 Dec 2018 17:38:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-05 at 08:59 +0100, Andrej Valek wrote:
> We have made some deeper analysis of this problem.
> 
> In our opinion the code as it is now does not work for any packaging
> method.
> For RPM it's a silent failure (purpose of dummy class is to replace
> tools like perl, however without RCONFLICTS clause those tools will
> be installed instead anyway of replaced.

That isn't true as for the buildtools-tarball case it *is* working with
rpm.

> OPKG correctly creates a hard failure when RCONFLICTS is not set.
> 
> The problem in RPM/DNF is that it cannot compare conflict between
> package name and file name (e.g. perl vs. /usr/bin/perl), so it will
> try install both.
> For this you have implemented a "workaround" by removing the
> RCONFLICTS which however makes the package useless for RPM and
> breaking OPKG build.
> 
> We ha tried to replace /usr/bin/perl by perl (which works fine),
> however there is still /bin/sh and /bin/env which can have multiple
> providers and we can't conflict with any possible package out there.
> 
> Unfortunately reworking RPM/DNS is something we don't know how to.
> Therefore we would like to at least fix OPKG that it does not crash
> during build and leave the background problem for later (e.g. create
> bugreport).
> 
> Would you reconsider merging this MR

If I merge your patch, the autobuilder breaks and shows errors. Is that
acceptable?

>  or would you accept if we create separate recipe for OPKG?

No, that is hacking around the problem.

I took a look at this myself. It seems that the patch below does work
for rpm. That does make me wonder about some of things you've mentioned
above. Basically the problem is that some recipes like nativesdk-
autoconf depend on more than just /usr/bin/perl. We therefore need to
extend the providers list to cover the various possibilities.

Cheers,

Richard


diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index eafcb823ab..4d653706b1 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -20,7 +20,7 @@ PR[vardeps] += "DUMMYPROVIDES"
 python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
-    #d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
-    #d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
 }
 
diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 11a727d486..d33e978666 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -2,6 +2,26 @@ DUMMYARCH = "sdk-provides-dummy-${SDKPKGSUFFIX}"
 
 # Add /bin/sh?
 DUMMYPROVIDES = "\
+    nativesdk-perl \
+    nativesdk-libxml-parser-perl \
+    nativesdk-perl-module-bytes \
+    nativesdk-perl-module-carp \
+    nativesdk-perl-module-constant \
+    nativesdk-perl-module-data-dumper \
+    nativesdk-perl-module-errno \
+    nativesdk-perl-module-exporter \
+    nativesdk-perl-module-file-basename \
+    nativesdk-perl-module-file-compare \
+    nativesdk-perl-module-file-copy \
+    nativesdk-perl-module-file-find \
+    nativesdk-perl-module-file-glob \
+    nativesdk-perl-module-file-path \
+    nativesdk-perl-module-file-stat \
+    nativesdk-perl-module-getopt-long \
+    nativesdk-perl-module-io-file \
+    nativesdk-perl-module-posix \
+    nativesdk-perl-module-thread-queue \
+    nativesdk-perl-module-threads \
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 714d15d8ba..57c10044f8 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -1,6 +1,9 @@
 DUMMYARCH = "sdk-provides-dummy-target"
 
 DUMMYPROVIDES = "\
+    busybox \
+    bash \
+    perl \
     /bin/sh \
     /bin/bash \
     /usr/bin/env \



