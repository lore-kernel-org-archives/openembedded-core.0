Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6006C251
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 11:43:50 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id a3so1941687ioc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 03:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9rjcyvsHboDeImAjOjLRhasiIojTGXkHIWAxh4NvG6k=;
	b=aHIyOnjAYjbI6yY4YN3/k5x9Ychkt3AxI2OZ22ajLzrX+Z6KwDJqrU8xDtlQpq3R6U
	vuBsJLUv2QWIPE2rYj6Vr/tExiIPkebbyAZhZCBjbq/e4OGcktkOhaIFD+Cy23FJKEhm
	XfEYjMEbuUIjkMS2RNI8wtoLGKVPLmHvudl4lXFfMFQ3uchkI8djAVb8VLu4ipvOLAn8
	VR7uKwDZf5MUU93k49xQ9hWFIi9IJiIaEu6w6B7BfS7sfyFXTdjn0H7aEKL5r4oA+KhX
	FCr6TAnltogxDUFObgqsb9R4CmShP8DXj9iE9AyPAXa5gmWrLIVibNWBpKLfyi5UuQL1
	bHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9rjcyvsHboDeImAjOjLRhasiIojTGXkHIWAxh4NvG6k=;
	b=I9ulS3AqvYtabATdudt4le0Y4ImDPcgH6hR9LA8xZM2yr49CgOUwiFGc/AkgFwZAqm
	7WBG1vGzMUKJEdFI4Wh3Lo7Nkwk8YOLXdUPDjSZ/6PBWVJgaN2HNtaa2knghmyvvfgIe
	oMAQz94r0x8JKx6hI+C+Gizr5YPyzKlBUPTB10lTZquZLV4Jpes7pOytPOD66G/50QaP
	arRt+Nb+buiAtjKkQfXHf02CwnPDwOoqkU/EhsAm+KO4X9tuoGhpM6/WQbHe4yRiqPpQ
	tIdqEljLBzhG/z2uK0n6G+dKdxx20Uyh9xv+DxyoCuzV47Zmi1BX8iEgqAXd0ZrvcNSq
	P9KQ==
X-Gm-Message-State: AGRZ1gLzQL0zd6yjoyIGd4OXm5WN9/STk03VsQ7s3T8nKMBhhmjOUHaj
	sINkUd9cVGDXqC7Y4vDm8pV8SL1XDj9uG7UJrtCerQ==
X-Google-Smtp-Source: AJdET5efmYENN9quGm3Pr8DnsHY2meRLPXht+nzx3bkfo1mskxXKnxmWW9aGqCGy+5ySRa+CWVCs5EBVYaqkcWPoEt8=
X-Received: by 2002:a6b:b844:: with SMTP id i65mr3661725iof.20.1542109432016; 
	Tue, 13 Nov 2018 03:43:52 -0800 (PST)
MIME-Version: 1.0
References: <1541662273-22871-1-git-send-email-hongzhi.song@windriver.com>
	<35eaf214-d7cf-aca6-f45c-88449b4eb68d@windriver.com>
In-Reply-To: <35eaf214-d7cf-aca6-f45c-88449b4eb68d@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Nov 2018 11:43:39 +0000
Message-ID: <CAJTo0LYgKPaLUb_0JE50Qmq9cLZXxLj8ZRkSJeg9khz4+XepMw@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: kernel/syscall/setrlimit05.c: use a legal bad address for mips
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
X-List-Received-Date: Tue, 13 Nov 2018 11:43:51 -0000
Content-Type: text/plain; charset="UTF-8"

Applying: ltp: kernel/syscall/setrlimit05.c: use a legal bad address for mips
Using index info to reconstruct a base tree...
A meta/recipes-extended/ltp/ltp_20180515.bb
Falling back to patching base and 3-way merge...
Auto-merging meta/recipes-extended/ltp/ltp_20180926.bb
CONFLICT (content): Merge conflict in meta/recipes-extended/ltp/ltp_20180926.bb
error: Failed to merge in the changes.

