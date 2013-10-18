Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1EE6CE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 13:13:35 +0000 (UTC)
Received: from [69.196.158.250] (port=56723 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VX9ry-0002bf-V9; Fri, 18 Oct 2013 09:13:35 -0400
Date: Fri, 18 Oct 2013 09:13:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1382089284.29912.528.camel@ted>
Message-ID: <alpine.DEB.2.02.1310180909160.18187@oneiric>
References: <alpine.DEB.2.02.1310170803260.23524@oneiric>
	<1382089284.29912.528.camel@ted>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: diff between defining a "no-op" task and using [noexec]?
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
X-List-Received-Date: Fri, 18 Oct 2013 13:13:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 18 Oct 2013, Richard Purdie wrote:

> On Thu, 2013-10-17 at 08:07 -0400, Robert P. J. Day wrote:
> >   using a concrete example, there's this from oe core's
> > linux-dummy.bb:
> >
> > do_configure() {
> >         :
> > }
> >
> > do_compile () {
> >         :
> > }
> >
> > do_install() {
> >         :
> > }
> >
> >   what is the difference between the above and writing:
> >
> > do_configure[noexec] = "1"
> > do_compile[noexec] = "1"
> > do_install[noexec] = "1"
> >
> >   *is* there a difference? if so, does it have to do with the
> > processing of other flags for that task?
> >
> >   i can see that, technically, the first variation still defines a
> > task to be run, while the second specifies that the task *not* be run,
> > so i can appreciate that those two operations have different results.
>
> The difference is just that, with the first case bitbake will run
> the task, it will do nothing. In the second case, bitbake will not
> bother running it at all.

  i figured as much, but is there any important (pragmatic)
distinction between the two if one simply wants to nullify an existing
task?

  if there's a defined task dependency of some kind, i can certainly
see how having a defined task consisting of a no-op would behave
differently from specifying to not run that task at all, in terms of
subsequent dependencies. does that distinction come into play
anywhere? is there an example in the OE source that recognizes this?

  and WRT to how developers should code, is one of these approaches
considered better than the other? i've seen both approaches used in
recipe files, and i'm wondering simply about coding style. thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

