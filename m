Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 958CD76044
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 23:20:21 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 16-v6so523840lfs.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=txwoPmU6m7gsazJ/bsW/XO49qi2SkOE+ZU3V7BXyGPA=;
	b=SoTcpMm1UqpOn5YF+jQleVFoGhfGl9ArzsXXJKLpe6SaDA63Q1CFjy8OXYR7DNkHXd
	uKqqYjkC8QVxKdDL3UB944eLWtb/InjOr8yx1srp62VEPZJOe5dv1UwIVj+s8dma+H3r
	JrGPeev+ZVrfDut8zfMYPcZKYYQPX+yqKaYPj3cXLh7OhhoEEOXAqk6ITnOMumVqY500
	DdsHpNpAeefq3FB7+nkTLT2k21lX4XoxYzBw8InqbzRqond94ZQ1RgGC0KCRrOB5R8Cn
	qlHzeybCskxSYSjMbn+MCGlQ3/SUNZ2Ph1RpUZ7ApTrjiyzmfqR0F9Xedfj9FOc5U99p
	nWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=txwoPmU6m7gsazJ/bsW/XO49qi2SkOE+ZU3V7BXyGPA=;
	b=Wax97HX+pJBjdDIujK026nt9+gItb8K4AczbhhqRNZFE1gnw8NLVGB8o9e7xFrphxy
	rvPv68qMMeh+tYgQse4HOsrfSPRpvQcjSdtshgG4OWpoThgdJr6gm4kIxNoiqgfecDoo
	Dbu3O0eDtnnj6rDlmaxSwahnqdeDJ4iHXk3qWx+0a/FoGbww4B98Wdd9iLd9nsoibsON
	4TJWOQ57KXjJtspCzwPYf6sh2gTPov9WrPx/LRh0a6Yieo1vZMdosonJG/fIRaC80Hip
	OH0xTZaioUMp+zqjHw5GvPfFCeOPCfvh4/3p2o4Xa9Cu414cV02p45WtTROsdeD4a5JV
	W1ng==
X-Gm-Message-State: ALKqPweeNTkl5W0sQoaZV/KP89RxX05avkvNl8bDxwutQUr1rXzEwAe0
	zWdaNds1os9CNwByjD9aE0RQzX4xW0u+Ux2pgNs=
X-Google-Smtp-Source: AB8JxZprnxyi+7youm2mZj4OJ3Cv3GF3IsDSUzu/LySPG707AtQvsnhZjIbxU1ydlU7wtI06WxhvRjmB6lOyVWh01LA=
X-Received: by 2002:a2e:7f02:: with SMTP id a2-v6mr5123526ljd.14.1526080822062;
	Fri, 11 May 2018 16:20:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.142 with HTTP; Fri, 11 May 2018 16:19:51 -0700 (PDT)
In-Reply-To: <20180511194457.GA2141@jama>
References: <20180510213058.68614-1-alistair.francis@wdc.com>
	<CA+chaQfgi+-PSYRRnCb2PtpH5UAHa2ztcQ3MaN0_wTc_=GMCmw@mail.gmail.com>
	<CAKmqyKOBqOtT=kCmiuUrrsVV9sQmyJdt7B-789ui6keRg53yiA@mail.gmail.com>
	<20180511194457.GA2141@jama>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 May 2018 16:19:51 -0700
Message-ID: <CAKmqyKMQpDknsqVj9s2MDgM0oRDceZ8x57XnyWAtBK4buVQtrQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 May 2018 23:20:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 12:44 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, May 10, 2018 at 03:06:47PM -0700, Alistair Francis wrote:
>> On Thu, May 10, 2018 at 2:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > See http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu
>> > + http://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/spice
>> > for more qemu related changes.
>> >
>> > More info:
>> > http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142349.html
>> >
>> > and that's basically where I'm still stuck (and why haven't sent most of
>> > these patches yet), because it works fine "natively" but when the
>> > qemu-native is running inside of chroot or docker, I didn't get the
>> > acceleration working (from virt-viewer running "natively" - outside
>> > chroot/docker).
>> >
>> > I plan to separate libsdl2 changes from this and send them with updated qemu
>> > upgrade as discussed with Ross.
>>
>> It looks like you beat me to it. Plus your patches look better then mine :)
>>
>> It would be great if you could send the QEMU 2.12 patches seperatly.
>> Can you CC me when you do?
>
> I've forgot to CC you, but the 2 patchsets I've sent today are:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150717.html
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-May/118144.html
>
> that leaves only virglrenderer and glx support in jansa/qemu branch.

Great, Thanks. I have reviewed them, although I'm not sure if that
matters for this project.

Alistair

>
>> >
>> > On Thu, May 10, 2018 at 11:31 PM Alistair Francis <alistair.francis@wdc.com>
>> > wrote:
>> >>
>> >> Allow building libsdl2 for native and nativesdk. This is required to use
>> >> libsdl2 in QEMU.
>> >>
>> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> >> ---
>> >>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 7 +++++++
>> >>  1 file changed, 7 insertions(+)
>> >>
>> >> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> >> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> >> index c0cf70d7fd..36508ec349 100644
>> >> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> >> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> >> @@ -42,6 +42,11 @@ PACKAGECONFIG ??= " \
>> >>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11',
>> >> d)} \
>> >>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2',
>> >> '', d)} \
>> >>  "
>> >> +PACKAGECONFIG_class-native = "${PACKAGECONFIG_GL} x11"
>> >> +PACKAGECONFIG_class-nativesdk = "${PACKAGECONFIG_GL} \
>> >> +                                 ${@bb.utils.filter('DISTRO_FEATURES',
>> >> 'x11', d)} \
>> >> +"
>> >> +
>> >>  PACKAGECONFIG[alsa]       = "--enable-alsa
>> >> --disable-alsatest,--disable-alsa,alsa-lib,"
>> >>  PACKAGECONFIG[directfb]   =
>> >> "--enable-video-directfb,--disable-video-directfb,directfb"
>> >>  PACKAGECONFIG[gles2]      =
>> >> "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
>> >> @@ -63,3 +68,5 @@ do_configure_prepend() {
>> >>  }
>> >>
>> >>  FILES_${PN}-dev += "${libdir}/cmake"
>> >> +
>> >> +BBCLASSEXTEND = "native nativesdk"
>> >> --
>> >> 2.17.0
>> >>
>> >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

