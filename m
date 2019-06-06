Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCB07DDAD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:35:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45KV9135R8z3L;
	Thu,  6 Jun 2019 17:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559835317;
	bh=/h2gy+KAbkcDbi37VdBtUEpilPi56T801LmXxEjU5a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qlsv8jFY1oEx5TOnY+hSVTXscfhHDGYNpxQ7N4xapksAtUHuNUs8x0055fjkG5rZ6
	stnC6xurGw7E8i57epCLltSLo9wRD5+8V6XpZZITIgGau3/Xot/yfQdHIVMyxdM6hQ
	dqQrk3Xc73DBCN1tCID+sUAKiU+EAxHZkE9VfSHRq7459pOnfSc0XznopjMeQ7Drp/
	6c4QF+5OwuPWgiv2b3DMKm/VlEmWZH+8+Vvhrkj25alp+x7NfbC4FW6WnZvfhzJRH0
	TJ51UVi9Whgd4fgPTD/s3zwhx3qabjAg/VBETGCs8M8jCc8qfjy//gZVPp9D+Tafp7
	KaCTuwrobDy/58DIYR8yZAzD6j8c2G1QJree8atxNyQU5VPhuVAmPoHx1Oe9Uz47tL
	I/7b707GoYxUOeRVN0OY1P1V3Kl/wSsTQojxYjwXaTuDl+wjGNtHQ2w3ryg6sdgYIa
	rAL5wDGe6BDpWDg90I7iLeUNzpFy1u36ItX0/Co686dmHQeLUK7mcImkI86nwzbL85
	G9YAk61eh19HUPmrVW9cfBfruX8Dz8mAqHfAEfaT1bEWbR1ZlCdXF6IZfNTsYO1Ac8
	swdJLQOVpnsTI8OfvkDVfjHF8ZKRTsPQtlowhEZG1A/p9oOQhhGlHsx57vZtnn1NDO
	XuYUufk385vrQYDSZNvf5Y+k=
Date: Thu, 6 Jun 2019 18:35:09 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Joe Slater <joe.slater@windriver.com>
Message-ID: <20190606153509.GB26324@localhost>
References: <20190605225040.213296-1-joe.slater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190605225040.213296-1-joe.slater@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] slang: modify an array test
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
X-List-Received-Date: Thu, 06 Jun 2019 15:35:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 05, 2019 at 03:50:40PM -0700, Joe Slater wrote:
> One array test attempts to create an array that is far too
> large to exist.  Different exceptions are thrown for 32 and 64
> bit machines, so we account for that when catching them.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-extended/slang/slang/array_test.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>...

This seems to miss actually applying the patch?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


