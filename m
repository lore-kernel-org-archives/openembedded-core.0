Return-Path: <net147@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25091771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 12:56:02 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id x12so2567579itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EreGmuOS76emWB7Me9YEAnq+Pysp19YtEqEDybGuReg=;
	b=RVmcAWIsaIThRomFizWZDSWohOPRL0rLbQRQRXY72ABYqwtsTUAjcg6unHKAZzTlB/
	8UufFcgQ4cVF0voa9v4zkcs3xxAAmvt0TdKxry0Zr7M8lJUO7BOV3hTXTr9CJk26pRSC
	QMJ3jfDmCwGfoDohQ/Tan5SQZk7FbnlEnaHCZQJVRgU+CMeSUnqualivXmgHDWxhx2kg
	/RkGe0+IHD2K97OZB7eRfDmFXgJnpnsijtg32kCd6quIOd3j1tReJbpNxOfjRHMrCqEp
	Jnicr6wgdA32/dnaEr1ETprY09SkZYy4yYxmRgPH2q+uGXAL/AfzaSojlwOuT74TgHAx
	N6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EreGmuOS76emWB7Me9YEAnq+Pysp19YtEqEDybGuReg=;
	b=jZMWOnhBljqtqIH2Z6Cx3BNyOrx3ayWGPMdrkZU6XQh0atdf5Z7IlKJgL5Wb76Y3vf
	GQtsL0dbiZOXcaZR4Ev74rexvLMtOMwdx69kU4QZnMYShMXKbU4VGgfcIam8VWgc0sOO
	Pe8E0uMvHABcNCcdOhpBe88csfH5L+ZUo80+4crPDyfUEMk8QtrX844qUYNUJ6/cdfir
	c1N0djioW2PpXPu67FD2aNvFGtejTjdSeYnJcVZEEOCrtXNHwkrLJI7PwTuyyUsVMzFV
	Nd8DgkgXtnjGlJACRsmBoJnD+t7VbfzTvjWce2ZnWxttgKh7iSs40BLbmLf2PXbQeY1q
	RXsA==
X-Gm-Message-State: AKS2vOzSOualUqyQ/uCBDbo2tlYCMVZ1wWqTbE6KN3zKA5YeBYK9yQss
	1sTQGYgxGcgf+H/aWPWdI7BlH0fGcA==
X-Received: by 10.36.204.215 with SMTP id x206mr2350032itf.81.1498568163622;
	Tue, 27 Jun 2017 05:56:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.104 with HTTP; Tue, 27 Jun 2017 05:56:02 -0700 (PDT)
In-Reply-To: <1498568049.3124.10.camel@linuxfoundation.org>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
	<1498568049.3124.10.camel@linuxfoundation.org>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 22:56:02 +1000
Message-ID: <CANwerB1ekM1MtG0-R7daQzhW_6mv_3gzhh5HK0gr4UJn5vz3pQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Jun 2017 12:56:07 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On 27 June 2017 at 22:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-06-27 at 11:05 +0200, Patrick Ohly wrote:
>> On Thu, 2017-06-01 at 22:15 +1000, Jonathan Liu wrote:
>> >
>> > If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-
>> > config
>> > to HOSTTOOLS to allow access to the host sdl-config.
>> >
>> > Signed-off-by: Jonathan Liu <net147@gmail.com>
>> > ---
>> >  meta/conf/bitbake.conf | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> > index 8e4f4bbb56..3ad905c917 100644
>> > --- a/meta/conf/bitbake.conf
>> > +++ b/meta/conf/bitbake.conf
>> > @@ -471,6 +471,9 @@ HOSTTOOLS += " \
>> >  # Tools needed to run testimage runtime image testing
>> >  HOSTTOOLS += "ip ping ps scp ssh stty"
>> >
>> > +# Link to sdl-config if using host SDL
>> > +HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-
>> > native', 'sdl-config', '', d)}"
>> > +
>> Why are you checking ASSUME_PROVIDES? The variable is called
>> ASSUME_PROVIDED.
>>
>> Even if you had checked the right variable, is that really necessary?
>> I'm building qemu with ASSUME_PROVIDED += "libsdl-native" just fine
>> on Debian Jessie, without sdl-config in HOSTTOOLS.
>>
>> Sorry for the late reply, going through my backlog... I see that this
>> has been merged. Probably needs to be reverted or fixed.
>
> I've reverted this since I can't see how it can actually work or help
> anything, unless someone has set "ASSUME_PROVIDES" to test this (which
> is a variable that doesn't exist or is used anywhere).
>
> Cheers,
>
> Richard

It is a typo. The fix is in ross/mut -
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=7605eb1e507d4ebc0c5b8d98a358be7c55e4ddd2.

Regards,
Jonathan

