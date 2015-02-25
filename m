Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id B124D71F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 08:41:04 +0000 (UTC)
Received: from [99.240.204.5] (port=36879 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YQXWg-0000Ig-2e; Wed, 25 Feb 2015 03:41:02 -0500
Date: Wed, 25 Feb 2015 03:41:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1424853407.26813.29.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.11.1502250340130.25049@localhost>
References: <alpine.LFD.2.11.1502250320080.23957@localhost>
	<1424853407.26813.29.camel@linuxfoundation.org>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: on current linux distros, what are potential candidates for ASSUME_PROVIDED?
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
X-List-Received-Date: Wed, 25 Feb 2015 08:41:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 25 Feb 2015, Richard Purdie wrote:

> On Wed, 2015-02-25 at 03:25 -0500, Robert P. J. Day wrote:
> >   for the sake of reducing build time in the classroom, what are some
> > of the potential (and relatively safe) candidates to add to
> > ASSUME_PROVIDED for a build from scratch?
>
> This path is fraught with danger to be honest. There are some things
> which are "safe" like subversion and git but they don't make that much
> difference to a build and there are not as many as you'd think.
>
> The biggest difference you can make is an sstate cache you share amongst
> the pupils. The time is spent:
>
> a) building gcc
> b) building libc
> c) building gettext
> d) building glib
>
> each of these is a bottle neck which then opens up a new set of targets
> as none of them are ASSUME_PROVIDED material.

  ok, fair enough.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

