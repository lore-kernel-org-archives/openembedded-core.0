Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 68EE16C3AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 08:11:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44ZbJ32lTrz4J;
	Thu,  4 Apr 2019 10:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554365491;
	bh=N7n+Xh3Wjtb10rsGFwxvf9qyFmPnXM+FzhWFLf2L+JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBdehKNdtDz8Z0okjTyOWpJJWQDSFk3HMe2llZif+cLDHCvTkgeEqFmMGzHz0eKus
	pft+mv3vwT1Q1qX6aCtX2L1mbnXbsWLjMgdSKkSwPZ+xzeGdjxZvPYjfs+KRwgBrTX
	IZXo3YipGK4dh7vuCOYZuJaB2dS/36CEAuYOjHF2xaA4zLZiMTYtXq4+AYRBqnD9km
	7oiAZae7xgI5OhwqRRdxL0f3d/io4E7BYibxSTeUvr9YVbEIHa27wyn61wqlqkwpdH
	w5sp2mLmWBQ/1xN+qCYC51+261krOAPbRVFfHB4um/1UAO0Ul1DYF1jgzc4jZRTBUC
	jHqWesbvsczXe1XMEcWV5KPLOiNIpcityzA7gUP+u5zlCf29tgLZe8fn82z2ZI7XtT
	gnItVqyAgmElTtZ+6zRoy7idftdZyPV/sRCAuAKB4xZTKOyWeXgqOmIjKVEsOn7Hu5
	vGMbcdRNMu011jWhAdjZTNbNaTnoYn4yzzg3Wnv3vbgrh/zAmXGPV9nkzwfMeGkycb
	+TIuDgbfuu53U22/Wy/0etIm4X7kaZ7sUo97IyLd4WCMG/OJKZ9xK7986t/oOK2tTb
	Xn3HHqr6R1nvCkLln3KPc2Bt0VHNebLmqDbTD9/oCkKWbCzpcfPMRkBSnsWxJbbhxB
	bgLuJhJfZh6rNhSCujQpPTWg=
Date: Thu, 4 Apr 2019 11:11:28 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Changqing Li <changqing.li@windriver.com>
Message-ID: <20190404081128.GB13624@localhost>
References: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
	<20190402113135.GA27866@localhost>
	<3381bfd6-b3ed-da15-69dc-394fc1a9643b@windriver.com>
	<20190403095811.GB8376@localhost>
	<c232147c-1fe0-e983-277e-ad3ee1049abb@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c232147c-1fe0-e983-277e-ad3ee1049abb@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
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
X-List-Received-Date: Thu, 04 Apr 2019 08:11:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 04, 2019 at 10:06:44AM +0800, Changqing Li wrote:
>...
> And also upstream have use same way to fix under
> cogl/driver/gl/gl/cogl-driver-gl.c
> 
> https://gitlab.gnome.org/GNOME/cogl/commit/ca5226513eb64bceb38ca01994799c4e7cd9f5fa

Have they?

This looks like a 4 year old commit that was never merged.

> so I think we can fix same way under this
> cogl/driver/gl/gles/cogl-driver-gles.c

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


