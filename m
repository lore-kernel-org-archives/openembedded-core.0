Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 75BED78DC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 11:59:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6VBxh0X029120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 31 Jul 2018 12:59:44 +0100
Message-ID: <db5cccef2f1ef458bb19d54fc03c7ce50de6ebeb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>, Khem Raj
	<raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 12:59:43 +0100
In-Reply-To: <2d0aedb8-fdb0-ad21-bdcc-e82f352570c3@xilinx.com>
References: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>
	<72c0ba68-7fa5-2e3a-a554-e79bff93a00b@gmail.com>
	<2d0aedb8-fdb0-ad21-bdcc-e82f352570c3@xilinx.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] multiconfig: Enable multiconfig dependencies on oe-core
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
X-List-Received-Date: Tue, 31 Jul 2018 11:59:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-30 at 15:05 -0700, Alejandro Enedino Hernandez
Samaniego wrote:
> On 07/26/2018 08:36 PM, Khem Raj wrote:
> > 
> > On 7/25/18 9:05 AM, Alejandro Enedino Hernandez Samaniego wrote:
> > > This patch enables multiconfig dependencies (mcdepends) to be
> > > used on
> > > recipes using the following format:
> > > 
> > > task[mcdepends] = "multiconfig:FROM-MC:TO-MC:PN:task-to-depend-
> > > on"
> > > 
> > > For the sake of simplicity consider the following example:
> > > 
> > > Assuming we have set up multiconfig builds, one for qemux86 and
> > > one for
> > > qemuarm, named x86 and arm respectively.
> > > 
> > > Adding the following line to an image recipe (core-image-sato):
> > > do_image[mcdepends] = "multiconfig:x86:arm:core-image-
> > > minimal:do_rootfs"
> > > 
> > 
> > Do we really need to add multiconfig to keyword namespace ? can we
> > deduce this from "arch1:arch2:..."
> 
> Bitbake already uses this and I believed adopting it would make it 
> easier for the user to understand its usage.
>
> For example, since the multiconfig names are also provided during
> setup, if you assume that someone set up the build and a different
> user is going through the recipe, arch1:arch2 wouldn't mean a lot for
> that user because they may not map 1:1 to MACHINE names.

It is consistent with the rest of the system. I'm still torn on whether
we should shorten "multiconfig:" to "mc:" but we need to be consistent.

> > secondy, this need to be well documented, with examples for users
> 
> I agree we could add more documentation to it, where do you think it 
> should go?

I'm going to queue the patches for testing in -next, they look good to
me just reading the patches.

Could you start to work with Scott (cc'd) to get this new dependency
type listed in the bitbake manual and anywhere else it needs to be
documented?

Its great to see this finally working!

Cheers,

Richard


