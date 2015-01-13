Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3544D65D3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 12:57:59 +0000 (UTC)
Received: from [12.20.171.104] (port=47789 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YB12i-0001uQ-Vy for openembedded-core@lists.openembedded.org;
	Tue, 13 Jan 2015 07:57:57 -0500
Date: Tue, 13 Jan 2015 04:57:54 -0800 (PST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501130453440.21773@localhost>
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
Subject: in sysfsutils_2.1.0.bb, is 'S = "${WORKDIR}/sysfsutils-${PV}"' redundant?
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
X-List-Received-Date: Tue, 13 Jan 2015 12:58:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  more nitpickery, but was demonstrating OE recipe structure to class
yesterday, arbitrarily picked sysfsutils_2.1.0.bb, going through it
line by line, and a sharp-eyed student noticed this line:

S = "${WORKDIR}/sysfsutils-${PV}"

and wondered what it was doing there, since bitbake.conf sets the
default of:

S = "${WORKDIR}/${BP}"

and since, by default:

BP = "${BPN}-${PV}"

the source directory for sysfsutils would already appear to be
correct. setting S that way in the recipe obviously doesn't do any
harm, but is it accurate to say that, at least in this case, it's
unnecessary?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

