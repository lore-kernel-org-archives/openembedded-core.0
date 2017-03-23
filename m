Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC9171ABD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 09:52:40 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170323095239722_0484;
	Thu, 23 Mar 2017 09:52:39 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=45343 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cqzQ0-0002jG-Tj; Thu, 23 Mar 2017 05:52:33 -0400
Date: Thu, 23 Mar 2017 05:52:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <9fff31b3-2d67-0bed-b5c3-7b6d60cb4d5f@windriver.com>
Message-ID: <alpine.LFD.2.20.1703230552170.31066@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703220648410.15178@uk63952.mitel.com>
	<CAJTo0LbY4m=t5wzMnoOJxd0EuA+mVai6kovk7YRfZYPT_ymnLw@mail.gmail.com>
	<alpine.LFD.2.20.1703220701350.15389@uk63952.mitel.com>
	<9fff31b3-2d67-0bed-b5c3-7b6d60cb4d5f@windriver.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: possible content for site.conf?
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
X-List-Received-Date: Thu, 23 Mar 2017 09:52:42 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Mar 2017, Mark Hatle wrote:

> On 3/22/17 7:02 PM, Robert P. J. Day wrote:
> > On Wed, 22 Mar 2017, Burton, Ross wrote:
> >
> >>
> >> On 22 March 2017 at 10:51, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >>         from site.conf.sample, the obvious content is things like:
> >>
> >>       * download dir
> >>       * reference to local (in-house) source mirror
> >>       * http proxies/fetching configuration
> >>
> >>       and so on. any other things people throw into site.conf i can just add
> >>       to a list so readers can understand what that file is truly designed
> >>       for?
> >>
> >>
> >> That's pretty much the expected use.
> >
> >   i thought so ... i wracked my brain trying to think what else
> > belonged in there, and that's all i came up with. thanks.
>
> I have seen people do some blacklist entries here (or preferred
> version) when they have a company policy not to use certain
> software.  (Similarly a site wide PACKAGECONFIG to disable a feature
> that isn't allowed.)

  ah, yes, good points, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


