Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9579162252
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 15:35:03 +0000 (UTC)
Received: from [69.196.158.250] (port=34891 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X4XQ8-0001if-7c for openembedded-core@lists.openembedded.org;
	Tue, 08 Jul 2014 11:35:04 -0400
Date: Tue, 8 Jul 2014 11:34:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407081124440.6415@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: a question about recipe style
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
X-List-Received-Date: Tue, 08 Jul 2014 15:35:13 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  perusing the bitbake user manual, and ran across the section
discussing the "override style" operators _append, _prepend and
_remove, and thought i'd go looking through the OE recipes for an
actual example of the use of "_remove", and the only example i found
is in meta/recipes-extended/newt, but it looks a bit awkward, so i
just want to know about recommended style.

  there are two recipe files there -- libnewt_0.52.17.bb and
libnewt-python_0.52.17.bb -- with the following structure. that first
recipe file contains (among other things) the following:

PACKAGES_prepend = "whiptail "
...
FILES_whiptail = "${bindir}/whiptail"

  ok, so that recipe defines an additional package, and adds a single
file to that package, whereupon the second recipe file contains:

require recipes-extended/newt/libnewt_${PV}.bb
...
PACKAGES_remove = "whiptail"

  it just seems awkward for recipe 1 to explicitly add a package, only
for recipe 2 to include that recipe file, and subsequently remove that
package.

  it's not a big deal, but from a style perspective, i would have
thought one would first create a generic libnewt.inc file with common
content, then define the two recipe files off of that. does that make
sense in terms of best programming principles?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

