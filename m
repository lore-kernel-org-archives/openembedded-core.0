Return-Path: <andrew@bradfordembedded.com>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 6E17B77455
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 17:06:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id C984420972;
	Thu,  2 Jun 2016 13:06:43 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute6.internal (MEProxy); Thu, 02 Jun 2016 13:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	bradfordembedded.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=D68IFeTzqDJZ1N7KjMUH4i2nGC8=; b=RSqLx/
	3+ZddLP8dm7jXurRgItVDGwOWI4YIdKvaUoYnXXMvyjjFQbduhiM8PrbXDilnDxV
	0+ocLQdzsJyraUTu6eXbb4eZ6UZs24U7rl43/ogFn0MLcgIAlWv3C0b6XyL8o0Px
	DB8SBrfNHdNd00G9tcnp/ioIIesdyLmJRCUzI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=D68IFeTzqDJZ1N7KjMUH4i2nGC8=; b=h7ebs
	so5ZAnchWjL3uaX6ipDHTVMTtMFF73xh386eZ5FGs+3+yUNjjXjl2ukLo2j2SFOx
	P+zvyokz9Q4TRMLEb86yjPNnhKlGbKP/MEuW6NgRxcBXSmrfD796Mbmin+hiw9MZ
	3vS40EVJl6mWiusEY+18+iFNgNaTxi1dFIhbHs=
X-Sasl-enc: mnFXv8u2Su80rs5Y9JnR70a0dtQlDi8qI+L307Vq6/Hi 1464887203
Received: from kaim-eeyore.kodakalaris.net (clr-vpn01.kodakalaris.com
	[198.140.222.129])
	by mail.messagingengine.com (Postfix) with ESMTPA id 156D5F29F4;
	Thu,  2 Jun 2016 13:06:43 -0400 (EDT)
Date: Thu, 2 Jun 2016 13:06:41 -0400
From: Andrew Bradford <andrew@bradfordembedded.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160602170641.GA25552@kaim-eeyore.kodakalaris.net>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
	<1464205571-26293-3-git-send-email-andrew@bradfordembedded.com>
	<1464882993.13979.7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1464882993.13979.7.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] bitbake.conf: Add P4DIR and FETCHCMD_p4
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
X-List-Received-Date: Thu, 02 Jun 2016 17:06:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Richard,

On 06/02 16:56, Richard Purdie wrote:
> On Wed, 2016-05-25 at 15:46 -0400, Andrew Bradford wrote:
> > From: Andrew Bradford <andrew.bradford@kodakalaris.com>
> > 
> > So that perforce fetching can work more like the other source control
> > system fetchers.
> > 
> > Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
> > ---
> >  meta/conf/bitbake.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index acef30b..1aa1d37 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -339,6 +339,7 @@ SVNDIR = "${CO_DIR}/svn"
> >  GITDIR = "${CO_DIR}/git2"
> >  BZRDIR = "${CO_DIR}/bzr"
> >  HGDIR = "${CO_DIR}/hg"
> > +P4DIR = "${CO_DIR}/p4"
> >  
> >  STAMPS_DIR ?= "${TMPDIR}/stamps"
> >  STAMP =
> > "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
> > @@ -618,6 +619,7 @@ FETCHCMD_cvs = "/usr/bin/env cvs"
> >  FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no
> > -check-certificate"
> >  FETCHCMD_bzr = "/usr/bin/env bzr"
> >  FETCHCMD_hg = "/usr/bin/env hg"
> > +FETCHCMD_p4 = "/usr/bin/env p4"
> 
> I've kind of been hoping we could move to a model where the fetcher has
> sane defaults and we don't need to change anything in bitbake.conf
> unless the user has some need to customise.
> 
> The FETCHCMD is easy to do that for, the P4DIR is slightly harder since
> it means teaching the fetcher about CO_DIR which bitbake currently
> knows nothing about. It may be worth dropping the notion of CO_DIR and
> making the default ${DL_DIR}/p4 which bitbake does know about and
> making the other fetchers match which such defaults?

OK, I'll take a look at that.  It should be easy to have a sane default
for P4DIR and even FETCHCMD_p4 in the fetcher itself and not need
changes to bitbake.conf.

Thanks for the feedback! :)
-Andrew

