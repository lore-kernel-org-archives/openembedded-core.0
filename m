Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C718D77D9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 18:40:51 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id t86so6885718pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 11:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cAaETS+R4kwKygo7w00xeE34k6/5ADhbm/FDnpdut4o=;
	b=biKpyvn+6Grr46Eoa14vge/OpgT6a3zNxo9UrKU76Rzw7T8P9grlBdOogitpdZjuE+
	/aTOL8kioE9ikJKZIICOWRV2cnIK4vGZWljN4hO6ogkLCbZwa15KYI5JZJ93HrK2TgGj
	Hj7YbVZL9gM59Eq9AUF3/TmWedM7ynw2iFzG0lWJtuSkVF+rIP7AUz7C3QPUQMSFo6oG
	gG9jTuwBdtoa8qpSEWhe2M6jyTxU5RCWfLkL00hEW9C5jFvKBcmKoHHmFXM7SBuo5TFK
	ElgyAKKxIqYeM78T1QeFROsSl2nr151godM94rexIOaD4ZbmhuwcxVOGA1a+JImMbA1x
	ahTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cAaETS+R4kwKygo7w00xeE34k6/5ADhbm/FDnpdut4o=;
	b=MXX+vqiE63LI3Rts8d69rIAklUmcO5tYwghdi/BaabyJWOmECaipiz0ETfGG64bRLO
	q3wM6RCiFMNudx+8FCWb1HaqW/UEIZUvq8t/dspHFaLI+0c7dTpL14ysDl1d6qQy8pxu
	p/C2CHcHPY3KoBHXdVmNejIdkj/pv5/GhEf0ZIP3Q/rStA/fUbtdPMPXdQQGqewMmD2S
	ftExdAvgUFb1BnxXUyi/oUezaVaQBpKMwlGhAKc8tPWVRwJmgT0ZmOh8Dj5tgIink01F
	Apt/F+7ASGk2Pf9rh8sI6vXgb36BHWm2iBea2I//sl1iSUziBLyaivoUNQsalAZIg+Eh
	709A==
X-Gm-Message-State: AHYfb5g6yAz52fJMQBkvONKbYxVgcahiBEvHGU56AcVgGj4aRHKTzyco
	MDe3A9o+3cEb2eAhsLjPHj2bzA7mQQ==
X-Received: by 10.84.239.8 with SMTP id w8mr9720450plk.73.1502304053100; Wed,
	09 Aug 2017 11:40:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 9 Aug 2017 11:40:22 -0700 (PDT)
In-Reply-To: <CAJTo0LZePXSS=RLYusEm9CJyRWZ5ygnjtk4=k=DrZtvDFYO9HA@mail.gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
	<20170809141922.2603-4-raj.khem@gmail.com>
	<CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>
	<14814de0-6516-8e73-b11f-d2a803b8dd03@gmail.com>
	<CAJTo0LZePXSS=RLYusEm9CJyRWZ5ygnjtk4=k=DrZtvDFYO9HA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Aug 2017 11:40:22 -0700
Message-ID: <CAMKF1sqvZQgW+FrvP6aFg4X_+f5dKDsbjr=TiQj9GpG0sauhEQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] cairo: Add pkgconfig for opengl support
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
X-List-Received-Date: Wed, 09 Aug 2017 18:40:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 11:16 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Breaks the no-x11 builder:
> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/543/steps/BuildImages/logs/stdio
>

yes I was expecting that

> Ross
>
> On 9 August 2017 at 19:11, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On 8/9/17 8:41 AM, Andre McCurdy wrote:
>> > On Wed, Aug 9, 2017 at 7:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >
>> > Any explanation? Was this previously non-deterministic? If so, how far
>> > back does the problem go?
>>
>> it isnt non-deterministic atleast not after RSS. However, we need this
>> enabled when we have openGL/X11 enabled.
>>
>> >
>> >> ---
>> >>  meta/recipes-graphics/cairo/cairo.inc | 4 +++-
>> >>  1 file changed, 3 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta/recipes-graphics/cairo/cairo.inc
>> >> b/meta/recipes-graphics/cairo/cairo.inc
>> >> index 8e1e2e1b88..fd376951bd 100644
>> >> --- a/meta/recipes-graphics/cairo/cairo.inc
>> >> +++ b/meta/recipes-graphics/cairo/cairo.inc
>> >> @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender
>> >> libxext"
>> >>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>> >>
>> >>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
>> >> xcb', '', d)} \
>> >> -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
>> >> +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>> >> +           ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>> >>
>> >>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no
>> >> --disable-xlib,${X11DEPENDS}"
>> >>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
>> >> @@ -30,6 +31,7 @@ PACKAGECONFIG[directfb] =
>> >> "--enable-directfb=yes,,directfb"
>> >>  PACKAGECONFIG[valgrind] =
>> >> "--enable-valgrind=yes,--disable-valgrind,valgrind"
>> >>  PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
>> >>  PACKAGECONFIG[glesv2] =
>> >> "--enable-glesv2,--disable-glesv2,virtual/libgles2"
>> >> +PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
>> >
>> > Since the opengl distro feature can imply either OpenGL or OpenGL ES
>> > support, it doesn't seem right to use it to select one over the other
>> > (ie for recipes which support both, shouldn't the choice between
>> > OpenGL or OpenGL ES be independent of the opengl distro feature) ?
>>
>> at some point we differentiated between opengl and gles at distro level
>> atleast for RDK, but I agree that marking opengl as a distro feature
>> encompassing all OpenGL implementations is better. Although, in this
>> particular case all openGL implementations can be enabled simultaneously
>> so may be we can enable egl and gles too with same knob. Alternatively
>> We can leave the packageconfig knob disabled which will make it same
>> defaults effectively ( which is disabled)
>>
>> >
>> >>
>> >>  #check for TARGET_FPU=soft and inform configure of the result so it
>> >> can disable some floating points
>> >>  require cairo-fpu.inc
>> >> --
>> >> 2.14.0
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

