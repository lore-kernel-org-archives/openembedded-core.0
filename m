Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1C89777E0D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 19:22:25 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id d29so4398316uai.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p7ZMmqYy/vBIRL+VLfBKPmVccX7wz41o/THHvuMnabA=;
	b=Rnoz2Jv1jMMFDEPIHMyTiHKdzQiR2u7TFnEEe9mvD6kyA6RvCcEBOwyytD2qrxUDWb
	l9QGJswK3QNlj5vwXPsuwzQtaJpaAnw2Ism/qediuqhnhtw7oBoc14ycmjPsk2sxyhUr
	94NPoFS9DJACq3vt5wC+yJUUCCVfiLnhjZHrDDP4RKR5mm6vvFZGYL8omZcVdYVS+mkI
	ZUlYpgLsJpYcJ6jbGcdPovCrkRB6Ri2x8S0guPA86X77UkXAJ64ikf9zFlSYUmYZ1en5
	xtuKKr7YzleoHmCFvse34m4JvTM9jV/d1g+f4MRoiWtdcUJUwi1vYnNPPcfeIV9xlcKm
	2okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p7ZMmqYy/vBIRL+VLfBKPmVccX7wz41o/THHvuMnabA=;
	b=NqGYqNt7P15hwJb/I5MWnYSMN6MX2JhdgpWhjx1EPimLY5UEaKJTuyod75DdiYqpcC
	1LtNIGuX088c6eMF5gDDw0ccU3L8vjLt9HaYHnMGXuk7BztKtFI/7WvlVDtCleyk0YlG
	wFdBNWUzCL+40RFqM7+Mr6E5GYN7vU52UiRKBG5PKvginN4mtprQyE97bP+awbTXQZ2l
	x4HC9inlPLlmH01JWSRT0P/qmDqmT8ZSmvKS0QkkMaq7BYkIK8io2YDZ8F1zoSuvGYO6
	dWZqtkP5tcjgKfEdXjVsc3lCISqXnI2bw6IuRI9Z6CUT0hmdWZhWQgETdO8z3sXr1dCy
	+Y2Q==
X-Gm-Message-State: AHYfb5gAZRnlFbu4MSrS2Iek0Z68RTpGpuG1qQFOHF9ekqtU3p44s5UP
	SQYC9B+M7o8qegxN1NjcFYFK+6JBHg==
X-Received: by 10.159.62.147 with SMTP id x19mr5504838uai.179.1502305156378;
	Wed, 09 Aug 2017 11:59:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.78.204 with HTTP; Wed, 9 Aug 2017 11:58:45 -0700 (PDT)
In-Reply-To: <CAJ86T=Vvu_wLDmtrkEvgrbMFWu+Y=EWfLGYDVD=aP_CDD1F9wg@mail.gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
	<20170809141922.2603-4-raj.khem@gmail.com>
	<CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>
	<14814de0-6516-8e73-b11f-d2a803b8dd03@gmail.com>
	<CAJ86T=Vvu_wLDmtrkEvgrbMFWu+Y=EWfLGYDVD=aP_CDD1F9wg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Aug 2017 11:58:45 -0700
Message-ID: <CAMKF1sruHBzJoW9E1H_kf1z5_g2gG_sxtOqHHZfKVFV0BeXsTA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Wed, 09 Aug 2017 19:22:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 11:24 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Aug 9, 2017 at 11:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 8/9/17 8:41 AM, Andre McCurdy wrote:
>>> On Wed, Aug 9, 2017 at 7:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>
>>> Any explanation? Was this previously non-deterministic? If so, how far
>>> back does the problem go?
>>
>> it isnt non-deterministic atleast not after RSS. However, we need this
>> enabled when we have openGL/X11 enabled.
>>
>>>
>>>> ---
>>>>  meta/recipes-graphics/cairo/cairo.inc | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
>>>> index 8e1e2e1b88..fd376951bd 100644
>>>> --- a/meta/recipes-graphics/cairo/cairo.inc
>>>> +++ b/meta/recipes-graphics/cairo/cairo.inc
>>>> @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>>>>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>>>>
>>>>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
>>>> -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
>>>> +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>>>> +           ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>>>>
>>>>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
>>>>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
>>>> @@ -30,6 +31,7 @@ PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
>>>>  PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
>>>>  PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
>>>>  PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
>>>> +PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
>>>
>>> Since the opengl distro feature can imply either OpenGL or OpenGL ES
>>> support, it doesn't seem right to use it to select one over the other
>>> (ie for recipes which support both, shouldn't the choice between
>>> OpenGL or OpenGL ES be independent of the opengl distro feature) ?
>>
>> at some point we differentiated between opengl and gles at distro level
>> atleast for RDK, but I agree that marking opengl as a distro feature
>> encompassing all OpenGL implementations is better. Although, in this
>> particular case all openGL implementations can be enabled simultaneously
>
> According to the tests in the configure script it looks like a choice
> between OpenGL or OpenGL ES, not both.
>
>> so may be we can enable egl and gles too with same knob. Alternatively
>> We can leave the packageconfig knob disabled which will make it same
>> defaults effectively ( which is disabled)
>
> Either leave it disabled or enable it conditionally based on both the
> opengl and x11 distro features?

could be a way forward.

>
>>
>>>
>>>>
>>>>  #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
>>>>  require cairo-fpu.inc
>>>> --
>>>> 2.14.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>

