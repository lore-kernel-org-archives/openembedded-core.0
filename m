Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 08E957CC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 23:12:07 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id a48so12766804qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 15:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pkZ/6fCOvd3OvNZbrLYgoAdVupKXW8lMwn6/qvMrTI8=;
	b=u0vmjh22kzFIHAkv+TTLOc2gKsDHSAZ5s7yJk6AoQPFTLqzy39rHEL3PqWVG8oPLcC
	o7wHTqcqny5Fwk/g1P9Z0ciL9lxz7U1IG9vTFnUzjNvB4KXeFdNMT688lNQBh+NU7jRm
	SMrT21FU3S+pjeEIEc6jLsKjszaWbAM0B7RY6vADffhO7B8aq3C4gem29tzkUJZvR75H
	xmyVoA4fxTOJwQB5ZlnetoFL9n1bS9HivcZsLt7d0Tei+SJxqwOL+DlNc0VcBQY8TIDQ
	El4EfdNyjFdsEUa4rkwA5/8NeoEUjH6az6dA437Sf0enfdST/xZVctRWqqXW11YfFGpX
	tW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pkZ/6fCOvd3OvNZbrLYgoAdVupKXW8lMwn6/qvMrTI8=;
	b=TSVW6RcT0Cry1syZNk/leVWMLE0VUKRG5CS32ABAOW7KrzOsRZeMXtsqjVOJBIXvSS
	9Xq4V98rKUgtSXe5U0JSXQxP9hYa8rDr5RGLiuqpX17N1/qtrZAIvVco3rCzb5PmHzOz
	tpFieNlNByhWDzmZd/9rKPOGWntBAiYVwbL50xIWvt0oNsG+QeGpLvQkH/4iu4LysmqG
	2zf2R5PhsTeVwM3l2i3BW7EBmrqiz/kL/w+k64NEugdw07T3zraPWLisaoY39We6Qc3b
	Ge6FjeBs8D8whzEPtFqV06mzUp9gLgNJMcsQcHN/CQ9BYwkdYqJXEMTTzlrcJ537GGGm
	N9MQ==
X-Gm-Message-State: AHQUAubyRqdOaYs+u2VfwQp6BTX1iSZnlM91VScGVVcQfyvBz0SJmaWS
	Xf5uq7ilPqhF+cqYCjAiinna2ItP4Y1c0gT5Tn8=
X-Google-Smtp-Source: AHgI3IbSkf5qT/7fF10XBCyV/lXpPZ7hSV+DAIYB0sE7rfWNp5uhTyJ/aye3EyxvZ6loEAGUGa8PSomD5E3HUyH6u34=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr9662092qte.196.1551136328747; 
	Mon, 25 Feb 2019 15:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20190225213911.20656-1-alistair.francis@wdc.com>
In-Reply-To: <20190225213911.20656-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2019 15:11:42 -0800
Message-ID: <CAMKF1sraXaL_fMtSnhMcZyOm7SBnyWoe4Tw7wfEKJG1phZ8KGA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Remove ChangeLog diff from patch
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
X-List-Received-Date: Mon, 25 Feb 2019 23:12:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 1:50 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> To avoid conflicts with other forks of glibc remove the diff from the
> ChangeLog.
>

LGTM

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...e-unsigned-Jcc-instructions-on-size-.patch | 21 +------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch b/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
> index 1c625f63c7..1a343149c0 100644
> --- a/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
> +++ b/meta/recipes-core/glibc/glibc/0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch
> @@ -21,33 +21,14 @@ Tested on x86-64 and x32, with and without --disable-multi-arch.
>  CVE: CVE-2019-7309
>  Upstream-Status: Backport
>  Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>  ---
> - ChangeLog                                | 11 ++++
>   sysdeps/x86_64/memcmp.S                  | 20 +++---
>   sysdeps/x86_64/x32/Makefile              |  3 +-
>   sysdeps/x86_64/x32/tst-size_t-memcmp-2.c | 79 ++++++++++++++++++++++++
>   5 files changed, 111 insertions(+), 10 deletions(-)
>   create mode 100644 sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
>
> -diff --git a/ChangeLog b/ChangeLog
> -index 29bc4451ef..a0dcdac323 100644
> ---- a/ChangeLog
> -+++ b/ChangeLog
> -@@ -1,3 +1,14 @@
> -+2019-02-04  H.J. Lu  <hongjiu.lu@intel.com>
> -+
> -+      [BZ #24155]
> -+      CVE-2019-7309
> -+      * NEWS: Updated for CVE-2019-7309.
> -+      * sysdeps/x86_64/memcmp.S: Use RDX_LP for size.  Clear the
> -+      upper 32 bits of RDX register for x32.  Use unsigned Jcc
> -+      instructions, instead of signed.
> -+      * sysdeps/x86_64/x32/Makefile (tests): Add tst-size_t-memcmp-2.
> -+      * sysdeps/x86_64/x32/tst-size_t-memcmp-2.c: New test.
> -+
> - 2019-01-31  Carlos O'Donell  <carlos@redhat.com>
> -           Torvald Riegel  <triegel@redhat.com>
> -           Rik Prohaska  <prohaska7@gmail.com>
>  diff --git a/sysdeps/x86_64/memcmp.S b/sysdeps/x86_64/memcmp.S
>  index 1fc487caa5..1322bb3b92 100644
>  --- a/sysdeps/x86_64/memcmp.S
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

