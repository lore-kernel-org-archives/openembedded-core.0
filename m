Return-Path: <leon@sidebranch.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 458DB7CA8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 15:44:23 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id j68so5574876vke.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h6qxcpTCrnwao+VcXZEtVwVFToE6FITAcjsQlI7r+Aw=;
	b=t6ptGW3UCkUFS50R+tbtHDTaqrpB21fai9SEvbsG+ZlUgo3OFOMKkiqeQml0UmqBw6
	GzlvklFchZZ8jEb/o9zzNJ682CJhX+1YpzK60bPppOOzjxAoJXnwwhmyImqIfIj03PHJ
	hg3Bzv6/hLN1SouHVb8mFRTl2gaMUL61wSSZr0d5C2dCm5Hob2jJsg5CXnj2N97OHEew
	60XlSocFv/LXRN+En73Qz3jHhvnaeIETcihLSVNO9S8nvOlISYPCdE8X/97KUKw3z2f8
	cE5tYOSXRqHXv4NVnbK8ohX1LHnlTBP4yM0Zs78f84meJ49JRc/3ust2Gs2Yu2FeE2DT
	b9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h6qxcpTCrnwao+VcXZEtVwVFToE6FITAcjsQlI7r+Aw=;
	b=MC/EdXd5HVuvrxJ3czpuZqDwOHSIri7ejW6QDEKgA6T/E4O7YXjgRj7ayW3Be6oFaC
	70pGIIBY4eQuJWJm5Prs5rfJdnOOja3oAisz3nMIp2APH33t8aSlYR0xJKc1dSXm3zGe
	+jPsdeFYghkqBxpopC+yTnVxyabMsiR8c2ORyN4k+egQtTSUbDVvF1HXkqgcAiaNHtNw
	OMz32LodwnnYc1wf/UTlQq9Hba2D8Pcm5nV+XsKlXLqJuMFEBxnXxNTt6zGhBStnopMK
	5v1DEXhmhvlWiCDuuI1VGWJ7OwicRmwIHgwWrLEE809f/vUzrLmvGcHObhXuVWlBOAvu
	t/ZA==
X-Gm-Message-State: AHQUAuYsjs1yC3s/ine1Q1dxUmqbsljui+ZfOAZ+63WMswBrUd1bSbS7
	z7qPIk33I1t5jm7rDzbFQd9KQgvaav/48HCKXZQozQ==
X-Google-Smtp-Source: AHgI3IYRxKSzG6wifdgfYDTSD6SkIp6qP9cHLxo9pvkGnHVGs+EYJc3hYy+6Ytpe5esJuGwGqKfHJy8V/e6t3zXwPKc=
X-Received: by 2002:a1f:39c6:: with SMTP id g189mr18660027vka.32.1550677463842;
	Wed, 20 Feb 2019 07:44:23 -0800 (PST)
MIME-Version: 1.0
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
	<CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
	<CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
	<CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
	<7ff71b82-b17b-99c1-407c-82692094054a@topic.nl>
In-Reply-To: <7ff71b82-b17b-99c1-407c-82692094054a@topic.nl>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Wed, 20 Feb 2019 16:44:11 +0100
Message-ID: <CAMjhiJgcWVbzsg25RMXRK=RRu1hchPMM-4MRCWjYHG+YeTzUkg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic creates ext4 images that read really slow in u-boot
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
X-List-Received-Date: Wed, 20 Feb 2019 15:44:23 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Mike, all,

On Wed, Feb 20, 2019 at 11:42 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> On 19-02-19 21:45, Leon Woestenberg wrote:
> > Hello all,
> >
> > On Tue, Feb 19, 2019 at 8:28 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >> On Tue, Feb 19, 2019 at 9:13 AM Leon Woestenberg <leon@sidebranch.com> wrote:
> >>>
> >>> Hello Mike,
> >>>
> >>> sounds familiar.
> >>>
> >>> On Tue, 19 Feb 2019 at 17:55, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> >>>>
> >>>> Took me a while to figure out why my board took 90 seconds to boot suddenly.
> >>>> The issue turned out to be the ext4 partition created by wic.
> >>>
> >>> I suspect it's not WIC's fault.
> >>>>
> >>> I am aware of two fixes for U-Boot. I will look them up, and reply again to this thread.
> >
> > Google for these two commits. I cherry-picked the first one for my
> > project and can confirm it brings back the desired performance. (Still
> > assuming this is the identical cause as for TO/Mike.)
> >
> > commit 855b8e4f9f255415a7753819e392e4b5d984f35c
> > Author: Matt Madison <matt@madison.systems>
> > Date:   Sat Aug 19 08:46:46 2017 -0700
> >
> >      ext4: cache extent blocks during file reads
> >
> >      A simpler and less-efficient approach to solving
> >      the problem with extent index blocks than what
> >      was in fc0fc50f38a4d7d0554558076a79dfe8b0d78cd5,
> >      but one that does not break write operations.
> >
> >      Signed-off-by: Matt Madison <matt@madison.systems>
>
> I'll give it a try...
>
> You mentioned "two" commits?

Yes the commit above, and *another* approach referred to and mentioned
in the commit message (also with hash).

The block cache feature may solve the problem in a more generic way
(also caching things like directory lookups), whereas the ext4 extent
patches are more specific to ext4 only.

I found the ext4 fixes starting from here:
https://github.com/madisongh/meta-tegra/issues/42

Regards,

Leon.

