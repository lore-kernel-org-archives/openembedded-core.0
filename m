Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1197D265
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 11:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 455k6Z52VFz5R;
	Sat, 18 May 2019 13:52:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558180343;
	bh=992Xawr67mpVDhoZKc6ePouchPt9Vhl2kKBGadnTcbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LT5mFg3HnnUxwW//VUW4HPrJxeK9DVzCbvHFedWbx5iDApRjdazSa3Oo0K8BDXRoD
	0v++9RgTCVJlSw2eW7sWXbPbckSYAaIFWvjhpiCRlRtS0P58Pymy6WMb6gOabwOovx
	5pwkNwDhxqlXcsjf5LwedDz0y6TyD06pPiMd5KHPz3w9ATPjZctqm6VQ3Wik06ufwh
	jBUFQj0m8a5IbpGfJW+3I3lhXdwO3Y9Tb5wO6bqq+Slje1L5g9vMvfObUQXM27f6+c
	QD6cww5EjQIMLBgpunBrywQH2jg02Rhs1yhgOWkzp+qmSUVgjCD97MJqvpkavADtXt
	H90fLtztoLJ4L68icDBjNVbw2edlEgUBsILnp1+1lAKF0kKBpkZAW8PhD9d5svdao/
	F/0zCAvaMcV62/sNIGE9g/IgEZCNFlUt1Hn4RPg4LuOxCLIz0KNfq/FZ0QVoAnIZ8L
	2vrG8URcBDy+GUSRMfxhtJXyPPz7IySbZI/dhZDTXQpcmIJagUp6HZIZeJ5vTvD6IT
	WJzeZaGghwhCp9jo3HGOmg+xp7doPVPa8lSp0h4BvnRml1Jnc7BywKDWQvjF+Rwzv+
	Bz5hRAfJ/BX+zZI/lBe7+4hDda8XJZph+LY/KFJcDLZpU9C7wc9HTv22Og56odHxrD
	e6BRILsKw6wCodj+E0omJ4Go=
Date: Sat, 18 May 2019 14:52:19 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20190518115219.GA10408@localhost>
References: <20190517233743.9646-1-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190517233743.9646-1-ross.burton@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] insane: add sanity checks to SRC_URI
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
X-List-Received-Date: Sat, 18 May 2019 11:52:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 17, 2019 at 04:37:43PM -0700, Ross Burton wrote:
> The SRC_URI almost definitely shouldn't be using ${PN}, and GitHub */archive/*
> tarballs are dynamically generated so the checksums will change over time.
>...

It might be worth mentioning that this is for archive, not releases.

GitHub release tarballs are stable, and they are preferable to commit ids.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


