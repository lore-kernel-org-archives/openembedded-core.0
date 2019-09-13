Return-Path: <scott.murray@konsulko.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECA07F02F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 22:28:56 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id d17so44109234ios.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version;
	bh=UP86qKFrOYZ2ZX+OVA0gF6tHPlR93aUvKrjlABp7GKk=;
	b=VexQ54a1GTXnhAb7gR9vRnC5Ckcgf8goh2klKnyA4wnUOKWZy6M3lBFnNodHC0k3Ls
	lQ/YeCi9kiwS88LNDi3/lWuLayh4NJr1kv67VFf7dLV+5N4WZFZLQbZDPH3amaUXhv5m
	4ZiQwPhCFTFBEhqMW2DPLkA+C6qMnCGnqvPYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
	:references:user-agent:mime-version;
	bh=UP86qKFrOYZ2ZX+OVA0gF6tHPlR93aUvKrjlABp7GKk=;
	b=AUfY5pJr4ntnXkfEKMLTKiQBG+KwUm07HQwiG2hWDPXzAonskhCiN8ulx1MeJ4DBwq
	9jne1MqigLP/ug7uCPGj81Bolowuo+UAx+GUeOoEMBuRvHWZ0xIyXtHstyTLVaMycfxE
	gDnWrwRbe4ehptOu2WkMocdThpuBUBgoNfHaGAyAca/mn8jvPRkQf6miijCzeWcyh4x5
	FVX1Ot44krEt4js4emzQFESmUysls8v++Hz2bCnHU3BEYVk/8kflIYhTQ0xdK/pDyJFW
	uE+mXqu0BlO6TDsphrFVWov6xGbBSIA/r2nX0ht8TdsZh78G4yB+/QQGC+xoB5Av3as2
	4SfQ==
X-Gm-Message-State: APjAAAX64/kjpkA3WwAvmz85YcTQMbefTgAxGS03u9wjWzhe7d4yQy9h
	0DkD7UwOb8IuSRGMjMwULHf/Kw==
X-Google-Smtp-Source: APXvYqzF8bh/hEJFbIMmc9icVx0cCSiNwtDqCF7rn+nfwPnYxGIQXpFlfOqoZ79nL15VEPHh5tkX4w==
X-Received: by 2002:a05:6638:93b:: with SMTP id
	27mr15839508jak.36.1568413737120; 
	Fri, 13 Sep 2019 15:28:57 -0700 (PDT)
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
	by smtp.gmail.com with ESMTPSA id
	i62sm45832448ioa.4.2019.09.13.15.28.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 15:28:56 -0700 (PDT)
Date: Fri, 13 Sep 2019 18:28:47 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
X-X-Sender: scottm@godzilla.spiteful.org
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20190913221123.GA31095@localhost>
Message-ID: <alpine.LFD.2.21.1909131822190.5588@godzilla.spiteful.org>
References: <20190913215809.34402-1-scott.murray@konsulko.com>
	<20190913221123.GA31095@localhost>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: upgrade to 243
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
X-List-Received-Date: Fri, 13 Sep 2019 22:28:56 -0000
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Sep 2019, Adrian Bunk wrote:

> On Fri, Sep 13, 2019 at 05:58:09PM -0400, Scott Murray wrote:
> >...
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-wait.h.patch
> > @@ -0,0 +1,25 @@
> > +Include wait.h
> > +
> > +Fixes:
> > +src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
> > +  158 |         r = sd_event_add_child(w->manager->event, &w->child_event_source, w->child, WEXITED, on_brightness_writer_exit, w);
> > +      |                                                                                     ^~~~~~~
> >...
> > +--- a/src/login/logind-brightness.c
> > ++++ b/src/login/logind-brightness.c
> > +@@ -1,5 +1,6 @@
> > + /* SPDX-License-Identifier: LGPL-2.1+ */
> > +
> > ++#include <wait.h>
> >...
>
> This should be
>   #include <sys/wait.h>

Okay.

> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
> > @@ -0,0 +1,54 @@
> > +Handle __cpu_mask usage
> > +
> > +Fixes errors:
> > +
> > +src/test/test-cpu-set-util.c:18:54: error: '__cpu_mask' undeclared (first use in this function)
> > +src/test/test-sizeof.c:73:14: error: '__cpu_mask' undeclared (first use in this function)
> > +
> > +__cpu_mask is an internal type of glibc's cpu_set implementation, not
> > +part of the POSIX definition, which is problematic when building with
> > +musl, which does not define a matching type.  From inspection of musl's
> > +sched.h, however, it is clear that the corresponding type would be long,
> > +which does match glibc's actual __CPU_MASK_TYPE.  So, add a typedef to
> > +cpu-set-util.h defining __cpu_mask appropriately.
> >...
> > +--- a/src/shared/cpu-set-util.h
> > ++++ b/src/shared/cpu-set-util.h
> > +@@ -6,6 +6,8 @@
> > + #include "macro.h"
> > + #include "missing_syscall.h"
> > +
> > ++typedef long __cpu_mask;
> >...
>
> Signed looks wrong.

I went that way since the usage is all with sizeof, and both glibc and musl
use sizeof(long) in their internal definitions of the set array.  The array
element type is unsigned long and my comment is actually wrong since
glibc's __CPU_MASK_TYPE is __SYSCALL_ULONG_TYPE, so I'll fix this.  I'll
upload a v3 shortly.

Thanks,

Scott



