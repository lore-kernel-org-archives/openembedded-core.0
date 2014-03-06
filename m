Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6FEA26E7D7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 14:13:22 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gf5so1766850lab.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 06:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wjW+EU/22V6fCbnyZWKJTHpksXx/9htS8i92+WxMTmI=;
	b=XJA9lld2SpjMMHLbF4JLoHHp9oCrhc6zdf/b0EQQX+1SWXS5lDnR11dTQn0/eTQK75
	V5l9WZi2afiirZ4sodgnMpFYWqe3FKLQEQ3PNemkjNxpfrDMP4jFA97sgWLy5uDUOqY3
	BcMR9IuZ1Yg1iDGqVcsyoc1XcAvrfrM5Nyr5lR7piAWflgRGEF4Qu0wBRFNNh9eNve2/
	WjCvVHueupx4IfCLcnZULCdie0yRg0Okd+RHMiOTQi1qZUkdchvMBbF8eXjpPFb/miVG
	lC4K3pzPz0Ir2Zz5OZ6eQSLcylvCyWXhuc2lSX3zhvhPe1LhXvCyBZmSsoxhKeHJFRCl
	Z8Xg==
MIME-Version: 1.0
X-Received: by 10.152.7.97 with SMTP id i1mr1974061laa.36.1394115202467; Thu,
	06 Mar 2014 06:13:22 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Thu, 6 Mar 2014 06:13:22 -0800 (PST)
In-Reply-To: <20140306110208.GG17362@console-pimps.org>
References: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
	<CADkTA4M=JH7cv+kxY58sCA7vgT5O+h-u-SgAgvzqXS=qb6heqA@mail.gmail.com>
	<20140306110208.GG17362@console-pimps.org>
Date: Thu, 6 Mar 2014 09:13:22 -0500
Message-ID: <CADkTA4PmVhqsC83Aa8cTo0oe7LApVGcgffPPqFPxkErBgsifbQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Matt Fleming <matt@console-pimps.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: Inspect remote branches with git ls-remote
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
X-List-Received-Date: Thu, 06 Mar 2014 14:13:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 6, 2014 at 6:02 AM, Matt Fleming <matt@console-pimps.org> wrote:
> On Wed, 05 Mar, at 12:02:27PM, Bruce Ashfield wrote:
>> Please cc' me directly on any kernel-yocto changes, I only noticed this
>> by chance.
>
> Noted.
>
>> On Wed, Mar 5, 2014 at 11:49 AM, Matt Fleming <matt@console-pimps.org> wrote:
>> >
>> > Furthermore, the output of 'git branch' is subject to change and trying
>> > to parse it could potentially lead to breakage in the future.
>>
>> I've never had a problem with it in 7 years of the tools and their variants, so
>> the point is arguable and could be dropped from the commit log.
>
> I'm referring to this,

Yah, I've seen similar warnings as well, I'm a fan of symbolic-ref after getting
burned poking directly into the .git directory structure in the past :) The more
usable primitives are much better than they used to be. But I'm in a pragmatic
mood lately and will keep an eye out for a real world break .. and then everyone
can tell me that they told me so.

Cheers,

Bruce

>
>   http://git-blame.blogspot.co.uk/2013/06/checking-current-branch-programatically.html
>
>> Good catch on the issue, like I said, I've never run into it .. but I
>> can definitely see the need for the tweak.
>
> OK, I'll send an updated version. Thanks for the review.
>
> --
> Matt Fleming, Intel Open Source Technology Center



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

