Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 3D88073182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:50:47 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160421125046435_0486;
	Thu, 21 Apr 2016 12:50:46 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=15563 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1atE5c-0004SQ-LB; Thu, 21 Apr 2016 08:52:12 -0400
Date: Thu, 21 Apr 2016 08:50:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LakXXOvj9_aKmYxy4OdxgP6rOp5EqLZtAajp8iFf7qkuA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1604210848320.4088@localhost.localdomain>
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
X-List-Received-Date: Thu, 21 Apr 2016 12:50:48 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1522812898-1461243039=:4088"

--8323328-1522812898-1461243039=:4088
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

  just to be clear, if i can dredge up the recipe for rpm_4, i'm
assuming i'd want to specify that i want the "package-management"
image feature, as well as stating:

PREFERRED_VERSION_rpm = "4.%"
PREFERRED_VERSION_rpm-native = "4.%"

correct?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1522812898-1461243039=:4088--
