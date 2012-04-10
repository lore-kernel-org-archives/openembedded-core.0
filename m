Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SHOsO-00068R-Cn
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 02:24:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 39717315AFBB;
	Tue, 10 Apr 2012 02:14:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id DoM74cabEL-T; Tue, 10 Apr 2012 02:14:42 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ce6c6.pool.mediaWays.net
	[89.12.230.198])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DE9F8315AFB9;
	Tue, 10 Apr 2012 02:14:41 +0200 (CEST)
Message-ID: <4F837B70.2020307@opendreambox.org>
Date: Tue, 10 Apr 2012 02:14:40 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1334014014.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1334014014.git.mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] MIPS/MIPS32 tune -> MIPS
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
X-List-Received-Date: Tue, 10 Apr 2012 00:24:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10.04.2012 01:31, Mark Hatle wrote:
> The following is in reference to the recent discussion about the mips32
> -package- arch changing from mips to mips32.  One of the potential options
> was to get rid of the previous "mips" and replace it with the mips32
> definition standard.  This patch does just that.
> 
> Working with Khem, we have moved the default "mips" (32-bit) tune to be
> -march=mips32 based, and produce package with the package arch of "mips".
> 
> The side effect of this work is that the prior 'mips' tune was actually
> "mips1".  I don't believe that was really desired by anyone, but it is a
> change.  Also there is no longer a "mips32" tune, just an include file
> that automatically inherits and chooses the "mips" tune.

There's no backwards compatibility, but I'm fine with the new options.
The "mips" tune already gets selected by default in arch-mips.inc, so
you can remove it from tune-mips32.inc. Actually I'd prefer removing
tune-mips32.inc completely, so people will notice the
backwards-incompatible change.

Regards,
Andreas


