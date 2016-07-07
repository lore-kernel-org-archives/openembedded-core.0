Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1B36013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 07:54:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so3533537wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hXoTb1iFsoK+qjBj9ImTE3KVqRL2yJy0c12wWYO3Yzw=;
	b=jKv+ZWpElex34AmREGiYrr+pL0vv3sVGHq+UpqsFbsLGRMAk/bwjTgVhPDZvi9ILtk
	pSY+jz9WELIXnFLr160zL8eecEq71i+fbbqD3G62n2kU2d8wNlRCgEOINHH7rBOiH0o3
	XmTdM0JFUTuzLnlKw9hiaYyBTnjo8DIMI/uVWlx+9dCmaCbmPK/zu39+X7XASBP4AqaW
	wnbGbcToz55S+7xZ3/svXlQlJNfmIN7vX6gTzqhPj7MR6cpTM3L8olUQZem0wJdh8v+Z
	YpLWqXtHhA0LtTWS8QbM4diJineEOXeO+G3T3KvhnmOTocBfkz1dwiZNo8wjbeX14Y1n
	DUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hXoTb1iFsoK+qjBj9ImTE3KVqRL2yJy0c12wWYO3Yzw=;
	b=lavYjXn34eW5aO1vD7wmxD6Tp+sqWwKp6sjtkyRjD7pwS3vpHkvfnCP9iEIrF8ytsC
	BRe4F4J+MU/1NZzgCqczXAcFFpqm8bJlPfQCbnw8y6Mr6DtXJ1RVVtXu5iWzKcjvLyAc
	KwrFo0Hs1VA/CCch+/I4coCl8TxIVfu8A9g37gSIKGUk56sIW5Qwo8oSrkmREZPPJ3qm
	DtAWtCqB8Y7xePMbWwZmK0WRj2Q94w7OUdtdNVUzGZMP4MOK9CzQRq3wXmQGSHA/jrOX
	pfnZZiPQu2YB3liQzv8zQQnHUkA+4AL4765bJfojBDYGtL2iNv3oOO2FaQlyN4Avk4iJ
	qvmQ==
X-Gm-Message-State: ALyK8tKxxyrBI2iBICN490r7RtOMH1czbnfLAox3IUCK0rY/54jeqo+XdFfyrqpbv4Eja/IHqA6/LeOI7vkWfg==
X-Received: by 10.194.104.227 with SMTP id gh3mr24650103wjb.3.1467878068699;
	Thu, 07 Jul 2016 00:54:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.47.69 with HTTP; Thu, 7 Jul 2016 00:54:28 -0700 (PDT)
In-Reply-To: <102523f6b96c68522c940a9c004ce5fc3f977f7b.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
	<102523f6b96c68522c940a9c004ce5fc3f977f7b.1467855356.git.liezhi.yang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 7 Jul 2016 00:54:28 -0700
Message-ID: <CAJ86T=USf+vf3xe-J6yNw97Ro9oKbMjjv9dOF5-5JpA_Vt7Lzw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Thu, 07 Jul 2016 07:54:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 6:37 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Based on the e2fsprogs release notes, v1.43.1 adds a new configure
option, --enable-hardening

  http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43.1

It might be nice to either enable that by default, or provide a
PACKAGECONFIG to control it (and in either case, verify that it
doesn't conflict with security_flags.inc).

> ---
>  .../e2fsprogs/{e2fsprogs_1.43.bb => e2fsprogs_1.43.1.bb}              | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.bb => e2fsprogs_1.43.1.bb} (98%)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
> similarity index 98%
> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
> index e82124b..ba11690 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
> @@ -1,7 +1,5 @@
>  require e2fsprogs.inc
>
> -PR = "r1"
> -
>  SRC_URI += "file://acinclude.m4 \
>              file://remove.ldconfig.call.patch \
>              file://quiet-debugfs.patch \
> @@ -11,7 +9,7 @@ SRC_URI += "file://acinclude.m4 \
>              file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
>  "
>
> -SRCREV = "d6adf070b0e85f209c0d7f310188b134b5cb7180"
> +SRCREV = "48203a389d2d9f45dd0768f0963cb2b3ffbc12df"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>
>  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

