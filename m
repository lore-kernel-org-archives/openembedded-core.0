Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id A175560290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 16:31:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b11so19304375wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 08:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=R+lcPZNHgUW5vZ9rKg659egQO79zUUXEMONwKR1dOhs=;
	b=Qgz5zOdnkh3QChVv1/+xmMZG11UAuJsHAShi/rJAHRAqX8ySEetM2fc00bFPTqWfT2
	hG7oujbKNSfU0Q2tK6eq+S7OTNz/usn/Y8BfucjTE5sydJX4yhtGhKROyFm/b3GwGYMo
	t8FlY0ATVJEDEStxNqmzAIePy+RYwKHFbP5aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=R+lcPZNHgUW5vZ9rKg659egQO79zUUXEMONwKR1dOhs=;
	b=dE4VdHWEkfU/03+oXWkpwYPTmtXsIKpn0Ss3cziuvSb0rJVoNK44HaTkCzSoIwBmoy
	vym5vM+svRtrd+pnOIkIHFyELmNHe3LrXxx9a/T6nAcnRzESAO9PKj93vsRuNugtRyQJ
	oMNpRw9Oq6MtznXxMl3vCsCkhUlszKFeszzCjWSYiowNWYUcUIaP6LaxYoHmzA1bKbRx
	+7KGDgt4u546qHBxcOGZWLsph8u3wp7B8KMWZD9QPFfT0a1vMyqVQ9ul/TeyfAQ1bnvk
	SImDC+G0owVrZInUuIU9I2vttR6WSha8xrP5AXMagpc8+M1+IEZ7y0qHDrcRI+jQlZ0Y
	qRMg==
X-Gm-Message-State: AA+aEWbh5uoz6SJk923uuT8dHI3s+RiI0TfQzLshdxeglgJuGqzUe/x/
	YP/6KbO6jT2ljsmK3CwCFuU8eg==
X-Google-Smtp-Source: AFSGD/XkdbAKzOuByfTQw7ib1jsdTNpdfrrlN0rOd/5I9PHC4NgptI19pdL629iCm+7uMXF/gQsJUw==
X-Received: by 2002:a1c:a8d2:: with SMTP id r201mr23818313wme.81.1546014682054;
	Fri, 28 Dec 2018 08:31:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x20sm50854018wme.6.2018.12.28.08.31.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Dec 2018 08:31:21 -0800 (PST)
