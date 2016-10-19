Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id BCAEA60403
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 22:18:24 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161019221825021_0685;
	Wed, 19 Oct 2016 15:18:25 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=52274 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bwzBg-0008S0-NV; Wed, 19 Oct 2016 18:18:16 -0400
Date: Wed, 19 Oct 2016 18:17:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1476915092.2166.105.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1610191815490.26491@localhost.localdomain>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
	<1542758.b0vWq7N0OP@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191733110.26015@localhost.localdomain>
	<1476915092.2166.105.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Wed, 19 Oct 2016 22:18:26 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-795611803-1476915442=:26491"

--8323328-795611803-1476915442=:26491
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 19 Oct 2016, Richard Purdie wrote:

> On Wed, 2016-10-19 at 17:34 -0400, Robert P. J. Day wrote:
> >   so, i'm home and on a different system about to do a build ...
> > refresh my memory, where are all those nativesdk rpms supposed to
> > show
> > up? if memory serves, they were under tmp/deploy/rpm/x86_64_linux.
> > anything i should set before i attempt a build?
>
> For SDKMACHINE="x86_64", the would appear in:
>
> tmp/deploy/rpm/x86_64_nativesdk/
>
> and SDKMACHINE="i686" in:
>
> tmp/deploy/rpm/i686_nativesdk/
>
> Switching SDKMACHINE might have been a trigger for one set
> disappearing, particularly on older versions. Which version was this?
> There were some bugs fixed in master/morty related to it.

  i'm building with an up-to-date checkout of poky, and am building a
core-image-minimal for mpc8315. i know i saw all those nativesdk rpms
earlier today -- do you want me to run a test of some kind?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-795611803-1476915442=:26491--
