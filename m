Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 200256FFEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:15:57 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160818131553558_0486;
	Thu, 18 Aug 2016 13:15:53 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=30846 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1baNCb-0008Lr-Qw; Thu, 18 Aug 2016 09:17:45 -0400
Date: Thu, 18 Aug 2016 09:15:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbY7x-e_iGa3qNOAKMwB+wudoDkORQgB3t-6WB4pVhNHg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1608180914320.18547@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608170956050.12816@ca624034.mitel.com>
	<CAJTo0LbY7x-e_iGa3qNOAKMwB+wudoDkORQgB3t-6WB4pVhNHg@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"?
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
X-List-Received-Date: Thu, 18 Aug 2016 13:15:59 -0000
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Aug 2016, Burton, Ross wrote:

>
> On 17 August 2016 at 15:01, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       recipes-extended/images/core-image-kernel-dev.bb:IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"
>
>
> I'm guessing that's a mistake, it doesn't need a +.

  i think you misunderstood, i was curious about the "+" *inside" the
string, but it's pretty clear that it's just adding to the current
value of that variable somewhere.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


