Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2779660118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 21:08:18 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so256838766wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ws9/tCziu4DI+WRhialep7jgXHV22ILkSy6gJf2/kGg=;
	b=e7tgc4dVlppNnHs5Y4Rtat7Q0W8EyIQdoumEHQ2GXRSc4JT7EfUj9YN8bwMwNOIlv0
	fYOip3ZizaOc5CosEhvGtbUeTKcvz/Iq2Faz4wC6iyqJxTfDKB/xFXraFXJfJ24oD3Y6
	+bCjEL2KLtWgDtKJLiXJKKPe4TssZ1h4gHiE52Qz/8VfIJkH77fsKpYH4lVDVr321E+y
	EerYnKpIzGEOfUO+qyW5N6X+fTIzhEHbkEeo4vnL28bx5nVTQ2sZka39Hg4wysJVc6HP
	eUm8g/mvExz8VD2KTgYavu+a4LqAVs55nWE06z6ZRZzOxRzmXXtSG0LDvsvnq+Bi9HJF
	R5gA==
MIME-Version: 1.0
X-Received: by 10.194.200.134 with SMTP id js6mr12229523wjc.114.1447967298673; 
	Thu, 19 Nov 2015 13:08:18 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Thu, 19 Nov 2015 13:08:18 -0800 (PST)
In-Reply-To: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
References: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
Date: Thu, 19 Nov 2015 13:08:18 -0800
Message-ID: <CAJ86T=VwKbgJDTA07978hduhxhSg=dF61n6kAEM=2qHm=wwY_Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] busybox fixes and cleanups + update 1.23.2 -> 1.24.1
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
X-List-Received-Date: Thu, 19 Nov 2015 21:08:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 6, 2015 at 12:47 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Andre McCurdy (11):
>   busybox_git: Enable getopt applet
>   busybox.inc: don't export EXTRA_OEMAKE
>   busybox: move EXTRA_OEMAKE etc into busybox.inc
>   busybox.inc: explicitly include CC=${CC} on make command line
>   busybox.inc: don't set .config CROSS_COMPILER_PREFIX
>   busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
>   busybox.inc: remove MAKEFLAGS over-ride from EXTRA_OEMAKE
>   busybox: re-order defconfig to align with busybox 1.24.1
>   busybox: update 1.23.2 -> 1.24.1
>   busybox: disable support for mounting NFS file systems on Linux < 2.6.23
>   busybox: enable resize applet

I'm planning to refresh these patches one more time to remove "-e"
from EXTRA_OEMAKE.

Is there anything else which needs fixing or dropping before these
patches are suitable for merging to master?


>  meta/recipes-core/busybox/busybox.inc              |  20 +-
>  .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 ---------------------
>  .../busybox/busybox/0001-chown-fix-help-text.patch |  34 --
>  ...ix-double-free-fatal-error-in-INET_sprint.patch |  67 ----
>  meta/recipes-core/busybox/busybox/defconfig        |  63 ++--
>  meta/recipes-core/busybox/busybox/resize.cfg       |   2 +
>  meta/recipes-core/busybox/busybox_1.23.2.bb        |  53 ---
>  meta/recipes-core/busybox/busybox_1.24.1.bb        |  43 +++
>  meta/recipes-core/busybox/busybox_git.bb           |  18 +-
>  9 files changed, 105 insertions(+), 583 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
>  delete mode 100644 meta/recipes-core/busybox/busybox_1.23.2.bb
>  create mode 100644 meta/recipes-core/busybox/busybox_1.24.1.bb
>
> --
> 1.9.1
>

