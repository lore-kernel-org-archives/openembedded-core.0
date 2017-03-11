Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 1899771AB9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 08:30:21 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170311083021968_0484
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 08:30:21 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=39556 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cmcPo-0006bS-5b for openembedded-core@lists.openembedded.org;
	Sat, 11 Mar 2017 03:30:16 -0500
Date: Sat, 11 Mar 2017 03:30:06 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703110315570.17105@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how does files/fs-perms.txt affect building base-files rpm?
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
X-List-Received-Date: Sat, 11 Mar 2017 08:30:23 -0000
Content-Type: text/plain; charset=US-ASCII


  potentially a dumb question, but do the settings in
files/fs-perms.txt affect the building of the base-files rpm just as
they would affect the building of any other rpm?

  i can see the structure of the base-files recipe, whose do_install()
routine manually installs a ton of stuff, with very specific file and
directory modes, which is fine. and assuming fs-perms.txt is applied
after that, does that mean that whatever is in that fs-perms.txt file
will override any settings already in place as built by the base-files
recipe?

  also, as i understand it, given that fs-perms.txt is used to set
file and directory modes for all created packages, does that mean that
any discrepancy between a package and what is already in the root
filesystem will cause a package installation error?

  i already ran across the situation where a package was built
assuming a volatile log directory, but the running image it was being
installed into had a regular /var/log directory, and that caused the
package installation to fail. am i correct in assuming that is normal
behaviour?

  thank you kindly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


