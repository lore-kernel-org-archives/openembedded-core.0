Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B0F81744AE;
	Thu, 19 Apr 2018 16:17:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3JGHNRf032051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 19 Apr 2018 17:17:24 +0100
Message-ID: <1524154643.18865.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2018 17:17:23 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: yocto <yocto@yoctoproject.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"Cetola, Stephano" <stephano.cetola@intel.com>
Subject: 2.6 planning proposals and meeting
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
X-List-Received-Date: Thu, 19 Apr 2018 16:17:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

[Widely cross posted but please reply to openembedded-core only for
want of picking somewhere to discuss this]

The next big question facing us is what would we like to do in 2.6?
What can we do with the resources we have?

I'm proposing to hijack the next monthly Yocto Project technical
call[1] and dedicate it to 2.6 planning. I'm going to detail some high
level 'big' ideas blow in this email from a feature development
perspective. Anyone is welcome to join the call (or reply) and I'm
happy to answer questions about the ideas below and hear suggestions of
others.

[1] https://www.yoctoproject.org/monthly-technical-call/

Ultimately, ideas will be turned into bugzilla enhancement entries. It
will then be a case of seeing who is willing to step up and help work
on any given feature. We're using the "2.99" target milestone as our
holding area for potential ideas, only moving to 2.6 when we have a
solid commitment for someone to do something.

If nobody steps up for something, chances are it will just get pushed
out as a "Future" idea. In the past, Intel in particular has stepped up
and done a lot of feature work but for various reasons, this is not
likely to happen going forward as they focus more in Intel specific
work.

At the end of the day, we'll process the changes that make it onto the
mailing list by the freeze deadlines for the milestones. If its not
there, it won't be in the release and 2.6 will be what people put into
it.

List of high level 'big' ideas:

- Reference binary package feed (in particular to test upgrade paths)
-
Secure/trusted boot support in OE-Core
- Improved security tools (e.g.
CVE database scanning)
- Provide sstate feed out the box for reference
-
Improve binary output testing (esp. reproducibility, upgrade paths)
-
Widen the scope of our automated testing infrastructure (include
  more
layers)
- Roll processes and tooling into the wider ecosystem (e.g.
meta-
  openembedded)
- Ability to make builds more efficient by output
comparison and
  sstate prebuilt reuse in many more cases. Maybe sstate
equivalence   
  server
- Completion of migration to new autobuilder
codebase and 
  infrastructure
- Out of box experience/layer setup
tooling
- Improved binary reproducibility

Features aren't all we need to plan for. There are other areas that
need work/help:

Many other smaller features

  There are too many for me to list/call out individually but search 
  bugzilla for 2.99 Medium+ items. A good example is adding 
  support for inter-multiconfig dependencies which is a small 
  remaining multiconfig item which would make a big difference to 
  certain workflows.

  Another harder example is parallelisation of oe-selftest. Its 
  currently the thing which ends up taking the longest in most of our 
  builds, improving its performance would reduce overall testing times.

OE-Core Recipe maintenance: 840 recipes in OE-Core
  
  - General recipe
updates
  - Security fixes
  - Recipe specific bugs/regressions
  - Adapt
to new technologies/upstream changes

General patch review

  ~5000 commits/year which need review, testing, identifying 
  regressions, merging

General regressions

  Regressions tests we have are good but don't catch every race 
  condition or intermittent problem. We end up having to track
  down several, particularly runtime testing instability

Bug fixing user issues

  Users find new use cases and workflows and identify bugs which then 
  need to be addressed

  For example we can't default to mem-res bitbake as there are known 
 
issues.

Maintain the tools

  We directly maintain tools like bitbake, pseudo, devtool, recipetool
  opkg, yocto-autobuilder, patchwork+patchtest, wic

Stable release maintenance

  People all want stable releases and security fixes but someone has 
  to make these happen.


Help in any and all of these areas is much appreciated. Also keep in
mind the things above are just to get people thinking. If there are
changes you'd like to see, now is your chance to proposal and work on
them to make them a reality.

Cheers,

Richard




