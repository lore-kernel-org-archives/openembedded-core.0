Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 14B61606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 16:03:42 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1CG3gmq002098; Thu, 12 Feb 2015 10:03:42 -0600
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015021210034254-1089400 ;
	Thu, 12 Feb 2015 10:03:42 -0600 
Date: Thu, 12 Feb 2015 10:03:37 -0600
From: Ben Shelton <ben.shelton@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150212160337.GA7233@bshelton-desktop>
References: <1423500745-2142-1-git-send-email-ben.shelton@ni.com>
	<1423500745-2142-2-git-send-email-ben.shelton@ni.com>
	<CAJTo0LbvkV1kVy3f_Qy95FCCAuZcJkqwRR_3v2FdoYrha6B51Q@mail.gmail.com>
	<CAJTo0LbLPSVjKi-m085=HnkVTTkKaUozVTpJBc2qzOJ-wqSL0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbLPSVjKi-m085=HnkVTTkKaUozVTpJBc2qzOJ-wqSL0Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/12/2015 10:03:42 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/12/2015 10:03:42 AM,
	Serialize complete at 02/12/2015 10:03:42 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-12_05:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernelshark: Update to version 2.5.2
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
X-List-Received-Date: Thu, 12 Feb 2015 16:03:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/12, Burton, Ross wrote:
> On 12 February 2015 at 07:46, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > This is failing on the autobuilder:
> >
> > http://errors.yoctoproject.org/Errors/Details/8571/
> > http://errors.yoctoproject.org/Errors/Details/8572/
> >
> > Two problems - an exception during build that is probably being ignored,
> > and then swing not found.  Is swig a non-deterministic dependency?
> >
> 
> I had a quick look at this and it appears that despite having Python
> build-depends (via trace-cmd.h) kernelshark for me locally doesn't build
> with Python enabled.  Somehow the autobuilder managed to have an
> environment that almost but not quite worked and so it tried to build...
> and failed miserably as oe-core doesn't have a swig binary.
> 
> I guess this just needs NO_PYTON exported to stop the Python auto-detection
> from happening.
> 

Hi Ross,

This is already done in the EXTRA_OEMAKE in the trace-cmd recipe, but
not for the kernel-shark recipe -- I guess I didn't hit the error in my
local build.

Should I submit a patch to fix it?

Thanks,
Ben

> Ross

