Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 36387605FE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 21:26:10 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id c47so56278920qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 14:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5eTSLzx/SVareE3wBONHIV/T4xQxHYXbtCQn11wzXrI=;
	b=eXq0vhSNNYSJJOpc3k+d6XR47TpfMQaq7fHrgPsDnh6SHqf7BcG9iWe/pBelTZ3Z/v
	6rM6m8h9EmoWqBhgtlG/pNNVBWQXZrTLbLjSNlGr0iHj9hVs2vtQ9eafk1X+KZ0ACxRS
	1We4aD7M8hzzbHjlnJtXnbWqCmTVyTPaxnkXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5eTSLzx/SVareE3wBONHIV/T4xQxHYXbtCQn11wzXrI=;
	b=UEC1c1g0SMUHE9I55HZG7sYpZMPzZ1rZ5PtO0FYQ74biOxWl8reBNeQz80uQgSUS1A
	fsXduNw2S/VA6hQnreB50lM90QmkxEOH2iL8lbz1jz/vy6fxdFcGSR3tMp2v/4BXvn6V
	wdDCidAbnEtcuv4qokC9b3lemsHNO1j38neYL/sTu5FOF5ockv60A1Nau6MrAZM/G0VG
	CFVkgyv2Ud0kyd0BbLryiGHJACmLLKfhgrCpVEq+XsITZvZUQP7k2GmcqHvBOE1+/z/W
	ds05QCH0XWZR4+VJLOg0TW/rilLlheGLVSUtXrp2cXzbnxmlvZvlzWgjqfL0zFQ9PkXz
	Wcvw==
X-Gm-Message-State: ABUngvceAlCSe/VKQh2RgljEor/We9FlRJHQXnONx25DUnrW0svAoEDM2HsRpczHyGXzk+wbCusDrgDrCpF3CBe8
X-Received: by 10.200.51.171 with SMTP id c40mr8238562qtb.131.1478294771858;
	Fri, 04 Nov 2016 14:26:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.104.102 with HTTP; Fri, 4 Nov 2016 14:25:51 -0700 (PDT)
In-Reply-To: <CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 4 Nov 2016 22:25:51 +0100
Message-ID: <CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Fri, 04 Nov 2016 21:26:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 1:05 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 20 October 2016 at 09:30, Koen Kooi <koen.kooi@linaro.org> wrote:
>>
>> +BBCLASSEXTEND =3D "native nativesdk"
>
>
> The native form fails on Debian stable hosts:
>
> | make[2]: Entering directory
> '/data/poky-master/tmp-glibc/work/x86_64-linux/libbsd-native/0.8.3-r0/bui=
ld/src'
> | ../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONF=
IG_H
> -I.. -isystem ../../libbsd-0.8.3/include/bsd/ -include ../config.h
> -DLIBBSD_OVERLAY -DLIBBSD_DISABLE_DEPRECATED -D__REENTRANT
> -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include
> -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include -O2
> -pipe -c -o getentropy.lo ../../libbsd-0.8.3/src/getentropy.c
> | x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I.. -isystem
> ../../libbsd-0.8.3/include/bsd/ -include ../config.h -DLIBBSD_OVERLAY
> -DLIBBSD_DISABLE_DEPRECATED -D__REENTRANT
> -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include
> -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include -O2
> -pipe -c ../../libbsd-0.8.3/src/getentropy.c  -fPIC -DPIC -o
> .libs/getentropy.o
> | In file included from /usr/include/x86_64-linux-gnu/sys/syscall.h:31:0,
> |                  from ../../libbsd-0.8.3/src/getentropy_linux.c:29,
> |                  from ../../libbsd-0.8.3/src/getentropy.c:28:
> | ../../libbsd-0.8.3/src/getentropy_linux.c: In function
> =E2=80=98getentropy_getrandom=E2=80=99:
> | ../../libbsd-0.8.3/src/getentropy_linux.c:203:17: error: =E2=80=98__NR_=
getrandom=E2=80=99
> undeclared (first use in this function)
> |    ret =3D syscall(SYS_getrandom, buf, len, 0);
> |                  ^
> | ../../libbsd-0.8.3/src/getentropy_linux.c:203:17: note: each undeclared
> identifier is reported only once for each function it appears in
>
> It's not wrong - there's no actual definition of __NR_getrandom in
> /usr/include here.

hmm. that's odd. libbsd is supposed to work with system that have this
syscall, and with system without it. in the upstream source code, they
properly do it like this:

#ifdef SYS_getrandom
static int
getentropy_getrandom(void *buf, size_t len)
{
    int pre_errno =3D errno;
    int ret;
    if (len > 256)
        return (-1);
    do {
        ret =3D syscall(SYS_getrandom, buf, len, 0);
<...>
#endif

So in order to get the build error you are seeing, that means that
SYS_getrandom is define to NR_getrandom (in syscall.h), but that
NR_getrandom is not set to the right syscall ID. That makes it quite
inconsistent.. could we be mixing HOST and sysroot content here?

I don't have a debian stable system handy right now, i will have to setup o=
ne.

nico

