Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id F14F0799B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 13:47:59 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id q4-v6so6038791otf.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 06:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VTt3tLYq9P4EKRQSv7Utzo6gpsWvu71Z/o3pRHfYFL0=;
	b=eCfVAYnqHdD2Dzg3etMvoMlWAV/kBWtxEtwHEkqOeWGMtZr4TxI/XvLY65rzd6SWtK
	urkZ5H9FJoD/rQoWm4xvVhYr8saSr+r5D0Pq0BovncEZ60nYDJjLJaKYnWBTJQj5v93e
	gEsXTM5Zo0fUShn6YhN8cVAe+uu1/Y/hbHC/Lg4VHlvrxaEzk0ywnUk1awh3Y3HcPKij
	5Y89WB5jUsCAo7OSPXCErowK9hHx8giVCrxoN4Zhe5c8EMd33jGfqLwL6R5knGgo0DY8
	jTufaQER3xILf+5OK+fNsIxN8ZYazJsF97ZGcnuJim30xpdinBUSWyaYtA2WzIW6M/y6
	A3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VTt3tLYq9P4EKRQSv7Utzo6gpsWvu71Z/o3pRHfYFL0=;
	b=LMlrsNsgLOL742FtFq3tzqlXOdQyOZM/chRnPjwpM5bE76Ccdjye9vG13ODEippqv1
	wClwbgNMcZ9j6GG8v9oFz5SeWdwQhY0cdjSutH7fS/S2SmANyn/9RF511AIyQbTe3iTs
	wRJV0QtbptVYMILXUI8TyZ9Vn8h2XZRRQSOvBPcscpD/iXl8D9GiGR4LRdPPAYI8HrET
	Em66k7dJuiRugWcXoSDzIXNIFV0EYG0QzhfIQSMiHGqNTSqk3JYOmze8zyHiwKdHENkl
	ZVJeaxM8WyxVPct2jQCpEC+jDTLgVmkeejl+hD72QNatw00uutc620diaEIKBRCBv+U6
	8cTg==
X-Gm-Message-State: ABuFfoh9WkMK2RZaleapM2UkSpKnjE3bH46eM81De+D118HcTT79KaWg
	i8gnyFvyCqUZWft35/T3kh2foi+dgeF9qy5ssINjBnsX
X-Google-Smtp-Source: ACcGV61Uf2mApqnXxlw9XYPJ9pW9Mnw54tXAeMualx6mMyTe2OzujjKhXIyZAuyYLNCKQtJhDWaSAHfnYyzBeU+NjRw=
X-Received: by 2002:a9d:4d8d:: with SMTP id
	u13-v6mr9755981otk.133.1538142480828; 
	Fri, 28 Sep 2018 06:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20180921060925.46930-1-hongzhi.song@windriver.com>
	<20180921060925.46930-2-hongzhi.song@windriver.com>
In-Reply-To: <20180921060925.46930-2-hongzhi.song@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Sep 2018 14:47:48 +0100
Message-ID: <CAJTo0LbhZtuWHThndVRu21PDYzb6OX0XftzH7dbYKibenf8v_g@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sigwaitinfo01: recent glibc calls syscall directly
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
X-List-Received-Date: Fri, 28 Sep 2018 13:48:00 -0000
Content-Type: text/plain; charset="UTF-8"

Please put the recipe name at the beginning of the commit log, and
rebase on top of master.

Ross
On Fri, 21 Sep 2018 at 07:10, Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> The case of sigwaitinfo related to sigwaitinfo API failed.
>
> glibc commit
>   8b0e795aaa44 ("Simplify Linux sig{timed}wait{info} implementations")
>   changed sigwaitinfo to call sigtimedwait, which calls rt_sigtimedwait
>   syscall directly.
>
> So, an invalid pointer no longer crashes child process and test
> reports failure. Fix it by accepting either crash or EFAULT.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  ...nfo01-recent-glibc-calls-syscall-directly.patch | 75 ++++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
> new file mode 100644
> index 0000000000..46e7fabd3d
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
> @@ -0,0 +1,75 @@
> +From 0932ca0a6f3ed9f7ae4487ed77ec07eb3610f4a7 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Thu, 20 Sep 2018 21:49:02 -0400
> +Subject: [PATCH] sigwaitinfo01: recent glibc calls syscall directly
> +
> +glibc commit
> +  8b0e795aaa44 ("Simplify Linux sig{timed}wait{info} implementations")
> +changed sigwaitinfo to call sigtimedwait, which calls rt_sigtimedwait
> +syscall directly.
> +
> +So, an invalid pointer no longer crashes child process and test
> +reports failure. Fix it by accepting either crash or EFAULT.
> +
> +Signed-off-by: Jan Stancek <jstancek@redhat.com>
> +
> +Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2018-September/009338.html]
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c    | 30 +++++++++++++++++++---
> + 1 file changed, 26 insertions(+), 4 deletions(-)
> +
> +diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> +index 95a9436..8fa8ac3 100644
> +--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> ++++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> +@@ -371,19 +371,41 @@ void test_bad_address2(swi_func sigwaitinfo, int signo)
> +               tst_brkm(TBROK | TERRNO, NULL, "fork() failed");
> +       case 0:
> +               signal(SIGSEGV, SIG_DFL);
> ++
> ++       /*
> ++        * depending on glibc implementation we should
> ++        * either crash or get EFAULT
> ++        */
> +               TEST(sigwaitinfo((void *)1, NULL, NULL));
> +
> +-              _exit(0);
> ++       if (TEST_RETURN == -1 && TEST_ERRNO == EFAULT)
> ++           _exit(0);
> ++
> ++       tst_resm(TINFO, "swi_func returned: %ld, errno: %d",
> ++           TEST_RETURN, TEST_ERRNO);
> ++       _exit(1);
> ++
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       SUCCEED_OR_DIE(waitpid, "waitpid failed", pid, &status, 0);
> +-      if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
> ++
> ++   if ((WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
> ++       || (WIFEXITED(status) && WEXITSTATUS(status) == 0)) {
> +               tst_resm(TPASS, "Test passed");
> +-      else
> +-              tst_resm(TFAIL, "Unrecognised child exit code");
> ++       return;
> ++   }
> ++
> ++   if (WIFEXITED(status)) {
> ++       tst_resm(TFAIL, "Unrecognised child exit code: %d",
> ++           WEXITSTATUS(status));
> ++   }
> ++   if (WIFSIGNALED(status)) {
> ++       tst_resm(TFAIL, "Unrecognised child termsig: %d",
> ++           WTERMSIG(status));
> ++   }
> + }
> +
> + void test_bad_address3(swi_func sigwaitinfo, int signo)
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
> index 9cd3489722..c99d5a2b00 100644
> --- a/meta/recipes-extended/ltp/ltp_20180515.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
> @@ -52,6 +52,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
>             file://0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch \
>             file://0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch \
> +           file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

