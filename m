Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4CC71A76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 14:16:23 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161028141620136_0486;
	Fri, 28 Oct 2016 14:16:20 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=56746 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c07x5-0001NJ-BJ; Fri, 28 Oct 2016 10:16:11 -0400
Date: Fri, 28 Oct 2016 10:15:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZxbiHqL4HeS28aLfmp-rgf_go0XNX-YQGSFmoNjooqHw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610281014560.4206@localhost.localdomain>
References: <alpine.LFD.2.20.1610280356230.30798@localhost.localdomain>
	<CAJTo0LZxbiHqL4HeS28aLfmp-rgf_go0XNX-YQGSFmoNjooqHw@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can i arbitrarily mix "meta-debian" recipes into my build?
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
X-List-Received-Date: Fri, 28 Oct 2016 14:16:25 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-674846667-1477664114=:4206"

--8323328-674846667-1477664114=:4206
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 28 Oct 2016, Burton, Ross wrote:

>
> On 28 October 2016 at 09:00, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         more silly questions ... just noticed that some of the recipes i'm
>       looking for exist under meta-debian; is there any issue with "mixing"
>       those recipes into my normal, poky-based, bleeding-edge image builds?
>
>
> meta-debian does a *lot* of stuff, some of which is very invasive,
> so I wouldn't recommend it.  If there's a recipe you want that is in
> meta-debian I'd use their recipe as a starting point and write a
> standalone recipe.

  understood.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-674846667-1477664114=:4206--
