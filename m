Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 056BE7FA69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 22:13:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47289x6WW8z4Q;
	Mon, 28 Oct 2019 23:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572300806;
	bh=wxA8vX1JK+w0OnCy8w3tSakFsrhIFFfM5iF/ondp2Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOBkC0+raS5fvjwU/fvR9Py+OHH0/0Sapjh8kl9dPuyP33GpxfAuKTZ+ui1pfazdd
	QLcbXMuNDL1H6KrT6i9qKHjQUiLAxYSc2fIESAMoMFEuR549Wr8FLPXukBvePeDCWn
	Jsd+0R2GXD/YKhUZvPUFVBJHTdS+y5Gy4Z3c9MCbFUB8pQ/VDq+BBF+tMFHmMYg33E
	Yjd8Blsrc+tNskmOiOTYBewViP18cYS6OnshGfDvr2Vam+di/5wi8YuXa7+SyY+XVV
	sE9hKQfDxDMxCHmYz9kQFSYoV9dliRqIQnlZAwjNqv4VzTvh1+jjJu7cxMX+zEPDHS
	/xASmX/8RZGObC3nfcQpljme9A2EvMNVMMybzES5/NOhoftJ8jtqrgdJKFlQpt15IA
	UiBP1vaE1elKj5sYmxZQ2G6yGRhK8kf1XCciXCMRm3e4qI2gAX49v5G64UJFU+gimX
	bBFeqlfVXkGcN3K8P8UDPDCluRNb9JWX1XhC+mmOg292JGWPCF96mbINevw0HhC5Yq
	iorVMSGEU86ulChx3YgwVIVQO4S+A5BYMp15jkD3iZdqxyWzoewFA1JcaI6rKlti/F
	YpN5UChreKa+VRo12J6yhFpLp+EP3OHn4lO3glu+m/ZKNrsAN4ucoO4cAjrc/PGrok
	efziD9gJ12aVjrISeX/foaI8=
Date: Tue, 29 Oct 2019 00:13:23 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191028221323.GA7516@localhost>
References: <20191027150425.13079-1-bunk@stusta.de>
	<4c399ed0039fe394b53979bc52fb2f65d40664cf.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <4c399ed0039fe394b53979bc52fb2f65d40664cf.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] coreutils: Move stdbuf into an own package coreutils-stdbuf
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
X-List-Received-Date: Mon, 28 Oct 2019 22:13:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Oct 28, 2019 at 01:44:47PM +0000, Richard Purdie wrote:
> On Sun, 2019-10-27 at 17:04 +0200, Adrian Bunk wrote:
> > This LD_PRELOAD trick is not really suitable for busybox,
> > so can be the only part of coreutils needed.
> > 
> > coreutils depends on the new package,
> > so nothing changes when installing coreutils.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> > v3: coreutils-native fixed
> > ---
> >  meta/recipes-core/coreutils/coreutils_8.31.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> This is better but there look to be nativesdk warnings:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1406

I thought I was also testing nativesdk, but apparently not...

So the following works for native (no effect) but not for nativesdk:
  RDEPENDS_coreutils += "coreutils-stdbuf"

v4 (sic) sent.

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


