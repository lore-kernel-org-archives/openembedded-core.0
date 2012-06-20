Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1ShKGJ-0004wg-7A
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 14:43:55 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:37568 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1ShK5v-0006ml-Vq for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 08:33:12 -0400
Date: Wed, 20 Jun 2012 08:33:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1340195059.14857.198.camel@phil-desktop>
Message-ID: <alpine.DEB.2.02.1206200828450.5073@oneiric>
References: <alpine.DEB.2.02.1206200807090.4904@oneiric>
	<1340195059.14857.198.camel@phil-desktop>
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
Subject: Re: oddities related to "_append" and "_prepend" in oe-core
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
X-List-Received-Date: Wed, 20 Jun 2012 12:43:55 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 20 Jun 2012, Phil Blundell wrote:

> On Wed, 2012-06-20 at 08:14 -0400, Robert P. J. Day wrote:
> > inspired by richard purdie's correction of my original patch, i did
> > a quick grep to see if i could find any oddities related, first, to
> > uses of "_append"; specifically, where the string being appended did
> > *not* start with a blank.  there are certainly proper examples of
> > that, say when one is appending to a path, or appending to a filename,
> > and so on where a blank would be *wrong*.
> >
> >   but there also appear to be "errors", so here's the grep command and
> > its output:
> >
> > $ grep -r "_append = \"[^ ]" *
> > meta/conf/bitbake.conf:DISTRO_FEATURES_append = "${@oe.utils.distro_features_backfill(d)}"
>
> That one is probably ok.
>
> > meta/recipes-devtools/gdb/gdb-cross-canadian.inc:EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
>
> That one is actually ok, since the old value of EXTRA_OECONF ends with
> whitespace.  But it does look confusing, and there is no obvious reason
> it couldn't be += instead.

... big snip ...

  just to be awesomely clear as to what i'm trying to do here, i
realize that a lot of what i'm picking on is perfectly valid and
works.  but in trying to lash together at least an intro tutorial on
oe-core, i want to be able to say, "let's look at how it's done in the
source," without having to constantly explain how there are different
ways to do exactly the same thing without confusing the reader any
further.

  as i said, i'm trying to codify "best practices."  boy, a style
guide sure would come in handy. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


