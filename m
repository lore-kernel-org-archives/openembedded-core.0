Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C906E6BC44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 07:38:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45XLk82FWDzGB;
	Mon, 24 Jun 2019 09:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561361888;
	bh=gMjUL6OBvyGc++WRykcYgdgrDNYxhBXQKP+XkA9lr1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qB105IB6zqTOAAfFnkDhvlbgVmWlOw4Sff9582sqhiK61y92wdD/mx5d4FC72FdL9
	sTUwh5k5N+rcgfGMwli/aPZDxU9i/SLwaXI2B+uWEmZxcg1Wi+J32DcbSHM/thaJZ9
	5JU6SFf3N7EsOulU2p/fJbEmYNlMOBDmBCe5FF+U8E5wZqltyu3WMdWvW8SgopAE/+
	ADzRWSy3q7MtGutws68ZyHC1AtwBxp0MXWsxHZKmx3xMtTMyTOUCmqrrNFg0yc7tEk
	UPAuBJTnFPvKOWgdrUjqQ9SVqSdnYZABnh+3NhbnZSCobLwDdJ3mygZXPIWZjtJYyO
	QeKkKW2S2uu6YtnwGONIqPbfa/8xv8Uq4twpkRZ319FHEizfiy5FQ/io2bKYITquCI
	RmsZl5c3BPJafYizaeUENx0395ya8jMbcbj2rWgkaEpPKz0jcd4/4rLs7J/fqUYwa9
	V+n0Kd1WKVgGKF47/MqrJuHP3CHPglTSvJvARpfdeDD4YsAmHXSP2eVeOiMIPlHfd8
	PlBaHGqbBZsoLq1WtyxbnTQam4QY5S0teu7vkc+ior4hAiSsIL0PSR/47u8O9BVJmr
	EOLxzOu7cDZoz7KXqqk7ZBXVh0vRx9pgLx5M0gN6uoEHIvb+rbpmUuKQW0rlsZ5cPq
	Sb3HJ2GdCf8Gs+9DX+UByg5g=
Date: Mon, 24 Jun 2019 10:38:02 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190624073802.GA11015@localhost>
References: <cover.1561348290.git.akuster808@gmail.com>
	<b8d16e9d74688e91d6dee5e643b42fd5c4f887b4.1561348290.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b8d16e9d74688e91d6dee5e643b42fd5c4f887b4.1561348290.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Warrior][ 15/19] texinfo-dummy-native: A little clean up of template.py
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
X-List-Received-Date: Mon, 24 Jun 2019 07:38:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jun 23, 2019 at 08:54:14PM -0700, Armin Kuster wrote:
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> 
> This is mainly whitespace clean up, plus using the with statement when
> writing files.
>...

This patch and the next two look more like cleanup patches to me,
not changes that should go into a stable series.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


