Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 46F4274E20
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 01:22:15 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 131-v6so18640826vkf.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 18:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4tg6Fe3N/VrQ07jOAUJ/xq3k9YH9GrY7Vi5qR16OiTk=;
	b=VGp31klCqV2wzbzcb0eq+DPmzyuGeqwuzIQCa973XtR7gH5mJbXfvPmMQJxOfHgpDB
	hJRfTQhcfVSRQugo1ZuA1YkbNkv1nMaPORdAuuD3khY+8en/UNyPdHg/Ogbkn9ezin6I
	AWCMwfQf6V+gfAZEQqkqZZ3loxzMsSK7mWkL+YsiYu+UreHCecRt519wb+0953qng4Eq
	mYON7ye1OIF0KHWlCAH5XryN9Wj0bt7ht7ed1Kwq5Y12diXNw436FnK6EaPxMJh69xID
	LS31+6cAa/9qQ86oSbSNgOF1buzbGGnsfFwfRh4yvgYZDelKOnr326I07PghYBUhYw9/
	dkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4tg6Fe3N/VrQ07jOAUJ/xq3k9YH9GrY7Vi5qR16OiTk=;
	b=m5cQWplksjl6GQmJX2HmUPfL0yKauiZxMMlXLPdYkofwK/rJ88/hkzdIAIa8qdq/pD
	ir1MaOs6eayBAVKy+JyznEmAOlu5ijf+wPfT3H7H/PHZ9Ffs2V4yMKVxjQ/pKFDsAO4u
	UfJOYup6RRsk3jx0GHBZLT+Xl+w+qvQDhcK4deiy0GXcj6fQlnGpxuO26HUlZdw5PLCE
	Fp1y18XkHhB9RXLtJHWb6heouuuAMThEpNuDZKszQG9mihpI8ET+aAgDuyIlbxCGtK4r
	Ue0GDY1IMF146xpH/jGiTvbIckrS9cvifgr6H6cIL1ryOCjTcpt+6ILH8t5olRffTHy8
	uwqQ==
X-Gm-Message-State: ALQs6tDiUXpBXv1AZjs4JKZErIc+gBeuid/A5GSRzYqh7I6pu1LvnkvZ
	kbo9MaIbT7Ko/yUZfxp2ba4xgusEPfxbKpTavs4=
X-Google-Smtp-Source: AB8JxZp/z828MzFFRECUyf/KvUe2WuXwzXA0HVqpQKuPPtY4LVrn1INUh0mV2FRcroqa9YLmBrgKkMKoiCiLyNTEHr0=
X-Received: by 2002:a1f:4445:: with SMTP id
	r66-v6mr32007066vka.154.1525742536482; 
	Mon, 07 May 2018 18:22:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Mon, 7 May 2018 18:22:15 -0700 (PDT)
In-Reply-To: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 7 May 2018 18:22:15 -0700
Message-ID: <CAJ86T=VK+Um4wa6F2EVzQTNiwa8LC1nhTEQrLqH2GBuSzCkbWw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 0/6] SRC_URI updates and minor build fixes
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
X-List-Received-Date: Tue, 08 May 2018 01:22:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 20, 2018 at 7:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Daisy has now (long since) left upstream maintenance and entered into
> community support. As a member of a community which still actively
> develops against this version of OE, I would like to propose the
> following updates.

Ping.

Are these kind of updates OK? Or are there objections to the community
trying to support historical releases? There are many millions of
devices in the field that I know of which are still being actively
developed and maintained on top of OE 1.6.

> Andre McCurdy (4):
>   gmp_4.2.1: fix build for MIPS
>   ncurses: fix build with gcc 5
>   binutils: fix build with gcc 5
>   mesa: fix SRC_URI
>
> Khem Raj (1):
>   kernel.bbclass: Remove bashism
>
> Krzysztof Sywula (1):
>   dtc: old SRC_URI died, changing to new working one
>
>  meta/classes/kernel.bbclass                        |  2 +-
>  .../ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch    | 53 +++++++++++++++++++
>  meta/recipes-core/ncurses/ncurses_5.9.bb           |  1 +
>  meta/recipes-devtools/binutils/binutils-2.24.inc   |  1 +
>  ...86.c-Werror-logical-not-parentheses-error.patch | 61 ++++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa_9.2.5.bb           |  2 +-
>  meta/recipes-kernel/dtc/dtc.inc                    |  2 +-
>  .../avoid-h-asm-constraint-for-MIPS.patch          | 57 ++++++++++++++++++++
>  meta/recipes-support/gmp/gmp_4.2.1.bb              |  1 +
>  9 files changed, 177 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-core/ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-tc-i386.c-Werror-logical-not-parentheses-error.patch
>  create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/avoid-h-asm-constraint-for-MIPS.patch
>
> --
> 1.9.1
>

