Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7026C6C1BE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 09:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xHZ56lnHz4t;
	Sun, 28 Jul 2019 11:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564306126;
	bh=Xtaes0uEl99ye6tQlcc56E6Vug64Q4UvJLwubA7JlOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvagKid7N/Q1Fv4kgDSvLILmUMMl+nL/8P738VvhTp7C3I9JLSlCK0h3TA2FuSW26
	lro5vK+PZ7oaphgQquMsebPrs2Ow/9mvSwnaZpqpfQvgucXzPDkbKiWL/JZFNc67o3
	LULvwdN+axumRvQJcLpoL/s8fmpgO5gf6KBphLgZNuGdzpqVMMARcCRQ3bjl1Ysa80
	CaZS61dvXwcXuKdHOuFIQpxnlUa4zUmeOlLuFiSBbLlGtsOFWmKtGJaBRiL49Q9iYX
	h46iCdDjufzDYc+KHCRMtqYMVJSQVrcH6RYV0CwQIQ+GBj1NLiFk33inbet0PswMuH
	cGRuo/fSA0RECIPNQz056qIVaY5eMNS96f1JUIMNDnvv7gOjS/VMrXzzB57I9aYBgb
	btdTXdiRhnGt2wB1BTaBir5VP8CPUFF1Qazx5QnM+2a7+iJAZklcCI+8IN78AJcA2L
	mXQZ0KCuEp/Baar87Es/xIyfjjNpac3i0aPNyabF0SkXXDx1bhmnf+yAonCDm3yvnB
	5aRp24iXKtsAZAzrMexmRBw6uD0sbwA6N3vYVvJNxhONX4viOuLSg4qhXXqCFt4ni/
	eZwWV0+1BUfgj2OZFNb5TFfbvwD5A48Wo+2pcRhTriKm3eic/fR38CkDUmYe8Uf+Zi
	iD9pVTl9wnm4kK9v1IV4skFA=
Date: Sun, 28 Jul 2019 12:28:43 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190728092843.GA15666@localhost>
References: <1564260566-8134-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1564260566-8134-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Update to latest stable, 9.14.
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
X-List-Received-Date: Sun, 28 Jul 2019 09:28:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jul 27, 2019 at 01:49:26PM -0700, Armin Kuster wrote:
> Even releases are stable and supported for 1 year.
>...

9.11 upstream support covers the whole lifetime of Yocto 2.8,
9.14 upstream support does not.

Eve worse, Yocto 2.9 would ship with 9.14 that might become EOL around 
the time of the 2.9 release.

ESV (3 years supported) releases are planned when upstream
is divisible by 4.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


