Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 68B9671A4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 10:41:14 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161031104110530_0485;
	Mon, 31 Oct 2016 10:41:10 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=28541 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c1A1X-0007o4-8E; Mon, 31 Oct 2016 06:41:03 -0400
Date: Mon, 31 Oct 2016 06:40:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LYORU9-1SCYVikomMkQA=XGJ=PNn5PpFg37+X5ubvXj8A@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610310639270.5379@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610290343130.7545@localhost.localdomain>
	<CAJTo0LYORU9-1SCYVikomMkQA=XGJ=PNn5PpFg37+X5ubvXj8A@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: couple questions about proper PACKAGECONFIG usage
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
X-List-Received-Date: Mon, 31 Oct 2016 10:41:14 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-1686021549-1477910404=:5379"

--587864349-1686021549-1477910404=:5379
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 31 Oct 2016, Burton, Ross wrote:

> On 29 October 2016 at 09:08, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         actually, that might be it for this post ... am i missing any other
>       subtleties involving PACKAGECONFIG worth mentioning? another
>       PACAKGECONFIG-related post coming shortly, but it's more focused so
>       i'll post it separately.
>
> The only interesting thing is that the behaviour has changed
> recently: the PACKAGECONFIG implementation now sets
> PACKAGECONFIG_CONFARGS and it's up to the recipe and/or class to do
> what it needs with it.  autotools.bbclass adds it to EXTRA_OECONF,
> cmake.bbclass adds it to EXTRA_OECMAKE, and so on.  In the past it
> was added directly to EXTRA_OECONF but that made integration with
> non-autotools harder.

  yes, i'd noticed that, definitely going to add that to my
explanation.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-1686021549-1477910404=:5379--
