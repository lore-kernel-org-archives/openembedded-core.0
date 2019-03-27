Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F29217C60B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:51:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44TrXx14h7z5h;
	Wed, 27 Mar 2019 15:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553698274;
	bh=n4/x8GUqvoHdWKiKNY6jh07PuCtHGSoyuDM/QlVTivo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBAdcYCyUhnRqyClKXvuHAxYjnTSY8w756SA5KviXion9KGI0xRj5s4z8UY4WWvRq
	B5gGRud6jstfxj3tKHGPRLOdxsqaF4IzkHvGel3iITBDMRmpuGoj6Q5y6wdBvc97uF
	36qqQSrxWARWuyxmMoNxnB937fz7k3kmoOuYDCdQJGIKBVRGP/xVULkJ7ZMFqCEMoi
	QkbcZw1xtS7vArta+9i3EETMIUUXHI3b5mAFsu9RpiEGnOPrhkbU/M4/pcFAKjsxlf
	siEiq0h6lZh+TMgZLzOIRoVg0kkzSLZyvsDtprPdz3sWUzeury4EsGoJoBZ1O5kQa8
	sBJPiXk1xk1Kj3GJb/dhle1bebgl6LVLL0LrtXG006ws5x7jBmfXSpLno6JChZAeBW
	zb10dYMI6SIP5XRH4S7/8EpkJdxXz378n7IH4PFuJrpTPkzq4fM5oUCGqntfWe4cxZ
	A9ihqMz4QT0yKNObvnIn+RYrcSnSm05EngkZXFyJtxSGMDfIxj8mrHhnlczqgU1hJD
	pjH1Hp3vUx+IbI3/IMPY/LWyUJd414gku3wSRCs3Q0/jpMmYjRbQ6y+e9MDxwVAOoY
	lEpb5wG2W3aPChdUr3jx/sw5bvsMYCGJnfrTP7JalwhIv9RdH4EDNHwx0FULWMXVkI
	e8vuA381dNncmy/hBTRKvohE=
Date: Wed, 27 Mar 2019 16:51:10 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190327145110.GA23257@localhost>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
	<20190327140922.109867-3-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190327140922.109867-3-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/8] blktool: update to 4-7.1
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
X-List-Received-Date: Wed, 27 Mar 2019 14:51:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 27, 2019 at 03:09:17PM +0100, Alexander Kanavin wrote:
> This update adds a patch from Debian to match the latest version there.
>...
> +           file://0004-fix-ftbfs-glibc-2.28.patch \
>             file://blktool-gnulib-makedev.patch \
>...

That's 2 patches adding the same #include.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


