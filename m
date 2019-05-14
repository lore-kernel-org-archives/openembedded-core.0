Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 728B07DEF6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 08:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4539qK1RJwz5m;
	Tue, 14 May 2019 10:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557822621;
	bh=1fQexnhIVN2y56myuiceAbQrnMEYZXOhmFqDW2h8+No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+QIUtXQdHqZzOifaIvfd/6Asaoubvcum5tJ4waGKMQdHQFFx7Xyfyp7QahSP37yG
	sDyTrqk2dWalB0tBcI0aA3HRbKU8KIZYeYzFwb8rf+8qmD9oCwunTY3vkJhvhJ5+0g
	tiEovH84kEkIWdyJLSPHYwVF++BbQswOLjjWEJqlCs2c4hv5vWMsjm+w3Xli1/hYER
	99siIS9ltupnVxZGkGzPFpIBsue5dRJFpGrtZAoMDn+S6IF+wZaOERx5+Z4IPuASCd
	QshZy5umyjSqeluUgF//0VmXbu7Am3B3xcWQbDx0Xw4FzaXjFWYkoN4jIIy8fqc17d
	bZI3zP/iVnsGwsu4aReZdtgh58xclc4x5TiSX0ZDVT4gNKJHMthYYJiHYWx2r+Vr6R
	6cKKvMdbVXX0z/nPCDOxGncQbStMdZzV5euc7QPNU1ixt5jYSurL7HkrEbY034RbQZ
	FSwKdu++tqRIuVd+gGRlqr4COVFQo/vPdx5dk7PlwJouZGHnasft4I5Jq3/61vZgP0
	TENJlZVhARbpVZdVhi8jQegi7OD91IZatyWjDokNYaN7CdGKbFCAPQEykSrDJ/jimr
	wbPAd7w9gqrXM1gUVFYvjEnVw+p4Zbn5D2Ls2QuZVzQeJ3Ad/4nnRUCbu0FV3+eweq
	uLR8TzLpt9ZLClMWLKL2ZIRw=
Date: Tue, 14 May 2019 11:30:19 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190514083019.GB11298@localhost>
References: <cover.1557809500.git.akuster808@gmail.com>
	<551153b0bd1ebbc05582f6014e3d88b9ce4a46d0.1557809500.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <551153b0bd1ebbc05582f6014e3d88b9ce4a46d0.1557809500.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/23] oeqa: Drop OETestID
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
X-List-Received-Date: Tue, 14 May 2019 08:30:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 13, 2019 at 09:54:03PM -0700, Armin Kuster wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> These IDs refer to testopia which we're no longer using. We would now use the test
> names to definitively reference tests and the IDs can be dropped, along with their
> supporting code.
>...

Is this bringing any benefits for a stable branch or was it just a cleanup?

And AFAIR this needs "oeqa/systemd_boot: Drop OETestID" or it might 
cause a regression.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


