Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 9A47E71E4C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 18:25:28 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170218182527971_0485
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 18:25:27 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=55076 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cf9hB-0004cB-JE for openembedded-core@lists.openembedded.org;
	Sat, 18 Feb 2017 13:25:21 -0500
Date: Sat, 18 Feb 2017 13:25:19 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702181316120.26007@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: possible consequences of adding "extraneous" layers to a build?
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
X-List-Received-Date: Sat, 18 Feb 2017 18:25:29 -0000
Content-Type: text/plain; charset=US-ASCII


  (currently updating a pile of my OE online pages so i'm going to ask
a bunch of basic questions to make sure i'm not missing anything.)

  what are the basic rules for layer design such that you should
(theoretically) be able to toss a bunch of ostensibly superfluous
layers into a build, and it shouldn't make a difference? that is,
leaving aside obvious conflicts in having two layers trying to define
precisely the same thing, what are the only issues you should worry
about in throwing more layers into your "bblayers.conf" file, even if
you end up not using anything from them?

  first, it seems(?) clear that introducing new recipes or classes or
machines or distros in those additional layers should make no
difference -- if you weren't referring to any of those features
before, then if you don't change your configuration, you certainly
won't be referring to them now.

  the most obvious consequence is that one or more .bbappend files
will tweak some recipes you were already building, so .bbappend files
strike me as, really, the only consequence of note.

  the only thing that leaps to mind is if some really weird content
was placed in the new layers' "layer.conf" file, but that strikes me
as really bad design unless there's a good reason for it.

  so ... is there any other possible consequence of adding layers to a
build that i'm overlooking?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


