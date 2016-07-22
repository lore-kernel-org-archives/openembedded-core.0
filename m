Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id DB5F360746
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 14:14:10 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id q8so8739306qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8viLA1y018Fr9e9INvlaAf5hF9rl42+a0Dzlq1vBOy8=;
	b=03wmNlyfXclOEdXoX3qb7q5NT1U3mbFrVxJE1fwp8L7pyUhnvrXdbSv8wMKyuALrzk
	vD9OM/Kxvx6Qx4n+go5WZfOqWuAkMDAObzqRMPk/GM4xazQKDsFD9PpTLIb9NWTyN0gn
	mFxL4y/v0BRUZ+p2VAp5Yb8qPiXNCs6obeF+LHlP0rPh9pH+GdZ75jAIDc8Z7HQRyWi1
	t2fkrGJKKKiZ12UVOOi8Oy0OeEN7QuU2Mrr0buEwLXImoVZTZSp0R+YNlWN0wAdlj8cx
	FZF1KkntkvCXES0LNKBfuuUAV1zQA4pbskWYSL8a2P6+TVtvbeJ5qOAsZTxctvPy7xoS
	22fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8viLA1y018Fr9e9INvlaAf5hF9rl42+a0Dzlq1vBOy8=;
	b=FhMzlW0s9u4AyWYK2o1lLuRH7WPj1Cu9ESuEnabuEIksJUfwLugW0yWOtU7KoXE+mC
	eaa5aMpHg/z6K4ZuKzY3OpMIevQMdBOOgndCfO8QDcZj2c7oLvH1KyXXO5KfCtQ0qH92
	NqGcq/2JE4FwT17g3Cb0ummDu0jw0b7jcxbLtcAhGJAYpIJhs32uP4bwPgWEnelXqgdZ
	I+LYRmUsdzkbKcTCjcRSegTn7xqObBOav55Ak53Uvr6GkBPqjGkTq9lhHWoUwc1/PNT9
	L+cMNg25c4t7Dwgb5hQDb++hgnqsESPR7zJpLz4yAs+P0IvZx9sAse+ZKe4NIOLaoOed
	VEMA==
X-Gm-Message-State: AEkoouvaE6qVkM8IIieqlvoOXKRvmBE7bYARH1uzRevWylkIK5PalcbKb1FdJJ0XFlsDxDqSnqYMiwHkf8M1mQ==
X-Received: by 10.55.97.18 with SMTP id v18mr4851928qkb.102.1469196851443;
	Fri, 22 Jul 2016 07:14:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 22 Jul 2016 07:13:41 -0700 (PDT)
In-Reply-To: <1469196210-29675-1-git-send-email-ross.burton@intel.com>
References: <1469196210-29675-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2016 07:13:41 -0700
Message-ID: <CAMKF1sqfNqA=EDATUOBauPBDOTQ6uYXhvfH9SuP84jDmT2xw6w@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oeqa/decorators: handle broken links when creating new symlink
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
X-List-Received-Date: Fri, 22 Jul 2016 14:14:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 22, 2016 at 7:03 AM, Ross Burton <ross.burton@intel.com> wrote:
> When checking if a link exists before creating it, use os.path.lexists() as
> otherwise os.path.exists() on a broken link will return False.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/lib/oeqa/utils/decorators.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
> index 0b23565..615fd95 100644
> --- a/meta/lib/oeqa/utils/decorators.py
> +++ b/meta/lib/oeqa/utils/decorators.py
> @@ -190,7 +190,7 @@ def LogResults(original_class):
>              local_log.results("Testcase "+str(test_case)+": PASSED")
>
>          # Create symlink to the current log
> -        if os.path.exists(linkfile):
> +        if os.path.lexists(linkfile):

I think it will fail if the existing file is not a symlink ?

>              os.remove(linkfile)
>          os.symlink(logfile, linkfile)
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

