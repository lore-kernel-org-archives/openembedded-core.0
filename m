Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.11651.1594218009441814463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 07:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=bCZExmhM;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B21fY2ByVz4K;
	Wed,  8 Jul 2020 16:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594218006;
	bh=0QrlOtIiJmA5gILiveSEBUP3KDChsX3+E3fORL3RLZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCZExmhMLr2Lupr5o+Xy0r9Fn4D8LNnHkndAUVnVBfkuLNnv51JbdEjjGlbA9OcIS
	 ZA0N7blTcqMqwuIzPrVmFkJbV7aAw0KMlXMS/4/l/9kEiB1n2UwRzcYFEFysry1P8I
	 +iuEEWVy48swttoIrdMJaptm4yXccuSr4EHoGpIrMRWq8tNkNR0+UPojHyg4MSGmN0
	 8o9fBnSlv5VOoyDEb8L1ocwzcjPHNzxn9f9z2IvDUzADXES8GfR5zMn+LqcNU4cc4q
	 7B+F3mPT6hotsm//OVGzXkOCT/BaMBiuv3xBuuvzlV2mJc+R/tjIhN3zln/BEMSDX0
	 0hJsxTgOIRAG2/tJoTj6+hK7urkoAcmQgg0ZSJh3WNUhVZ3S9RwIVO5G3nA4NVNz2w
	 VEIDP3EcJ42IGCA9NchuXkcemQKcxB/D/d2wP/2PIpJo5W/dHGEgJlaQXpxCl6/5sL
	 3iZZoHv+/J0RL2U9og96gsE1CW28p9ftP/59+RJPBPrPk2XpOEIytcilvh9pRKXSyg
	 p0xa7ANJMBS4sjqL4TM+INktCuyl2HJdBNhJa04TLApnMclgM8BI8sGNj+6RjHaKYe
	 1Nw09/DAlNOZG6ZjzKqrssk5zO89Q9eYOzkCyig9MWcrd0zLAFCNNDKucMds4ZAJqB
	 /nAi2U1XVD17wqSDNzs1Go+M=
Date: Wed, 8 Jul 2020 17:20:03 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Christian Eggers <ceggers@arri.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Patches are stuck in master-next
Message-ID: <20200708142003.GD5419@localhost>
References: <5614347.lOV4Wx5bFT@n95hx1g2>
 <ec870c18ff3d28d9e0f45f9b128b380dd8b5d668.camel@linuxfoundation.org>
 <12184874.L5pGue1uWE@n95hx1g2>
MIME-Version: 1.0
In-Reply-To: <12184874.L5pGue1uWE@n95hx1g2>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jul 08, 2020 at 11:40:30AM +0200, Christian Eggers wrote:
>...
> For NATIVE, I need the libs for running automatic unit tests on the
> build machine. One could probably ask whether unit tests should
> depend on libraries like libudev or libnm.
>...

I would rather ask why you aren't running automatic unit tests
built for the target inside qemu.

> regards
> Christian

cu
Adrian
