Return-Path: <cazfi74@gmail.com>
Received: from mail-qe0-f54.google.com (mail-qe0-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 278636D284
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 01:43:47 +0000 (UTC)
Received: by mail-qe0-f54.google.com with SMTP id 1so4608487qec.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 18:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=F6Kzb94egLNUramdySH6/z3gYWRlZbrJlq4L4CMwGAA=;
	b=DjjziDVR55XPQ6b0XBm3/4TYFyl5Ee/p6MJ2S24cS2Y4e3n8ZpG7/+0PKOJEdK6IlT
	WeSBJuv2ezDZBFHoQGMPfEDfN1XYfC1cLcZM9NFaEdKVgblv0KCWlj077YnEk127u46n
	W9+E21YZ6L2bN15PiznAzDRt+zfysKA5H4zKpOarKxHkdlNjgNxDwAjtEtNqkGeMr42G
	iTVdjTrXHaQCznY9l1zOPmuD0fo9qojwU/Sk+zleJia/+OznWrYmC6AP56OwYvKgp6Js
	YYem4Pbf8l7JAWE5HeCynGKoqSoxmLEgQnVrfgWeSgxZfBHPnkcX62eRBhTmhmByvcXF
	2IZg==
MIME-Version: 1.0
X-Received: by 10.49.0.208 with SMTP id 16mr33596288qeg.25.1383011028993; Mon,
	28 Oct 2013 18:43:48 -0700 (PDT)
Received: by 10.224.127.4 with HTTP; Mon, 28 Oct 2013 18:43:48 -0700 (PDT)
In-Reply-To: <CAMKF1sqG+y17HGokD0_YEsqmeiY7+2OiQN9Ld0UuSrbD0kpSpg@mail.gmail.com>
References: <cover.1382686685.git.cazfi74@gmail.com>
	<b4d752157bb874d686fb25ae43e4dc499596c22c.1382686685.git.cazfi74@gmail.com>
	<6ea9e9fe207b9c3b84a4450268ea289246b83055.1382686685.git.cazfi74@gmail.com>
	<CAMKF1sqG+y17HGokD0_YEsqmeiY7+2OiQN9Ld0UuSrbD0kpSpg@mail.gmail.com>
Date: Tue, 29 Oct 2013 03:43:48 +0200
Message-ID: <CAF6bG8c6KUSED75bebNRaOAbwU=+ynHxctFf5bbr5_A2TiUV=g@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] libfm: allow build with automake-1.14
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
X-List-Received-Date: Tue, 29 Oct 2013 01:43:47 -0000
Content-Type: text/plain; charset=UTF-8

On 29 October 2013 02:35, Khem Raj <raj.khem@gmail.com> wrote:
> Marko
>
> On Fri, Oct 25, 2013 at 12:39 AM, Marko Lindqvist <cazfi74@gmail.com> wrote:
>> Do not consider automake warnings about future incompatibility
>> errors.
>
> hmmm so disabling Werror is working around and I consider it degradation
> in code quality, is there any alternative ?

 I agree on principle. That's why I wouldn't even consider submitting
this to upstream, as future versions should handle this correctly. I
think it's ok for us to patch the current version this way, as the
warnings are about the future only.

> may be fix the code itself to not
> generate the warning at all ?

 That's something that (upstream) must do anyway before automake-2.0
comes out and turns these warnings in to errors. I'm not going to
figure these out for every upstream that has such a problem. When we
were preparing for automake-1.13, I submitted fixes to nearly 100
upstreams. While I usually am happy to fix the problems I encounter,
I'm not ready to make anything like that again. I'll leave proper
fixes for these problems for upstreams to make.


 - ML

