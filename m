Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADB7731E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 02:50:55 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s68so27574186qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 19:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aXYSPo6FZV8zbqO7JtSU4c7714ozAsNL6RxtvEyGQp8=;
	b=zIYy3GMqDrSWcyrvOTZkOSQUv9URw5PhDHSVjKyl4rxVVi0a0XyqujTdQX7fjyEwo3
	5lpXTdeVzbhLqIAq48h7F6BIcjzIObZSLNO8MMoGtCbbmJaZL3r6hrpCCDakdtg5gcFm
	LAHADHV7U7GXy+sJilvL4K17Ha72zHroEnIqd8Fyzw1mmIo2oNgnJ72kukRo7Cje3I/7
	E43t01RsEDGusmR5Gt2VLCIYPgddNYWV/VaN712yyHoNg+GFzgHS5JOhU3KIea5ugz2I
	B1fODdExbzVqYJGyeZ+7M3s246Bs4SlkaMyDlJvNKJdUk7pGEyFthI7ZZ8lxzM1uww9V
	f9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aXYSPo6FZV8zbqO7JtSU4c7714ozAsNL6RxtvEyGQp8=;
	b=QyPNdFJxRalDNfg9EX2JtTtY8cOgvAXkXa4UpflXA9ihbYT+5II9wRRiJLMf93D/wO
	6VxVROfllUmqd2ebGZrft9qlyjZ3AOw7FAza1FByBu6JO+qdYoCo7jAZZoHtGLkOuAsR
	qz56JrjghPp+KTNszke8Ct5qEUalTErWMXX2d1QYEypaGBUymgyOYy76KObYcIqfA4hk
	CcMX4312p0iycx3OPj23q4YiNgDKRkeDsyM8IBwVpm5cyfb9UROEV9hMdIRFHGjDls7W
	Jg+lh8pN1MOcC/PueN39Ll461WVuqE2rpUfSyjvWwW3oaYmUN07H9QWCIsYf9PnwKsFj
	Uymg==
X-Gm-Message-State: AD7BkJLMadh3OKkNiV0fR9dvX4q/PxVq1I/uiEFvc2mUjf8stF7x2jcyU7ZI7Xpvn/TxW9MRWWpalYkfCPoEgQ==
X-Received: by 10.55.74.197 with SMTP id x188mr14854574qka.104.1458874256618; 
	Thu, 24 Mar 2016 19:50:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 24 Mar 2016 19:50:27 -0700 (PDT)
In-Reply-To: <1458688681-31394-3-git-send-email-brad.mouring@ni.com>
References: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
	<1458688681-31394-3-git-send-email-brad.mouring@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2016 19:50:27 -0700
Message-ID: <CAMKF1spi=cuJpMNXqAoEBL57L7q6rw1+fZ_=+sxhqB04z6YXYA@mail.gmail.com>
To: Brad Mouring <brad.mouring@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] busybox_git: Fix SRC_URI
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
X-List-Received-Date: Fri, 25 Mar 2016 02:51:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 22, 2016 at 4:18 PM, Brad Mouring <brad.mouring@ni.com> wrote:
> Since the commit called out in the recipe is off the master branch,
> update the gitful SRC_URI to specify the branch to use for the
> recipe.

no, we want master for the git recipe.

>
> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> ---
>  meta/recipes-core/busybox/busybox_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
> index 529ed5b..47c1364 100644
> --- a/meta/recipes-core/busybox/busybox_git.bb
> +++ b/meta/recipes-core/busybox/busybox_git.bb
> @@ -6,7 +6,7 @@ PV = "1.23.1+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> -SRC_URI = "git://busybox.net/busybox.git \
> +SRC_URI = "git://busybox.net/busybox.git;branch=1_23_stable \
>             file://get_header_tar.patch \
>             file://busybox-appletlib-dependency.patch \
>             file://busybox-udhcpc-no_deconfig.patch \
> --
> 2.7.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

