Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TqRyW-0002Id-BQ
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 18:19:35 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:44065 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TqRjz-0005r2-6x for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 12:04:31 -0500
Date: Wed, 2 Jan 2013 12:04:27 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301021151240.6551@oneiric>
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
Subject: value of "PACKAGE_BEFORE_PN" versus "PACKAGES =+"?
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
X-List-Received-Date: Wed, 02 Jan 2013 17:20:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII



  just now noticed the variable PACKAGE_BEFORE_PN, whose entire
usage in poky (other than documentation) is:

meta/conf/bitbake.conf:PACKAGE_BEFORE_PN ?= ""
meta/conf/bitbake.conf:PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
meta/classes/lib_package.bbclass:PACKAGE_BEFORE_PN = "${PN}-bin"

  is there an actual need for that variable that places the new
package names *precisely* in that location in the PACKAGES list?  and
given the specificity of the initial PN-related packages:

  "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale"

is there any reason more recipes couldn't use PACKAGE_BEFORE_PN
instead of "PACKAGES =+" when defining new packages?  i *realize*
those two things don't represent the same thing but, in many cases,
would the end result be the same?

  is there any reason more code doesn't use "PACKAGE_BEFORE_PN"?

rday



-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


