Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1828A60116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:35:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44kcXq1D7wz3G;
	Wed, 17 Apr 2019 11:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555493725;
	bh=LYplF16dqXDZmsPSHurksLrPEfpZOXxCwiV6VXP8d+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2nHEwfUdRX+ruJONo0GyhE5aPeOgGOzDsrwLBektup+P7nfQIK1Qm3MM85RgghyT
	Kiz34psMiwUq6l9cFycAYlauuUG4hElMuhy0SakZDDmQEUT5KoS+0/YT476x+H0loP
	fzLZG6TJ9oBpUorcnooj4KwatgjpL4Xk6ceprbhx163ubyYt98oP8G+ASuSKu2j/++
	mkj0YaThQjnstrPS60fO+ASQs0MTlb28/ZuQv6gafbWzD10jlmCL2R5poHmLQ1S8lq
	AL2qM2RDQAy1pA3/4hBCmY90WNRW48X5xZ9rXBOYsYuOj9fgdprx3MoFsDQP6JFmBF
	rznlivjLsEkpoakmaPRR2NGVrUdo2wpQrIgKMNavC4u1PTMXdFh/MW5FOzmcJWR636
	jAa/7GQXYCTBX8p+Pmupo9E2uUM1uoz0uoWyNqx+gGg5BtFTZyPbnUIIr6Dl9sw1nq
	r15PmFrJhKyNC47VXGqvr6zCKbIFgjwKzqpP3trX+UBFJ50XdvOhrUrD2eGxFXGawH
	/ZxQANzZSZBxMQVFR1xC+2ymmz8Ub5wYfyh+cyxV9yGhsxqWI1PPBuxIIVrjwMb3Fv
	FUvD8rH8azfdhpFHiKSiXGAI3Fb6lf4l0MQxkEwaJ6Y0vTvNVKGXCOjlsyHrH2e2x3
	PkhDw1A/9Fh3TTGYL/gQCxJo=
Date: Wed, 17 Apr 2019 12:35:20 +0300
From: Adrian Bunk <bunk@stusta.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190417093520.GA895@localhost>
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
	<b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
	<95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
	<eac500ca51a96c769ab3080bcd78dd93316bea9f.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <eac500ca51a96c769ab3080bcd78dd93316bea9f.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 17 Apr 2019 09:35:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 17, 2019 at 09:46:25AM +0100, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-04-17 at 10:20 +0800, Saini, Naveen Kumar wrote:
>...
> > Should this be added to HOSTTOOLS instead so lfs files are always
> > fetched for packages that use it?
> 
> No, that would mean everyone has to install it.
> 
> I'm ok with adding it to HOSTTOOLS_NONFATAL as soon as we have some
> mechanism in the fetcher or in recipes which detects lfs usage and hard
> errors if its present but git-lfs is not installed.
> 
> That way its deterministic - it builds with git-lfs installed and
> errors if it is not.

Is it OK that some packages are not buildable at all on supported
distributions?

Your "everyone has to install it" worry misses the much bigger problem 
that git-lfs is a relatively new tool and not available in distributions 
like Debian 9 or Ubuntu 16.04.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


