Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id E097265D03
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:18:26 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20140724091825604
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:18:25 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [64.134.185.139] (port=51367 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XAFAJ-0006uy-UQ; Thu, 24 Jul 2014 05:18:20 -0400
Date: Thu, 24 Jul 2014 05:18:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZOnTtA_mrFMMTR-TtXwUeQYSECQ2utjwzkNZdMWXCrtA@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407240517330.1252@localhost>
References: <alpine.LFD.2.11.1407240509150.1086@localhost>
	<CAJTo0LZOnTtA_mrFMMTR-TtXwUeQYSECQ2utjwzkNZdMWXCrtA@mail.gmail.com>
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
Subject: Re: [PATCH] Mention package_tar packaging in local.conf.sample
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
X-List-Received-Date: Thu, 24 Jul 2014 09:18:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 24 Jul 2014, Burton, Ross wrote:

> On 24 July 2014 10:10, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > +#  - 'package_tar' for tarball packages
> > +# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk package_tar"
>
> package_tar is pretty limited (no dependencies, so images don't work)
> - is there a good reason to keep it around?  If we're going to delete
> it, now is the time to do it...

  i'm fine with that, just trying to be consistent. i'm always a big
fan of throwing stuff away.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