ross/mut has the posted upgrade to ltp 20180926 in. Do you want this
to be considered for a 2.6.1 point release (too late for 2.6.0)  Or
does the upgrade already cover this patch?

Ross
On Tue, 13 Nov 2018 at 01:07, Hongzhi, Song <hongzhi.song@windriver.com> wrote:
>
> ping
>
> --Hongzhi
>
>
> On 11/08/2018 03:31 PM, Hongzhi.Song wrote:
> > This testcase fails on mips32. The process is killed by SIGBUS which
> > is not as expect.
> >
> > This is because:
> > ((void *)-1) is not a legal bad address which causes the process
> > killed by SIGBUG on mips.
> >
> > 'tst_get_bad_addr()' returns an address that should works on mips
> > and other arches.
> >
> > Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> > ---
> >   ...t05-Use-another-method-to-get-bad-address.patch | 61 ++++++++++++++++++++++
> >   meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
> >   2 files changed, 62 insertions(+)
> >   create mode 100644 meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> >
> > diff --git a/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> > new file mode 100644
> > index 0000000..dd688e4
> > --- /dev/null
> > +++ b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> > @@ -0,0 +1,61 @@
> > +From ff1678f02fdf08e8b7cfca4d0d5aa7815b30957c Mon Sep 17 00:00:00 2001
> > +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> > +Date: Thu, 8 Nov 2018 01:30:53 -0500
> > +Subject: [PATCH] setrlimit05: Use another method to get bad address
> > +
> > +This testcase fails on mips32. The process is killed by SIGBUS which
> > +is not as expect.
> > +
> > +This is because:
> > +((void *)-1) is not a legal bad address which causes the process
> > +killed by SIGBUG on mips.
> > +
> > +'tst_get_bad_addr()' returns an address that should works on mips
> > +and other arches.
> > +
> > +Upstream-Status: Accepted [80bed467bc6ab48a6cd88a8ab74ca15d08830cb0]
> > +
> > +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> > +---
> > + testcases/kernel/syscalls/setrlimit/setrlimit05.c | 10 +++++++++-
> > + 1 file changed, 9 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit05.c b/testcases/kernel/syscalls/setrlimit/setrlimit05.c
> > +index 7ea7d62..61ac7c6 100644
> > +--- a/testcases/kernel/syscalls/setrlimit/setrlimit05.c
> > ++++ b/testcases/kernel/syscalls/setrlimit/setrlimit05.c
> > +@@ -26,6 +26,8 @@
> > +
> > + #include "tst_test.h"
> > +
> > ++static void *bad_addr;
> > ++
> > + static void verify_setrlimit(void)
> > + {
> > +     int status;
> > +@@ -33,7 +35,7 @@ static void verify_setrlimit(void)
> > +
> > +     pid = SAFE_FORK();
> > +     if (!pid) {
> > +-            TEST(setrlimit(RLIMIT_NOFILE, (void *) -1));
> > ++            TEST(setrlimit(RLIMIT_NOFILE, bad_addr));
> > +             if (TEST_RETURN != -1) {
> > +                     tst_res(TFAIL, "setrlimit()  succeeded unexpectedly");
> > +                     exit(0);
> > +@@ -67,7 +69,13 @@ static void verify_setrlimit(void)
> > +     tst_res(TBROK, "child %s", tst_strstatus(status));
> > + }
> > +
> > ++static void setup(void)
> > ++{
> > ++    bad_addr = tst_get_bad_addr(NULL);
> > ++}
> > ++
> > + static struct tst_test test = {
> > +     .test_all = verify_setrlimit,
> > +     .forks_child = 1,
> > ++    .setup = setup,
> > + };
> > +--
> > +2.8.1
> > +
> > diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
> > index ff85be7..240222e 100644
> > --- a/meta/recipes-extended/ltp/ltp_20180515.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
> > @@ -56,6 +56,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
> >              file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
> >              file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
> >              file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
> > +                file://0001-setrlimit05-Use-another-method-to-get-bad-address.patch \
> >              "
> >
> >   S = "${WORKDIR}/git"
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

