Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7548F617EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 12:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Rdkn0qqcz4f;
	Tue, 25 Feb 2020 13:38:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582634289;
	bh=RQdC5XftD+4EoEDrsfVduOJ/4LAYj0NGuLWNDp0F2rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Smq6eQB9XUaO9k+BBeFdLjUqsoV3I1+ovWAGX09Z/C2dCnPWA3zpXdpJKTyq0dnVm
	3lyi2IDgVBz7BCbSHC7FSxkKBwWJeOWGpkbAbkeS6SKBJ18TVaAJ4bBe0WE9Dve52o
	YH320dESvKm/HtJp1WkDW3TlRF5vO2ghuN8phogrrEMeRfAGbFST8MIIYjJ2+Njou8
	S6vwz+jPPYBxCecooF0gYp48eQB6pu9LS1s0sokeuqm6Ev2cWD5ojamgXexil1seiZ
	vh0J/gI7RDcu1iInMGamAm0jr8zYWeoU3Pu6sNVRtiMvX0RRVjIdhi0O0sVhc1wUho
	6VZ2GJekudhEBM3LxXmGCdGDKoYTFHCIqrIpsG6XfIwdZdvWCDasdBKzaeKg7dUsRB
	9zsg+x7KZjIv+VR0v2J3SCcliR0/LDzYTH/YnkY8BjPx7oblO5M/ULa2+C8nzxp/Ws
	ILls/SCwpihHUo/2sAiujUtaQHyP0H8lPrACTjfcqo01wA9i5GbM1Rl1aYIZxFVPCL
	uuUCqtFKJLX6GJyNF8Ttt00+dMyZZl9ptLw7+Q3IGTTP5m7uzJ4K2y5AHnSvIQDmHc
	SF0Gd8l70XLnuzrYQsahdgFMGo9nJUFrBOi72efHSSf6G0eXzt5NLJYlz+MUlf2dtV
	FvP6U0l1Ms0lXHVV5R06LYi0=
Date: Tue, 25 Feb 2020 14:38:07 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200225123807.GB13902@localhost>
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
	<20200224104635.GA27036@localhost>
	<20200224140801.GC27036@localhost>
	<CANNYZj91N68ocXm=UKzcH6U7nEnVLuQzDStR3O0_cO3GsY9uag@mail.gmail.com>
	<20200225111955.GA13902@localhost>
	<CANNYZj-VbMxS52x78goiAA3jvKnyRQiyxd8G5TfEKZ8hBSXdDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-VbMxS52x78goiAA3jvKnyRQiyxd8G5TfEKZ8hBSXdDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Tue, 25 Feb 2020 12:38:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Feb 25, 2020 at 12:32:55PM +0100, Alexander Kanavin wrote:
> I would probably look into how
> REQUIRED_DISTRO_FEATURE/ANY_OF_DISTRO_FEATURS is actually implemented, and
> see if you can convince it to do the right thing, or maybe write a custom
> re-implementation.

I did already check meta/classes/features_check.bbclass, there is no 
obvious simple way for expressing more complicated dependencies.

The low-effort way forward will be to keep opengl required even for x11,
with a comment why.

> Alex

cu
Adrian

