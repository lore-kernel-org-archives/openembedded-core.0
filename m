Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 907697318E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:19:32 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160818091928721_0484;
	Thu, 18 Aug 2016 09:19:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=26003 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1baJVp-0003I7-Ch; Thu, 18 Aug 2016 05:21:22 -0400
Date: Thu, 18 Aug 2016 05:19:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: =?ISO-8859-15?Q?J=E9r=E9my_Rosen?= <jeremy.rosen@smile.fr>
In-Reply-To: <a1c7979f-5b89-44fd-f7c9-137cbb887654@smile.fr>
Message-ID: <alpine.LFD.2.20.1608180508280.15887@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608170956050.12816@ca624034.mitel.com>
	<a1c7979f-5b89-44fd-f7c9-137cbb887654@smile.fr>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 18 Aug 2016 09:19:33 -0000
Content-Type: multipart/mixed;
	BOUNDARY="2071690107-374431512-1471511959=:15887"

--2071690107-374431512-1471511959=:15887
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 17 Aug 2016, Jérémy Rosen wrote:

> On 17/08/2016 16:01, Robert P. J. Day wrote:
> >    as in, what's with the "+" in that "+ 3000000" value? i've
> > never seen that before, and i took a quick look under classes/ to
> > try to figure out what's happening, but i'm still confused.

> you're reading too much into this

  yeah, i get that a lot. :-)

> "+ 3000000" will append the string "+ 3000000" to the string
> contained in the IMAGE_ROOTFS_EXTRA_SPACE variable
>
> I am not sure who consumes that variable, but I assume it's
> something that's able to do math and will properly compute the final
> value.
>
> you can always run "bitbake -e core-image-kernel-dev" in a pager an
> look at the final value to see what's happening...

  i assumed as much after another quick look at that; obviously, the
variable IMAGE_ROOTFS_EXTRA_SPACE will have a default value, to which
one can add a subsequent fudge factor based on ... whatever. anyway,
could still use a cleanup tweak to be consistent with the other usages
of it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--2071690107-374431512-1471511959=:15887--
