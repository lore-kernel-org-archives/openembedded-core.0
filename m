Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 91D75784E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 18:57:25 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q189so17287259wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1dHnPkDrRAg8MUOZswxFAeb1cXIjZOgwHqlz5+o4+y0=;
	b=flglWDkYEtXvFjGgA6uwcYZwrU/Dtd3HGRhajYa4yuOhppG4IgpL4lvmmv/P99blha
	61PRfDAvx+iRXaPNiUkR2Kk+6SDTbFJHkWe2FGW2y1arATJoq21HAZZSuVqM8i9g/5aJ
	6nLJ/StPPcHIsiAy9CulgzY33uusswFaBzInitEI0mDgXvU1Y3UaTbruGoxhu6e7n8JI
	gyLe4sf6DISkf6l0LsaPYCf/tvHL0HNsioum3bF9aprs+CKIkBjIn1iOLzMVT0Xu49eV
	uHjmNPm4o6WuNzklj2R5fCCe+WNQgniwXfkCvYU26//8UYmp2t5nXutAyk+HhXbO7Vik
	WQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1dHnPkDrRAg8MUOZswxFAeb1cXIjZOgwHqlz5+o4+y0=;
	b=tWKZCwXSXRHgLzf3Cy5au8lBAnWTfAq2/VxG1LhJVLKg78j7lCZF4lffD9SvJx9SNl
	bMSv77UMdvj4OGnpp+Ov45xG99W1joBl2FwL7TuWEMTPUQhsxuaY3HIStGFd9HJnemYN
	rvf55Ms9rQuO8k/n0f4/YTztt8YJBXUS7XHyRmcr0/Fci8zhrOlZmAaZYeTUMXqYZFMf
	ZHr7H1PmHb5o36qjhoTir2wVXKxmLv1E3wuecLrYTE1bYTuhWNmtW68+RyFNwPd8xP9R
	ZDtceMd6RGToU+nQz/7EDNlxcLGzcIXbYZeGT9J/88bdFju6veIoR7qeEPb0KlUSx9Ey
	CpZQ==
X-Gm-Message-State: AIVw113FkQDYyfD2LCdGYAWCQuXeWcHu5Ezqya3HunAFqPiFUaAlbNQQ
	9z5+DnnisUPsum1W0pBKqHhshEc3qA==
X-Received: by 10.80.147.197 with SMTP id o63mr7671772eda.194.1501268246352;
	Fri, 28 Jul 2017 11:57:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 11:56:55 -0700 (PDT)
In-Reply-To: <1501267767-109163-1-git-send-email-denis@denix.org>
References: <1501267767-109163-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 11:56:55 -0700
Message-ID: <CAMKF1srgt4uLiwr3UjHjEG+ytPTBe0URvd-jboFw=N5gLkU_wA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf: fix typo in SUMMARY
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
X-List-Received-Date: Fri, 28 Jul 2017 18:57:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 11:49 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-devtools/autoconf/autoconf.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
> index f1b2dfc..ea62df8 100644
> --- a/meta/recipes-devtools/autoconf/autoconf.inc
> +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> @@ -1,4 +1,4 @@
> -SUMMARY = "A GNU tool that procude shell scripts to automatically configure software"
> +SUMMARY = "A GNU tool that produce shell scripts to automatically configure software"
                                                             -----^------
there is a grammatical issue too :)


>  DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
>  configure software source code packages. Autoconf creates a configuration script for a package from a template \
>  file that lists the operating system features that the package can use, in the form of M4 macro calls."
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

