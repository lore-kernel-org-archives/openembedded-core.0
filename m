Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0CF6B49F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 00:35:06 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so3546313lbd.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 17:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GBm0rX4oYp3ZAOHivqHOyRguukKrOZTQ+xyWXEol1x4=;
	b=pOc2Z223qDLQjWzp/JKplhBnvy1LYsLp2F/6PAfu80Ct6pa6fBwMK9VbAGcWjGMAAW
	0kAhdSix39daTPkLMt8WAZS/rEJc1/GTvHJZfLKWkG3wqAa8Wl3MOQMrFtoD9gIddkJ3
	ZKFyW9UIaO/Ic+6CdRVM+xltcInVhN/GOSMuuiHApg8vHvTbaR0FF6EkO/vzC3e5b1kY
	ILmWk2W/nLuZb+cCM5uZxRivsHHmz5aBM2fWCCr4Q2+sfwYFVijY3QQW9WtV4ZlEEv9G
	SYk74gEyFlzoYv7LlKeBTGYW6rmoWhafudBkMOEzT0Xc9wqJmpMtoj9g6pIHnBdYE9pK
	ly8Q==
MIME-Version: 1.0
X-Received: by 10.152.207.74 with SMTP id lu10mr20169763lac.28.1402360506584; 
	Mon, 09 Jun 2014 17:35:06 -0700 (PDT)
Received: by 10.112.124.146 with HTTP; Mon, 9 Jun 2014 17:35:06 -0700 (PDT)
In-Reply-To: <1402348889-26065-3-git-send-email-henning@itconsulting-heinold.de>
References: <1402348889-26065-1-git-send-email-henning@itconsulting-heinold.de>
	<1402348889-26065-3-git-send-email-henning@itconsulting-heinold.de>
Date: Mon, 9 Jun 2014 20:35:06 -0400
Message-ID: <CADkTA4NZ5gepMbUgTf1F8isyCkd0FMTVWyq11HVUZWrY=V5F5Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] perf: fix broken shell comparsion in do_install
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
X-List-Received-Date: Tue, 10 Jun 2014 00:35:12 -0000
Content-Type: text/plain; charset=UTF-8

When describing something as broken in the short log, it's typically a good
idea to also include the symptoms, and the fix. That way the log will tell
someone experience a particular problem that this change indeed addresses
their problem.

Bruce

On Mon, Jun 9, 2014 at 5:21 PM, Henning Heinold
<henning@itconsulting-heinold.de> wrote:
> The patch was sponsored by sysmocom
>
> Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index adbecfd..74686ca 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -112,7 +112,7 @@ do_install() {
>         unset CFLAGS
>         oe_runmake DESTDIR=${D} install
>         # we are checking for this make target to be compatible with older perf versions
> -       if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
> +       if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0" ]; then
>                 oe_runmake DESTDIR=${D} install-python_ext
>         fi
>  }
> --
> 1.9.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

