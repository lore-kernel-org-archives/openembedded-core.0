Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D34D60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 23:08:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r68so11954253qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 16:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y744G0YJ3XR3FZ3MfpZDQKtvJWR/gchhQSDRg1kZtPY=;
	b=mmCWtVbAUuUWfmOeERLApMW7NKECW9R8XgtUo7hpaVD9V+74Sm+q35nu2SJ5GcO9si
	+IfAmjST2++U9v4IDmgw3Q1SrKsfKMMcirwTk35hUkCUCH0YkEzLgYI8XCifiTUSqf1P
	b/b1yU35SzKWIm8pfu3wdjClWLkDNOZYIAj+7020dQA7XcenzEJWIPLHI//a3mb3a8lx
	SqHsbuMYqeNm53ZGwvp6Oti3+dcP4sB4E7o/zMfas0K1xsKtLLE6MvuGQlLdKbp+MDba
	qM75kaEK29ZYtWiE73OhWSZeBPFektFGddaG6XP/JMUj11wDgvIqpowzpyVlyOyg6nw2
	V1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y744G0YJ3XR3FZ3MfpZDQKtvJWR/gchhQSDRg1kZtPY=;
	b=JawjAO075yznTLVPzziOlrx7Yfo6sI9hZUDyTcKyYZHaO1h02tBYF7qP4+oGyY9mH1
	NomEYYzKq8u237pzGcSjEM8SbLAESIyPcTu5SHhY0XBH0XKBjFbAg+6Qjl1oAUlUAA6Z
	/QueHwM06jcgy5S3w/LbT+391ihweuGBMXHMCnbpEEfjGUlYXZRRLjqEbkMqPJRG7Wly
	iI5TRQVgYS3fM0p5f9U+eegTam2bEF0vhWMEaMSPb4oJsFfOo4LtIs2yq2AgifXvcnhu
	4pOizjL7PrtQb7DFuWUrg05cVkFlrxDMMiDz7b/Nr3M5uEKGHJQg6HlRpC13D3zO49Ii
	8fGg==
X-Gm-Message-State: ALyK8tJ/oBGsKz2eqNS3GGeyL0BA2AVHpud9nxiJriewYzgTyax1pOuAn2YP0Ld/z4dPLgfv/M1UIcYOdIiP1Q==
X-Received: by 10.55.178.195 with SMTP id b186mr10054539qkf.81.1468019309402; 
	Fri, 08 Jul 2016 16:08:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 8 Jul 2016 16:08:00 -0700 (PDT)
In-Reply-To: <1468018113-32659-1-git-send-email-akuster808@gmail.com>
References: <1468018113-32659-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jul 2016 16:08:00 -0700
Message-ID: <CAMKF1sro1hRSYMG8O4bEck78EyJbpWunmOWZG_43a2je3nPXQQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvisa.com>, Armin Kuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] glibc: CVE-2016-4429
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
X-List-Received-Date: Fri, 08 Jul 2016 23:08:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 8, 2016 at 3:48 PM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Signed-off-by: Armin Kuster <akuster@mvisa.com>
> ---
>  meta/recipes-core/glibc/glibc/CVE-2016-4429.patch | 86 +++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.24.bb             |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch b/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
> new file mode 100644
> index 0000000..074c60d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
> @@ -0,0 +1,86 @@
> +From bc779a1a5b3035133024b21e2f339fe4219fb11c Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Mon, 23 May 2016 20:18:34 +0200
> +Subject: [PATCH] CVE-2016-4429: sunrpc: Do not use alloca in clntudp_call [BZ
> + #20112]
> +
> +The call is technically in a loop, and under certain circumstances
> +(which are quite difficult to reproduce in a test case), alloca
> +can be invoked repeatedly during a single call to clntudp_call.
> +As a result, the available stack space can be exhausted (even
> +though individual alloca sizes are bounded implicitly by what
> +can fit into a UDP packet, as a side effect of the earlier
> +successful send operation).

this should be covered with latest pull I have sent especially this patch
https://patchwork.openembedded.org/patch/126637/

would be nice if you could test this one out.

> +---
> + ChangeLog         |  7 +++++++
> + NEWS              |  4 ++++
> + sunrpc/clnt_udp.c | 10 +++++++++-
> + 3 files changed, 20 insertions(+), 1 deletion(-)
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-4429
> +Signed-of-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: git/ChangeLog
> +===================================================================
> +--- git.orig/ChangeLog
> ++++ git/ChangeLog
> +@@ -1,3 +1,9 @@
> ++2016-05-23  Florian Weimer  <fweimer@redhat.com>
> ++       CVE-2016-4429
> ++       [BZ #20112]
> ++       * sunrpc/clnt_udp.c (clntudp_call): Use malloc/free for the error
> ++       payload.
> ++
> + 2016-05-11  Florian Weimer  <fweimer@redhat.com>
> +
> +       Do not use mcheck in localedef.
> +Index: git/NEWS
> +===================================================================
> +--- git.orig/NEWS
> ++++ git/NEWS
> +@@ -48,6 +48,10 @@ Security related changes:
> +   called with the GLOB_ALTDIRFUNC flag and encountered a long file name.
> +   Reported by Alexander Cherepanov.  (CVE-2016-1234)
> +
> ++* The Sun RPC UDP client could exhaust all available stack space when
> ++  flooded with crafted ICMP and UDP messages.  Reported by Aldy Hernandez'
> ++  alloca plugin for GCC.  (CVE-2016-4429)
> ++
> + The following bugs are resolved with this release:
> +
> +   [The release manager will add the list generated by
> +Index: git/sunrpc/clnt_udp.c
> +===================================================================
> +--- git.orig/sunrpc/clnt_udp.c
> ++++ git/sunrpc/clnt_udp.c
> +@@ -388,9 +388,15 @@ send_again:
> +         struct sock_extended_err *e;
> +         struct sockaddr_in err_addr;
> +         struct iovec iov;
> +-        char *cbuf = (char *) alloca (outlen + 256);
> ++        char *cbuf = malloc (outlen + 256);
> +         int ret;
> +
> ++        if (cbuf == NULL)
> ++          {
> ++            cu->cu_error.re_errno = errno;
> ++            return (cu->cu_error.re_status = RPC_CANTRECV);
> ++          }
> ++
> +         iov.iov_base = cbuf + 256;
> +         iov.iov_len = outlen;
> +         msg.msg_name = (void *) &err_addr;
> +@@ -415,10 +421,12 @@ send_again:
> +                cmsg = CMSG_NXTHDR (&msg, cmsg))
> +             if (cmsg->cmsg_level == SOL_IP && cmsg->cmsg_type == IP_RECVERR)
> +               {
> ++                free (cbuf);
> +                 e = (struct sock_extended_err *) CMSG_DATA(cmsg);
> +                 cu->cu_error.re_errno = e->ee_errno;
> +                 return (cu->cu_error.re_status = RPC_CANTRECV);
> +               }
> ++        free (cbuf);
> +       }
> + #endif
> +       do
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
> index 77630e3..c2a31e0 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -37,6 +37,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0023-eglibc-Install-PIC-archives.patch \
>             file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
> +           file://CVE-2016-4429.patch \
>  "
>
>  SRC_URI += "\
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

