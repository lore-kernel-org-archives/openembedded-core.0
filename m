Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 7624C77CAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 10:40:33 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170329104033390_0486;
	Wed, 29 Mar 2017 10:40:33 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=14411 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ctB1d-0002fJ-TG; Wed, 29 Mar 2017 06:40:26 -0400
Date: Wed, 29 Mar 2017 06:40:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1490783406.13980.310.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1703290639280.513@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703290548440.3733@uk63952.mitel.com>
	<alpine.LFD.2.20.1703290555150.2895@uk63952.mitel.com>
	<1490783406.13980.310.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: wanting to clarify HOSTTOOLS and HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 29 Mar 2017 10:40:34 -0000
Content-Type: multipart/mixed; BOUNDARY="587868445-1730932157-1490784025=:513"

--587868445-1730932157-1490784025=:513
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 Mar 2017, Richard Purdie wrote:

> On Wed, 2017-03-29 at 05:56 -0400, Robert P. J. Day wrote:
> > On Wed, 29 Mar 2017, Robert P. J. Day wrote:
> >
> > >
> > >   again, trying to catch up with new developments, and i want to
> > > make sure i understand these variables. as i read it (and i
> > > could be off-base), HOSTTOOLS represents a list of tools that
> > > *must* be available one way or the other, and any tools listed
> > > there are allowed to be symlinked from the tools available in
> > > PATH, is that correct?
> > >
> > >   OTOH, HOSTTOOLS_NONFATAL represents whitelisted tools that
> > > will be symlinked if they're there, but their absence is not
> > > fatal.
>
> Correct. Perhaps you could send a patch to add these to the manual? :)

  it's what i live for. :-P

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-1730932157-1490784025=:513--
