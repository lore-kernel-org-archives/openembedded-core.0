Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ED62660DDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 15:18:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2014 07:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,555,1389772800"; d="scan'208";a="489288538"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2014 07:18:23 -0800
Date: Thu, 27 Feb 2014 17:18:23 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Message-ID: <20140227151815.GC3534@lpalcu-linux>
References: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>
	<20140227142404.GB3534@lpalcu-linux> <530F4D46.1060401@enea.com>
MIME-Version: 1.0
In-Reply-To: <530F4D46.1060401@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Thu, 27 Feb 2014 15:18:25 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 27, 2014 at 03:35:50PM +0100, David Nyström wrote:
> On 2014-02-27 15:24, Laurentiu Palcu wrote:
> >Hi David,
> >
> >My comments/questions below.
> 
> Thank you for your detailed comments on the RFC.
> I will return with V2, where your comments are addressed when the
> general approach is Acked.
> 
> What do you think about the general approach ?
I think the approach is ok. I don't know a simpler way than this to add
package feeds into the image.

> I guess it was you who added the insert_feeds_uris stubs in rootfs.py ?
Yes, I added the stubs in preparation for this. But I didn't know
when/if this will be done. Thanks for taking care of this.

laurentiu


