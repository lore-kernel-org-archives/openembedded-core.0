Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3202B71BEE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 04:58:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45NHnM4vHgz23;
	Tue, 11 Jun 2019 06:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560229080;
	bh=IWWAHogfzbnUrsfPwfKpEwSrpGC6hMbcWE5BjtNBgsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJvXljH+HleLNjkj/y1Fe8+KosJDQZmC2uKcKTWyq4rhW2EkEDuNjVv0hsM/F5zqg
	RYybNfhvNlAqiz22PVlf1ukRabYmSe+C2XgvZv55mHapuGvyOAfMWey8VCvH6+ymgh
	v+DzCkiOezrsocW34QddTTrQhRnrB4fe+K/60e3ITEKZMXyqB2PRB8Czs4vdBfdM7R
	HWL2bel9VCufxZeWbi44fJ3Hz+C+0fc06ZTb0+BfojDpm2VVO/mraMUjy9gymFBVLY
	s51XgJ5yyRXpHlvjUlTp/v182t34gr7QVcxPVUSwEMxGoWWiYJS+z1OR6t42dT+TYp
	LvRnsUDPXOkWKuezeie21VcnFCMe+a06gEhrckk34tZ6UeXsDTqga+I1LnWVoWzh9X
	CdajNPYSxOlgrKVJxF54nd0qx8raWPxicW89NSB+x9aEWMEKE1qevcGdN5jSzDQqoJ
	sgFZzjN/sv8UpRON0Gd/pw/x+BwJULjsfuhe8kxmIPE3yO3W/saj4NFcFJLlodaZ1w
	oO7rCQbYJo9stzbmN16j2di6kIkkLXD+Pla2WpDcXSrZE6WbEvohEQr0Dl9Dg+jLLN
	MrLmj6iHq16DrbiMCbc81zME6E16hk2c1yLtHNTkN88YPCSKkSy9KVQzpRtKYYAHIn
	N7tKTz070ssZgoO/A82VEjpU=
Date: Tue, 11 Jun 2019 07:57:55 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <20190611045755.GA16835@localhost>
References: <20190611015756.19184-1-douglas.royds@taitradio.com>
	<73faa614-2438-4e1c-1cf9-d40fa5a60d52@windriver.com>
	<4e14116b-84ac-6138-33ca-4e01a311f866@taitradio.com>
	<9a6f595e-5e3c-f0c3-98b1-40472a15ed1b@windriver.com>
	<4fe2e513-e4f3-10f2-cda8-d34d14a66625@taitradio.com>
MIME-Version: 1.0
In-Reply-To: <4fe2e513-e4f3-10f2-cda8-d34d14a66625@taitradio.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] json-c: update to current upstream head, with --disable-werror
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
X-List-Received-Date: Tue, 11 Jun 2019 04:58:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 11, 2019 at 03:12:09PM +1200, Douglas Royds via Openembedded-core wrote:
> On 11/06/19 3:05 PM, Kang Kai wrote:
> 
> > On 2019/6/11 上午11:04, Douglas Royds wrote:
> > > On 11/06/19 2:46 PM, Kang Kai wrote:
>...
> > > > Use option '-M' of git format-patch may make the patch more
> > > > clear. And why not just backport the 'disable-werror' commit?
> > > 
> > > 
> > > Re '-M': True, fair point.
> > > 
> > > Re the backport: There hasn't been a release in over a year, they
> > > don't seem to have any plans to do so (see
> > > https://github.com/json-c/json-c/issues/487), and this was easier.
> > > If you have a substantial objection, yes, I could submit it again
> > > with a patch instead of the update.
> > 
> > Just consider footprint, git repo will take more space than tar ball.
> > But no substantial objection.
> 
> 
> We do also lose the RECIPE_UPSTREAM_VERSION functionality by switching to
> the git HEAD, ie. there'll be no notification when they do (eventually)
> release a new version.
> 
> I'm in two minds. Opinions?

The biggest worry is actually whether some random git snapshot is as 
stable as a release.

Unless there is a good reason why a git snapshot is better than
release plus backported patch, the default should be to not switch
to using a git snapshot.

Starting to follow git snapshots brings the risk of frequent regressions 
since it follows the latest upstream development.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


