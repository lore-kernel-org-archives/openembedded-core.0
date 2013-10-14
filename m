Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5E46CC8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 10:24:24 +0000 (UTC)
Received: from [173.34.6.101] (port=51755 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VVfK5-0003oG-K4; Mon, 14 Oct 2013 06:24:25 -0400
Date: Mon, 14 Oct 2013 06:24:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <3582326.YWLuugF7nd@helios>
Message-ID: <alpine.DEB.2.02.1310140623080.11043@oneiric>
References: <alpine.DEB.2.02.1310120642340.21327@oneiric>
	<3582326.YWLuugF7nd@helios>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: where is "packagegroup-core-qt-demoapps" defined?
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
X-List-Received-Date: Mon, 14 Oct 2013 10:24:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Oct 2013, Paul Eggleton wrote:

> Hi Robert,
>
> On Saturday 12 October 2013 06:45:20 Robert P. J. Day wrote:
> >   currently writing a tutorial on packagegroups and noticed in
> > core-image.bbclass:
> >
> > PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demoapps"
> >
> >   is that packagegroup actually defined anywhere? i'm prepared to be
> > told i'm being an idiot and that it's right under my nose.
>
> meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
>
> This one isn't as easy to find as some of the other packagegroups.
> Given that the recipe only provides one actual output package we
> could possibly rename it for clarity.

  grrrrrr ... not sure how i missed that, i must have used just the
slightest bit inappropriate grep command looking for it. sorry.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

