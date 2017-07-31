Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64B76785BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 21:57:01 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q189so465976wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TG3T3yyJw4cfV0EHuQmqrDCOxJXiTOx8LZo3adxMiNo=;
	b=ONKx04fC/U21dinFUjM/yzYCecgn9Y/+EKu15zylcg7UV8UK9GiB77wMj6fziqrTUc
	DhrwQv7TCs8M/ifcS1pkmmM0uCvG5Dq8uU0O27hCtoX40GI9deOPFn8RhcY//0vpm42C
	DVVNgNqum+EOi+Xr973xuM2hS5TtDbkcI6rD2AHtF/WV2rbkCFZS1QaKP3sL58EBwD/r
	eooyEXJ/XnfJjwUifD1eB+OMy6i2BRBxsxbzsS/xf76OKGiS5LbkstDK3WfVnjAdV7Qf
	z3y6/aBpnl7LRvnWWamu4qYyXaS9jVr9ISQK2oh/l3oae04VYUQZrr2STWuccBhLLUy6
	u4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TG3T3yyJw4cfV0EHuQmqrDCOxJXiTOx8LZo3adxMiNo=;
	b=By9UvCuhMvt6nx7waTVsAvSIcvxEisPcm1z9L8U8YE/6faKTJsaPe5BeeRz8Y005a0
	gcot21BIdn50RH/cu8hI1FTRG+NMgLABu1kCUCQKuLw2Mhj7DiSwrxs94CuLfwdH+ONE
	cB7Uxu+ySnC5T8ocg4VMGuI7XOB3FGK7QWg0JP0NQY1Yv672Cx6nF5LBx/EDD1LUm2NP
	a9Oav7u4R/YPWYyhiW9+5qmqIpraPgOGk1836IcB4om4OFPOflo/ZFsbAdJM1bfVHNKF
	TglxfvaalC5Dr+ICdrjSFJxQjnBJ/fte2fjEnKlKPT+N4E1L+I0c3e9ZEhUCiNi/m7Rc
	YHGw==
X-Gm-Message-State: AIVw112lwrpu81jMy8EXsfE2dTVrR3BsRooaW7/RMyt3axPOIZ/6T1QV
	Cv4KyuCBJt0XdDPn5tAMLzlgIvGmYQ==
X-Received: by 10.80.147.197 with SMTP id o63mr15927911eda.194.1501538222934; 
	Mon, 31 Jul 2017 14:57:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Mon, 31 Jul 2017 14:56:32 -0700 (PDT)
In-Reply-To: <CALatG=5yu+0gVSg0dEOY-Yt1SftLWY9iweuzzVMj3D29U0XvaA@mail.gmail.com>
References: <1500730246-25592-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LaGMPJj-=c7FarWJAULoCJfSjouPKNSweMAaf-g38toJg@mail.gmail.com>
	<CAMKF1soLq6tFwDKBhs_5DxHrNeWr_Hv8kYSvABYsTW_BvgfpKQ@mail.gmail.com>
	<CALatG=5yu+0gVSg0dEOY-Yt1SftLWY9iweuzzVMj3D29U0XvaA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Jul 2017 14:56:32 -0700
Message-ID: <CAMKF1sqBnmmVEDB1GE3ei8=skkyRXc_igD_=_xEcwwOnANspaQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] tclibc-musl.inc: fix bfd "cannot make copy relocation for protected symbol" issues
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
X-List-Received-Date: Mon, 31 Jul 2017 21:57:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 25, 2017 at 1:07 AM, Ming Liu <liu.ming50@gmail.com> wrote:
> Hi, Burton:
>
> I also agree with you, your suggestion is better.
>
> Hi, Khem:
>
> But is this a bug of binutils? Or musl libc? Since I had only observed this
> error with musl libc only, it did not occur with glibc.
>

Please try out a tentative patch here
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679#c4

> //Ming Liu
>
> 2017-07-24 15:39 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>>
>> On Mon, Jul 24, 2017 at 6:18 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > If we're going to silently change the linker to bfd under musl if
>> > ld-is-gold
>> > is selected, wouldn't it be better just to throw an exception if both
>> > musl
>> > and ld-is-gold are selected?  Better to tell the user so they can not do
>> > that than silently ignore what they asked.
>>
>> yes, that would be better but I am skeptical of disabling it
>> completely, we should
>> create testcase and report it to binutils bugzilla
>>
>>
>> >
>> > Ross
>> >
>> > On 22 July 2017 at 14:30, <liu.ming50@gmail.com> wrote:
>> >>
>> >> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>> >>
>> >> Quite a few such compiling issues were found when I was building with
>> >> following configs:
>> >> ...
>> >> MACHINE = "beaglebone"
>> >> TCLIBC = "musl"
>> >> DISTRO_FEATURES_append = " ld-is-gold"
>> >> ...
>> >>
>> >> fixed by adding bfd binding now ldflags.
>> >>
>> >> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> >> ---
>> >>  meta/conf/distro/include/tclibc-musl.inc | 4 ++++
>> >>  1 file changed, 4 insertions(+)
>> >>
>> >> diff --git a/meta/conf/distro/include/tclibc-musl.inc
>> >> b/meta/conf/distro/include/tclibc-musl.inc
>> >> index 3d3f6ac..99d52a1 100644
>> >> --- a/meta/conf/distro/include/tclibc-musl.inc
>> >> +++ b/meta/conf/distro/include/tclibc-musl.inc
>> >> @@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=
>> >> "nativesdk-glibc"
>> >>
>> >>  CXXFLAGS += "-fvisibility-inlines-hidden"
>> >>
>> >> +# Workaround for musl libc does not support bfd lazy binding well
>> >> +# Refer to: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679
>> >> +LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
>> >> '-Wl,-z,relro,-z,now -fuse-ld=bfd', '', d)}"
>> >> +
>> >>  IMAGE_LINGUAS = ""
>> >>
>> >>  LIBC_DEPENDENCIES = "\
>> >> --
>> >> 2.7.4
>> >>
>> >
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>
>

