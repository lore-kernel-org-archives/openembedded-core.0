Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id E0AB870632
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:25:48 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140724122544571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:25:44 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [64.102.254.33] (port=3522 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XAI5b-0004bP-3O; Thu, 24 Jul 2014 08:25:39 -0400
Date: Thu, 24 Jul 2014 08:25:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1406203585.27697.5.camel@ted>
Message-ID: <alpine.LFD.2.11.1407240825160.10708@localhost>
References: <alpine.LFD.2.11.1407240709110.8468@localhost>
	<1406203585.27697.5.camel@ted>
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
Subject: Re: simple dependency question
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
X-List-Received-Date: Thu, 24 Jul 2014 12:25:56 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 24 Jul 2014, Richard Purdie wrote:

> On Thu, 2014-07-24 at 07:13 -0400, Robert P. J. Day wrote:
> >   i realize that "DEPENDS" represents build-time dependencies, as in
> > ... all of the DEPENDS recipes must build *completely* before this
> > recipe can *begin* to build, is that correct?
> >
> >   however, in something like module.bbclass where one finds:
> >
> > do_make_scripts[deptask] = "do_populate_sysroot"
> >
> > does that now *override* the normal build-time dependency to say only
> > that this recipe's do_make_scripts task need only wait until all of
> > the "DEPENDS" recipes have completed their do_populate_sysroot tasks?
>
> The original DEPENDS meaning remains unchanged and applies to the
> configure task. The behaviour of DEPENDS comes from:
>
> do_configure[deptask] = "do_populate_sysroot"
>
> which means the configure task waits for all the populate_sysroot tasks
> of DEPENDS to complete before executing this task.
>
> do_make_scripts[deptask] = "do_populate_sysroot"
>
> Adds constraints to the make_scripts task where it also must wait until
> all DEPENDS populate_sysroot have run before it can.
>
> >   in other words, the instant i define an inter-task dependency, does
> > that relax the normal strong build dependency? since, if it didn't,
> > this wouldn't make any sense.
>
> and hence no, it doesn't relax other rules.

  ah, i should have known/remembered that. thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


