Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7C97F9B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 12:28:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 473l3g5bldz2Y;
	Thu, 31 Oct 2019 13:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572524912;
	bh=SCjfOurA4Rhr4JeAKEnwn1f+7SthTJOQ3vYKepjAuk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwwWjP7kjBJibb+mAu2ZTN5JzIlXq23dN34JWQrC68dLbI/ENu8r3u9JOI9zsIt/d
	OY/iKOooEa1m/X7CqbCU4uidnGiKSyv+qEWIMSuq2xtWU40brBAlV89fOGOy8dMAdA
	vd99fVMTS1XlEu23PdBmv0Dh3n2gs+gIO8Mv9twb8/UjJvpLp1kS0lvtl6SYuaH3bm
	y2/KFscnSJXVhsaomdjAHb88NwyAj63stj9MLNcv1VPNDcilODkGIM3UWmwVvgu21m
	FIe25JExGsgq4yzkoipYv+DteckjLSu7SOZc8GWwhcdz/0hd0ksrnG9UYkk76xY12H
	PKU+jRAPi0vIe69/npZteJbozQj96ynjOR+elg9f1PEpY0gUBmp5vNURXGBfs5eNX7
	Wdn5QchwzsUrycomwK68iKkDlAVmDic5ajx0TlVRQFXeLzej+WzDLDSH2BeJCnmw+8
	bx4howQwe194nES0SpgfpHszLWvCqhEOlmmMkEkRuihFUMcTXjSMfKVdOJf4EKkuMr
	rWg8wg5ki8/ZtBwj+EaX7TzJhayTe353WZaFoEg6tbUxaK6lrhdJV+HTmWwB8dyO/W
	EHOYKNPAszoVKC4944JPShMzdxH/2ZlIPHz58y+73V7l3Ij6rQ+kmDGbN2Q3GL9ZNg
	fSejIiNK80fs8IZLQI4QJ/Pg=
Date: Thu, 31 Oct 2019 14:28:29 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20191031122828.GA31854@localhost>
References: <20191028221328.15756-1-bunk@stusta.de>
	<e3ede03b-34b7-4815-c5e3-cfc5eb6d8495@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e3ede03b-34b7-4815-c5e3-cfc5eb6d8495@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Thu, 31 Oct 2019 12:28:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 30, 2019 at 04:36:58PM -0400, Randy MacLeod wrote:
> On 10/28/19 6:13 PM, Adrian Bunk wrote:
> > This LD_PRELOAD trick is not really suitable for busybox,
> > so can be the only part of coreutils needed.
> 
> Which LD_PRELOAD trick?
> 
> Ah, I think you mean:
> 
>    The coreutils implementation of stdbuf uses LD_PRELOAD [1]
>    to dynamically load libstdbuf which calls setvbuf().
>    This can't be implemented simply in busybox since it produces
>    one or two statically linked executables. Therefore, stdbuf
>    should be packaged separately.
> 
> [1]  ?? http://git.savannah.gnu.org/gitweb/?p=coreutils.git;a=blob;f=src/stdbuf.c;h=7eaadb45fef8c01783eeb5c27853fafbcef34f1c;hb=HEAD#l188
> 
> Could you send a v5 for plebs like me?

Done.

> ../Randy

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


