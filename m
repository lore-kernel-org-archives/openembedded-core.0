Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7oMn-0006NK-Q4 for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:35:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDR4Ib008091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:27:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06829-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:27:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDQtXH008085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:26:56 GMT
Message-ID: <1331731615.18586.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 13:26:55 +0000
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/14] Warning Fixes and some Updates
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
X-List-Received-Date: Wed, 14 Mar 2012 13:35:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 01:33 -0700, Saul Wold wrote:
> Richard,
> 
> This has some warning fixes along with some update.
> 
> Biggest change is to bitbake.conf, which re-orders PACKAGE and addes 
> ${libdir}/${BPN}/*.a to the staticdev list, this was seen in a number 
> of packages and seems to make sense.  But I would understand if there
> are other issues I am not aware of.
> 
> The FILES_${PN} was grabbing from ${libdir}/${BPN}/* so we needed to 
> get the staticdev in before that.

I replied to this patch. If we do take it in, it needs some very
specific testing data.

> Saul Wold (14):
>   owl-video: Fix unpackaged file warning
>   ltp: Package static library in -staticdev
>   quilt: Fix docs packaging warnings
>   autoconf: remove emacs mode files to fix warnings
>   rpm: Package python-rpm static archive correctly
>   distro_tracking: Updates for manual checks
>   avahi: Update to 0.6.31
>   man-pages: Update to 3.36
>   libgalago: Fix package warnings by not packaging autopackage
>   man: fix configure issue to solve warnings

I took these, thank.

>  gpgme: fix packaging warnings

I'd like to see a small tweak to this one (I've replied to the patch)

>  python: package static libraries correctly in -staticdev

I meant not to take this after the comment from Martin but accidentally
did. I therefore followed up with a fix to the generator script so this
one is merged and dealt with.

>   bitbake.conf: Modify PACKAGE list ordering to insert -staticdev file
>     before PN

I've replied about this one.

>  qt4: package static libraries correctly to fix warnings

I've held off this one as Martin reported an issue.

Cheers,

Richard



