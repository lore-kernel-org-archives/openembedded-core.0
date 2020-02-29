Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B508161138
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:32:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48V9Px23Thz4S;
	Sat, 29 Feb 2020 16:32:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582990341;
	bh=q2jlrUiB6WqNbHMziFIyeX8q6Fmmwy5YB2XYRaV7M6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwNPcLCSEWMLnbT8AEGPcLPZ+0pxixZWxANLi2Qs5IAajOIxNFECHXxSN/njVnRK8
	SR1ZuLLGPmQO5Fh3bMW0KZN1KIwtWEYeeQ5Z+Yyz6w2zKgNI8nGhgyw234Sh4Ob+JL
	MT/MPxyHZ6HmLyhomLIgGFTWdGPZk1Jb/f9HL3Nq3gQX4dSTbQkhPMIRzxvUvINEbY
	pn0eIzM77f/2t7RovfA+otYnKVRGU84E9Co8SfJKkWm0D/v4Uav9LNMAk2TZMlFdAA
	N+gYTC11EN0G2Nm4CDwUis8oogSzpPen3+zWSglLjOA3/J+bZ3PVokDqQyJlVDluoM
	uN/q9z9hbrKAQo1jd5LZM+2dkQBKs2azA86iOWUV49YWGiMkXQx7XN8h1yLN2TJRED
	nRpI1rififM25HpQvboP+VCwtrv6dnfznxW/bwRZ3KDTzdPg9lTcyozEMhITm8fxtq
	b3JIDhyETRvsNyw4hB5kNLOpdDNv66D5vKXG9snEN0922bLPm9/3jQ85/fk9IoBe/U
	nqBcUl35nIM82Crz1huJ5AL3QfhFjP8PCslkWXVl7NkWm2AclxbuN7+3PV6bg2wBn3
	wIAIN9CozWIxt4otX977bUax2W6Xit5BEELOUDfg8brCPhqcMDFE3hXcDoTbQTPz5B
	g+y6TfaVc6wChTWr0+2akFHs=
Date: Sat, 29 Feb 2020 17:32:19 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200229153219.GA25145@localhost>
References: <20200229152352.1993520-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200229152352.1993520-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: Syscall fixes for mips/risc-v/mucroblaze
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
X-List-Received-Date: Sat, 29 Feb 2020 15:32:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Feb 29, 2020 at 07:23:52AM -0800, Khem Raj wrote:
> Should fix the mips make 4.3 issue on target
> 
> Changes in this delta
> 
> * 71f2b249a2 malloc/tst-mallocfork2: Kill lingering process for unexpected failures
> * 5d31b083e4 riscv: Avoid clobbering register parameters in syscall
> * f4f8843515 microblaze: Avoid clobbering register parameters in syscall
> * aa638b86b2 mips: Fix argument passing for inlined syscalls on Linux [BZ #25523]
> * ae1b6b13d4 mips: Use 'long int' and 'long long int' in linux syscall code
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index f489650f70..f7acf99752 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.31/master"
>  PV = "2.31"
> -SRCREV_glibc ?= "9ea3686266dca3f004ba874745a4087a89682617"
> +SRCREV_glibc ?= "71f2b249a28e17eac0e47c53af44d5c5b65101aa"
>...

I have the same locally, but then PV should be "2.31+git${SRCPV}"
and I haven't yet sorted out everything afterwards.

cu
Adrian

