Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id A8B966067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 22:47:59 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20160422224758877_0485
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 22:47:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=48304 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1atjt8-0002vO-Dp for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2016 18:49:26 -0400
Date: Fri, 22 Apr 2016 18:47:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1604221835420.5850@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: precise details on processing of multiple .bbappend files across multiple layers?
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
X-List-Received-Date: Fri, 22 Apr 2016 22:48:01 -0000
Content-Type: text/plain; charset=US-ASCII


  i realize i should know the answer to this, but it's friday and i'm
tired. i want to know the precise processing order for the bbappend
files for a single recipe over multiple layers. (i realize it's
already a bad design if i have so many bbappend files for the same
recipe that i get confused knowing how they're processed. :-)

  if i have a recipe, say, rday_1.2.3.bb, and numerous rday*bbappend
files spread across several layers, i already know that those layers
are processed in increasing priority, so that higher-priority layers
will overwrite the settings of lower-priority layers. so far, so good.

  now, in each layer, the selection of any bbappend file will be based
on specificity, so in my case, selection order might be:

  * rday_1.2.3.bbappend
  * rday_1.%.bbappend
  * rday_%.bbappend

and as long as that's true, i'm assuming that search order is
restarted for each layer, so that if i have:

  * layer priority 5, rday_1.2.%.bbappend
  * layer priority 6, rday_1.%.bbappend

the first of the above will be processed, but will be superseded by
the second even though it is a more generic wildcard, correct?

  finally, if i have multiple layers with the same priority, what is
the processing order of bbappend files there? is it random? based on
wildcard specificity?

  thanks muchly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


