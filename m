Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Soty3-0003el-N8
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 12:16:24 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:58576 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SotnF-0000Tf-7X for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 06:05:13 -0400
Date: Wed, 11 Jul 2012 06:04:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANkzWeZ1+yqqcLf330Ko-rMuk8C7w7FF+aH_omo1Xw2+NA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207110604040.5884@oneiric>
References: <alpine.DEB.2.02.1207100454370.26177@oneiric>
	<CABcZANkzWeZ1+yqqcLf330Ko-rMuk8C7w7FF+aH_omo1Xw2+NA@mail.gmail.com>
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
Subject: Re: does anything actually use BBVERSIONS?
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
X-List-Received-Date: Wed, 11 Jul 2012 10:16:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 10 Jul 2012, Chris Larson wrote:

> On Tue, Jul 10, 2012 at 1:58 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   perusing bitbake user manual, came across section 2.1.20 which
> > mentions BBVERSIONS, but i don't see any current usage of it.  is
> > it still actively used anywhere?  the only places i see it are in
> > the documentation.
>
> I don't know of any uses of it. The original intent was to allow a
> single recipe to emit multiple versions of a recipe, like
> BBCLASSEXTEND, thereby consolidating the metadata for an upstream
> project in a single place rather than it being scattered across .inc
> files, but I don't think anyone has needed to use it or tried to use
> it for anything. I still think there's value, but less so now that
> we try to keep the number of supported versions of a thing to a
> minimum.

  ok, just thought i'd ask.  someone else is welcome to decide if it's
worth keeping around.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


