Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TdIU0-0001iR-Dj
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 11:33:41 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:35655 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1TdIGG-0005MD-OV for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 05:19:28 -0500
Date: Tue, 27 Nov 2012 05:19:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.DEB.2.02.1211270427320.17683@oneiric>
Message-ID: <alpine.DEB.2.02.1211270512010.16369@oneiric>
References: <alpine.DEB.2.02.1211270427320.17683@oneiric>
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
Subject: Re: qemuarm: configure of bison fails, claims to need flex [SOLVED?]
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
X-List-Received-Date: Tue, 27 Nov 2012 10:33:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 27 Nov 2012, Robert P. J. Day wrote:

>
>   trying to build absolutely stock qemuarm image with current oe-core,
> got:
>
> ERROR: Task 800
> (virtual:native:/home/rpjday/OE/dist/layers/oe-core/meta/recipes-devtools/bison/bison_2.5.1.bb,
> do_configure) failed with exit code '1'
>
> and the log file claimed that bison needed flex.  i'm doing it all
> over again from scratch just to make sure it wasn't something silly
> i did, i'll report back if i can reproduce it.

  ah, i see where i did something unapproved -- to test what i could
add to the ASSUME_PROVIDED list, i added this to my local.conf:

ASSUME_PROVIDED += "m4 quilt"

which caused the configure step for bison to fail, claiming that it
needed flex.  should i have expected that?  am i misunderstanding the
rationale for ASSUME_PROVIDED?

rday

p.s.  just restricted to ASSUME_PROVIDED to "m4", that appears to be
causing the problem.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


