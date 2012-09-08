Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAGF0-0008P1-Fs
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 10:18:10 +0200
Received: by pbcwy7 with SMTP id wy7so743957pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Sep 2012 01:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WY3b73/rF5MlH9NFp0EyLerSNlBB/2GfDkmiEBQkJww=;
	b=rcJjeLipBFtGprR/YNZXLZTz7ZNyb8hLNH5+cDdx5f5srmqMtmVWo2mW9l54MGq9u7
	52mpZKPgk8BMgTvMVXzO8Rj8u6CTTtIAUxl0mW+mmGFUfzsQCDDRCTca5Ci7hugcBfkd
	GplF8coR/kR/WnGHS1ruxf9M9U+4fG01rqLlolBKRnB9nTPdxR5VDJkzXOFpR21+jRyV
	6fWhTtOIhQDinn9AC3Hve9VprZ0MATbSPGq4pm+Z5Uwd1sEQue101AJ8B2LNXOLNSb1R
	MHJ0AMfjTr65sP1PU0vQiNdr2GFyYsW5Dub7R8rQyLellsw9cFSFI4YugAAxFGxMzEsH
	/vgQ==
Received: by 10.66.88.1 with SMTP id bc1mr12596091pab.18.1347091543137;
	Sat, 08 Sep 2012 01:05:43 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ka9sm4764985pbb.59.2012.09.08.01.05.41
	(version=SSLv3 cipher=OTHER); Sat, 08 Sep 2012 01:05:42 -0700 (PDT)
Date: Sat, 8 Sep 2012 01:05:04 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120908080502.GC3903@sakrah.homelinux.org>
Mail-Followup-To: Phil Blundell <philb@gnu.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1347033943.8619.0.camel@ted> <504A21A5.7000309@windriver.com>
	<CAJTo0LYnG1BdZ=UkKPWju7UwBZWjEJhQ_svmO4bVwaSL1ZGGkA@mail.gmail.com>
	<1347037772.8619.24.camel@ted>
	<1347038143.2673.226.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1347038143.2673.226.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2012 08:18:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/09/12 18:15), Phil Blundell wrote:
> On Fri, 2012-09-07 at 18:09 +0100, Richard Purdie wrote:
> > The key places people get bitten are eglibc and gcc so those should be
> > straight forward to test, the question is how widely to deploy this
> > initially. I think the mechanism is good, its now just a question of the
> > implementation detail.
> 
> Eglibc and gcc, at least, support building with ${B} != ${S} so it might
> be easier/quicker to just blow away the whole ${B} tree rather than
> trying to distclean it.

yeah and I think separating B from S in general has merits in long run
> 
> I imagine that most modern-ish autotools-based packages will also build
> fine in that configuration, though there are bound to be some that
> don't.  It's hard to say whether there are likely to be more or fewer of
> those than there are ones where "make distclean" fails.
> 

either way there seems to be same amount of uncertainity.

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


