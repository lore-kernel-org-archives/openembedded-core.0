Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5A02577FC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 18:43:47 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id v105so11449010wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 11:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y0q1QGnvMUqFI2jazHxCJromW62TmJq1fjY5LOESPiY=;
	b=IKsAgNTcGDq2dJOeMFNlrfEBfoe4ljcRQqjKnDem1pClyvQzE5+spDU9BocflxqJpS
	Tvr1LtfQFUwZ7qWCKSluUqetTZ1FO4WTQMcm7N7GWiDc46k9TXt9GO+x5JURXPVCUOba
	AGKBZEofgra1+T8wNvsHZmAlqZExvWmDLAzEfqE/2xA3pBSYsW3cuSrlkUX2GwSKPpCu
	ibggKmh1A0yJFRL0QsgEzsiikgKeTMkENleeUXG6NjVgE1EOE2vQ/thGSZwLdJzMDAcB
	K5Ou6HaBMPJxkTbc3e7O5cIUZHtrNHVjPjXTkJwcU2OJDi/6XgzTToniNhI0NKUbhXFM
	6tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y0q1QGnvMUqFI2jazHxCJromW62TmJq1fjY5LOESPiY=;
	b=W0O4WzNfEUUigkX2P3hHkHNk3lGJ1DfJf9Mjia/RnCkQzAB9KxoplwNBz81lEm1uK/
	2R2rz8CdZ+gZSS1Tv/oWiyYwTSpnuTIZ9FZDop+zTUgwgXaLwtmm4SKZM24MvUtyyDD7
	3T4xLGLqep9VXeVRjvAAB1B8NqufMT2bxC01JOupebgk2QkrPJWDgvqkg1N/V0RkZzWz
	J5WuPl+42iGzkSCc3JtFEBj4wGoFzJK0a2pUzo2ngpNJTpo/wiHc1ujgjr6FtdpJGt7e
	o5AQ4chldGBUXKpUr4fA5Lgb1gIuMBh3C+OSvHrvXo7DuWHPJoEjdwkB5QSzS7yVIdye
	WpNA==
X-Gm-Message-State: AIVw1121awMK/gnIMzVc/DBle24mf9pxoJESW5TgvKIygqiGmEw0+x4L
	jaau2CX85vXxnns/pK1JesjaueMS2A==
X-Received: by 10.80.171.165 with SMTP id u34mr2957523edc.99.1500403428999;
	Tue, 18 Jul 2017 11:43:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Tue, 18 Jul 2017 11:43:18 -0700 (PDT)
In-Reply-To: <1500375149-7407-1-git-send-email-jussi.kukkonen@intel.com>
References: <1500375149-7407-1-git-send-email-jussi.kukkonen@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jul 2017 14:43:18 -0400
Message-ID: <CAMKF1soF6FveU6ZfwNntCKXzzLYPaF5+ih6NuRXr5RtULFJcQg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-bootchart: Fix build with glibc 2.26
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
X-List-Received-Date: Tue, 18 Jul 2017 18:43:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 18, 2017 at 6:52 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> xlocale.h is no more, don't include it.
>

looks good

> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../0001-parse-util-Don-t-use-xlocale.h.patch      | 32 ++++++++++++++++++++++
>  .../systemd-bootchart/systemd-bootchart_231.bb     |  4 ++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch
>
> diff --git a/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch b/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch
> new file mode 100644
> index 0000000..5aa0463
> --- /dev/null
> +++ b/meta/recipes-devtools/systemd-bootchart/files/0001-parse-util-Don-t-use-xlocale.h.patch
> @@ -0,0 +1,32 @@
> +From d379126d56d0b6e935b2d97ca71579e6cc54d1bb Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Tue, 18 Jul 2017 13:37:27 +0300
> +Subject: [PATCH] parse-util: Don't use xlocale.h
> +
> +glibc 2.26 no longer contains the non-standard xlocale.h
> +(http://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27xlocale.h.27)
> +
> +This change shouldn't break anything as xlocale.h was a subset of
> +locale.h.
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/35]
> +---
> + src/parse-util.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/src/parse-util.c b/src/parse-util.c
> +index 5635a68..1b2169c 100644
> +--- a/src/parse-util.c
> ++++ b/src/parse-util.c
> +@@ -21,7 +21,6 @@
> + #include <locale.h>
> + #include <stdlib.h>
> + #include <string.h>
> +-#include <xlocale.h>
> +
> + #include "macro.h"
> + #include "parse-util.h"
> +--
> +2.13.2
> +
> diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
> index 1d88036..4da000e 100644
> --- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
> +++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb
> @@ -2,7 +2,9 @@ LICENSE = "LGPLv2.1 & GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
>                      file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
>
> -SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https"
> +SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
> +           file://0001-parse-util-Don-t-use-xlocale.h.patch \
> +"
>
>  # Modify these as desired
>  PV = "231+git${SRCPV}"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

