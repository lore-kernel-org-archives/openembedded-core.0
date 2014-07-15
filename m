Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 36CFF60850
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:16 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140715161814793
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:14 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [69.196.158.250] (port=55703 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X75Qf-000293-7Y; Tue, 15 Jul 2014 12:18:09 -0400
Date: Tue, 15 Jul 2014 12:18:01 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <53C54F34.7030802@linux.intel.com>
Message-ID: <alpine.LFD.2.11.1407151215330.7130@localhost>
References: <alpine.LFD.2.11.1407150923000.13777@localhost>
	<53C5477D.3030501@linux.intel.com>
	<CAJTo0La_uMvwmqZSX-8uaRk3ZcZDY=54+3A1X+oNNtf9-fydaQ@mail.gmail.com>
	<53C54F34.7030802@linux.intel.com>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: curious about why bitbake.conf setting of FILES_${PN}-bin
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 15 Jul 2014, Saul Wold wrote:

> On 07/15/2014 08:51 AM, Burton, Ross wrote:
> > On 15 July 2014 16:23, Saul Wold <sgw@linux.intel.com> wrote:
> > > Blame me for that patch!  Looking back at the commit message
> > > from about 2 years ago I think this got mid-way through a
> > > change, with the plan to actually remove lib_package completely
> > > since all it contained was the setting of PACKAGE_BEFORE_PN,
> > > therefore having FILES${PN}-bin. Not sure why we did not end up
> > > completing that.
> > >
> > > So another option is to remove the inherits and replace it with
> > > PACKAGE_BEFORE_PNs, Which would finish off the orignal plan!
> >
> > Wouldn't that change the packaging by putting all binaries into a
> > PN-bin package?
> >
> No the change would be to rmove the inherit lib_packaging from the
> recipes that use it and replace that with setting PACKAGE_BEFORE_PN
> with ${PN}-bin. So it's just doing what the recipes do already, not
> a general change in bitbake.conf.

  just FYI, while PACKAGE_BEFORE_PN is a cool concept, it's not like
there's a lot of it being used in the poky layer -- all of two uses:

meta/classes/lib_package.bbclass:PACKAGE_BEFORE_PN = "${PN}-bin"
meta/recipes-graphics/clutter/clutter-1.0.inc:PACKAGE_BEFORE_PN += "${PN}-examples"

was it really necessary to introduce a new variable just for that?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



