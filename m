Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BC50A61059;
	Wed, 12 Feb 2020 11:40:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Hd440tMKz3K;
	Wed, 12 Feb 2020 12:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1581507620;
	bh=VWsE3BpLT0EQAJxtOa/h7KQy9jtgbtD6sH61ukcfKUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCmWQgtDhrGZZDiUqeq3SCWjcMOd6ug793BXk4/8raJCHvLM2gI52ONtcHDIulH+1
	u5KvYwWrLJJqv1sadbO7/Vo+kEuh7rgiZsXnywQOiwvfLYR2T7jqtdZLHvJMlyPiFP
	ZkVczkxCzKIsjutHmFYq33cllNMxu1neEGNNobAx9oTs5KZjMArWDZ/dOJr/t/0TuR
	5GeuuffHVceAOFP2p3zkhXxDbsS8JkP4g5ohtYIzaKLDE2GvjunDSvleXMZWzqrOPu
	xSL2PoG8BsHPF9N9qBnWUpI8KScKS+FkwA7hI3X5+Qno2z9fn1ozAFoUIwgXwTGCsv
	X4YzMkScqbRS2yrgYgVY0qfmooabeo682SCTgO/lVib+ef73VrHI5vCZqRoYY8LClX
	lgL4n4HO+7Er2phkeBFw1QHMhpGHvWrg129xFLCeEiJ5WGteicJ65Xn1k/rM8C6d0a
	TUlzcPmz8PEemStWlfUc8MuEc6nIDr9rJZaZKmlwNnc7G2xeeWhwBA3MZ7iMlUPq21
	wXfGO8RFd67nkz4cBue2XkbRoWrAG+h8NpWcjR8rgmVLWNlNzuB2S8gpw4ZIm6lhHa
	Va7sjO6i49Xyvi0RSLXILbrMK+O55aPOTUIGhybTYSfC4683x/5hrw51pEwnfMtFrR
	dkZ/u4hH5h59SRqb4xWCkCj0=
Date: Wed, 12 Feb 2020 13:40:18 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200212114018.GA4081@localhost>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<2a9e05eadae5df35ae1c13be4484fd6d3e8fed19.camel@linuxfoundation.org>
	<CANNYZj_JXMzwQuLcUwfAty_ESZZ8gWav+K9_gz8dDqSZR+xUEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_JXMzwQuLcUwfAty_ESZZ8gWav+K9_gz8dDqSZR+xUEw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Wed, 12 Feb 2020 11:40:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Feb 11, 2020 at 07:06:57PM +0100, Alexander Kanavin wrote:
> On Tue, 11 Feb 2020 at 18:53, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
> > I still strongly believe we need something in core which pulls together
> > all our pieces into a UI where you can test key elements of what we
> > build. If we don't have sato how do we actually test the core or demo
> > it?
> 
> See my other email I just wrote; I think epiphany/webkit under weston is
> able to replace sato more or less fully in this aspect,

Regarding dependencies and buildtime, epiphany/webkit is the largest
part of sato.

If you anyways want core to ship all the multimedia libraries and
ruby and rust and plenty of other packages, then an additional
desktop environment in core would be relatively lightweight.

A small core would be headless.

> and actually do
> more when it comes to modern embedded UI use cases which involve video and
> 3D.
>...

epiphany/webkit is a strange option to support in core for that,
moving Qt back into core instead would bring more usage in actual
products instead of shipping test/demo-only software.

> Alex

cu
Adrian

