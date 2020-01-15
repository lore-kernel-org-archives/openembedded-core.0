Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id E05877F9B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 18:36:42 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id j17so16445264edp.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2DVdOwAPVguNdJNbVKpVpT/rreVG5Ev5P1XmYyZi1DU=;
	b=izF0aurus+uCLWpLpJiNg/hkPygWAhpuBoRjb6KcPJxjReJl7mT54bdZyKRpNKHOL4
	vSYLfw1ZcBGCd5FCrhkxIy3yn9bfHV81b8Hzs4m1zDjDIHdhSKDAulZYaRUm8B4AZhU7
	qagFgRQ/IwRNvulQS0qUCC2Nng8fsPFoeSEmAVIkjkXMtSsjItD1ToGfH0gsy+tXqqv7
	c7RhOGqKT+pkfywgpwvXXXSXXXcflcyx/I642mZh131kqaCqKhyG39Q+H0N8U4ER10gd
	NaflpIToM5IC8tsvjGv/ZMebgIFmqoxzAtCKQynJ9JOayU49VUtsnkWlX5/TJK1Gvl3Q
	uY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2DVdOwAPVguNdJNbVKpVpT/rreVG5Ev5P1XmYyZi1DU=;
	b=S7kj0dpxX/vdpKOYXoKEdZFpxQihzaw2SlTXKB+2+R3h6vZAP+1A8CEfg/vkIb89ZH
	F1dYxCdaJPs7DaARLv7EPJ/NrEgX/brSWWbidL5z6lkHSuLqHM/cXr7q85nLqlywo/8Y
	tr0vhjgiSbIWD/JelC7n8Dl9/10aatvUi4pAra10fFCC/+DioqyGsU2bxRK32hbz0QV5
	G9Fpx1dDH+tsqP0GeSsd6Vwv8OeOcjnjjx5XEkrQwrHEqt0pjMBAWUAvV1Ww+FzXM2Ik
	jwYustPQ8ve8PyQGudLSrbuUk/PaybyYupLbmCfHrofPlVTxUUidSOKl02wyw6rB1d2/
	HW0g==
X-Gm-Message-State: APjAAAUjfZyoVUWWwoveDdp/rVXc3mvPSfk+7vzHhURnD3Ut+qNXfP6s
	LUb5aQf4bsv2WjWw4Y0kYdATtijQvSDeg7YlWPo=
X-Google-Smtp-Source: APXvYqy59ME9GNwSoLUccjlhxPWjlzCqk0xZvVmHPMqTUZjxZvmNukjblSy2M3+5QlGG3l10Di3lgXoQP5TBiFEjr6Y=
X-Received: by 2002:a05:6402:c9c:: with SMTP id
	cm28mr31980721edb.88.1579113403401; 
	Wed, 15 Jan 2020 10:36:43 -0800 (PST)
MIME-Version: 1.0
References: <20200115180828.17399-1-pbarker@konsulko.com>
In-Reply-To: <20200115180828.17399-1-pbarker@konsulko.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2020 13:36:32 -0500
Message-ID: <CADkTA4MSwdq_JjofhfyCJvQ=dY45G9tYhGtAp2Vv+7M-EB46Rw@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Make kernel-yocto bbclass usable without linux-yocto.inc
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
X-List-Received-Date: Wed, 15 Jan 2020 18:36:43 -0000
Content-Type: text/plain; charset="UTF-8"

I already have an entire queue in development for this.

So hold onto this series. I'll publish my branch later this week, or early next.

Bruce

On Wed, Jan 15, 2020 at 1:08 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> Patch 1 allows the kernel-yocto bbclass to be inherited directly in a recipe
> without needing to use linux-yocto.inc. I can then use kconfig fragments in
> my kernel recipe without pulling in the whole of linux-yocto.inc (which
> includes some things I don't want like KERNEL_FEATURES changes and the
> LINUX_VERSION_EXTENSION default).
>
> Patches 2 & 3 fix some minor issues I spotted while working on this.
>
> I've tested that linux-yocto can still be built for qemux86 after these
> changes.
>
> Paul Barker (3):
>   kernel-yocto: Move defaults and tasks from linux-yocto.inc into
>     bbclass
>   kernel-yocto: Drop setting of unused variables in do_kernel_metadata
>   kernel-yocto: Only override CONFIG_LOCALVERSION if
>     LINUX_VERSION_EXTENSION is set
>
>  meta/classes/kernel-yocto.bbclass         | 34 +++++++++++++++++------
>  meta/recipes-kernel/linux/linux-yocto.inc | 21 --------------
>  2 files changed, 25 insertions(+), 30 deletions(-)
>
> --
> 2.20.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

