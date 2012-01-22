Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ronzy-0003Cj-49
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 04:21:42 +0100
Received: by iabz21 with SMTP id z21so3214197iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 19:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VH9R6Pt5KFeo2KXrNznBq6EkE1FfuT0I9CyA4udD4tY=;
	b=wDILJMi3LLELazmU74UfeUelRMZbUyY1XsRvypOR1/GARmEfzidclgvnJgOuU4HWD6
	HznusSYPp5ZXMx4fKSg1HtcEN6fjh+IqtE5t273mN3Gn8vYVUwDnhbKQzZa4lOAIhKxU
	1HV84aw0sVBq7lKL/B1ezmVlAItlWENvvuEmA=
Received: by 10.42.151.65 with SMTP id d1mr3338258icw.18.1327202039246;
	Sat, 21 Jan 2012 19:13:59 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id gh7sm14663561igb.1.2012.01.21.19.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 19:13:57 -0800 (PST)
Date: Sat, 21 Jan 2012 19:14:52 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120122031452.GF27997@sakrah.homelinux.org>
References: <1326804638-3951-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1326804638-3951-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] e2fsprogs: update to 1.42
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
X-List-Received-Date: Sun, 22 Jan 2012 03:21:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/01/12 13:50), Koen Kooi wrote:
> Complete changelog can be found at http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.42
> 
> The quotefix patch isn't needed anymore and the build survived -j20 on a quadcore machine, so PARALLEL_MAKE is enabled again. Almost everything in the recipe minus SRC_URI stuff has moved to the .inc file as well.

I like PARALLEL_MAKE being reenabled


