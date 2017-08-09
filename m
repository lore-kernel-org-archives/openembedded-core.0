Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3F177DE7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 18:52:34 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y67so5038663wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R3yDUCv1EvvNoB4Akeper5SjV2Fo9OxMw6GH0GA6jC8=;
	b=LgT1jn/xyNW+gAnP819KjNRo/54lNVAmLZG3di+pT74OLJkbCoRLB/sJCsN0FCZRfs
	v/oF71FMKUVeCxbTeTBddM0LsXCQrhInnBylu02KURzgLFu5MmTxVfXR31UpGAheZWo0
	efzuL71VKt+j1dMPQ/tw5dnsCxPBgQXRPBA0heWC7CFqzcthY0oQBpajSVd/8PZLz4ku
	xfmMvKVTuzWhTQ7y/Nu6evceR2t9B/7sbKUnhXZ0IrkrYZ0VF0lmNsGEAp5Ey3XJcc5H
	SButFIY/O8ePrCVYYETcUFjlTaurqTA+KbTxA/Nkuiv1AvFa9S26N2lhUBeamaPE8Xwk
	em4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R3yDUCv1EvvNoB4Akeper5SjV2Fo9OxMw6GH0GA6jC8=;
	b=hAVQtn5b54qhc/jq96oEHH1uIZ5RqjWk5S7/7XIuOPNgBJ1i8pBtWX3nJXaswiuE+U
	irKq9o7rZbtirlUQeCSrwbnd7vZ6cdRAn4K/ggja9pQtTxSn3Z9bPHZaQjMZR0Wu+W6L
	hiNix2K/PL3imZ0VvnEs4qY1GT0hW54wxAEpwHP2CxcDR0154OMGhp/mNBJVpSxpT296
	SeacblzsbscKR+5ZYFTg47GLjltSKk8Z7r9V+aE5MPMLjSyPuUYVKOZDShgUFB4dIHwl
	mqUswh+5rvDGNk+uiT+OQyIz61vJ5cHUjqfROBZMCwGQhOK6Y9WNfU3gZCMouSzha8el
	JcFQ==
X-Gm-Message-State: AHYfb5j0ifsNk7TBPASTIUYKC6LSOCd/xcZEt9oS8XoCxOaQvnx+uYdI
	erxAqlY6f1kouxsqNjLweiRojVagKg==
X-Received: by 10.223.151.82 with SMTP id r76mr6578254wrb.6.1502303061287;
	Wed, 09 Aug 2017 11:24:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Wed, 9 Aug 2017 11:24:20 -0700 (PDT)
In-Reply-To: <14814de0-6516-8e73-b11f-d2a803b8dd03@gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
	<20170809141922.2603-4-raj.khem@gmail.com>
	<CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>
	<14814de0-6516-8e73-b11f-d2a803b8dd03@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 Aug 2017 11:24:20 -0700
Message-ID: <CAJ86T=Vvu_wLDmtrkEvgrbMFWu+Y=EWfLGYDVD=aP_CDD1F9wg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 09 Aug 2017 18:52:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 11:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 8/9/17 8:41 AM, Andre McCurdy wrote:
>> On Wed, Aug 9, 2017 at 7:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> Any explanation? Was this previously non-deterministic? If so, how far
>> back does the problem go?
>
> it isnt non-deterministic atleast not after RSS. However, we need this
> enabled when we have openGL/X11 enabled.
>
>>
>>> ---
>>>  meta/recipes-graphics/cairo/cairo.inc | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
>>> index 8e1e2e1b88..fd376951bd 100644
>>> --- a/meta/recipes-graphics/cairo/cairo.inc
>>> +++ b/meta/recipes-graphics/cairo/cairo.inc
>>> @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>>>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>>>
>>>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
>>> -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
>>> +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>>> +           ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>>>
>>>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
>>>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
>>> @@ -30,6 +31,7 @@ PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
>>>  PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
>>>  PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
>>>  PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
>>> +PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
>>
>> Since the opengl distro feature can imply either OpenGL or OpenGL ES
>> support, it doesn't seem right to use it to select one over the other
>> (ie for recipes which support both, shouldn't the choice between
>> OpenGL or OpenGL ES be independent of the opengl distro feature) ?
>
> at some point we differentiated between opengl and gles at distro level
> atleast for RDK, but I agree that marking opengl as a distro feature
> encompassing all OpenGL implementations is better. Although, in this
> particular case all openGL implementations can be enabled simultaneously

According to the tests in the configure script it looks like a choice
between OpenGL or OpenGL ES, not both.

> so may be we can enable egl and gles too with same knob. Alternatively
> We can leave the packageconfig knob disabled which will make it same
> defaults effectively ( which is disabled)

Either leave it disabled or enable it conditionally based on both the
opengl and x11 distro features?

>
>>
>>>
>>>  #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
>>>  require cairo-fpu.inc
>>> --
>>> 2.14.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

