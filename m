Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E50C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:15:29 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.1594.1642709728708334035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LbjA4xyw;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id bp39so7621271qtb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4bEafdvFoCJr0fMJfMxwWJkXigEdQfOZU3OOjv3RiPA=;
        b=LbjA4xyw/OE5aHevzARCe/rBp07YbJe2o8gVPssKxRMcOVfUSDi7CqjKduro9V5Fqj
         humPD+8UBYJ1bPOyLN7F+r+bp/eckcTUbTkC0rXR0CAgBg/QiZ+nLcOJglc4F0t4rsvw
         6FnYB42/u31AJm1juR1wgl1fPMTg7ZYGoKC53uXA7ri0K1YtI57ZQOs2iLPeukrxNch0
         wM4gofzPZHSVm/1vE93qutWoZhuxg1fsZVL62wXPxSzUW/cH7kXxo05JYEcijSKzoPu/
         YHOHXLBftzzY6BcAJAFU6uCvFrSHbO8dnr7a9FJXDznb6y2j3OSXJhJOm7n0XClZgyt+
         XE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bEafdvFoCJr0fMJfMxwWJkXigEdQfOZU3OOjv3RiPA=;
        b=iVcJSGx7eqKcAT34CAU3oLkg5aD/5tUPBpNh8Yi2ubdVLHBpgf/yBsDJo9m38Spb4H
         2oc/zbzt0VVUoKixgo8w1z2F9VniYfdM45knUHp93DRHqMqzPhiXdTqPvwAX5IxTm5mn
         MbhQJiQT2Yr/jfHJGMJrGJTolAmis3uVWz55Q/rJLP+73VQXvqFWY/ovo+X2zzO8p7UL
         rvSbII4U0yx9xSRct9UgGvbRBdlQUXPLdpxsNQ8Za4uJEOFtd97h89juaYb90luQMROi
         2kPs2F9Zmg2YD/kEFjsYo9/VKW2ZZkk3lJhAdeXD/duu5Xzjmv3i1uWlWEYq3vfgKK1a
         74Ew==
X-Gm-Message-State: AOAM533hG94VKggQmc0r4JlXADBbgzjWftc7WSAVJjIIX10UlFrZlHUU
	FqW+f9zF/vySaF6nUOir/wKWQoJCKdgTNMJg4jo=
X-Google-Smtp-Source: 
 ABdhPJzmHZCMdX0VAPL1mm4m2Z+9kCpSoxI7iCED9R/NsluxCyXWWA/iFr6LTlNR/eQreUE0gZ1bMymODcqpCvb3Pdc=
X-Received: by 2002:a05:622a:5c9:: with SMTP id
 d9mr666007qtb.330.1642709727698;
 Thu, 20 Jan 2022 12:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20220118185043.1778569-1-marex@denx.de>
 <CANNYZj8mJNZW=N-cgSzGGR8Av7Lij=NFzpK6cLWpyMjyHP2Oww@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8mJNZW=N-cgSzGGR8Av7Lij=NFzpK6cLWpyMjyHP2Oww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jan 2022 12:15:01 -0800
Message-ID: 
 <CAMKF1srtAJi+xvqJ1qNoi9rnCKpeN226r76o6AY=CMXe3x24Lg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Update from 4.4.1 to 5.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:15:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160780

there are bunch of failures in meta-openembedded as well  see

https://errors.yoctoproject.org/Errors/Build/138784/

On Tue, Jan 18, 2022 at 12:48 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This update breaks gst-libav, and I have a patch in the works that fixes that too :)
>
> Alex
>
> On Tue, 18 Jan 2022 at 19:50, Marek Vasut <marex@denx.de> wrote:
>>
>> Update ffmpeg to 5.0 , release notes and changelog below:
>> https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release/5.0:/RELEASE_NOTES
>> https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n5.0
>>
>> The avresample has been removed before 5.0 release in ffmpeg commit
>> 420cedd497 ("libavresample: Remove deprecated library")
>>
>> The ffmpeg 5.0 might be an LTS release, see:
>> http://www.jbkempf.com/blog/post/2022/FFmpeg-5.0
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexander Kanavin <alex@linutronix.de>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  .../ffmpeg/{ffmpeg_4.4.1.bb => ffmpeg_5.0.bb}            | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.4.1.bb => ffmpeg_5.0.bb} (95%)
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
>> similarity index 95%
>> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
>> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
>> index 3ba07c31d6..4ba5ff4537 100644
>> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
>> @@ -11,7 +11,6 @@ LICENSE:libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LG
>>  LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
>>  LICENSE:libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
>>  LICENSE:libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
>> -LICENSE:libavresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
>>  LICENSE:libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
>>  LICENSE:libpostproc = "GPLv2+"
>>  LICENSE:libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
>> @@ -26,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>>             file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>>             "
>> -SRC_URI[sha256sum] = "eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02"
>> +SRC_URI[sha256sum] = "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
>>
>>  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>>  ARM_INSTRUCTION_SET:armv4 = "arm"
>> @@ -41,7 +40,7 @@ DEPENDS = "nasm-native"
>>
>>  inherit autotools pkgconfig
>>
>> -PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
>> +PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc \
>>                     alsa bzlib lzma pic pthreads shared theora zlib \
>>                     ${@bb.utils.contains('AVAILTUNES', 'mips32r2', 'mips32r2', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)}"
>> @@ -54,7 +53,6 @@ PACKAGECONFIG[avformat] = "--enable-avformat,--disable-avformat"
>>  PACKAGECONFIG[swresample] = "--enable-swresample,--disable-swresample"
>>  PACKAGECONFIG[swscale] = "--enable-swscale,--disable-swscale"
>>  PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc"
>> -PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
>>
>>  # features to support
>>  PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
>> @@ -153,7 +151,6 @@ PACKAGES =+ "libavcodec \
>>               libavdevice \
>>               libavfilter \
>>               libavformat \
>> -             libavresample \
>>               libavutil \
>>               libpostproc \
>>               libswresample \
>> @@ -163,7 +160,6 @@ FILES:libavcodec = "${libdir}/libavcodec${SOLIBS}"
>>  FILES:libavdevice = "${libdir}/libavdevice${SOLIBS}"
>>  FILES:libavfilter = "${libdir}/libavfilter${SOLIBS}"
>>  FILES:libavformat = "${libdir}/libavformat${SOLIBS}"
>> -FILES:libavresample = "${libdir}/libavresample${SOLIBS}"
>>  FILES:libavutil = "${libdir}/libavutil${SOLIBS}"
>>  FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
>>  FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
>> @@ -175,7 +171,6 @@ INSANE_SKIP:${MLPREFIX}libavdevice = "textrel"
>>  INSANE_SKIP:${MLPREFIX}libavfilter = "textrel"
>>  INSANE_SKIP:${MLPREFIX}libavformat = "textrel"
>>  INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
>> -INSANE_SKIP:${MLPREFIX}libavresample = "textrel"
>>  INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
>>  INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
>>  INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
>> --
>> 2.34.1
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160678): https://lists.openembedded.org/g/openembedded-core/message/160678
> Mute This Topic: https://lists.openembedded.org/mt/88516624/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

