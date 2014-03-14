Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9286B6D899
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 18:38:08 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so2990100iec.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ItQkGHikQm8FBFr7wd1XiWZ0IVoznlpf09cYlC9y1o8=;
	b=mJjOcNz+mSAQZeFTDC+/z78/fXHGuvnQAwb9rf/vMsqd0i+n1UnvbvxBfa0tsU7jW8
	VdCu0s9KePZ5mQJQE1/TTiim735ytszcj6h4HNl5iXBuvI95JOLOt0qnFhLuopvfzRkh
	V3/heZQ/9wcMKVsqS50R4xpZcQsna+Im0a1i+dbDJChNeai7qwuEwWMsxoYVR/F+2fl2
	uri8cJHdnbrtq1thezOiXY1l4XuN0+vFzcf6iXlt4Txr7PmAB72jl4uhi7LCUAWcSXVG
	KSW1kNug5SL8kxKnYGE2TbGPoYGEsHQlxN7Tu6zGhG3tuvip1SYZyFPHaxCBcYZ9C69c
	fvCg==
X-Received: by 10.42.203.202 with SMTP id fj10mr7606282icb.51.1394822289578;
	Fri, 14 Mar 2014 11:38:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 14 Mar 2014 11:37:39 -0700 (PDT)
In-Reply-To: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Mar 2014 11:37:39 -0700
Message-ID: <CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 18:38:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 14, 2014 at 11:34 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> I'm stuck using Dylan for a project as I need a 3.2 series kernel.
> Building on my current development machine I ran into two failures:
>
> eglibc-initial, do_configure: Make 4.0 isn't recognised
>
> This can be fixed by backporting
> a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).
>
> linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)
>
> I fixed this by removing git-native from ASSUME_PROVIDED in
> meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
> That isn't something we should commit in Dylan but may be useful for
> others to know the solution if they run into the same problem.

I think if you also lock your build machine OS along with yocto
release, it is less painful.

