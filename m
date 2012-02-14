Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RxNp4-0007PK-2H
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 20:13:54 +0100
Received: by daln34 with SMTP id n34so201171dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 11:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I1MF2nzOsQEtkNFtIZFAzsMMqDZy0w2gxkhLigXXRKA=;
	b=ltC1ZYP9XiYZ3jy5/dVHmcYApPjHKXEGyaEq9F+mqUr6AeIkk17lc1BR4rJEewkqHp
	o2a4agJFFWVGKC2eoInDRdsGaU5zArQqklKJkzVBtITPGVJ/FYSC6W9i8RzBP8WUmboY
	PPMaxeNUrh0h5uq8ig9UctT5pf3itevlGhAqc=
Received: by 10.68.237.40 with SMTP id uz8mr42353840pbc.9.1329246342484;
	Tue, 14 Feb 2012 11:05:42 -0800 (PST)
Received: from sakrah.homelinux.org ([108.60.121.129])
	by mx.google.com with ESMTPS id 4sm5226574pbo.4.2012.02.14.11.05.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Feb 2012 11:05:41 -0800 (PST)
Date: Tue, 14 Feb 2012 11:05:37 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120214190537.GC11340@sakrah.homelinux.org>
References: <CAGiJk9fHCXEeFkRBi4OWL-0fbGtxPpHyGu5Qky+yJ_Ab-yVZ7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9fHCXEeFkRBi4OWL-0fbGtxPpHyGu5Qky+yJ_Ab-yVZ7A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Eglibc related / libm issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Feb 2012 19:13:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/02/12 16:21), Samuel Stirtzel wrote:
> Hi,
> currently building dependency depencies of Plasma Active dependency
> dependencies (this sentence may contain slight ironic content).
> 
> One of the libraries wants the maths.h library libm.
> Libm existent in my rootfs under /lib/libm-2.12.2.so, /lib/libm.so.6
> that points to it and the other link at /usr/lib/libm.so.
> But for some reason configure can't find it and quits with this error:
> 
> ac_cv_header_math_h=yes
> ...
> configure:14858: checking for ceil, floor and round in default libs
> configure:14900: checking for ceil, floor and round with -lm
> configure:14943: error: Could not find ceil, floor, round in default
> libs or with -lm
> 
> 
> Anyone knows what causes this, or how it could be resolved?

post the config.log which should be in the top of build tree.
there it must list why the test failed.

-- 
-Khem


