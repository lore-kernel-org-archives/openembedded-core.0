Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 368447F8AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 14:01:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 476Dwt3klqz72;
	Mon,  4 Nov 2019 15:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572876078;
	bh=G2fkk1OqZFgfvFnw1SCuTOBmKkQS7C/sTNe3KFe+Bxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTuN+YAvQE+3g/629I8G/m6VfN+BG+YDHlwwMbNJahzngpvpbD6zPHs8ijym/mdNN
	UbmWGZYE9/ijYptqXdsUJunTGF6IIQdS+3wnLYwTwOEarNXXqG+xDMz/y0sZ/rMhpt
	mJ0T5CQndiIrvg4TLjtov+w5XaXpX/pRK5GcjydFN0eTytwFox6Q5hxu2+7kwGZqcn
	EusFnDyiDQ48Iw7pmA5dIG9BFY4o0nbx2FlLK/F9rITMcFEvjH/wnU7JQ6V7uDQxXF
	2Hxdqjh5T5telxd0cpa7UjM1BN723azBbDsBF2eq5IxTBRzR/AEnhbY5gbv8aZtaWm
	htTH1YRa4kEBpoMuBelDfx4qfiVkkmupsiE7JkG/1mrFbqboW4hT6za/9WXNIsw7XX
	0bpmXN2awwaeBf2Fga8ZAr3hKjfNowlonMa2EnSw+yDGCZdMwACVby4wzVkw7+KAX1
	CBQg4bEy7nNyYxpcfvP2mJog0OT8pKKHS0aZDKvvi+VdLQXanZNOyJecLy6+obr+Zf
	w4cPpynwkLml82U1Gy3V43eVBI+ACuU92kDFr5/hI98ULtfZGwImRvOAyhyQ6jrWbR
	b4ONXuFeH3oaBiOdFngxvs5DQ02flebHbTsD55B8gTyBwI6aigy/4IK8uUkPPPDUhS
	hdMiptxLEYd7kmuqcRrq0P7A=
Date: Mon, 4 Nov 2019 16:01:15 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191104140115.GA5390@localhost>
References: <20191104124251.21923-1-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191104124251.21923-1-ross.burton@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng: whitelist CVE-2019-17371
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
X-List-Received-Date: Mon, 04 Nov 2019 14:01:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 04, 2019 at 12:42:51PM +0000, Ross Burton wrote:
> This is actually a memory leak in gif2png 2.x, so whitelist it in the libpng
> recipe.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> index 66af2f3d60e..07970e14360 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> @@ -29,3 +29,6 @@ PACKAGES =+ "${PN}-tools"
>  FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +# CVE-2019-17371 is actually a memory leak in gif2png 2.x
> +CVE_CHECK_WHITELIST = "CVE-2019-17371"

These should use += to not overwrite whitelists defined by
the distribution or the user.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


