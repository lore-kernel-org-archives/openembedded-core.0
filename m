Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 586F960B21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 20:32:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48fvPc3RwPz3w;
	Sat, 14 Mar 2020 21:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584217941;
	bh=feXwX0DQirmzsFsYcQT3mx4tSsXwmWCr1paIg22+qVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZCZJ39xkxtiVU0oKT3RJGXI9VhrThWMf43RDjct0aQdiZ3ePabu9fzv7fVP/Jy1J
	FHgbk1+0f+x72uQRQRj/issZn8nc51jMyLOC+T/2k+5mIHOgdd/IiRdTD487H9XDU7
	ofZPhPM8jAPh6ii1frdh867rQwQgaKRKReBqrQ4U669yEZWf7/edh6Uac8xw7MHswN
	KQAyPWe+A6vsooO+LZgIZZRZsuygZrh15/lshaGFB1v+t7xLnnIQ+M29RxjF/N85Eq
	GhGbvsxBXhE/M2ZnzrKza5cHy0m6oxLi/C30ftV+8/US5T1sisc3r9z1gklVHzlbMC
	IRfVZ0M56QgfXRng/9aVVdF3BxVg3qbM0f2SLOSlHWsN+ZUAIsckXDxv3dy8u+WUoF
	xj/3oBObCkXJDVNqkq4hyFJiVb6K9mS6FJ6E/0JiRFpY3KRjtA6FIkSdHBfOKlOJgY
	9grzeK6aNlUA4pvbf/5vToWcE4ecY/+bvNsvjsueca6BZELZcosGiQXhKki9P+Y07U
	LFjFn9ximWCEAeCS5bqQGBsVQ+2E0bQbOtAuWxvGzQpA2NqSca+B3thToKXMnrJciI
	vkoK4inalcSup69As3xOV3GdfOvzm8NkjLi14q5+PeLVzHomRHq1mO1mOFSq7aunku
	AJD/Sd3R4I/Zskjc0ElYKZbI=
Date: Sat, 14 Mar 2020 22:32:18 +0200
From: Adrian Bunk <bunk@stusta.de>
To: =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20200314203218.GB10881@localhost>
References: <20200314194038.5051-1-git@andred.net>
MIME-Version: 1.0
In-Reply-To: <20200314194038.5051-1-git@andred.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-numpy: incompatible with armv4 and armv5
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
X-List-Received-Date: Sat, 14 Mar 2020 20:32:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Mar 14, 2020 at 07:40:38PM +0000, André Draszik wrote:
> Just throws lots of compiler errors regarding the floating point macros,
> similar to the ones mentioned in commit 3e40a1d230a9
> ("boost: fix mips soft float compilation") commit 7e712e1831f8 in
> poky.
> 
> Just disable, to avoid frustration.
>...
> +COMPATIBLE_HOST_armv4 = "null"
> +COMPATIBLE_HOST_armv5 = "null"
>...

Builds for me for qemuarmv5.

cu
Adrian

