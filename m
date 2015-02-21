Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 78617606E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 20:28:05 +0000 (UTC)
Received: from [99.240.204.5] (port=48043 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YPGeh-00053w-9m; Sat, 21 Feb 2015 15:28:03 -0500
Date: Sat, 21 Feb 2015 15:28:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1424522044.11836.70.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.11.1502211520590.24876@localhost>
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
X-List-Received-Date: Sat, 21 Feb 2015 20:28:06 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 21 Feb 2015, Richard Purdie wrote:

> On Sat, 2015-02-21 at 05:09 -0500, Robert P. J. Day wrote:

> > p.s. i also notice that a small number of OE recipes contain the
> > apparently redundant setting:
> >
> > $ grep -r "^S = \"\${WORKDIR}/\${BP}\"" *
> > meta/recipes-extended/texinfo/texinfo_4.8.bb:S = "${WORKDIR}/${BP}"
> > meta/recipes-extended/texinfo/texinfo_5.2.bb:S = "${WORKDIR}/${BP}"
> > meta/recipes-support/taglib/taglib_1.9.1.bb:S = "${WORKDIR}/${BP}"
> > $
> >
> > which i would be tempted to remove, just because i'm a big fan of
> > minimalization.
>
> Those can likely be cleaned up, yes. Patches welcome.

  i'll put something together ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

