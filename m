Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 6F30B7024B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 19:26:39 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20140716192638316
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 19:26:38 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=44872 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X7UqW-0000Fp-7w; Wed, 16 Jul 2014 15:26:32 -0400
Date: Wed, 16 Jul 2014 15:26:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANnfhoCkE_ttWfcGA4PMJQ3YH912XrTHP6AH=9QAf8z=0Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407161523410.4207@localhost>
References: <alpine.LFD.2.11.1407160719540.5398@localhost>
	<CABcZANnfhoCkE_ttWfcGA4PMJQ3YH912XrTHP6AH=9QAf8z=0Q@mail.gmail.com>
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
Subject: Re: two variations for distro-specific FILESEXTRAPATHS prepending
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
X-List-Received-Date: Wed, 16 Jul 2014 19:26:43 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-193618293-1405538792=:4207"

--8323328-193618293-1405538792=:4207
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jul 2014, Christopher Larson wrote:

>
> On Wed, Jul 16, 2014 at 4:26 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         just ran across this in the meta-yocto layer but it's a general OE
>       question -- the psplash_git.bbappend file contains the following
>       distro-conditional line:
>
>         FILESEXTRAPATHS_prepend_poky := "${THISDIR}/files:"
>
>       and the accompanying files/ directory has, unsurprisingly, a
>       poky-specific splash image file, "psplash-poky-img.h".
>
>         but based on how FILESEXTRAPATHS is processed by incorporating all
>       of the FILESOVERRIDES variations (one of which is the distro name),
>       would it not have been entirely equivalent to have used simply
>
>           FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>
>       and placed that splash file in the accompanying directory files/poky/?
>       would these two approaches do the same thing? is there a preferred
>       way? that's the only example of that i've seen in all the layers i've
>       played with.
>
>
> Both would do the same thing, I'm personally of the opinion that the
> latter would be more consistent with how such things are normally
> done.

  i was ready to bet internal organs that they had the same effect,
but i've perused the OE code base enough that i trip over oddities and
i just really want to make sure i know what i'm looking at.

rday

p.s. if someone wants to submit a poky patch that changes that, feel
free. otherwise, i'll just use it in class as a "check out what
someone did *here*!" example. :-)

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-193618293-1405538792=:4207--
