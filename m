Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D0DB960721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 19:17:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q189so26047558wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DwBU1U8/FEPdYDvBalGdcBm7IsAQOPp14XT1Vq4LyEI=;
	b=Cv95Valom+JPIVQKg2hMl0LMFJpyUtkYug0pzArLAyS1rvT9QNe4BN6X1d8ITXaBcR
	XP/IDFQWA6LFP8sKPq869+K91PWwSVMzkycwuhl1CwFu9owxc+TiW5mzzN4fMpScMaxj
	dlpE1Ug81YDCVJ8wlnV6Xr9bpcEviwcJAxbYJpc5eORZlOwhGG241QV5HoZKB3G9GKj5
	ukRMdaGPvEhiTkCoBkz3eLS01r/mzI67RgtghN+qUY3bV0Q798BkCC7KUyGME6ffUHzd
	TqdJto5sNglxGq8vYO9BWtuBR8OiHCY6Al5fVSfJyVkMZAJAVGgSNQdWCB+wdxexSAGm
	GJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DwBU1U8/FEPdYDvBalGdcBm7IsAQOPp14XT1Vq4LyEI=;
	b=GPNZffh4mXY1QCSSlq62L8MvNr/ij6FIE6a/0BwS4a/9HAVhPT6a9/+FxfJHMLTKSP
	pVivJngzQQleC8YDnUHzDtCbsyPwpu0B7v47ApyF9wdOVLX7xUExk67dYLO8PUAv8bfb
	F/Yc/or4eLxovm+MjFW0WsZaGk+J9cZtIKYNz+xXqCQUIsMvN2FxSzhEOtppnIdCz8LL
	351jPTRE6gVENSSaZNAPGIbzpmwY6+GwPsuvRg7fsduZ54ywjjRx8nP94BwVISaB//ey
	mTJUuBYLTGPf1fxqK9nRUTVfu5Lv6PJiab9i2M5BP79zn4t8CFqc3wHaSq9hNyplyhZC
	Qmyw==
X-Gm-Message-State: AIVw113cNHch57m1NKiJ5B/DvJhOsRVZhkcPrPwyEvRRQY9Fl9dZaMZs
	NeFdDiNtJoRfRQzRv9+Y/nG1K3Q8wA==
X-Received: by 10.28.159.133 with SMTP id i127mr12131281wme.172.1501528662359; 
	Mon, 31 Jul 2017 12:17:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Mon, 31 Jul 2017 12:17:41 -0700 (PDT)
In-Reply-To: <20170731125017.GA15641@mbabyjoh-desk.ger.corp.intel.com>
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
	<ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
	<1501498850.18633.1.camel@linuxfoundation.org>
	<20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
	<20170731125017.GA15641@mbabyjoh-desk.ger.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 31 Jul 2017 12:17:41 -0700
Message-ID: <CAJ86T=XNa+Dr3_j0srwKj=ZufVnWgQ2D95x_h3B+GAoZC-TcDA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: worth adding a "git"-versioned of i2c-tools to oe-core?
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
X-List-Received-Date: Mon, 31 Jul 2017 19:17:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 31, 2017 at 5:50 AM, Maxin B. John <maxin.john@intel.com> wrote:
> Hi,
>
> On Mon, Jul 31, 2017 at 07:15:23AM -0400, rpjday@crashcourse.ca wrote:
>>
>> Quoting Richard Purdie <richard.purdie@linuxfoundation.org>:
>>
>> >On Mon, 2017-07-31 at 13:41 +0300, Alexander Kanavin wrote:
>> >>On 07/31/2017 01:41 PM, rpjday@crashcourse.ca wrote:
>> >>>
>> >>>
>> >>>    given that some significant changes have been made to i2c-tools
>> >>> since
>> >>> version 3.1.2, is it worth adding a git-versioned recipe of that
>> >>> to
>> >>> oe-core,
>> >>> and using DEFAULT_PREFERENCE to force people to select it if they
>> >>> want it?
>> >>> in particular, the code base has been restructured, and a new
>> >>> utility,
>> >>> "i2ctransfer", has been added.
>> >>It's better to ask the upstream to make a new release.
>> >>
>> >>We've had dual git/release recipes in the past, and they were all an
>> >>utter failure. In the sense, that only one version of the recipe was
>> >>maintained, and the other was completely neglected.
>> >
>> >Going forward we may accept patches using this instead:
>> >
>> >http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/devupstream.bbclass
>> >
>> >Cheers,
>> >
>> >Richard
>>
>>   well, here's a possible conundrum ... in that same package (i2c-tools),
>> there appears to be an *obvious* flaw in that the "eeprog" utility uses a
>> sleep that is far too short for proper operation, as described here:
>>
>> https://www.toradex.com/community/questions/10243/write-issue-with-eeprog-in-eeprom.html
>>
>> there is a link to a patch on that page that simply cranks up a few sleep
>> calls from 10usec to 5msec, which apparently solves the problem. i've been
>> involved in a discussion on the i2c-tools mailing list about this very
>> issue after i tripped over it, but there seems to be little enthusiasm on
>> that list for "fixing" this -- i was told that people use the kernel driver
>> instead and access via /sys rather than calling "eeprog".
>
> dl.lm-sensors.org has been down for a while and doesn't show any positive signs that
> it will be back in near future. One possibility will be to use the unofficial mirrors
> listed below and upgrade to version 3.1.2
>
> 1. https://fossies.org/linux/misc/
> 2. http://jdelvare.nerim.net/mirror/i2c-tools/
>
>>   so, from my perspective, this should definitely be fixed so that "eeprog"
>> functions properly, but it's not clear upstream is all that interested in it.
>> what would the protocol be here?
>
> Since this genuinely fixes an error, we should be able to include this patch with:
> "Inappropriate [bug workaround]" status.

If upstream isn't interesting in a fix then "Inappropriate [upstream
not interested in fix]" or "Inappropriate [upstream is dead]" would be
better tags.

>> rday
>
> Best Regards,
> Maxin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

