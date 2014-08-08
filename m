Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id D1BAD60144
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 10:35:28 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20140808103517993
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 10:35:17 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=37706 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XFhVy-0000Hi-44 for openembedded-core@lists.openembedded.org;
	Fri, 08 Aug 2014 06:35:14 -0400
Date: Fri, 8 Aug 2014 06:35:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1408080629500.13627@localhost>
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
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how does SCR_URI_OVERRIDES_PACKAGE_ARCH affect building tslib?
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
X-List-Received-Date: Fri, 08 Aug 2014 10:35:33 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  looking at SRC_URI_OVERRIDES_PACKAGE_ARCH variable, and i notice
first that there is only one usage of it in all of oe-core (tslib),
but i'm confused as to what value it has.

  the ref manual reads:

"By default, the OpenEmbedded build system automatically detects
whether SRC_URI contains files that are machine-specific. If so, the
build system automatically changes PACKAGE_ARCH. Setting this variable
to "0" disables this behavior."

  first, i'm not sure what about the tslib SRC_URI appears to be
machine-specific. also, just for fun, i commented out that line in the
tslib .bb file, and did a global "bb show" to see what difference it
made, and i saw no difference at all. so what exactly is the purpose
of that line in that recipe? what difference should i be able to see
with versus without it? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


