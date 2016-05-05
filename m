Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6486012C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 12:16:00 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160505121600948_0685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 05:16:00 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=30018 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ayIDk-0007Pu-3S for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2016 08:17:32 -0400
Date: Thu, 5 May 2016 08:15:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1605050800120.26815@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: an rpm question: can i get an update/install history relative to a baseline?
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
X-List-Received-Date: Thu, 05 May 2016 12:16:01 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm sure there's a trivial answer to this, but here's what i'm
after. say i use OE to build an image for a target board, rpm-based,
load it and start running it -- imagine i say this is "version 1.0".
as time goes by, i occasionally update existing packages or install
new packages for extra functionality. at any time, i'd like to
generate a "change manifest" relative to the original installation;
IOW, just a changelog of what's happened *only* since the original
install. that should be simple, but wait, it gets better.

  eventually, a new release, say "1.1" comes out, and a full upgrade
to that new release is done. at that point, i want to reset the
baseline for the change manifest relative to 1.1, so the new change
manifest appears empty, and starts tracking changes from that new
version. and so on, and so on.

  or, now that i think about it, i guess i want the general ability to
query the change manifest relative to any "official" release, assuming
i can identify when an official release is applied to the system.

  is there a simple rpm command to do this? i can see a utility called
rpm-manifest:

  https://github.com/jumanjiman/rpm-manifest

that will at least tell me that *something* changed, but doesn't go
into detail.

  so what overlooked feature of rpm (or the smart package manager, if
need be) am i missing?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



