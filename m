Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 699817522C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 22:07:16 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id x7-v6so5070218lff.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3sFNqpbm9umsg/821tcZ4tUchoT+s3fPYxXmvEEhTN4=;
	b=uDhEDVnWlluJxb6SgboVojc1A6CZmuNyzc+WfYm8yiT0iUU1tW5yudYNCYspghvZVa
	21udw9USjAegdvH7TGArbvqQz8ZGnrpdCJopT2vSIo8k1biRPpeq1k44oNGm7QlRDwX/
	enEJqioKsTm3LOA2G28psARxg1m0iczYEagNCmkMPPcyHsf2U2R4ZpXbh46AOnBXB88i
	tbjjYTZ/hjqtiwIAOk9ZiYIBbkIrJ7rYCfHFqDFaA8GoRKOejm+zDy+8QS0qxltrThkq
	fy5C+BmsorCQHo8Vyw0IPfvQ8BDs3oS5lMNdT2K6oSIulXwVy9kTzXmTqFU8peJrkKvo
	5J8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3sFNqpbm9umsg/821tcZ4tUchoT+s3fPYxXmvEEhTN4=;
	b=qPP9w7gWVwbTZzBW+2Mxi7bKrFEjXEK1RM2fEe8bE2ke90ONDW1pi60hW9/04+cpX0
	plQQyd9M1Vbfj/4PNUVUtbQMMLkXyzYk+BQcbng4Pl2BwmPZ2Udo7gMWHrM/Qw5dS/TU
	VIH6fxdBTP/Ip9ZdpZ12GdhCEGTt3G1USFgiIYCZiJcbtCYpkqrtLPtnRw1r77j4fvKs
	RfB1iXtIOHtw5tAvs/Js/qtU6JyPkO8T2LH0ChSUzZMgUhm5oadpN9PxoVbkWXsQ2Szx
	H5AyHJK/iWU6G41Hb7pcSsk1LMoUeugb+e1Xgby+wSgB3g3Z+W6lk8dyZLfECCboEAQD
	OLtg==
X-Gm-Message-State: ALKqPweiLuROp2qvyaDpA9PNxD8IY2dNQ4OoKiOGaqBnOHBeOUOpJ995
	HA5vEiv4iB4KbwqRx5vOU1LfBIbBSFOA8Pus68c=
X-Google-Smtp-Source: AB8JxZq0WxxQmeHYVWrka9pBXRqxDYJ3RdvGhMkyLRjO8Ypf0DANaY6K5L3sS3rAqe2gg1Mql8k+g5M7+bvPxTvQB44=
X-Received: by 2002:a2e:638f:: with SMTP id
	s15-v6mr2195833lje.78.1525990037672; 
	Thu, 10 May 2018 15:07:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.21.17 with HTTP; Thu, 10 May 2018 15:06:47 -0700 (PDT)
In-Reply-To: <CA+chaQfgi+-PSYRRnCb2PtpH5UAHa2ztcQ3MaN0_wTc_=GMCmw@mail.gmail.com>
References: <20180510213058.68614-1-alistair.francis@wdc.com>
	<CA+chaQfgi+-PSYRRnCb2PtpH5UAHa2ztcQ3MaN0_wTc_=GMCmw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 May 2018 15:06:47 -0700
Message-ID: <CAKmqyKOBqOtT=kCmiuUrrsVV9sQmyJdt7B-789ui6keRg53yiA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-graphics/libsdl2: Add native and nativesdk support
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
X-List-Received-Date: Thu, 10 May 2018 22:07:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 2:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> See http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu
> + http://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/spice
> for more qemu related changes.
>
> More info:
> http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142349.html
>
> and that's basically where I'm still stuck (and why haven't sent most of
> these patches yet), because it works fine "natively" but when the
> qemu-native is running inside of chroot or docker, I didn't get the
> acceleration working (from virt-viewer running "natively" - outside
> chroot/docker).
>
> I plan to separate libsdl2 changes from this and send them with updated qemu
> upgrade as discussed with Ross.

It looks like you beat me to it. Plus your patches look better then mine :)

It would be great if you could send the QEMU 2.12 patches seperatly.
Can you CC me when you do?

Alistair

>
> On Thu, May 10, 2018 at 11:31 PM Alistair Francis <alistair.francis@wdc.com>
> wrote:
>>
>> Allow building libsdl2 for native and nativesdk. This is required to use
>> libsdl2 in QEMU.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> index c0cf70d7fd..36508ec349 100644
>> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> @@ -42,6 +42,11 @@ PACKAGECONFIG ??= " \
>>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11',
>> d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2',
>> '', d)} \
>>  "
>> +PACKAGECONFIG_class-native = "${PACKAGECONFIG_GL} x11"
>> +PACKAGECONFIG_class-nativesdk = "${PACKAGECONFIG_GL} \
>> +                                 ${@bb.utils.filter('DISTRO_FEATURES',
>> 'x11', d)} \
>> +"
>> +
>>  PACKAGECONFIG[alsa]       = "--enable-alsa
>> --disable-alsatest,--disable-alsa,alsa-lib,"
>>  PACKAGECONFIG[directfb]   =
>> "--enable-video-directfb,--disable-video-directfb,directfb"
>>  PACKAGECONFIG[gles2]      =
>> "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
>> @@ -63,3 +68,5 @@ do_configure_prepend() {
>>  }
>>
>>  FILES_${PN}-dev += "${libdir}/cmake"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.17.0
>>
>

