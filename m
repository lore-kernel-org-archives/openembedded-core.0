Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.9551.1619080999386630289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 01:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:47900 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lZUvc-0007pg-TV; Thu, 22 Apr 2021 04:43:17 -0400
Date: Thu, 22 Apr 2021 04:43:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Denys Dmytriyenko <denis@denix.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] standard for names for local source mirror tarballs for git-based recipes?
In-Reply-To: <20210421214534.GT15937@denix.org>
Message-ID: <c1a47173-f82c-5245-662-5f3c2c377d3@crashcourse.ca>
References: <373df555-e7c2-f0b4-11c5-575d209391ea@crashcourse.ca> <20210421214534.GT15937@denix.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Apr 2021, Denys Dmytriyenko wrote:

> On Wed, Apr 21, 2021 at 07:44:45AM -0400, Robert P. J. Day wrote:
> >
> >   based on my recommendation, colleague created a local source mirror
> > to start collecting tarballs so as to minimize amount of downloading
> > for various builds. names of tarballs that correspond to fixed
> > (versioned) tarballs was fairly obvious, but he got stuck trying to
> > local source mirror a tarball for googletest (from meta-oe), which
> > contains (among other things):
> >
> >   googletest_git.bb
> >   ...
> >   PV = "1.10.0"
> >   S = "${WORKDIR}/git"
> >   SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
> >   SRC_URI = "git://github.com/google/googletest.git"
> >
> > he wasn't sure what name the tarball should have in order to be
> > recognized in the local source mirror. i didn't have the answer off
> > the top of my head, but since for years i've enhanced all my builds
> > with a site.conf file containing:
> >
> >   SOURCE_MIRROR_URL ?= "file:///home/rpjday/oe/dist/tarballs/"
> >   INHERIT += "own-mirrors"
> >   BB_GENERATE_MIRROR_TARBALLS = "1"
> >
> > i just added googletest to a random build to see what i'd get, and
> > got:
> >
> >   git2_github.com.google.googletest.git.tar.gz
> >
> > i guess i'd never paid close attention to the name generation for such
> > things, but i'm *assuming* that the name generation by the appropriate
> > fetcher code simply encodes everything there is to know about the
> > source so that the appropriate tarball is recognized as the local
> > source mirror version for that recipe. is that about right?
> >
> >   second question: clearly, the simple name of that tarball doesn't
> > encode the PV or SRCREV values, so what happens if the base recipe
> > suddenly bumps PV up to 1.11.0? i'm sure the answer is obvious, i've
> > just never thought about it.
>
> The tarball with the previous clonedir will be unpacked and bitbake will check
> if required SRCREV exists in there. If not, it will try to update the clonedir
> from upstream.

  i feel silly for having asked this question since a little more
research clarified things nicely. *sigh*.

rday
