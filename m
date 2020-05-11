Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.8739.1589188630358374030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 02:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49LFgj1xfvz5tlL;
	Mon, 11 May 2020 11:17:05 +0200 (CEST)
Date: Mon, 11 May 2020 11:17:04 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dawod <mhm.dawod@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Subject: Re: [oe][yocto][bitbake] Fetching source using different protocols
Message-ID: <20200511091703.l53b4t74xc36vgdo@qschulz>
References: <CAGCTLNQW1WWHmy1zaE+LF-AKBQa-UpY8sfOy=HH3tt0rJLJFLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGCTLNQW1WWHmy1zaE+LF-AKBQa-UpY8sfOy=HH3tt0rJLJFLg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mohamed,

On Mon, May 11, 2020 at 11:03:26AM +0200, Dawod wrote:
> Hello,
> 
> I need to fetch a git repo using 2 different protocols ( ssh & https )
> So that when I run bitbake, It will fetch using ssh protocol first and if
> it fails to fetch, It will try to fetch using https protocol.
> 

Why? What's the exact use case?

> can I do some thing like that or I will have to change it manually every
> time ?
> 

Maybe you could play with PREMIRROS? (I've never explicitly used that
variable though):
https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#var-PREMIRRORS

I guess the asterisk parts could be removed and the path to more or less your
source could be used (ssh first, to http path in your SRC_URI)?

That's a shot in the dark for me but something to test I'd say :)

Quentin
