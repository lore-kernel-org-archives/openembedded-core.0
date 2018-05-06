Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id D0C59749F8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 May 2018 00:42:45 +0000 (UTC)
Received: from [10.137.0.15] (107-179-160-78.cpe.teksavvy.com [107.179.160.78])
	by mail.thecshore.com (Postfix) with ESMTPSA id 2428426A0;
	Sat,  5 May 2018 20:42:45 -0400 (EDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 2428426A0
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 2428426A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1525567365;
	bh=nmmiEL7WelVQ1nceY5cLk1UypNVuMRb6FjMW1/QK3Yw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=j+to2kBsVmufbDuqFn2XnAb8mQjG6iFJvNT4mrjg1WDpjWQGyNIDwZb+tpMK4UFsm
	U2OZzg4yLjZtWO4woYE/6i/mlwxNJzcuLW0gPEwhuaPaPGZEww03pSqlUVrz3+YWXr
	+88BTryaE1RKbj7TMwP2FXHTwzLifu/zn4loM8Hg=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.4 at mail.thecshore.com
To: Scott Rifenbark <srifenbark@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1524154643.18865.113.camel@linuxfoundation.org>
	<39f087be-1129-6131-d5d1-5714f127667b@thecshore.com>
	<1525186011.25196.117.camel@linuxfoundation.org>
	<CAFNP8Ov2waP_aG81Y9_AJRNbm4FicjhkC7Yy-M5OU=SXLmJarg@mail.gmail.com>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <07602ab6-0958-c098-79b1-d499121ebfde@thecshore.com>
Date: Sat, 5 May 2018 20:42:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFNP8Ov2waP_aG81Y9_AJRNbm4FicjhkC7Yy-M5OU=SXLmJarg@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: 2.6 planning proposals and meeting
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
X-List-Received-Date: Sun, 06 May 2018 00:42:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 2018-05-01 10:55 AM, Scott Rifenbark wrote:
> 
> 
> On Tue, May 1, 2018 at 7:46 AM, Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
> 
>     Hi,
> 
>     On Fri, 2018-04-20 at 08:02 -0400, Daniel F. Dickinson wrote:
>      > I'm relatively new to OE; I've written a couple of pre-alpha layers
>      > to try some idea, and worked on meta-openembedded, but I've not had a
>      > chance to go in depth on the Yocto documentation, and at the some
>      > there see to be things (based on the lists) that are out of date, or
>      > new things that aren't even mentioned, which makes getting up speed
>      > somewhat difficult.
> 
>     Writing down where you think there are issues would be a help so that
>     we can see if there is some way we can improve that.
> 
> 
> Yes - please indicate any areas in the documentation you believe need 
> updated, changed, or added.  I have been trying to bring things 

Will do (I've afraid I didn't write things down earlier, but will now). 
I also realized I somehow completely missed the path from qs to overview 
and ended up working on things like a (trivial) bsp, a runit-based 
distro (decided it wasn't worth it due to lack of proper dependencies), 
and a different way of doing read-only rootfs (i.e. even on ro media the 
ro rootfs is root and a the initramfs-framework is 'borrowed' to do 
pre-init stuff without sacrificing space for an actual initramfs 
(basically a 'volatiles' like approach gets used for persistent data 
too; only pre-planned persistent data exists in that approach; I'm 
thinking of seeing if I can extend volatiles in systemd so that the 
pre-init part no longer is necessary).

Anyway, the 2.5 manuals have been pretty good so far, the only thing I'd 
missed on this read through is actually in Overview §4.3.1 where I'm not 
clear on the difference in scripts used / path taken when using Poky vs. 
using OE-Core + BitBake + layer's of one's choice.  I'm interested in 
that because I've

a) seen a bit on the ML about Poky being problematic
b) gotten along fine without while working Khem Raj's meta-openwrt repo; 
it's distro-less, which I find interesting; it can generate images but 
is still a buffet of recipes (as much as possible with openwrt 
sub-projects anyway).
c) am interested in doing a Yocto/OE based distro for routing and 
network appliance projects that are intended for more constrained 
hardware, and figure the starting point should be distro-less rather 
than hacking on Poky.

[aside]
I'm actually thinking that the main things I'm interested in from 
Openwrt are the light networking, firewall, and init; but would rather 
see if there is a way to have systemd-minimal that handles those without 
being excessively large (also to evaluate just how much of a real 
difference there is between the the full 
init+networking+dynamic-firewall in terms of size (and/or what the size 
gets you).
[aside]

Regards,

Daniel

> up-to-date in several manuals during the 2.5 process.  So, identifying 
> areas in the 2.5 manual set would be very helpful.  To be sure you are 
> viewing 2.5 manuals use the following form for the URL:
> 
> yoctoproject.org/docs/2.5/ 
> <http://yoctoproject.org/docs/2.5/><manual_folder>/<manual_folder>.html
> 
>        where <manual_folder> is
> 
>             brief-yoctoprojectqs
>             bsp-guide
>             overview-manual
>             dev-manual
>             sdk-manual
>             profile-manual
>             kernel-dev
>             ref-manual
>             toaster-manual
>             bitbake-user-guide
> 
> Thanks
> Scott
> 
> 
> 
> 
>      > In any even one thing that I'm wondering if is of interest, is
>      > modifying the build process to build an eSDK which is used to build
>      > everything else.  The advantage of this, in my view, is that it makes
>      > it easier to do things like use GitHub+Travis integration on
>      > individual recipes.
> 
>     I know people who've tried travis with OE and the challenge is the
>     length of the builds and the data usage. I'm not sure that problem
>     changes regardless of whether the eSDK or native sstate is used as the
>     size would be comparable.
> 
>      > The biggest challenge for this type of per-recipe build is dealing
>      > with dependencies, but I think it would be helpful to get rid of 3-
>      > day+ world builds.
>      >
>      > At the very least having a 'standard' binary eSDK for external layers
>      > to use for this purpose would helpful in my view.
> 
>     How would that differ from a specific version of OE-Core used for
>     testing for which a known good set of sstate were available?
> 
>      > I'm interested in working on this, but I don't think I've got a good
>      > enough handle on OE for making this a 2.6 goal from me.
>      >
>      > Thoughts?
> 
>     I like the idea of thinking more in this area and would certainly
>     welcome help. I think the issue is more one of tools to generate a
>     locked sstate which layers then reuse rather than anything eSDK
>     specific. Its therefore partly a process problem of generating that
>     specific config and sstate which others would reuse. You could do this
>     from things that already exist, e.g. from the OE-Core milestone
>     releases but its not something people have really adopted for testing
>     of other layers.
> 
>     Certainly worth exploring but the devil is in the details.
> 
>     Also worth mentioning that build-appliance exists which is an image
>     capable of "self hosting" builds. There are often specific patches
>     applied to native tools and version requirements which mean that the
>     -native recipes are often essential to the build though.
> 
>     Cheers,
> 
>     Richard
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 


