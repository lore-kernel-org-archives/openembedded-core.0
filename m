Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id C197E7C8A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 15:15:26 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id g1so28724094otj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 07:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k8vpj4i+92WBD9h6Lox2545IIcMgitrt/ReVgDYdtM4=;
	b=IEUFrpqrXqz+xJMq3/ri2r+6fLcR5HURM4C1xA9/bKbCk820VEfnBIvrpwL1uXUOLH
	gw33pEQHL9BiEw2SKKCptIThnTpY4Chz+QhyW3CX8j2IkT7Dg4/qhMo48fDHBinNVHlq
	9V1GmK0QM/0Pkwg66nMkyZfwk1R8+Yo5l76LjGLcACUB/1VAauLqNyVvRlsWE6h4IDyB
	W8qm0H/mq5Bd3EtyZAnoL4SY+wk6VjhzQjjgwp4LHCsJNSgpLOicB69iExZNwuGMdCK2
	VCyiEaB3O/Eeknvtf9PME+yDy1+Gb3xmVdeVZ2drbzQ1H3Y7MyHS8jYzRZEcCAr8/BSp
	TNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k8vpj4i+92WBD9h6Lox2545IIcMgitrt/ReVgDYdtM4=;
	b=ZYRQq9GdbTtZ87YH0Hvl/xlrDgmpc0lI3IyQiZbnRwvotNrgIO3lFcJ/h/f75+iaqs
	Qzs47nSB3ufxKqHsmkjVyqCDgKT8A2yhp5YffMCWNZ5r4lBiQ+XPZiloaCnWYA8xWHbw
	N4c6mB0pLo+8Ti5Lb7HshQG3mK3I/57x0og8XjGxcuUi/3LD9OFek1hy13SFsUGeRihU
	LGQBZbt4S7qUu5qRL7npiD4zhk+mavIhlp5JbQ8jjV43R1Kz6NLdiZPByJjWZYu2GLhi
	naTzBSIsLISCLk7X6ApXdPfQu43xk/0PNy4ko7W0OACbzZzQPalxOeVdl06B+y75UYbk
	QxBQ==
X-Gm-Message-State: AHQUAubXVf/ncBz0AGG2m9iFLbln03MaH3RbQhLdNR7dCwRjALgmbAxD
	xwumLJeQwK2IaRqR0l7NGrRdiIFqc2YXVTRoWf4=
X-Google-Smtp-Source: AHgI3Ia+h6zdxPjBNyKUEjhnvpFFBYss8DHOpEZsVTlEpfNrlBwiUj+rIa0QxoryeHJS7W1baamPYVP2M66KcyYwW6s=
X-Received: by 2002:aca:30c2:: with SMTP id
	w185mr14821948oiw.163.1550502927746; 
	Mon, 18 Feb 2019 07:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20190131065016.21887-1-raj.khem@gmail.com>
	<20190131065016.21887-6-raj.khem@gmail.com>
	<CANNYZj8VWh4ZECFQdzqR7+eS6Lh5yt1oLOBqCx7rzKNTUUWj_w@mail.gmail.com>
	<CAMKF1sqwwWS40ihF952tKBnzGvb_pO=sCZBnuU1cNJ=330mCxA@mail.gmail.com>
In-Reply-To: <CAMKF1sqwwWS40ihF952tKBnzGvb_pO=sCZBnuU1cNJ=330mCxA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Feb 2019 16:15:16 +0100
Message-ID: <CANNYZj9QOH06p6qQRKWAjw7sDE3oPRB5XNAefUrukf_+WxdmPw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] llvm: Upgrade to upcoming 8.0.0 release
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
X-List-Received-Date: Mon, 18 Feb 2019 15:15:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Feb 2019 at 16:04, Khem Raj <raj.khem@gmail.com> wrote:
> > There is now an official git repo for llvm, which also has version tags:
> >
> > https://github.com/llvm/llvm-project
>
> yes there is and its intentional to use this mirror, since the
> llvm-project is a super repo and
> contains all llvm projects sources which is going to clone tonne
> unnecessary code.

More than half the commits are llvm's. (llvm-only mirror repo 175k,
llvm super-repo 310k)
So it adds to the clone, but not that much.

The point is something else:
- llvm-mirror is not an official repo, and may become stale/unmaintained
- llvm-mirror does not have version tags, so we can't trace commit ids
to the releases, or track upstream development with automatic tools

I think these two things outweigh the extra clone overhead.

> > I'll make a patch to switch over to that.
> >
> > Also note that final 8.0 is not yet out, so the recipe shouldn't make
> > it look like it is.
>
> This is intentional too.
> Its in rc stages and there are no specific chages espcially in
> versioning schemes
> which will mark it rc etc.

What I mean is there is no mention whatsoever that the recipe is
currently building a pre-release. It's not in PV, it's not anywhere in
the recipe. This can mislead people.

Alex

