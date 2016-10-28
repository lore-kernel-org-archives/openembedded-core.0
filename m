Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id AF66560745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 08:02:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161028080141174_0486
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 08:01:41 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=44486 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c026Z-0002rm-9M for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2016 04:01:35 -0400
Date: Fri, 28 Oct 2016 04:00:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610280356230.30798@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: can i arbitrarily mix "meta-debian" recipes into my build?
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
X-List-Received-Date: Fri, 28 Oct 2016 08:02:06 -0000
Content-Type: text/plain; charset=US-ASCII


  more silly questions ... just noticed that some of the recipes i'm
looking for exist under meta-debian; is there any issue with "mixing"
those recipes into my normal, poky-based, bleeding-edge image builds?

  i note that the README for meta-debian specifically states that:

"Currently, the following software versions are supported in
 meta-debian.

    Source code: Debian GNU/Linux 8 (jessie)
    Build system: Yocto Project 2.0 (jethro)"

does that mean i should stick to precisely the "jethro" version of YP
for my builds if i choose to use any meta-debian recipes? or, as long
as it seems to work, i can just grab what i want and add it to my
current checkout of poky?

  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


