Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4995760191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 15:09:36 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id f84so22063718ioj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=A5aY9agtq32eaN7OL5LhJzNnXa2PZXDc9wQ1gaSxYyc=;
	b=rZr4PMrApR5cGCmj5RtxQ+BPrXbDExO8FZs12tpkslAsEQcSJef8LPEYx8TDHJaHoJ
	kdRr2MEz5Y1Ok0UwvfxjQP08Cy1x3VJOfbrrs//imMN8BZ3c7oMEvQOi+ggToBwW//3T
	Tz6Tiqk5jBC0ueMiuFXTVAybtN1EWyEtICa2NPpEWYdaK0o2+OHdukBKKqVDQELpxHqc
	sBB837E8ZX+vTtw5T23dVAe6zixIg1GVbLHNvT2GiUFeru4tWrKGixMh5uf64nOzdGXW
	yYA6KjW+q8C0KGK1pJ6Nis9HvKMxXz8UCckoG3O6FLis6pfAz42KwYIBkRx4UUg+Z5O0
	CnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=A5aY9agtq32eaN7OL5LhJzNnXa2PZXDc9wQ1gaSxYyc=;
	b=dkM74sYg3HW8iGTch/WYARjAfBh34kQnjc0aokoJWF5IIDAOW4uIYnXUoGdIzmSuw9
	sH5UY5JsFy9yaPD1pDk7FAS4SBfqy8CfYvOVqZWxaK8N7vl8XRmdURW6VoF/51Km0gJm
	l0DWqrrSlMCxaJPCK38ul3Q7DbcFpnQyl+fp6buCTpyh6OZuqvWfwBmj1sCLNgUQYgJo
	R41rGn5pkZKDtOV4woN5i4FNdyA6kXZBNhvwR35jIYdd6SdFPfKgdtOKQbontTk7qs4c
	FxlQyD2DClyG+IjpqsS3kPRLZ119txl+Mm1Yh/h1L0Bulbfsj4qT+prHYi830x9QQKL6
	rFHQ==
X-Gm-Message-State: AFeK/H3LYu1Ii439nAGu2yhhkZyyLOU9ojBrS9rGCH/bMWz7yalhHPehu8/TnEw4ApVy3un7
X-Received: by 10.107.55.137 with SMTP id e131mr5229582ioa.105.1489590578241; 
	Wed, 15 Mar 2017 08:09:38 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DCEB.dip0.t-ipconnect.de. [93.232.220.235])
	by smtp.gmail.com with ESMTPSA id
	y124sm272781itd.19.2017.03.15.08.09.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Mar 2017 08:09:36 -0700 (PDT)
Message-ID: <1489590574.6396.113.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Wed, 15 Mar 2017 16:09:34 +0100
In-Reply-To: <20170315144704.GA7153@linux.intel.com>
References: <20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
	<20170314171147.GA28498@linux.intel.com>
	<1489513785.6396.83.camel@intel.com>
	<20170314180644.GA22000@linux.intel.com>
	<1489562674.6396.89.camel@intel.com>
	<20170315125810.GA28986@linux.intel.com>
	<1489585158.6396.102.camel@intel.com>
	<1489585294.6396.104.camel@intel.com>
	<20170315140143.GA17397@linux.intel.com>
	<20170315144704.GA7153@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Wed, 15 Mar 2017 15:09:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-15 at 16:47 +0200, Ed Bartosh wrote:
> On Wed, Mar 15, 2017 at 04:01:43PM +0200, Ed Bartosh wrote:
> > On Wed, Mar 15, 2017 at 02:41:34PM +0100, Patrick Ohly wrote:
> > > On Wed, 2017-03-15 at 14:39 +0100, Patrick Ohly wrote:
> > > > On Wed, 2017-03-15 at 14:58 +0200, Ed Bartosh wrote:
> > > > > Regarding do_rm_work. It should not touch rootfs directories, I believe.
> > > > 
> > 
> > > It does, and it should by default because a rootfs can be quite large.
> > > If it's not going to be reused in another recipe, then it is worthwhile
> > > to remove it.
> > This is true unless we're going to use wic as a stand-alone tool, which some
> > people still do.
> > 
> > > I should add that RM_WORK_EXCLUDE_ITEMS += "rootfs" can be used in image
> > > recipes which know that their rootfs is going to be needed elsewhere -
> > > it's just not the default.
> > 
> > Isn't rootfs going to be rebuilt if one rootfs recipe depends on another one?
> 
> Here is an example of dependency I'm talking about:
> wic-image-minimal can be built just fine with enabled rm_work.
> Its .wks uses 2 rootfs: core-image-minimal and wic-image-minimal.
> 
> I didn't use any RM_WORK_EXCLUDE_ITEMS. I did specified dependency to
> core-image-minimal in wic-image-minimal recipe:
> 
> # core-image-minimal is referenced in .wks, so we need its rootfs
> # to be ready before our rootfs
> do_rootfs[depends] += "core-image-minimal:do_image core-image-minimal:do_rootfs_wicenv"
> 
> Am I missing something here?

I'm pretty sure you have a race condition, you just haven't triggered
the failure case.

Perhaps you were also lucky because my "rm_work.bbclass: re-enable
recursive do_rm_work_all" is pending and thus
core-image-minimal:do_rm_work never ran at all.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




