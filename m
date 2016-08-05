Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80510770E3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 22:18:26 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so19846937pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 15:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=ETu3fWyX1q/DgWC6S5UqQhwz8rQJ/Yg8d9ipv2FMiLg=;
	b=Y/7bSfNax3iObaRb3uXiNP0JmgKpPLaCazCS5Jf/PLKQCB6PNxoFzfaXTIcLDNMtYC
	m4Zy4w91MmR7IrokbZPDSpu4qXchbptiu1eVUmMmsiVWOW4vLWLv4VY/ggDIdQlBpN1n
	59WRSBYij5KOvMXxfDV3BY8XELlAHetoneW3/Hd/0Rei/0TktyEMfvnLaU2xXgyMRRbP
	rFV3F1O/Nx04QrJrhNeKF8aYFGk35MPcJGJKxXwMgOI2BHrUgiPonsATsRXz8pxkSfSW
	YO1mO65YEBFNlSifnvDQOfHyhLe6sNbKGNA+lTy2W+MRGxYr3KkXEA6zD+93B/qf0UY3
	yHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=ETu3fWyX1q/DgWC6S5UqQhwz8rQJ/Yg8d9ipv2FMiLg=;
	b=ev1nc103wGRRy+rpk1flTZoEitXMmDL6CUS3p+9qh3oQ5IbRkMqzrp2XDugmP9xdTx
	9I3PQWxMQYwV4a+E9HzKOT8rU1qCmJePBysjiwlmW3TR1nD8CxezwFx7265jxXKfoteB
	lRoVdsLS9RlIrda1RBKMrx4wJzG2Rdg5XX0/ZLqqfAsTk9gAvjJWRtvhxR6PL0EVJXZ+
	SExsVaKme4OWL/FqF7kQnqvt04gz2jRUiN9GfIoZU39dquBe1SZGjsxZJvh6lacK6+S0
	wn78uahX0vXIlrwp5taYS0EPtRKpvvAJ+c1ZsX2lOWalqEqRKZfdIaKczrxsRg7H5LnD
	ltFg==
X-Gm-Message-State: AEkoousU9DZrFw3zBxqls3ngoBbrlJswmGn9MzHFxrHL+jXNqox4J6ZlstVt+zAQtiMnVw==
X-Received: by 10.66.49.67 with SMTP id s3mr28506833pan.100.1470435507586;
	Fri, 05 Aug 2016 15:18:27 -0700 (PDT)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	p9sm30297949pfj.3.2016.08.05.15.18.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 15:18:26 -0700 (PDT)
Date: Fri, 5 Aug 2016 15:18:22 -0700
From: Khem Raj <raj.khem@gmail.com>
To: =?utf-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <20160805221822.GA9968@haswell>
References: <1470433368-13508-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1470433368-13508-1-git-send-email-anibal.limon@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apt: Fix build in musl it was break due to upgrade to 1.2.12
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
X-List-Received-Date: Fri, 05 Aug 2016 22:18:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 16-08-05 16:42:48, Aníbal Limón wrote:
> methods/connect.cc: Musl doesn't support AI_IDN flag in netdb.h
> header so define it manually.
> apt-pkg/contrib/srvrec.h: Add explicity include of sys/types.h
> to avoid errors in types u_int_SIZE.
> 

This patch fixes the musl build issue.

> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-devtools/apt/apt.inc                  |  1 +
>  .../apt/apt/0001-apt-1.2.12-Fix-musl-build.patch   | 50 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
> 
> diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
> index 87cc206..3026370 100644
> --- a/meta/recipes-devtools/apt/apt.inc
> +++ b/meta/recipes-devtools/apt/apt.inc
> @@ -12,6 +12,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/
>             file://disable-configure-in-makefile.patch \
>             file://disable-test.patch \
>             file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
> +           file://0001-apt-1.2.12-Fix-musl-build.patch \
>             "
>  SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
>  SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
> diff --git a/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch b/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
> new file mode 100644
> index 0000000..04b0406
> --- /dev/null
> +++ b/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
> @@ -0,0 +1,50 @@
> +From 33b97e089d4a98d3acd20bd78337dd915b989bc2 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
> +Date: Fri, 5 Aug 2016 15:24:27 -0500
> +Subject: [PATCH] apt 1.2.12: Fix musl build
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +methods/connect.cc: Musl doesn't support AI_IDN flag in netdb.h
> +header so define it manually.
> +apt-pkg/contrib/srvrec.h: Add explicity include of sys/types.h
> +to avoid errors in types u_int_SIZE.
> +
> +Upstream-status: Pending
> +
> +Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> +---
> + apt-pkg/contrib/srvrec.h | 1 +
> + methods/connect.cc       | 3 +++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/apt-pkg/contrib/srvrec.h b/apt-pkg/contrib/srvrec.h
> +index 01b8102..15b6875 100644
> +--- a/apt-pkg/contrib/srvrec.h
> ++++ b/apt-pkg/contrib/srvrec.h
> +@@ -9,6 +9,7 @@
> + #ifndef SRVREC_H
> + #define SRVREC_H
> + 
> ++#include <sys/types.h>
> + #include <arpa/nameser.h>
> + #include <vector>
> + #include <string>
> +diff --git a/methods/connect.cc b/methods/connect.cc
> +index 07a730b..bb0ab5a 100644
> +--- a/methods/connect.cc
> ++++ b/methods/connect.cc
> +@@ -33,6 +33,9 @@
> + #include <sys/socket.h>
> + #include <arpa/inet.h>
> + #include <netdb.h>
> ++#ifndef AI_IDN
> ++#define AI_IDN 0x0040
> ++#endif
> + 
> + #include "connect.h"
> + #include "rfc2553emu.h"
> +-- 
> +2.1.4
> +
> -- 
> 2.1.4
> 

