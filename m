Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 994 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Jan 2015 13:10:26 UTC
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1ED7213F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 13:10:26 +0000 (UTC)
Received: from [70.30.87.145] (port=59801 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y87AK-0006B0-M4 for openembedded-core@lists.openembedded.org;
	Mon, 05 Jan 2015 07:53:48 -0500
Date: Mon, 5 Jan 2015 07:53:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501050746100.9262@localhost>
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
Subject: how to share just the host tools among different builds?
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
X-List-Received-Date: Mon, 05 Jan 2015 13:10:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm drawing a blank at the moment so this might be a trivial
question -- is there a way to share the non-toolchain, host tools
across different builds on my development host?

  if i'm doing closely-related builds (or even for totally different
architectures), i can see the host tools that are built under
tmp/sysroots/x86_64-linux/... and one would think that, theoretically,
those tools are appropriate for all sorts of independent builds, even
if the toolchain is different.

  is there a simple setting that allows me to take advantage of all
those host tools that were built during an initial build, and continue
to use them in subsequent builds?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

