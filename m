Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0336E74777
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 23:17:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u86so6245208pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 16:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C1WqNJfTGfYoFUDd9eROOcwDVzD3EJqwvUNYoITQu3Y=;
	b=OENQ03OqpGKVkVYvi6G9QcRwpReSXdLEcog6ZImoR8WVMPPe0OSwt5YdsX8qIL01Mt
	KKSW0lj3BY0klUEoU49wv8rekxQECmOHkPTGXnumKJ21rVQHQgf9nU+e+jPxoMJcEmoX
	EGBm88w+2J4Vlz3olBvCfeNMTUHPUIJPYF76XkBDmNCI9vp1T3OOXMfuChBTILL4TNj1
	82dl1+OYK2jND5oXBciSAm0Rv8uXEOYX7vI7pqrNuq42DvvLeYYKG+ejaKCzOTv8rRIM
	bZAWCjNpHhiLUN91TpAFdqqmjqqOm6SQ09HNbo9/U9mcc8RA+wec7lZwZm3V86RV/EgE
	gx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C1WqNJfTGfYoFUDd9eROOcwDVzD3EJqwvUNYoITQu3Y=;
	b=DaNcK1IMGi6t9l/pN94Tg9NFsCtxdsxu3fNGXPIr/hDaRr2ThbkEVLgWSEAwffRF1E
	8UcZpvdGJGdZuqwHOvcdipCNrYz7x+3seM8yXjyf0dLDNlXAAnF7jKmb9hmS1L4Mzk/f
	3ms947n/mTiBB/sUjz7mpOI07eP0Id6dC+Jijai4pP4an7tB9nVFaQQ3pBQ+SdOARjCH
	5zMsQDYZbboyAKt23Hz0yDFD/Cdfjyca7rvkwAbAaYQb5HJnmOIZGBbs6x27QiG0wo8l
	byN7c+vdxNCqus7G+CN+nXt7/V6sFZv2CVvQ3PSYA2e2wgEciF624jqqJ/ZTFA0MlPPn
	2vBA==
X-Gm-Message-State: AElRT7Gti9J0zg3pPWRD21806Fw3Pn+6/CpF4bILTeGVsFYCqGfX15CS
	NmhuHXLobZq6l0y/VFyxqJgzR0FmGjsNh6j1UJE=
X-Google-Smtp-Source: AIpwx4/WpL1yg7TMX+oglJ3HKjJOu1B/8boShuxFRWa+A1oOUPVZYc9M59Fth9hKsGWhdeVr11Zd1SNatapn2a8qg44=
X-Received: by 10.98.229.21 with SMTP id n21mr641466pff.158.1522451846582;
	Fri, 30 Mar 2018 16:17:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.227.8 with HTTP; Fri, 30 Mar 2018 16:16:56 -0700 (PDT)
In-Reply-To: <1522443068-43048-1-git-send-email-juro.bystricky@intel.com>
References: <1522443068-43048-1-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Mar 2018 16:16:56 -0700
Message-ID: <CAMKF1so_JMxhfKBRaVuroPUfe+0QiVSDPaG0bLqCGy7rUgVNCA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto_4.14.bb: fix for deterministic srcversion
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
X-List-Received-Date: Fri, 30 Mar 2018 23:17:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 1:51 PM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> "srcversion" field inserted into module modinfo section contains a
> sum of the source files which made it. However, this field can
> be incorrect. Building the same module can end up having inconsistent
> srcversion field eventhough the sources remain the same.
>
> This basically negates the whole purpose of the field srcversion,
> and breaks build reproducibility as well.
>
> The problem is fairly easy reproduceable by comparing "srcversion" of
> kernel modules built in a workplace of a short directory name with
> "srcversion" of the same modules built in a workplace of a fairly long
> directory name.
>
> The reason for incorrect srcversion is that some source files can be
> simply silently skipped from the checksum calculation due to limited
> buffer space for line parsing.
>
> [YOCTO #12544]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  .../modpost-srcversion-sometimes-incorrect.patch   | 48 ++++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  4 +-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
>
> diff --git a/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch b/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
> new file mode 100644
> index 0000000..1680293
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
> @@ -0,0 +1,48 @@
> +"srcversion" field inserted into module modinfo section contains a
> +sum of the source files which made it. However, this field can
> +be incorrect. Building the same module can end up having inconsistent
> +srcversion field eventhough the sources remain the same.
> +This can be reproduced by building modules in a deeply nested directory,
> +but other factors contribute as well.
> +
> +The reason for incorrect srcversion is that some source files can be
> +simply silently skipped from the checksum calculation due to limited
> +buffer space for line parsing.
> +
> +This patch addresses two issues:
> +
> +1. Allocates a larger line buffer (32k vs 4k).
> +2. Issues a warning if a line length exceeds the line buffer.
> +
> +Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10318141/]
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> +index 9917f92..955f26e 100644
> +--- a/scripts/mod/modpost.c
> ++++ b/scripts/mod/modpost.c
> +@@ -385,9 +385,10 @@ void *grab_file(const char *filename, unsigned long *size)
> +   * spaces in the beginning of the line is trimmed away.
> +   * Return a pointer to a static buffer.
> +   **/
> ++#define MODPOST_MAX_LINE 32768
> + char *get_next_line(unsigned long *pos, void *file, unsigned long size)
> + {
> +-      static char line[4096];
> ++      static char line[MODPOST_MAX_LINE];
> +       int skip = 1;
> +       size_t len = 0;
> +       signed char *p = (signed char *)file + *pos;
> +@@ -402,8 +403,11 @@ char *get_next_line(unsigned long *pos, void *file, unsigned long size)
> +               if (*p != '\n' && (*pos < size)) {
> +                       len++;
> +                       *s++ = *p++;
> +-                      if (len > 4095)
> ++                      if (len > (sizeof(line)-1)) {
> ++                              warn(" %s: line exceeds buffer size %zu bytes\n"
> ++                                   , __func__, sizeof(line));
> +                               break; /* Too long, stop */
> ++                      }

this should be upstreamed into kernel as well.

