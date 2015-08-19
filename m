Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 275FA608B7;
	Wed, 19 Aug 2015 03:36:45 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so147135230pab.0;
	Tue, 18 Aug 2015 20:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ddid8z/j3vme2pGAtlbgpUqtDtq90nFmGsAVYBDvvGY=;
	b=VuiXCc9OSZLYAdYP9AS9SwrIVCqTLldW31JQR7v6JhVm3Q8MCvBZh0u44KlBwPECtb
	4pdIMpZt5kTZY1X9hwNZQ5KHUnr4c68n8F5gU87VFAGd+2W/UHJgGlylzIDHQag/BMdx
	I/7Gc3Kl0hP5jKVwAKG+C3P4GurGQVdEJX67i41MsxKMu0OLXihNsdUhkfYxhSrBEaRh
	jlHEGFX9gkSH1B2d4IC333MHJPotT/phCI+KGpwSH3enupT/6bDgL8S+pC4JqAsCTtjX
	Nh7qqt7WjZn0FkbeofK6mKY/56d+Aby3sIgYpQ2SJlwU4dvtHp+c/gf4tHYWhjlbiZjp
	3cng==
MIME-Version: 1.0
X-Received: by 10.66.193.73 with SMTP id hm9mr20614603pac.105.1439955405031;
	Tue, 18 Aug 2015 20:36:45 -0700 (PDT)
Received: by 10.66.48.97 with HTTP; Tue, 18 Aug 2015 20:36:44 -0700 (PDT)
In-Reply-To: <CAJTo0Lbpqowa0Vmq7HziVBUR_pwyPcLSxtfzaphg1RS3fwZrfQ@mail.gmail.com>
References: <20150810194122.4ED1750388@opal.openembedded.org>
	<20150818190406.GB10246@jama>
	<CAJTo0Lbpqowa0Vmq7HziVBUR_pwyPcLSxtfzaphg1RS3fwZrfQ@mail.gmail.com>
Date: Wed, 19 Aug 2015 13:36:44 +1000
Message-ID: <CANwerB1VTh_Q9PmhS9cUvrqR=V=TDeYRYxyO7u4rwXTJdfBGGA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Nicolas Dechesne : mesa: upgrade 10.5.8 -> 10.6.3
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
X-List-Received-Date: Wed, 19 Aug 2015 03:36:48 -0000
Content-Type: text/plain; charset=UTF-8

On 19 August 2015 at 05:23, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 18 August 2015 at 20:04, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> I haven't tried to find out what's the replacement for this yet, but
>> it's the reason why mesa is now failing in my bitbake world builds
>> (fbdev is added in ./meta-luneui/recipes-graphics/mesa/mesa_%.bbappend)
>
>
> I think what you were building wouldn't actually have done anything useful
> anyway, that configuration was removed by this commit:
>
> commit 0d6e7620f35331be301ec3177c0d9236838a845b
> Author: Emil Velikov <emil.l.velikov@gmail.com>
> Date:   Sat Mar 14 22:36:28 2015 +0000
>
>     egl/main: drop platform fbdev specific code
>
>     st/egl was the only one which had support for this platform.
>
> Ross

The last version of Mesa where software rendering using EGL to fbdev
works is 10.3.7 after reverting
91ff0d4c6510dc38f279c586ced17fba917873e7.

Regards,
Jonathan

