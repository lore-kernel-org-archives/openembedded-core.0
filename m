Return-Path: <net147@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 32320771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:02:00 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id z62so16856777ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f3UI2GR/TypPluhLffPTa2QbIK9IRFjMCe4+t36TAjQ=;
	b=puGCom9QnGPG2z2/gaA2kAPsst11Rt/TQk/uqQAIQrGqZytvsYvL2ILjPTrU+n644h
	tIT29I9dZMrAjle4WWixcWCx0wuv71J+xUnmyG/JSil4xQFFA5mxl7aAG6C2TGOo7vdL
	sANPdXPy/cXPd2ldNOj8nq82HCDpEKyfhparKseUEvO20QY1KIdQpiZ2ehh4IxO788L1
	jj5C93wYyrH91xuEfHI4t7uKTGLpMwfznObowEeYSPu30LNsQeu0T+PYEVOscyW8LQHl
	XoUjHKJIfvktc5FSfEwbtpPYe5ECnuGbP08cp2R4HV7cp0kByhwB2SSBt6yv86QjaWCu
	0U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f3UI2GR/TypPluhLffPTa2QbIK9IRFjMCe4+t36TAjQ=;
	b=rOS/BqXHbW70lj4Z08MM1KdUwfN0ua3hiO6kg3yHbuliIAJkk9ucOD4qRgPro7wIkn
	4FN6MlkhPGIWdDU96zE+C1hFWx7WQqZOoC3SVMsFv/PGClxaP5izh6TP+KTVeLhvQuPn
	KefVIzI2pc8zjy+Qu8778frfhIKY0MXyUU06ctx541byAP4Re7h0PdVB6FWeNgC1xr5c
	bmvOAyO8BYSv6/XyMFEbJGecTDnOuRsrLDEN7jqLxMFkjzJq7+ZBBezRFKjk6ruEJSf+
	gERV4yPJfMpSo04/uX6FtV1XkZiBfGW1jfh8exkS9HiC3Zm5T1VTqeVD00M534+cBZCh
	oX/A==
X-Gm-Message-State: AKS2vOz8YNRGvWtBVsQY612/sApBaB/oX+zJG8e+TAeT0AtyYy9mvjJW
	Qcp2XzNBmZk+Mm8lLZUEvoepw8dG6w==
X-Received: by 10.107.202.195 with SMTP id a186mr5878422iog.37.1498568522047; 
	Tue, 27 Jun 2017 06:02:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.104 with HTTP; Tue, 27 Jun 2017 06:02:01 -0700 (PDT)
In-Reply-To: <CANwerB1ekM1MtG0-R7daQzhW_6mv_3gzhh5HK0gr4UJn5vz3pQ@mail.gmail.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
	<1498568049.3124.10.camel@linuxfoundation.org>
	<CANwerB1ekM1MtG0-R7daQzhW_6mv_3gzhh5HK0gr4UJn5vz3pQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 23:02:01 +1000
Message-ID: <CANwerB2=6GOb8U98eufkgbsFRz_z38gEDK5+p=udNiGPGp=19g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 13:02:04 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On 27 June 2017 at 22:56, Jonathan Liu <net147@gmail.com> wrote:
> Hi Richard,
>
> On 27 June 2017 at 22:54, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2017-06-27 at 11:05 +0200, Patrick Ohly wrote:
>>> On Thu, 2017-06-01 at 22:15 +1000, Jonathan Liu wrote:
>>> >
>>> > If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-
>>> > config
>>> > to HOSTTOOLS to allow access to the host sdl-config.
>>> >
>>> > Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> > ---
>>> >  meta/conf/bitbake.conf | 3 +++
>>> >  1 file changed, 3 insertions(+)
>>> >
>>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> > index 8e4f4bbb56..3ad905c917 100644
>>> > --- a/meta/conf/bitbake.conf
>>> > +++ b/meta/conf/bitbake.conf
>>> > @@ -471,6 +471,9 @@ HOSTTOOLS += " \
>>> >  # Tools needed to run testimage runtime image testing
>>> >  HOSTTOOLS += "ip ping ps scp ssh stty"
>>> >
>>> > +# Link to sdl-config if using host SDL
>>> > +HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-
>>> > native', 'sdl-config', '', d)}"
>>> > +
>>> Why are you checking ASSUME_PROVIDES? The variable is called
>>> ASSUME_PROVIDED.
>>>
>>> Even if you had checked the right variable, is that really necessary?
>>> I'm building qemu with ASSUME_PROVIDED += "libsdl-native" just fine
>>> on Debian Jessie, without sdl-config in HOSTTOOLS.
>>>
>>> Sorry for the late reply, going through my backlog... I see that this
>>> has been merged. Probably needs to be reverted or fixed.
>>
>> I've reverted this since I can't see how it can actually work or help
>> anything, unless someone has set "ASSUME_PROVIDES" to test this (which
>> is a variable that doesn't exist or is used anywhere).
>>
>> Cheers,
>>
>> Richard
>
> It is a typo. The fix is in ross/mut -
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=7605eb1e507d4ebc0c5b8d98a358be7c55e4ddd2.

Also it was indeed tested after the fix but the sanity check was
cached in build/conf/sanity_info and I didn't think to clear it.
So the sanity check wasn't re-run after I deleted bitbake.lock,
buildhistory, cache, sstate-cache, tmp and rebuilt.

Why is state data written into a "conf" folder anyway? Shouldn't this
go into another folder like "cache"? Users don't generally think to
wipe files in conf folder when they want to do a clean rebuild.

Regards,
Jonathan

