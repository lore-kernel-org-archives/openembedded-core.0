Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id BD95C719DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 11:42:43 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161118114243713_0685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 03:42:43 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=53164 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c7hZ0-00068z-4m for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2016 06:42:38 -0500
Date: Fri, 18 Nov 2016 06:41:31 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611180634400.3556@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: small number of perl modules that can't be cross-compiled
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
X-List-Received-Date: Fri, 18 Nov 2016 11:42:45 -0000
Content-Type: text/plain; charset=US-ASCII


  after OE recipfying over 100 perl modules from CPAN, i'm down to
less than a dozen that are going to take more work, and a small number
of those seem to be simply badly written in that they don't support
cross-compilation for my target choice of "qemuppc". example
boilerplate recipe i put together produces this:

$ make libauthen-pam-perl
... snip ...
Checking if your kit is complete...
Looks good
checking for gcc... powerpc-wrs-linux-gcc -m32 -mhard-float -mcpu=7400
--sysroot=/home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc
checking for C compiler default output file name... a.out
checking whether the C compiler works... configure: error: cannot run
C compiled programs.
If you meant to cross compile, use `--host'.
See `config.log' for more details.
Error in configuring the Authen::PAM module.
... snip ...

  so i'm assuming the source itself for Authen::PAM:

https://metacpan.org/pod/Authen::PAM

is somehow flawed in that it doesn't properly recognize
cross-compilation, would that be it?

  i'm about to peruse the build process, but if someone has a quick
answer as to what the issue is here, there are 2 or 3 other modules
that have exactly the same issue. much thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


