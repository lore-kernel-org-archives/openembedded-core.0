Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44F5A72C60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 17:36:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jan 2015 09:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="445943316"
Received: from krogon-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.16.44])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jan 2015 09:22:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 27 Jan 2015 17:36:26 +0000
Message-ID: <1515874.lKmuXDyq7s@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CACS+7ZSWL2FTcVWwT0Yf4ydRogyxqOGmn+cMBUBgYPiuKRoJPg@mail.gmail.com>
References: <1422372551.19798.53.camel@linuxfoundation.org>
	<CACS+7ZSWL2FTcVWwT0Yf4ydRogyxqOGmn+cMBUBgYPiuKRoJPg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image: Add missing depends on virtual/kernel for depmod data
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
X-List-Received-Date: Tue, 27 Jan 2015 17:36:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 27 January 2015 11:20:53 Dan McGregor wrote:
> On 27 January 2015 at 09:29, Richard Purdie
> 
> <richard.purdie@linuxfoundation.org> wrote:
> > We need the depmod data so that the kernel depmod command works
> > successfully at rootfs time. The fact this was working inconsistently is
> > now highlighted after the command was made to error out. A simple test
> > case is:
> > 
> > bitbake virtual/kernel image
> > bitbake vrituak/kernel -c clean
> > bitbake image -c rootfs -f
> > 
> > We fix it by adding the missing dependency.
> 
> On a similar note, I have a patch that makes kernel depmod optional
> when generating images. I used it to create an image that can be used
> as a container without also including kernel depmod info. I shall post
> it.

Thanks - that's part of a task that's been on my list for a while:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6478

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

