Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id E96CA71FE8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 08:35:53 +0000 (UTC)
Received: from [99.240.204.5] (port=49962 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YPS11-0006N0-Iv; Sun, 22 Feb 2015 03:35:51 -0500
Date: Sun, 22 Feb 2015 03:35:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1424522044.11836.70.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.11.1502220334160.12252@localhost>
References: <alpine.LFD.2.11.1502210434001.12954@localhost>
	<1424522044.11836.70.camel@linuxfoundation.org>
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
Subject: Re: questions about WORKDIR and S usage and files/ stuff
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
X-List-Received-Date: Sun, 22 Feb 2015 08:35:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 21 Feb 2015, Richard Purdie wrote:

> On Sat, 2015-02-21 at 05:09 -0500, Robert P. J. Day wrote:

... snip ...

> >   sticking with those non-patch files, it makes sense that all of
> > them should be processed relative to their location in ${WORKDIR}
> > (which is where they've all been copied), but occasionally, i'll
> > see a recipe that sets:
> >
> >   S = ${WORKDIR}
> >
> > then refers to all those files relative to ${S}. sure, that'll
> > work, but it always struck me as dangerous in case you ever need
> > to use a separate S directory down the road, then you'd have to
> > change the entire recipe.
> >
> >   as an example, consider base-files again, which sets:
> >
> >   S = "${WORKDIR}"
> >
> > but not for any reason that i can see since that recipe consists
> > of nothing but explicit files, and all of their processing is done
> > with respect to ${WORKDIR}, anyway, which strikes me as the right
> > way to do it. so, a question -- what is the point of the
> > base-files recipe setting S to that value? doesn't seem to have
> > any purpose that i can see.
>
> See the recent patches which actually added that.

  sorry, i don't know what recent patches you're talking about ...
that variable setting above has, according to git blame, been part of
the base-files recipe since back in 2005.

  what am i misunderstanding?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

