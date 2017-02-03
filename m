Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 04F206AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 11:11:04 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:7d41:1b6a:db1a:d59c] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>) id 1cZblc-0000gD-Ck
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2017 12:11:03 +0100
Message-ID: <1486120259.13882.26.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 03 Feb 2017 11:10:59 +0000
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: RSS difficulties
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
X-List-Received-Date: Fri, 03 Feb 2017 11:11:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm having a few problems adapting our build setup to work with recipe
specific sysroots.  More specifically, I am finding it difficult to get
the correct set of components installed into the recipe-sysroot in all
cases.  In some cases I am getting too much (which causes build
failures if oe attempts to stage two things that install the same file)
and in other cases I am not getting enough.

Could somebody explain, ideally using only small words, how the set of
things to populate in the recipe-sysroot is determined?  I assume it is
based on the task dependency graph somehow but I'm not quite sure which
relationships I ought to be looking at.

thanks

p.


