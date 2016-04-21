Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 5448C6E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:25:12 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160421122509659_0484;
	Thu, 21 Apr 2016 12:25:09 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=13553 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1atDgp-0001fc-C4; Thu, 21 Apr 2016 08:26:35 -0400
Date: Thu, 21 Apr 2016 08:24:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LakXXOvj9_aKmYxy4OdxgP6rOp5EqLZtAajp8iFf7qkuA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1604210822220.6578@localhost.localdomain>
References: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
	<CAJTo0LakXXOvj9_aKmYxy4OdxgP6rOp5EqLZtAajp8iFf7qkuA@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: trying to reconcile OE builds with rpm4-format rpm files built on centos 6
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
X-List-Received-Date: Thu, 21 Apr 2016 12:25:13 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1226535564-1461241502=:6578"

--8323328-1226535564-1461241502=:6578
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 21 Apr 2016, Burton, Ross wrote:

>
> On 21 April 2016 at 13:06, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         next bit of muttering is, "can we downgrade the OE build to use
>       rpm4-format packages?", which is not a path down which i want to walk.
>
>
> Assuming that the obviously correct option of "build the packages
> inside OE" really is being written off for mysterious reasons, rpm4
> was only just removed from oe-core (though depending on what
> releases you're using you may have never noticed it be added and
> removed again).  So you could just recover that from history
> (oe-core a6e7a86f1635be9a688c56c25e9d215ea4d2cc84 removed it) and
> fix it up.

  under the circumstances, that sounds like the simplest approach.
would we be losing any significant functionality downgrading to rpm4?
it's not my first choice, but if all that's required is to do basic
installs and upgrades, i suspect it will work just fine.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1226535564-1461241502=:6578--
