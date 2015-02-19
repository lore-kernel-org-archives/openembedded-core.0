Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9357873608
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 17:27:11 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hl2so45718634igb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 09:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DqHOm5cc3PPRTnAdO87P7+cwrS9jnxs4evyy1N4s5Wc=;
	b=MrKJSab86t8jHKDjTFjk9ERdiZx242aWEs6+Iylfo9hmT4nXOsLbLZORfagyDb85Ay
	9ceSVjg2/UmIXJ3NVID/4Ns4UTAl+JAnUEVGpvclG3wEt7lTXYeGZm1Kqk+WIdvch2ki
	H5KVjJicL9+7ewWHWK9kw7NWlywbNu5U4n1Baf7fPn6oa0lRBGM8AvTN/mgpnco/P1lf
	K8k779biRO/dSPByeOBfaow0UfSGE1lTRKuPDNeeJM4GfTPSpPI5eo+7556jbsR1qrlI
	mH/B7YwPbC5mvado50nMKKbkuy/idSrNbdwKDi3fX7NG/wozIF0ETiUwsns/Qc+XVCBZ
	6Mpw==
MIME-Version: 1.0
X-Received: by 10.50.50.142 with SMTP id c14mr6069549igo.42.1424366833286;
	Thu, 19 Feb 2015 09:27:13 -0800 (PST)
Received: by 10.36.78.16 with HTTP; Thu, 19 Feb 2015 09:27:13 -0800 (PST)
In-Reply-To: <3100587.NflBacsYxf@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
	<CADkTA4NYnGhGUmi9ZSZZU3PYf7wA2Zj-u7HM8GhQbO5sU9AoTg@mail.gmail.com>
	<3100587.NflBacsYxf@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 19 Feb 2015 12:27:13 -0500
Message-ID: <CADkTA4O3THtCOYid9hRu4+rPnCTt-_VxQtePELR6C913kw3Prg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] devtool and externalsrc improvements
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
X-List-Received-Date: Thu, 19 Feb 2015 17:27:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 19, 2015 at 11:55 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 19 February 2015 11:47:01 Bruce Ashfield wrote:
>> On Thu, Feb 19, 2015 at 11:39 AM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > I've been attempting to enable usage of devtool with the kernel (which
>> > effectively means using the externalsrc class with the kernel). This
>> > doesn't really work yet due to lack of handling the kernel configuration,
>>
>> I've always insisted/argued and designed in that externalsrc shouldn't touch
>> the kernel configuration at all.
>>
>> You are building a tree that is completely managed outside of the build
>> system, and getting the kernel configuration in place is part of that
>> management.
>>
>> So I'm not convinced it is a problem that needs to be solved.
>
> So, externalsrc still doesn't touch the configuration, and it is not my plan to
> make it do so. However, users do need some way of setting up that configuration
> when checking out those sources for the first time, and if that's to be of any

Right. Something to think on.

> use to someone who just wants to make some minor changes, it should be the
> exact same configuration you get when you build the recipe as normal. That is
> what I believe "devtool modify" (at least with -x) should be doing, given that
> it is one means you can use to set up a development environment if you do not
> have one already.
>
> We can certainly talk about the mechanism and work out the best way to do it,
> such that it fits in with how linux-yocto works and meets user expectations. My
> intent with this series was to get us to the point where we can at least
> experiment and have that discussion.

Agreed.

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

