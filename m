Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7EE70E45;
	Sat, 30 Aug 2014 00:01:35 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id x19so3649207ier.35
	for <multiple recipients>; Fri, 29 Aug 2014 17:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wf/JPXUYmXTxfjNg6Muu2mQ7XuUIVT5sJdllMWRzogU=;
	b=V+t07lrpQS65P6RO/oNVlPQd65mTbBdVOZOQ9NQASMw0UG8XE0CBZz2mUCKF2DHdcw
	wBMZHo2et5NDQFVEbvYKogxUECOgA766Hs4mReh8/+05B929g1lZggvj/Qt8MXU58KFD
	4WquRKTZce7EGqRoWAhjMshl5frmpJ9PC/ATfuGW0rp5VPLtKXetItdaA/U1QoqfeL9S
	JnY9XBnz/tq0F7cwE283knu015i60DXrpLF3EH5/CcVpnJ5jnnrsareDKdSGlTecDyaQ
	uaepIp9n1BSy9NKbsdKopavMGEiThuYMTLEChFmZIKsH+7MFAIQG/nOpA9yiHQxzB+4k
	5/ig==
X-Received: by 10.50.21.3 with SMTP id r3mr7904616ige.13.1409356896574; Fri,
	29 Aug 2014 17:01:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Fri, 29 Aug 2014 17:01:06 -0700 (PDT)
In-Reply-To: <1409308755.29296.148.camel@ted>
References: <20140828064051.GA13139@haswell> <1409266291.29296.147.camel@ted>
	<CAMKF1spz2KoO6NDSkZwh=V=pkyYi6e7-G0fpka5P2ifbjnNn6w@mail.gmail.com>
	<CAMKF1spj67i2i_50m=oTUpS3x2J=de0UxGf70zLhn-a7c4M3QA@mail.gmail.com>
	<1409308755.29296.148.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Aug 2014 17:01:06 -0700
Message-ID: <CAMKF1sq4NwaFhZCXysdJ53G=3UY2CnHgKZmgpG7H-X=vhG0W9w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Moving on from eglibc to glibc 2.20
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
X-List-Received-Date: Sat, 30 Aug 2014 00:01:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 29, 2014 at 3:39 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-08-28 at 18:46 -0700, Khem Raj wrote:
>> On Thu, Aug 28, 2014 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > reproduced. will apprise as I have some fix.
>>
>> OK pushed another patch to the contrib tree that should take care of both
>> xf86-input-synaptics xf86-input-vmmouse
>
> Thanks. I'm having one heck of a problem unentangling all the different
> build failures (from these and other patches) but this one looks like
> glibc:
>
> https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/18/steps/BuildImages/logs/stdio
>

Trying to reproduce it locally. Once I have, I will update.

> Cheers,
>
> Richard
>
>
>

