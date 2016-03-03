Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 23698731BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 06:42:38 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l68so116745001wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 22:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=t9tPf+uNLrV8JxwD10mnne5dBAlYnhE5LOz8BOyO46g=;
	b=N2T5DMZoCsfQ+n2H9coQxBcuT1CO2m7vbI1xgiwF3SB+kDqVjKXShR4sauF0qijKfv
	UBfQGSnAizpkOtj5PO9W+2H8/H1F8HCD2w/FJw0eQ8efmi5vTVVgAD0dVospyTt7zgNQ
	XfbPR8lGNA6zw/4OYipa/z0cb79LvHLC/fln52lmMf1YK9wmVNGz7Xqm0XTJpojxbq4w
	GrIVFw2N4jwcxFk1RTqGo2bnvLjwQdor/f/hc+9fx+68s+ixCMIFkqG5gi0gj9fi1zM7
	4QK+r+LK1iblSTiUwY+Q09LmDxZyO7Vxd4axVAe0JWnwdU2k7t4jZE8yxYU1pnNZY5Sq
	R8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=t9tPf+uNLrV8JxwD10mnne5dBAlYnhE5LOz8BOyO46g=;
	b=C5qB2OKk3C3tELiSOKKR6IFh7e6HupU+sBf1XlxUhBbgtGmm0zA/YgSUQrILTtmGfj
	+FB7DFDSBJTjwxqI85kgP0A9ftjOM3tHHW3NEQbMI/tsPdVGxEM3UQC+3hhHWqE252Pj
	67eGqHVpLBq+hIoC2lfPnF7WsWqLNHOh+l9tao4WRoW4p7wHcsDVrn1D9ndmbcap+GVW
	7q9FfCxCNJlYF4uo2S1J6CdxNdz+fI9zvewO+QwuHnrzryySIPhQrDfVgOh1vA+rV2Gv
	6m4nvHkxCH0//lQf2p/ewLMCW5S+36uWIM4jI7pFgeJJ55UDHoAYOFTiS5HQjavVRWbp
	YPrA==
X-Gm-Message-State: AD7BkJJqWLkQwr2CDw1syQNykxQqXpB9LME2AVdKUFA9FDHPBrUoUzESStxP4dZhfs/zAQ5lBs2/TQc48yfnHw==
MIME-Version: 1.0
X-Received: by 10.194.109.161 with SMTP id ht1mr987384wjb.43.1456987358897;
	Wed, 02 Mar 2016 22:42:38 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Wed, 2 Mar 2016 22:42:38 -0800 (PST)
In-Reply-To: <CAMKF1soUxs=Q0qABjqsp8XDppipHTKQkOUB0uVC5aODCkSBk9A@mail.gmail.com>
References: <1456981633-16756-1-git-send-email-armccurdy@gmail.com>
	<56D7D404.4090500@windriver.com>
	<CAMKF1soUxs=Q0qABjqsp8XDppipHTKQkOUB0uVC5aODCkSBk9A@mail.gmail.com>
Date: Wed, 2 Mar 2016 22:42:38 -0800
Message-ID: <CAJ86T=VPYX68-k3uFnoO1Vu6LTyNSQ6yJJhhRQmMRqBJA=_1RQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime.inc: disable libitm for little endian MIPS too
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
X-List-Received-Date: Thu, 03 Mar 2016 06:42:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 2, 2016 at 10:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 2, 2016 at 10:04 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 3/2/16 11:07 PM, Andre McCurdy wrote:
>>> libitm is already disabled for big endian MIPS, but needs to be
>>> disabled for little endian MIPS targets too.
>>
>> No objection to the patch, but do we have any little endian MIPS currently
>> defined or buildable to test?
>
> most of mips based set-top boxes are mipsel.
>
>> All of the samples I've seen are all big endian these days.  (QEMU or actual
>> boards.)

Of the MIPS boards supported by OpenWRT, there seem to be an even
mixture of big and little endian:

  https://dev.openwrt.org/wiki/platforms

I don't know how many (if any) of these boards are supported by OE though...


>> --Mark
>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> index 707db37..1c3dd54 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>>> @@ -12,7 +12,9 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>>>
>>>  RUNTIMELIBITM = "libitm"
>>>  RUNTIMELIBITM_mips = ""
>>> +RUNTIMELIBITM_mipsel = ""
>>>  RUNTIMELIBITM_mips64 = ""
>>> +RUNTIMELIBITM_mips64el = ""
>>>
>>>  RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>>>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

