Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T7Tr2-0004bG-FK for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:13:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7VG1bAQ022438;
	Fri, 31 Aug 2012 17:01:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13955-10; Fri, 31 Aug 2012 17:01:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7VG1Pgt022426
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 31 Aug 2012 17:01:28 +0100
Message-ID: <1346428885.16485.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Fri, 31 Aug 2012 09:01:25 -0700
In-Reply-To: <1346423384.2673.102.camel@phil-desktop>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 16:13:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-31 at 15:29 +0100, Phil Blundell wrote:
> On Wed, 2012-08-29 at 23:22 +0100, Phil Blundell wrote:
> > As far as I know, only Intel have ever expressed any real interest in
> > having this feature work.  My recollection is that there are some
> > supposed "carrier grade" systems where this is, for whatever reason, a
> > requirement. 
> 
> None of the carrier-grade people (or indeed any others) seem to have
> spoken up in favour of a separate /usr in the past 3 days or so, which
> does rather suggest that nobody actually cares about it.  
> 
> Maybe the TSC would like to reconsider whether this is in fact a
> worthwhile thing to go on trying to support in oe-core or whether it
> should just assume that / and ${prefix} will be the same filesystem.

I think the people in question are at a conference at the moment and
dealing with a few issues so they fact they haven't spoken up doesn't
surprise me.

I'm fine with merging the symlink change. As others have mentioned, if
it is an issue, a script to turn the links into copies can be written
relatively easily.

I don't think dropping support for / and ${prefix} makes sense as long
as it doesn't excessively hurt us. It is up to users to step up and help
maintain the use cases they care about and so far, they have done this.
So I think the position the TSC took is the correct one. Certainly we
can revisit it but its not going to stop this patch going in for
example.

Cheers,

Richard



