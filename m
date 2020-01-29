Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD8B360069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2020 02:28:56 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v25so12088877qto.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 18:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n6KJoQ/eOJxjNkv2hi+WKqi8y3WaQirsDNyDstUCPbg=;
	b=dkqKC81mQ5mrchB4dWykOpE4aiHjcFDG486JFJK1TYBWRpQe9E+YEex4l0lX6Ojs5r
	zy9GM9JmzJ9FDVD0b7ObtfkztVzV/m4DSlY3Tulz9arbLBVIEKdPGf95fjCZghEeasQi
	L/8lNJzXWFRNoRljQt1c9FWexa7HV4bcWuMdw1Ql8en6i+QnYF10CobauaYLppXuL5dR
	abapZgN/fRV0qP0Y3FT+AcBWx/5MTu40fr8l0QD+ylP6FnkCATBDy9o1BNRVNpicm0w4
	oc7SlOfBdU4JsRgoCx59qWlxYiaeQGQHxv8xWGtdF/eDGPd9RWHfRl4Wm+JKOepXmYnR
	EcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n6KJoQ/eOJxjNkv2hi+WKqi8y3WaQirsDNyDstUCPbg=;
	b=RQFGIAjnE6hyU3p+W86ooFZi/JMIiMmNtoAonRQ9bV2U+mGXwT2wc8dA6HSoljJN3Q
	0+L0aXvYH9PO4TvLIiOA7GqguUv4QKwwqAZNj7jEeSiQyO/tbXgbw4/HhWeOf+/25eGa
	SiHVExnjiB2dDsh8rbpZH841y8Ld+AdwJTBP6P+x/qZd6fMMeeUhv0OfIXo0DYnI/XBo
	imd7Zv2ljqFlzKZsbCFiiLyU0UB0VH5+5VcGOzWnfayI+kK7FxPjZTB/YIEDRYUnztRF
	zNwbA3E4Jfjz36G9KklRQqkjU8UFKZ1PxSi3+Bq6HQ/ywo/1lxgpnHPhdezKbiXEokCb
	aG7A==
X-Gm-Message-State: APjAAAXN9JDy+9O0LuodQV1FJFXcKudJW0ksdUpf2cAY9R1TF7HlvvkZ
	yCgdh9bMGK207ixSg0qX2BcM7M1HNCknBL1k+AWK8cE1
X-Google-Smtp-Source: APXvYqzfvY6/q6QR6LoETPTEJpMqIxiNL9XYvPmQgh+7X2skPX/wuuaTSGZYD/j8LDJGLv/qZ7mpZ/aZTzguf5PGiZU=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr26381357qkh.9.1580263129096; 
	Tue, 28 Jan 2020 17:58:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1580248809.git.bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 17:58:23 -0800
Message-ID: <CAMKF1soahdfvfsi_-27Zm3QMsr_Mp__oZ8k22gVuUZJpvn1Q-Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3][RFT]: kernel-yocto: v5.4 LTS kernel
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
X-List-Received-Date: Wed, 29 Jan 2020 02:33:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 2:14 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Hi all,
>
> I just wanted to send these to the list, so everyone could see the
> reference kernel that we are planning for the upcoming release.
>
> I have other patches to drop 4.19, 5.2 and make this the default
> kernel for the various reference platforms as well, but I'm not
> sending them, since we still have two outstanding issues:
>
> 1) mips64 init is segfaulting after / during some self tests.
>
>    https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c
>
> 2) x86 musl is getting a gpf on many commands:
>
>    https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/steps/8/logs/step1c
>

musl now uses 64bit time_t for all 32bit platforms. So my hunch is in
that direction. If you can point to
an interactive reproducer that will help. I think stracing it will
help identify the problem. all segfaults seems
to be similar so it could just be one issue causing this all.

> I've looked into both, and don't have any great ideas on how to debug
> or fix them.
>
> So if anyone has ideas, or wants to poke at these, feel free to follow up.
> But as of now, we still can't merge the v5.4 kernel as the reference due
> to these remaining problems.
>
> Bruce
>
>
> The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:
>
>   bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)
>
> are available in the Git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
>
> Bruce Ashfield (3):
>   linux-yocto: introduce 5.4 recipes
>   kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
>   kernel-devsrc: update to v5.4+
>
>  .../kern-tools/kern-tools-native_git.bb       |  2 +-
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  8 +--
>  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
>  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
>  5 files changed, 136 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

