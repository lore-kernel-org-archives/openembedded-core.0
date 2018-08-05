Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 69BB778A89
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 15:15:31 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c15-v6so11220833qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 08:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zILtGKBqAR5wl33LH70sjaKiXb2Rmk8O34bBfXukjFE=;
	b=F13uwp99z9rYkpmZAXjt+dypkB+Tz2ajuriJ4EI9HgDV0OeAUod1XOilwMPtxSv+hK
	91gffsqfLhkyB1D2JuyeBKCrc7/OdjUQ+ldeU+UyWxUTrxa1lxUkiz6yUtoa0xOBA3y9
	QoCeWrsYDfWZCZ5DHQLAeot++/u/LxfkCxtmnqhEcI96Eey+PTiTBdb8RsWMbG/bl7Gw
	THxpaEBJamDBYikfRe/BThUQMJeYhoFb9MpdcZuZGOiu0UvRzK6cucLX4uk8lXKgOsd6
	Og5mMnzJiPeuIODyOk/fsYDLGCvY+ZK0ARtxJkUPEh69fQE8kmseCYc6MLCglxtEKNjF
	O0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zILtGKBqAR5wl33LH70sjaKiXb2Rmk8O34bBfXukjFE=;
	b=Wh15Zhd04JQE9vmoBFA8LLhn95ug+TndcXVAJFlfhhHg2P5frwD0rZKREzk7RlYCH4
	MlUdMiwodnZnMBB3Oyz6Evm2uFRbYlxxC+x1CvGf9LVlHu3Sz0RoKix3EYT4kScghO/W
	WD4TOxw+nFRO302dyqerK6zTCc5oAjSWu7l8AxxmaBA2K932ct4ylZ60xQEQx0Kmxizr
	2Xy+YGz4U7yzVQe+Qk/dfW5djgFlp5Xf8NMl/WQY62Z41WHVXzG2dqwUsB+71d8IT/R8
	isb0+prkmN1d59Oywjgsl2xbIQ2VuCFX7P8LUDGs00ZnlNULqF1IfDf8SprV8hIXY2O5
	rnWQ==
X-Gm-Message-State: AOUpUlFtN/MsmbpQagdYv4p5ysR6cpsneBPuHhXktLMSGaQBcRgO/hg/
	TKkpgTQyJfENJ/iFAtuiJ2Za/5SBtmex+Gk5ykM=
X-Google-Smtp-Source: AAOMgpc47VF49UPHuE64oA805X1g9dgdeyqH2uiKaDtC1xNeB9gXQ1/23a68sYvaazAlEQk5EOlV79in7SGoT3Ida2s=
X-Received: by 2002:ac8:91d:: with SMTP id
	t29-v6mr11214558qth.188.1533482131988; 
	Sun, 05 Aug 2018 08:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1533434674.git.raj.khem@gmail.com>
	<3257c4ab40a5ed8f6df7fa7273c02939fb27ac75.1533434674.git.raj.khem@gmail.com>
	<1533462606.3114.1.camel@gmail.com>
In-Reply-To: <1533462606.3114.1.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Aug 2018 08:15:05 -0700
Message-ID: <CAMKF1sqeRP389KDEndzTf3GAZL47W-bvsDU9j4m7+mkozscafg@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/10] strace: Fix build with glibc 2.28
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
X-List-Received-Date: Sun, 05 Aug 2018 15:15:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 5, 2018 at 2:50 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Hi
>
> Am Samstag, den 04.08.2018, 19:07 -0700 schrieb Khem Raj:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../0001-tests-Include-linux-stat.h.patch     | 76 +++++++++++++++++++
> >  meta/recipes-devtools/strace/strace_4.23.bb   |  1 +
> >  2 files changed, 77 insertions(+)
> >  create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
> >
> > diff --git a/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
> > b/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
> > new file mode 100644
> > index 0000000000..cbb9c60de7
> > --- /dev/null
> > +++ b/meta/recipes-devtools/strace/strace/0001-tests-Include-linux-stat.h.patch
> > @@ -0,0 +1,76 @@
> > +From 264889246fcdd486867e8ca923094afa1689126c Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 4 Aug 2018 13:18:03 -0700
> > +Subject: [PATCH] tests: Include linux/stat.h
> > +
> > +Starting with glibc 2.28, sys/stat.h header will have the
> > +definition for struct statx, in which case including  linux/stat.h should be
> > +avoided, in order to prevent a duplicate definition.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2018-August/008329.htm
> > l]
> > + tests-m32/statx.c  | 7 +++++++
> > + tests-mx32/statx.c | 8 +++++++-
> > + tests/statx.c      | 8 +++++++-
> > + 3 files changed, 21 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/tests-m32/statx.c b/tests-m32/statx.c
> > +index 816b7eb..7364a02 100644
> > +--- a/tests-m32/statx.c
> > ++++ b/tests-m32/statx.c
> > +@@ -30,6 +30,13 @@
> > +
> > + #ifdef __NR_statx
> > +
> > ++# if defined(__GLIBC__)
> > ++#  if !__GLIBC_PREREQ(2,28)
> > ++#   include <linux/stat.h>
> > ++#  endif
> > ++# else
> > ++#  include <linux/stat.h>
> > ++# endif
> > + # include <linux/stat.h>
>
> Shouldn't the unconditional include be removed?
>

yes.

> Max
>
> > + # include "xlat.h"
> > + # include "xlat/statx_masks.h"
> > +diff --git a/tests-mx32/statx.c b/tests-mx32/statx.c
> > +index 816b7eb..e9f9993 100644
> > +--- a/tests-mx32/statx.c
> > ++++ b/tests-mx32/statx.c
> > +@@ -30,7 +30,13 @@
> > +
> > + #ifdef __NR_statx
> > +
> > +-# include <linux/stat.h>
> > ++# if defined(__GLIBC__)
> > ++#  if !__GLIBC_PREREQ(2,28)
> > ++#   include <linux/stat.h>
> > ++#  endif
> > ++# else
> > ++#  include <linux/stat.h>
> > ++# endif
> > + # include "xlat.h"
> > + # include "xlat/statx_masks.h"
> > + # include "xlat/statx_attrs.h"
> > +diff --git a/tests/statx.c b/tests/statx.c
> > +index 816b7eb..e9f9993 100644
> > +--- a/tests/statx.c
> > ++++ b/tests/statx.c
> > +@@ -30,7 +30,13 @@
> > +
> > + #ifdef __NR_statx
> > +
> > +-# include <linux/stat.h>
> > ++# if defined(__GLIBC__)
> > ++#  if !__GLIBC_PREREQ(2,28)
> > ++#   include <linux/stat.h>
> > ++#  endif
> > ++# else
> > ++#  include <linux/stat.h>
> > ++# endif
> > + # include "xlat.h"
> > + # include "xlat/statx_masks.h"
> > + # include "xlat/statx_attrs.h"
> > +--
> > +2.18.0
> > +
> > diff --git a/meta/recipes-devtools/strace/strace_4.23.bb b/meta/recipes-
> > devtools/strace/strace_4.23.bb
> > index 0c159fc6f6..d966a77b89 100644
> > --- a/meta/recipes-devtools/strace/strace_4.23.bb
> > +++ b/meta/recipes-devtools/strace/strace_4.23.bb
> > @@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> >             file://mips-SIGEMT.patch \
> >             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> >             file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
> > +           file://0001-tests-Include-linux-stat.h.patch \
> >             "
> >  SRC_URI[md5sum] = "fad4bba0947553cef34d46a9fd78f039"
> >  SRC_URI[sha256sum] = "7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad"
> > --
> > 2.18.0
> >

