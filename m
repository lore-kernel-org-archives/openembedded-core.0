Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SeTEq-0002fS-PO
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:42:36 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:59613 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SeT4c-0002Gn-J0; Tue, 12 Jun 2012 11:32:02 -0400
Date: Tue, 12 Jun 2012 11:31:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <2704914.5qldZ3P3Ag@helios>
Message-ID: <alpine.DEB.2.02.1206121129470.13822@oneiric>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
	<CAMZjud3vpBnst6PWtSq-io+5CPZZdCCM7whOOSWbi9YCzbE7sQ@mail.gmail.com>
	<2704914.5qldZ3P3Ag@helios>
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
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Tue, 12 Jun 2012 15:42:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 12 Jun 2012, Paul Eggleton wrote:

> On Tuesday 12 June 2012 18:13:35 Marinescu, Bogdan A wrote:
> > On Tue, Jun 12, 2012 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > > You have to build it on uclibc to see if you can drop this patch or not.
> >
> > Thanks for your reply. I built with uclibc and the build succeeded.
> > Not sure how to test it though. Is there a 'standard' image that I can
> > build in order to test? I tried core-image-lsb, but it fails with an
> > error.
>
> Any core-image-* would do e.g. core-image-minimal, and you could just use
> CORE_IMAGE_EXTRA_INSTALL += "strace" in your local.conf to have strace
> installed in the image by default for the purpose of doing this test.

  i remember running across precisely that and being somewhat confused
by how that was described:

http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/18105

i still think there's some redundancy involving using both "_EXTRA_"
and "+=" in the same directive.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


