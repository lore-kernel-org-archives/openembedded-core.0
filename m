Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0586C3AA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 15:32:34 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id i21so5256614oib.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OzTKrBik2ak9/BEnTujZnCZ9C7TK8zdCfDYFl53Xl8s=;
	b=bKBuSSM/deu+cOrl6ueV4/wNA+0EqcqfyGVHLGfH+cl03/NP4t3Vwa8jLEqjiCHZhp
	edSpOKVQMNxlMeGGVIvhcJ1THoCKfgfsr3aZbZoO9VaLR4GOPQIEi0QiV2WEO3r+jmq9
	cWz49dd/HxwE4w8+PtGvY4yFE0+YZUbHReBsOrMbmaGoCk9WgqTsRdpcE7wfZ6GaiOPR
	PDHeUFGMeq+1Um+KgupBJSStPL7lrn7JUlzRytd2quRB1NI04K3ZfX1ZWX3MTHo3DR9Q
	uwwfXtYzEAZ/04aK8zgaCFWatZBXR7KFanx8soxGYZFc/54zFxdjZXELDkgomWW85mOi
	0GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OzTKrBik2ak9/BEnTujZnCZ9C7TK8zdCfDYFl53Xl8s=;
	b=jKy6BZwkGLA8NMHkIbbbltUz/rdryipceafkFJRbQ0VGRULCDGNidkQMFtYf8WWID6
	90a/F5FPF70l8of8M4cAYi+FgPymazVqDB5q295oY+8T3aE8Vzlmn/MurHpGMZQXbtUt
	W/e+Et/6IqQdE+puencSZFKk/bw8ooulY70HbBAOlKvQb/M3fyllQKw47dyhwoGpgO3n
	FSdLVk56BuUZGhqJmUXBVLkvoHy0suG6HxYhq36AfEORpxROAdxbOzn3B9LjgrRM70NT
	1Qle4tqzme6eYz/RaS/PZ5SxVfXPR/+qhwykflwIe7XJJd9c3FadkC7lSJ6TV+4NKhfi
	9C/w==
X-Gm-Message-State: APjAAAWDUYeuhj7lCKk2/PDn4l3sNWHI0CHDU8W07DbRGwMPQ8mn6Y1s
	Dou+EHqufptOwogKOcgkKAiwwKG1cjBXZvZxQu6hKQ==
X-Google-Smtp-Source: APXvYqyqvxgrItmgGXIGQvU62dZZlOHPh+j7oliOacyrxozyiWJ1KBNgPTbgAYAsZ9HvPPl/95nAkBbbp7NwhspM70o=
X-Received: by 2002:aca:cc86:: with SMTP id c128mr9610734oig.119.1554046355912;
	Sun, 31 Mar 2019 08:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190331151439.25283-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190331151439.25283-1-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 31 Mar 2019 17:32:24 +0200
Message-ID: <CANNYZj93TpC4REvozSQ2HYaWSQoS1pnnROiqUgUSoCe2mXrawg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: update to 8.1.1097
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
X-List-Received-Date: Sun, 31 Mar 2019 15:32:35 -0000
Content-Type: text/plain; charset="UTF-8"

The tarball cheskums or SRCREV haven't changed?

Alex

On Sun, 31 Mar 2019 at 17:15, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../vim/{vim-tiny_8.1.1017.bb => vim-tiny_8.1.1097.bb}            | 0
>  meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1097.bb}     | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-tiny_8.1.1097.bb} (100%)
>  rename meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1097.bb} (100%)
>
> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb b/meta/recipes-support/vim/vim-tiny_8.1.1097.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim-tiny_8.1.1017.bb
> rename to meta/recipes-support/vim/vim-tiny_8.1.1097.bb
> diff --git a/meta/recipes-support/vim/vim_8.1.1017.bb b/meta/recipes-support/vim/vim_8.1.1097.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim_8.1.1017.bb
> rename to meta/recipes-support/vim/vim_8.1.1097.bb
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

