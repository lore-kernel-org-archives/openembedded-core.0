Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 4762D719CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 10:32:11 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161020103211103_0484;
	Thu, 20 Oct 2016 10:32:11 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=41177 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bxAdn-0000U2-Kp; Thu, 20 Oct 2016 06:32:03 -0400
Date: Thu, 20 Oct 2016 06:31:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1476915092.2166.105.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1610200514490.4275@ca624034.mitel.com>
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
X-List-Received-Date: Thu, 20 Oct 2016 10:32:12 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-1563063255-1476955560=:4275"
Content-ID: <alpine.LFD.2.20.1610200536570.4806@ca624034.mitel.com>

--587864349-1563063255-1476955560=:4275
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LFD.2.20.1610200536571.4806@ca624034.mitel.com>

On Wed, 19 Oct 2016, Richard Purdie wrote:

> On Wed, 2016-10-19 at 17:34 -0400, Robert P. J. Day wrote:
> >   so, i'm home and on a different system about to do a build ...
> > refresh my memory, where are all those nativesdk rpms supposed to
> > show up? if memory serves, they were under
> > tmp/deploy/rpm/x86_64_linux. anything i should set before i
> > attempt a build?
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
> disappearing, particularly on older versions. Which version was
> this? There were some bugs fixed in master/morty related to it.

  just for fun, i'm going to do a fresh build right now, involving:

* fresh "git pull" of poky
* MACHINE=mpc8315e-rdb
* bitbake core-image-minimal

  current state of poky (master branch)

$ git show
commit ef627ab364d52fe19994c94c1a78fbe21620a32c
Author: Joshua Lock <joshua.g.lock@intel.com>
Date:   Wed Oct 12 21:46:42 2016 +0100

    local.conf.sample.extended: remove RM_OLD_IMAGE
    ... etc ...

  that's it, no other customization other than selecting MACHINE and
pointing build at my local source mirror. and away we go ... and the
end result is, under tmp/deploy/rpm/:

$ ls -l
total 328
drwxr-xr-x. 2 rpjday rpjday   4096 Oct 20 05:54 all
drwxr-xr-x. 2 rpjday rpjday  40960 Oct 20 06:06 mpc8315e_rdb
drwxr-xr-x. 2 rpjday rpjday 286720 Oct 20 06:09 ppce300c3
$

should i have expected a nativesdk directory?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-1563063255-1476955560=:4275--
