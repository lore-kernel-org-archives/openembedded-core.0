Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1F771DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 13:34:23 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170315133421834_0486;
	Wed, 15 Mar 2017 13:34:21 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=59322 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1co949-0006PV-Ii; Wed, 15 Mar 2017 09:34:13 -0400
Date: Wed, 15 Mar 2017 09:34:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Patrick Ohly <patrick.ohly@intel.com>
In-Reply-To: <1489581612.6396.94.camel@intel.com>
Message-ID: <alpine.LFD.2.20.1703150928510.10217@localhost.localdomain>
References: <alpine.LFD.2.20.1703150639340.8646@localhost.localdomain>
	<CAJTo0LZm4zR2f+2Wgvab0=dhdP-Mu-cDGihqh2_hnVvuaOVGmg@mail.gmail.com>
	<1489581612.6396.94.camel@intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what shell programming constructs can we count on in .bbclass files?
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
X-List-Received-Date: Wed, 15 Mar 2017 13:34:24 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Mar 2017, Patrick Ohly wrote:

> On Wed, 2017-03-15 at 11:05 +0000, Burton, Ross wrote:
> > Our shell parser *should* be POSIX compliant.  There are a few
> > places where it isn't, but I believe those should be considered
> > bugs.  At the end of the day the shell is actually executed by
> > /bin/sh or /bin/bash anyway, so as long as bitbake can parse it
> > you can use anything.
>
> Unfortunately bitbake has problems parsing useful things like $( ).
> Are there open bugs about that and/or is it worth filing enhancement
> requests?

  on a more basic level, there's quite a lot of, i guess, bourne
shell'isms (and other weirdnesses) still lying around. in
meta/classes/, some examples (hoping i didn't screw them up):

  "if test" rather then "if ["

  all that 'if [ "x${VAR} = "x" ]' i mentioned earlier

  if [ "x${ICE_PATH}" = "x" ]   rather than   if [ -z "${ICE_PATH}" ]

  if [ ! -z "${conf_sign_keyname}" ]  ... ?????? :-)

none of this is a big deal, but there sure are some historical
holdovers and strangely-chosen constructs.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


