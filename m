Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TeQWM-00008n-9Q
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 14:20:46 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:49159 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1TeQIY-0004zs-Bm for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 08:06:30 -0500
Date: Fri, 30 Nov 2012 08:06:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1211300802160.22736@oneiric>
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
Subject: Q about terminology: bitbake "fetch" vs "fetchall"
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
X-List-Received-Date: Fri, 30 Nov 2012 13:20:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  need some advice about terminology -- for the sake of describing
this accurately, what is a good way to describe the packages
downloaded by:

  $ bitbake -c fetch
  $ bitbake -c fetchall

  for a simple "fetch", i get only this in my downloads/ directory:

autoconf-2.69.tar.gz
automake-1.12.5.tar.gz
gnu-config-20120814.tar.bz2
libtool-2.4.2.tar.gz
m4-1.4.16.tar.gz
pkg-config-0.25.tar.gz
pseudo-1.4.1.tar.bz2
quilt-0.60.tar.gz
sqlite-autoconf-3071401.tar.gz

while a "fetchall", of course, should fetch everything needed for the
build of my selected recipe/image.

  so what word/phrase can i use to describe what is downloaded by a
simple "fetch"?  for the sake of docs/tutorial, of course.


rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


