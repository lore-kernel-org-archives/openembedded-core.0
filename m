Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id E7BB265E1B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 12:07:08 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140810120709037
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 12:07:09 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=34626 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XGRtv-0000uI-TH; Sun, 10 Aug 2014 08:07:03 -0400
Date: Sun, 10 Aug 2014 08:07:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <4144636.z3IdHmx8Ax@peggleto-mobl5.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.11.1408100803070.25129@localhost>
References: <alpine.LFD.2.11.1408081529290.23581@localhost>
	<53E54245.4070704@linux.intel.com>
	<alpine.LFD.2.11.1408090914290.7338@localhost>
	<4144636.z3IdHmx8Ax@peggleto-mobl5.ger.corp.intel.com>
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove "SRC_URI_OVERRIDES_PACKAGE_ARCH = 0" from tslib.bb
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
X-List-Received-Date: Sun, 10 Aug 2014 12:07:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 10 Aug 2014, Paul Eggleton wrote:

> On Saturday 09 August 2014 09:17:16 Robert P. J. Day wrote:

... snip regarding changes that encompass multiple files ...

> When you're making a blanket change like this it's OK to not have a
> "primary item". Most of the time though you end up changing just one
> recipe or class at a time, and then you should specify it.

  ok, i'll submit this patch shortly. and just FYI, i do understand
that a lot of these patches are eye-rollingly trivial bordering on
aesthetic, but a lot of them are in aid of my courses, wherein i like
to work through OE source files with students and, every so often, i
run across oddities that someone asks about and i have to admit i have
no clue what something represents because i've never seen it before
and it's not documented anywhere. so i do enjoy making stuff like that
go away so i never need to explain it. :-)

  patch coming soon ...

rday

p.s. and with the removal of the thing in the subject line, i am
unaware of a single use of that variable in all of the layers i
normally work with. just an observation.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