Message-ID: <cc3405fd6c7f18dfa7dc9f545ae33e4515b7b856.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 28 Dec 2018 16:31:19 +0000
In-Reply-To: <298dd0b5-f2f8-23dc-3a0d-cf05958e038c@windriver.com>
References: <efccb653-580b-3a5f-6e3d-be5d51b6b8c1@windriver.com>
	<8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org>
	<298dd0b5-f2f8-23dc-3a0d-cf05958e038c@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: gdb failure on simplest hello world program -- oe-selftest
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
X-List-Received-Date: Fri, 28 Dec 2018 16:31:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-28 at 17:49 +0800, ChenQi wrote:
> On 12/26/2018 07:06 PM, richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2018-12-26 at 10:09 +0800, ChenQi wrote:
> > > Hi All,
> > > 
> > > 'oe-selftest -r package.PackageTests.test_gdb_hardlink_debug'
> > > fails.
> > > I did the tests on both my Fedora27 and ubuntu16.04 servers. They
> > > both 
> > > failed.
> > > I can also reproduce this issue manually.
> > > 
> > > I did some investigation. No clue how to fix this it. So I want
> > > to seek 
> > > help from community.
> > > 
> > > Below is some output from oe-selftest.
> > > [snip]
> > > 2018-12-26 09:27:58,440 - oe-selftest - INFO -
> > > test_gdb_hardlink_debug 
> > > (package.PackageTests)
> > > 2018-12-26 09:37:55,333 - oe-selftest - INFO - gdbtest
> > > /usr/bin/hello1
> > > 2018-12-26 09:37:59,904 - oe-selftest - ERROR - GDB result:
> > > 1: Reading symbols from /usr/bin/hello1...Reading symbols from 
> > > /usr/bin/.debug/hello4...done.
> > > done.
> > > (gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h,
> > > line 107.
> > > (gdb) Starting program: /usr/bin/hello1
> > > 
> > > Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
> > > 107    /usr/include/bits/stdio2.h: No such file or directory.
> > > (gdb) Continuing.
> > > Hello World!
> > > [Inferior 1 (process 312) exited normally]
> > > (gdb)
> > > 2018-12-26 09:38:00,907 - oe-selftest - INFO -  ... FAIL
> > > [snip]
> > > 
> > > The hello world problem is as follows.
> > > $ cat 
> > > meta-selftest/recipes-test/selftest-hardlink/selftest-
> > > hardlink/hello.c
> > > #include <stdio.h>
> > > 
> > > int main() {
> > >      printf("Hello World!\n");
> > > }
> > > 
> > > Some extra information:
> > > 1. Remove '-O2' or '-D_FORTIFY_SOURCE=2', and it works correctly.
> > > 2. Adding some system call like daemon(0,0) before printf also
> > > works.
> > > 3. Reverting poky repo to
> > > 1c048479af7cc98e30f9a33d1f3bef03711544aa, 
> > > which adds this selftest case, does not work. It still fails.
> > > 4. Hongxu confirms that things work on his host.
> > > 5. I also don't see failure about this test case on yocto's
> > > autobuilder.
> > > 
> > > Could somebody help to provide some suggestions?
> > 
> > This is strange and there must be some difference between your
> > configuration and what what we test on the autobuilder or on
> > Hongxu's
> > setup.
>  
> Hi Richard,
> 
> I have talked with Hongxu and we can now both confirm that there does
> exist some problem.
> 
> > Which DISTRO and MACHINE are you using?
>  
> DISTRO is poky
> MACHINE is qemux86.
> 
> It seems that if MACHINE is qemux86-64, the test case could pass. But
> that's just because the test case only checks 'Breakpoint 1, main ()
> at hello.c:4'. See the console output below.
> (gdb) b main
> Breakpoint 1 at 0x1050: file /usr/include/bits/stdio2.h, line 107.
> (gdb) r
> Starting program: /usr/bin/hello1 
> 
> Breakpoint 1, main () at hello.c:4
> 4        printf("Hello World!\n");
> (gdb) c
> Continuing.
> Hello World!
> [Inferior 1 (process 156) exited normally]
> (gdb) q
> 
> Even in this case, the 'b main' does not give correct result. The
> test case passes because 'Breakpoint 1, main () at hello.c:4' is
> there.
> 
> On qemux86, we have:
> (gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h, line
> 107.
> (gdb) Starting program: /usr/bin/hello1 
> 
> Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
> 107    /usr/include/bits/stdio2.h: No such file or directory.
> (gdb) Continuing.
> Hello World!
> [Inferior 1 (process 156) exited normally]
> (gdb)
> 
> > I think the key to resolving this is will be to understanding how
> > to
> > reproduce it...
>  
> Two ways to reproduce the problem:
> 
> I) reproduce it via oe-selftest
> 1) . oe-init-build-env build-selftest
> 2) SANITY_TESTED_DISTROS = ""
> 3) oe-selftest -r package.PackageTests.test_gdb_hardlink_debug
> 
> II) reproduce it manually
> 1) add meta-selftest to bblayers.conf
> 2) IMAGE_INSTALL_append = " selftest-hardlink selftest-hardlink-dbg
> selftest-hardlink-gdb"
> 3) bitbake core-image-minimal
> 4) On target:
>      gdb /usr/bin/hello1
>      (gdb) b main

I confirmed I could also reproduce it. We've just been lucky with the
configuration the autobuilder tests. 

I think we need to improve the test case. Does installing the libc
headers/dev package so that stdio2.h is there help?

Cheers,

Richard


