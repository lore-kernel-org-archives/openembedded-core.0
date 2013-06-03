Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9D30061EBD;
	Mon,  3 Jun 2013 16:03:52 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id p14so2711503vbm.14
	for <multiple recipients>; Mon, 03 Jun 2013 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3QrgQL8tAlvLg7P5nsVGOvOqdQliz8datp37KN7tZdI=;
	b=xy7L2NXxokpTmxIaK5d8SYcxfqzmOwxCG8xJsSxb8hSwzI4twZjXjMLlgwAhc5e1B8
	O3UZuT3AlIQ3lNczpSbUQOeL4Thc8ZP6gPZlZFlgwWfWNYzqFwsS5F67wuGz1kckD1Ii
	5w7m+mMLfxWjEgFC35bmQcAJahnQqe1QzmCMOYSNPZYQQH6e/Oc2Ci5ntGwlLSBcWbFM
	U9qE4ZrnkrVuCtX/rDCnhQEwCKoJy15KR13kx1/g+l2jOOHsfzHnWaizxxixGgxu/djt
	pmqvtem2w+WpJsmgvDhGQsx/h68WT13UWILcM+3VYhIzx0dce8GjXVpFSPS0sYMJU+gS
	wEDg==
MIME-Version: 1.0
X-Received: by 10.58.46.48 with SMTP id s16mr13127341vem.52.1370275432820;
	Mon, 03 Jun 2013 09:03:52 -0700 (PDT)
Received: by 10.52.52.84 with HTTP; Mon, 3 Jun 2013 09:03:52 -0700 (PDT)
In-Reply-To: <20130603151008.GC3279@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
Date: Mon, 3 Jun 2013 18:03:52 +0200
Message-ID: <CALbNGRREbtVAxJ+vQmSAfmm4aE9AFz=K=p2HvCM2t5RDVsa-jQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 03 Jun 2013 16:03:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 3, 2013 at 5:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, May 20, 2013 at 03:06:35PM +0200, Martin Jansa wrote:
>> Couple of issues from last email were fixed, so here is updated status:
>>
>> qemuarm Summary: 14 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130520_090009.log
>> qemux86 Summary: 19 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130519_170509.log
>> qemux86-64 Summary: 20 tasks failed:
>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130520_005747.log
>
> Hi,
>
> updated status, still building with gcc-4.8
> shr-version issue already fixed
> llvm2.9 also fixed
> so if we don't count these 3 failures it's a bit better than last status
>
> qemuarm Summary: 15 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130601_225651.log
>
> qemux86 Summary: 18 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130603_011743.log/
>
> qemux86-64: Summary: 21 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20130602_103752.log
>
> common (13):
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb, do_compile
^ this one is new and caused by oecore
689ac095b868b3ee975169257e114981f2593b4b libtasn1: Updated from 2.14
to 3.3.

Haven't got the time to look into this further at the moment

Andreas

