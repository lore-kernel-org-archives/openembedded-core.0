Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0787E3BC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 14:37:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w9so12151807wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 06:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Io32VsrhwZLaZ8piUMPjz8loKJTbr3NHRvqCP8uuRq4=;
	b=diFF3LA4dk9THhl4xpswYsE6/lahEwsnbMWd054gcDVHVH20Pe8zZl/hLKam9tMZvm
	dDqmFwfyt8FLjyrx623KuzqSAasAdq05mZv5Z3zM2wDvUHRU3QWqGUnREot5QNeZKGLW
	Ki3eeFXswNAa9rmUdS4iM8r34zNGEdeHtoTDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Io32VsrhwZLaZ8piUMPjz8loKJTbr3NHRvqCP8uuRq4=;
	b=LjUzLm9IyI1jWXXILXaspumP67/iU2nUsOp4gNxQMvCh2s/M1abMbbSyqIlP+mUbxM
	x/PvIhuCG5mJvTNG72kDH8+Vj6gQpyOgMmQs2xObVwgvCTtHof0h6Zwy4j8AAW2xXHMr
	Q4wYOwFCrhbP4fQiSqblCKXpsDINA5INhlQkDMqksMtu67d5w0coo7GpiRyDxlbQJfgu
	AqMAueYFekbNHR0802899u2AuxNXz2efNqcTYzSN+xCE7KS/YyKittZY6yKFA1+BvIZZ
	c9188SdcwbclkQb7roftnSDir5MDKlH6eGBY65hCP4ot84qSS44PoJz2OP9j9nD/9s8B
	doJw==
X-Gm-Message-State: APjAAAX7PIm4BVu9ZJkEOddkNJFZPE8vZXm6aJmpo0oWF/hEaH5V8Ep2
	yPMj0szNsaOiUJ74yW8fWFDJ0g==
X-Google-Smtp-Source: APXvYqwtPeNz6/wsH7o223YvnbtnC9hzpl755SJxRDptX0px3Grfy2ptYSFHuhAS83IF3AAQQjm1uw==
X-Received: by 2002:adf:ec89:: with SMTP id z9mr22748640wrn.153.1574519871814; 
	Sat, 23 Nov 2019 06:37:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id m3sm2365494wrw.20.2019.11.23.06.37.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Nov 2019 06:37:50 -0800 (PST)
Message-ID: <65a8d4b35bf573d0c777ac337057e7198591f107.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 14:37:49 +0000
In-Reply-To: <20191120134455.125118-3-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 03/11] dummy-sdk-package.inc: do not include files into RREPLACES
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
X-List-Received-Date: Sat, 23 Nov 2019 14:37:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-20 at 14:44 +0100, Alexander Kanavin wrote:
> rpm 4.15 no longer allows it, which makes sense.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-core/meta/dummy-sdk-package.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc
> b/meta/recipes-core/meta/dummy-sdk-package.inc
> index 4d653706b13..58b0482eca5 100644
> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> @@ -16,11 +16,12 @@ python() {
>  ALLOW_EMPTY_${PN} = "1"
>  
>  PR[vardeps] += "DUMMYPROVIDES"
> +PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
>  
>  python populate_packages_prepend() {
>      p = d.getVar("PN")
>      d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
>      d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
> -    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
> +    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES_PACKAGES}")
>  }


This breaks:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/1509

Needs something like this (added in -next):

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 58b0482eca..61afab1d76 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -18,6 +18,9 @@ ALLOW_EMPTY_${PN} = "1"
 PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
+DUMMYPROVIDES_PACKAGES ??= ""
+DUMMYPROVIDES += "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+
 python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 6a8748acdf..5bc11b9daf 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -1,6 +1,6 @@
 DUMMYARCH = "buildtools-dummy-${SDKPKGSUFFIX}"
 
-DUMMYPROVIDES = "\
+DUMMYPROVIDES_PACKAGES = "\
     nativesdk-perl \
     nativesdk-libxml-parser-perl \
     nativesdk-perl-module-bytes \
@@ -21,6 +21,9 @@ DUMMYPROVIDES = "\
     nativesdk-perl-module-posix \
     nativesdk-perl-module-thread-queue \
     nativesdk-perl-module-threads \
+"
+
+DUMMYPROVIDES = "\
     /usr/bin/perl \
     "
 
diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index b891efa5ef..29f4dd3633 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -1,10 +1,13 @@
 DUMMYARCH = "sdk-provides-dummy-${SDKPKGSUFFIX}"
 
+DUMMYPROVIDES_PACKAGES = "\
+    pkgconfig \
+"
+
 # Add /bin/sh?
 DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
-    pkgconfig \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 87b8bfab9c..e3beeb796c 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -48,7 +48,6 @@ DUMMYPROVIDES_PACKAGES = "\
 "
 
 DUMMYPROVIDES = "\
-    ${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])} \
     /bin/sh \
     /bin/bash \
     /usr/bin/env \


