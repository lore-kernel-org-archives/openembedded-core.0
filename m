Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0B74F606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 11:06:48 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id t200so2985442wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 03:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4h1fS05TKiSRz1QHOHWqT2+SkH731oS8jI2NMjqwZW0=;
	b=RPkl+Js2/uletheBUTm4+IYik+PhHPqRK7e1uhSh9VArhCKqv1Y0xy86iJGoALm4M6
	oveoMd3oAGlZZ4zi+ItvykLzkcPkU47CRTgOuw7vFHfLupklBAqMH0wgdltStSJKFMl2
	nUg10aShY72RLGyK/MMUAO7wMFfhzRpmKlGVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4h1fS05TKiSRz1QHOHWqT2+SkH731oS8jI2NMjqwZW0=;
	b=DyGgqfZVfPL9DN+RO+KJL2xYicL9ntAVh2QSmXotP/eR6lzDvix6XwIt6EOY1w1SOV
	Qu0P7If5DPkojarbDQahkeGJJkEBj0xzSmB8S7bfU1YbCxFsWxfUjLTjxfaT1/iXQg0w
	mtcc7RDSBHCXq1H8CzWw5y1dG2fe3j5yojKnRlT605GMc2lsrN+rVXF7lyAs9PmEX5KV
	si4KfZ9MU0JJqfXjB+wLqEhsM478faWOZ9LzwAxxZPw+PnmqhkQkXLXC0t+G518yeq2u
	/pJ0/Sl7yl8mrl14UJJjaYECSM0OGb3nGTNvAiDnguQdNQJjFqJafVx6ljQ4mgVhsv49
	h9xg==
X-Gm-Message-State: AA+aEWZBDknU0ZpPIJEgEIBTCnDw+PoqjhpWGqJDia1Ip5xAw052l1oi
	Kw+DB9g1HOAI0zkoiUMEVWBIAw==
X-Google-Smtp-Source: ALg8bN4wlfZZvtRgu/t6WkGMi2o+pqOP3JSSgM/EzPbJ8HC4PYIlx5ZwRFqVGtSUpLHUedKbkq4AsQ==
X-Received: by 2002:a1c:9a0d:: with SMTP id c13mr18251842wme.41.1545822409385; 
	Wed, 26 Dec 2018 03:06:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y138sm32510801wmc.16.2018.12.26.03.06.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Dec 2018 03:06:48 -0800 (PST)
Message-ID: <8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 26 Dec 2018 11:06:46 +0000
In-Reply-To: <efccb653-580b-3a5f-6e3d-be5d51b6b8c1@windriver.com>
References: <efccb653-580b-3a5f-6e3d-be5d51b6b8c1@windriver.com>
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
X-List-Received-Date: Wed, 26 Dec 2018 11:06:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-12-26 at 10:09 +0800, ChenQi wrote:
> Hi All,
> 
> 'oe-selftest -r package.PackageTests.test_gdb_hardlink_debug' fails.
> I did the tests on both my Fedora27 and ubuntu16.04 servers. They both 
> failed.
> I can also reproduce this issue manually.
> 
> I did some investigation. No clue how to fix this it. So I want to seek 
> help from community.
> 
> Below is some output from oe-selftest.
> [snip]
> 2018-12-26 09:27:58,440 - oe-selftest - INFO - test_gdb_hardlink_debug 
> (package.PackageTests)
> 2018-12-26 09:37:55,333 - oe-selftest - INFO - gdbtest /usr/bin/hello1
> 2018-12-26 09:37:59,904 - oe-selftest - ERROR - GDB result:
> 1: Reading symbols from /usr/bin/hello1...Reading symbols from 
> /usr/bin/.debug/hello4...done.
> done.
> (gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h, line 107.
> (gdb) Starting program: /usr/bin/hello1
> 
> Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
> 107    /usr/include/bits/stdio2.h: No such file or directory.
> (gdb) Continuing.
> Hello World!
> [Inferior 1 (process 312) exited normally]
> (gdb)
> 2018-12-26 09:38:00,907 - oe-selftest - INFO -  ... FAIL
> [snip]
> 
> The hello world problem is as follows.
> $ cat 
> meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/hello.c
> #include <stdio.h>
> 
> int main() {
>      printf("Hello World!\n");
> }
> 
> Some extra information:
> 1. Remove '-O2' or '-D_FORTIFY_SOURCE=2', and it works correctly.
> 2. Adding some system call like daemon(0,0) before printf also works.
> 3. Reverting poky repo to 1c048479af7cc98e30f9a33d1f3bef03711544aa, 
> which adds this selftest case, does not work. It still fails.
> 4. Hongxu confirms that things work on his host.
> 5. I also don't see failure about this test case on yocto's autobuilder.
> 
> Could somebody help to provide some suggestions?

This is strange and there must be some difference between your
configuration and what what we test on the autobuilder or on Hongxu's
setup.

Which DISTRO and MACHINE are you using?

I think the key to resolving this is will be to understanding how to
reproduce it...

I think its worth investigating and figuring out...

Cheers,

Richard




