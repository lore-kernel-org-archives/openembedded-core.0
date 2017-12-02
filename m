Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 85D3778416
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Dec 2017 00:31:38 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id z34so11752159wrz.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 16:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bfG+wUtYap4ja4RpLCcjY+Svs8O7yStruLuqZKkp7L8=;
	b=szfjQ9LZwmU5DJ0FZ8VC/2a4hDgMhvMcgrTds1Bw4q+Gi+c120L4+ySk5xWp//Ni4H
	9UJlYIwlfgDbJ0znVEMguN4bq2ihFRtiBLVVKqV9doMXjnwi0JgI7oG3mo0zN76D2Tam
	p4bjyMt9QnoNNaxFIUJ0b3xZM9GFDJgcHbGKS1zhffBbg9bVT0//jqPzQ53HLMEcgb9C
	nolUjAcBi5p93XTIiwc2hbhn4uGiAwzTGc92pcfCyHhsZVwaMKpjl7OK0khgFumPz+q0
	XG0GCJEqN+8dePko9d/3wWxMB/34ivzt1s6RAdbOXPkZD7nvsOQIMMI/nj5sJKCixSOX
	JjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bfG+wUtYap4ja4RpLCcjY+Svs8O7yStruLuqZKkp7L8=;
	b=SctnsJ+4RGr+OnUKf4/522ynF20qqlMamCSOedvM7nAioex/Us3ECPsOlGeI9RJbtA
	v8mf/pLZQb9yKi+SzAKYZCF0F8Q5yxnr1c09K+V0vCo5iYCfroMf6WEIGip5FLH7JZIV
	laMNvUjCAWAypEq/BCJuLfUg40vZZI5sxQDLsuM0u17WYoTFrCyHcJKOpyvWHLia7gv3
	J4M6Oa7tDMQcxn4YEj9cRyPjMfqMGRHfy7ZpNTJ0PLHl7SEWhapnlh1TzYoRZWyK81Yo
	zY18UQIDBwAZ2Yfpyy9gCn6QtAi56K0YTCgxP+d5b2Gt2bhK4vOntH5HUNV7HA3eyuP2
	i2RQ==
X-Gm-Message-State: AJaThX4L2T+Y45RlRkMHPCq/ZSnwvkYVJsShNgbm0aLD/zUkOmgm4IGl
	Y/V1o8STGFP5BH7sgNHBa99PYuy/0Pcz7PticwI=
X-Google-Smtp-Source: AGs4zMZGRAFBiU7jNfT+dIIsEPyb8bsW9kXWCRfi6NUjAl5QbesO0R9yPEWOvZzU6cgD8M7Ha24uYFNszYNpqHLhWD8=
X-Received: by 10.223.173.67 with SMTP id p61mr6098238wrc.226.1512174699143;
	Fri, 01 Dec 2017 16:31:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Fri, 1 Dec 2017 16:31:38 -0800 (PST)
In-Reply-To: <826373113902dd8d6284ec49a2ea2076c7e298c0.1510192517.git.raj.khem@gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
	<826373113902dd8d6284ec49a2ea2076c7e298c0.1510192517.git.raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 1 Dec 2017 16:31:38 -0800
Message-ID: <CAJ86T=VKWCdmAXRMV8dqSnQS=MdHX=H3odPHKtydB6SCEFyrMQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] musl: Update to 1.1.18
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
X-List-Received-Date: Sat, 02 Dec 2017 00:31:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 8, 2017 at 5:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Rich Felker (9):
>       fix access by setjmp and longjmp to __hwcap on arm built as thumb2
>       for executing init array functions, use function type with prototype
>       fix read-after-free type error in pthread_detach
>       fix incorrect base name offset from nftw when pathname ends in slash(es)
>       in dns parsing callback, enforce MAXADDRS to preclude overflow
>       release 1.1.17
>       fix regression in glob with literal . or .. path component
>       fix build regression on ARM for ISA levels less than v5
>       release 1.1.18
>
> Szabolcs Nagy (1):
>       math: rewrite fma with mostly int arithmetics
>
> Will Dietz (1):
>       posix_spawn: use larger stack to cover worst-case in execvpe

With the version of musl currently included in rocko, various apps
(including bash) segfault at startup when compiled as Thumb2. The "fix
access by setjmp and longjmp to __hwcap on arm built as thumb2" commit
from musl 1.1.18 fixes that.

However the other changes in musl 1.1.18 look pretty useful too, so
unless there's strong objection, I'd like to suggest aligning rocko
with the musl 1.1.18 release. ie cherry-picking the following two
commits from oe-core master to rocko:

  c3f0a70 musl: Update to 1.1.18
  3953c54 musl: Update to latest


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 671de326fb..932c9a27a0 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -3,9 +3,9 @@
>
>  require musl.inc
>
> -SRCREV = "48be5b6313d7b827acf555769e93b389fa9f6307"
> +SRCREV = "eb03bde2f24582874cb72b56c7811bf51da0c817"
>
> -PV = "1.1.16+git${SRCPV}"
> +PV = "1.1.18+git${SRCPV}"
>
>  # mirror is at git://github.com/kraj/musl.git
>
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

