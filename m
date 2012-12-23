Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TmtEi-0000lZ-TC
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Dec 2012 22:37:36 +0100
Received: from wnpgmb0903w-ds01-73-59.dynamic.mtsallstream.net
	([207.161.73.59]:38818 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tmt0O-0004fG-Rm; Sun, 23 Dec 2012 16:22:45 -0500
Date: Sun, 23 Dec 2012 15:22:40 -0600 (CST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1356286202.21913.21.camel@ted>
Message-ID: <alpine.DEB.2.02.1212231522200.23742@oneiric>
References: <alpine.DEB.2.02.1212231020210.32043@oneiric>
	<1356286202.21913.21.camel@ted>
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
Subject: Re: is defining an empty task same as "[noexec]" task flag?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2012 21:37:37 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 23 Dec 2012, Richard Purdie wrote:

> On Sun, 2012-12-23 at 10:23 -0600, Robert P. J. Day wrote:
> > is overriding something like do_compile() like this:
> >
> > do_compile() {
> >         :
> > }
>
> This will get run but does nothing.
>
> > equivalent to:
> >
> > do_compile[noexec] = "1"
>
> Bitbake won't even fork() a process to try and execute this so its
> marginally more efficient.

  i suspected as much, just wanted to make sure.  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


