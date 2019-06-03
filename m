Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6165F7E402
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 06:47:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45HQb50XTlz23;
	Mon,  3 Jun 2019 08:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559544433;
	bh=Iy79lz7yw3JhgSIr1jy4WxRcl/P48DuieCD7m7dt1Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Az8AmXV8GLfBJjmiD9UCdgHMg+VxMou35eDS9x0XrXHvag+pxHcvPN9YBNA4rN3BV
	TIk4hJNg2+pdJqiDOmzFbwLh9icdvMik7wx9vBsAnhtvYZIaGJxbHEB1OUE7bC2k8x
	eWaBgzZpLPrfA/wqpnp/61zl/x9HVS595A0P60Q5UKZndlVHNV4XTX2iBRhDc7Cebm
	X/K/Vuepa0OJ+N934aVlvLsWrPNPFBNXWLLNq0xEsKwMOxNAGlPTj2uD8gEIfaCfez
	DC7i/SyTQsVqkbf67Rcy3Jvpz/VnDRa5y+GW+lixwkKmdIgLHeB4NzerPsQlLsbvVz
	3JUHY9zCV5y0X4tHSKg9xRIlTZh8XBbjzIw2JV7uFKv9Bti3i7V7atzHyNI3+UWJgs
	GUuxzMNQ1cHb9VDbiXSHeelgqF5LqpTtG7xCg/ow8uNspRCT8sNQIML5j6sEXs1GQW
	G01yu5ECKVH9+cEVxO209pOEoeHi+U/7ENiTnjBWZaIwBVLy03KRhm+nZXs3LosSaX
	wV+rOz0ebE1U5dr/IPws1sQolqLMoOitfbeA3VCe+nuzlAFTDxO5HCq7LUBUnCcwUI
	iXI0UDmStdVYzQ7WLU0SMJ4yVw54Vf7qN9LR+n5sZdlAgcJuBbRhapIwKTij9FszGd
	rQKg7/oa3xBI69QQTnD9TkqA=
Date: Mon, 3 Jun 2019 09:47:10 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190603064710.GA2982@localhost>
References: <20190601215825.24862-1-bunk@stusta.de>
	<b5dc94a76d15d78512ad20639c09c4ff4b12ecde.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <b5dc94a76d15d78512ad20639c09c4ff4b12ecde.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lrzsz: Add implicit declaration fixes from Debian
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
X-List-Received-Date: Mon, 03 Jun 2019 06:47:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jun 02, 2019 at 11:36:51AM +0100, Richard Purdie wrote:
> 
> Could you put at least something in the patch header to say what the
> patch does please?

Added in v2.

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


