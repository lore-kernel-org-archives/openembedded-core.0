Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A153171A66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:44:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 23 Nov 2016 05:44:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,538,1473145200"; 
   d="scan'208";a="8429992"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 23 Nov 2016 05:44:11 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 86F266A4006;
	Wed, 23 Nov 2016 05:43:29 -0800 (PST)
Date: Wed, 23 Nov 2016 15:44:04 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161123134404.GC13863@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
MIME-Version: 1.0
In-Reply-To: <5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Eduard Bartosh <eduard.bartosh@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Wed, 23 Nov 2016 13:44:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 23, 2016 at 02:08:28PM +0100, Kristian Amlie wrote:
> On 23/11/16 13:08, Ed Bartosh wrote:
> > On Tue, Nov 22, 2016 at 12:54:52PM +0100, Kristian Amlie wrote:
> >> On 22/11/16 12:10, Patrick Ohly wrote:
> >>>> ...
> >>>
> >>> All of these introduce some special mechanism. Let me propose something
> >>> that might integrate better with the existing tooling:
> >>>
> >>> The "rootfs" directory gets redefined as representing the entire virtual
> >>> file system. When creating a disk image, it gets split up into different
> >>> partitions based on the image configuration.
> >>>
> >>> For example, the /home or /data directories in the rootfs could hold the
> >>> content that in some image configurations goes into separate partitions.
> >>>
> >>> The advantage of this approach is that the tooling for staging content
> >>> for image creation does not need to be changed. The same staged content
> >>> then can be used to create different images, potentially even using
> >>> different partition layouts.
> >>
> >> That's a very good idea. I think it beats all of my suggestions!
> >>
> >>> To implement this approach with wic, wic needs to be taught how to
> >>> exclude directories from the main rootfs. Ideally, the mkfs.* tools
> >>> should also support that without having to make an intermediate copy of
> >>> the files for a certain partition, but initially wic could create
> >>> temporary directory trees.
> >>
> >> Yes, some work would be needed here, but ultimately it would be contained within wic and related tools, which is a good thing.
> >>
> > 
> > I support the idea. Let's discuss the details of implementation and
> > create a bug in bugzilla to track the development 
> 
> Do you want me to create the ticket? (it'll be my first, so apologies in
> advance if I omit something important)
> 
Yes, please create an issue in bugzilla and assign it to me. Don't
worry. If you miss something other people will point to in in the
comments :)

--
Regards,
Ed

