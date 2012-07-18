Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SrZBb-0006b5-4P
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 20:41:23 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:42551 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SrZ0d-0000UD-6Z for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 14:30:03 -0400
Date: Wed, 18 Jul 2012 14:29:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4OdgOFcrMyRKgwGgU9DsMWNMU673Zp-DFV_H+GeFpup1w@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207181429150.23786@oneiric>
References: <alpine.DEB.2.02.1207181358290.23450@oneiric>
	<CADkTA4OdgOFcrMyRKgwGgU9DsMWNMU673Zp-DFV_H+GeFpup1w@mail.gmail.com>
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
Subject: Re: any easy way to run kern-tools verbosely?
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
X-List-Received-Date: Wed, 18 Jul 2012 18:41:23 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 18 Jul 2012, Bruce Ashfield wrote:

> On Wed, Jul 18, 2012 at 2:02 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   if there's a way to do this, i'm going to be so embarrassed.
> > perusing kernel do_patch() routine, which eventually calls:
> >
> >         if [ -n "${KMETA}" ]; then
> >                 createme_flags="--disable-meta-gen"
> >         fi
> >         createme ${createme_flags} ${ARCH} ${kbranch}
> >
> >   but checking out "createme" in the sysroots/ directory shows:
> >
> > usage()
> > {
> > cat << EOF
> >
> >     createme [-v] [--disable-meta-gen] --meta=<branch name> <arch> <branch> [defconfig]
> >
> >       --disable-meta-gen: do not automatically create meta data
> >                           if not already present in the source tree.
> >       --meta: the branch name for meta data. default is 'meta'
> >       -v: verbose processing
> >       ... snip ...
> >
> > so "createme" accepts "-v" for verbose, but i see no trivially
> > easy way to pass that option given the hardcoding of the call in
> > do_patch().  are you just expected to manually edit createme to do
> > that?
>
> They are only useful for debugging at the moment, which is me :) So
> honestly, there's never been a reason to complicate the reciepes any
> more by dragging these options out to that level.

  ok, just wanted to make sure i wasn't missing something deviously
complicated.  thanks muchly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


