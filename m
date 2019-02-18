Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 185CF7C870
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 15:42:02 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z39so19689025qtz.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nFz10eNdccPEWXUyrTHMH71BrTnfhcyCXjJzoL6+G9Y=;
	b=NtSkGyQ1DMVLZA9KkxBc+cqLSxazl1U1+b9X1yOCSdH2v27o9AuXA++nVC63pBSzBy
	uY1XXkixc7zCmIawSb4DEBKzryRssWLCO6GGd733DDOKAY4MWM8VGP1ZbOHjfpLStFxS
	+EKAO0pDJ3EbAwJYWhVpUfdZoNYrDXT0WM5hSpgjEtHmkziCvIfmBqPRgFqXOk6Z3WS/
	x4WEX9Bkfhm43M7CJ3KDAoA6ca6CxDhMQSB97d1fp51kMujl7Hs4LSCE81wJYbBUHITQ
	4MIXuVD2h+lzdp2BRlTMnpJziPclweP9cCOa9tq06Oe+iZ3e3kH1cDS3OIbv9N3bL2aI
	uYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nFz10eNdccPEWXUyrTHMH71BrTnfhcyCXjJzoL6+G9Y=;
	b=QZQc+aNPmNXelufAHx+P6Dyh3t7grO07/2vmbOSEOIZzYrzVhGzwvsDektnZziaVBd
	xSXVZcf2zK3MXrLxhq/HzdkxpxO/6ePrQjx6K4/ggVJQ+HgWIXA+ub4Uue960C0Rl/u3
	f7DvOmJJ1eMYunw4klOYvh4FL3u2sEFEqfjwceW5gUBM4OmuRZNOTNfh8LrbFHYaisO/
	lS05H4Oy14kUXMIuiOpKxyfkOTuTkWXcBgMD4HDErQGm5206SpisyzWVLigokkpDcRNH
	yRvmK/P5FZXdKN4dhmyVP6YxR50jXu19IhhEmn6VVh8UTTVvWA4UM5skgpaEf7LD9KMd
	UW8A==
X-Gm-Message-State: AHQUAuYgBJKa7C8SvP/A0NLE5RgbAGpSR1haXeqFQMlvDs3agX4SqN2P
	X5Ni98aiEtv4eSoiANKEZoC4w8uuJQrgZAf2swg=
X-Google-Smtp-Source: AHgI3IZKotw7XcgHtyJJhqguNGyqeufFfqT/VX1BH26JSAxJ8+wmgcIqcVawVCN4w9aYN3pCDPaySNNbbWkU24SWJhQ=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr17855835qvj.228.1550504523544;
	Mon, 18 Feb 2019 07:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20190131065016.21887-1-raj.khem@gmail.com>
	<20190131065016.21887-6-raj.khem@gmail.com>
	<CANNYZj8VWh4ZECFQdzqR7+eS6Lh5yt1oLOBqCx7rzKNTUUWj_w@mail.gmail.com>
	<CAMKF1sqwwWS40ihF952tKBnzGvb_pO=sCZBnuU1cNJ=330mCxA@mail.gmail.com>
	<CANNYZj9QOH06p6qQRKWAjw7sDE3oPRB5XNAefUrukf_+WxdmPw@mail.gmail.com>
In-Reply-To: <CANNYZj9QOH06p6qQRKWAjw7sDE3oPRB5XNAefUrukf_+WxdmPw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Feb 2019 07:41:37 -0800
Message-ID: <CAMKF1sokQeVRQZQNiSQaPgjQyt6m9arryp8m1FmD1wQF6VHonA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Mon, 18 Feb 2019 15:42:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 18, 2019 at 7:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 18 Feb 2019 at 16:04, Khem Raj <raj.khem@gmail.com> wrote:
> > > There is now an official git repo for llvm, which also has version tags:
> > >
> > > https://github.com/llvm/llvm-project
> >
> > yes there is and its intentional to use this mirror, since the
> > llvm-project is a super repo and
> > contains all llvm projects sources which is going to clone tonne
> > unnecessary code.
>
> More than half the commits are llvm's. (llvm-only mirror repo 175k,
> llvm super-repo 310k)
> So it adds to the clone, but not that much.

I would have preferred to use mono repo and I have no problems  using
it since thats what we
use in meta-clang as wella and it would make it simpler to reuse. but
it can be a pain for other people.

310k, I am not sure what is measured here. But here is the breakdown
of sizes for information

1.5G    .
676M    ./.git
16M     ./lld
51M     ./libcxx
3.5M    ./libclc
31M     ./llgo
32M     ./polly
395M    ./llvm
43M     ./compiler-rt
988K    ./pstl
116K    ./debuginfo-tests
720K    ./libunwind
13M     ./clang-tools-extra
7.3M    ./openmp
6.3M    ./libcxxabi
105M    ./lldb
352K    ./parallel-libs
155M    ./clang


>
> The point is something else:
> - llvm-mirror is not an official repo, and may become stale/unmaintained
> - llvm-mirror does not have version tags, so we can't trace commit ids
> to the releases, or track upstream development with automatic tools
>
> I think these two things outweigh the extra clone overhead.
>
> > > I'll make a patch to switch over to that.
> > >
> > > Also note that final 8.0 is not yet out, so the recipe shouldn't make
> > > it look like it is.
> >
> > This is intentional too.
> > Its in rc stages and there are no specific chages espcially in
> > versioning schemes
> > which will mark it rc etc.
>
> What I mean is there is no mention whatsoever that the recipe is
> currently building a pre-release. It's not in PV, it's not anywhere in
> the recipe. This can mislead people.

Yes it can however, we know that when next release is cut out from
master then we will be
on a 8.x release.

>
> Alex

