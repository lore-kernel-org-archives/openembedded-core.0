Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C277261294
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 15:10:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48R59H4rdSz1v;
	Mon, 24 Feb 2020 16:10:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582557043;
	bh=aoJnxBb1u1Jud7RU1wJv3PJgJXtQaFZim0tjwPwMUCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIfb6eKHKhkZsd76Zf3ildZ85sqgHJX90yeF3ANA04kLxl1ZdT3VIhl2WCyTBqHPL
	1XzrUEvaeQEZsZVGGds13k4meQ1f6cXbYT+ttnF5qUZkAt7l/EqUgz7UhKdlJ+wHEH
	dmLhgJDbqKuDF91E1npHMy+94A/NTMbXzoWk8HWaZZb0GyXRM2x0wBS8CjsnuJFqwf
	yzpJ96dtE+0+mwGOs1LhYEywLT8i5nA8had17aigAXK2qQfy7zQGkUFcI7GfTWaBHH
	tDyzH7FE6+qKxaaVidSyjrC8BePixonPFPWf1spqAiVOUmUCvyEDnZtRvNuLm8xsaE
	eJZ+UydaTP9snG2W/gQi01HXrWaPVdceGKXob8cZsggMi/BConBLf2mgCC/wxEyRzU
	fVEDIit0fGsxXfyaYpWXBol3sZoGKxW2AfJVuE1kafPK8oP6RhubP+gkpuCBZJ56i/
	sQ7zBldss9Ni7XzeBtz9lkfZiQRyET2Blw3XqsowdX1KHNdD4dpRRbqS+CHWu51sUD
	hgFky6k6YYKwCyNjehSgzb1uL57jaKsn2cc9wzoXnIfGVBcfSYt9yojWw9VyZs7QR/
	w0hx5Uf8/a5IXX/3MWccxINHjwJFzI7T0/V+dSVAXm1Q8C50d7pswzMb+gxpVYjNUh
	5bbaNIw0q738Ty5y8444IHcE=
Date: Mon, 24 Feb 2020 17:10:41 +0200
From: Adrian Bunk <bunk@stusta.de>
To: =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20200224151041.GE27036@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<6c0d874e887dc5a2355d236d77e8ec771ea729f9.camel@andred.net>
	<20200224143155.GD27036@localhost>
	<5639b75022c28419467aefb8de62c6ab24f9eae6.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <5639b75022c28419467aefb8de62c6ab24f9eae6.camel@andred.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 15:10:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 24, 2020 at 02:58:21PM +0000, André Draszik wrote:
> On Mon, 2020-02-24 at 16:31 +0200, Adrian Bunk wrote:
> > On Mon, Feb 24, 2020 at 02:21:57PM +0000, André Draszik wrote:
> > > ...
> > > Once the artefact has been created, it doesn't matter anymore how it
> > > was created, as long as the high-level options aren't being changed (like
> > > an explicit compression level, checksum method, etc.)
> > > ...
> > 
> > meta-poky/conf/distro/poky.conf:INHERIT += "reproducible_build"
> 
> I still maintain these are two different problems. I am not trying to fix
> reproducible builds.

But won't fixing reproducible builds require reverting the patch you 
suggest for fixing your problem?

> Cheers,
> A.

cu
Adrian

