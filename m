Return-Path: <ulfalizer@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4DA60621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 05:00:21 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id u125so4174147ybg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 22:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8Gas99UTOYbQW7pMo+r0dJZo1waHevJcwSd7f+OQ3bc=;
	b=yJicwBGn2iax6jwEZNUaUZQPcLKhZEGrY10y1RZMd3vNlfkPVHidYr5e/Y9fduT4PH
	9oUw3E5ItWvtoZ8YeGbcw6xhCQGJMkM3V6bYZgqcYVbZcV3+L1YAsTurk7hT+nvvrH9B
	3fuI3wSPmRYkVaiwaMkl6WiWIvOabW5yg706sUJu20dCsfCGe76pw/omCVwuQOkJFKEB
	shhI1lWGpuqXKaYr2FxaGFliBBZyyrtaRF3pmj374El9qgQTk9l3fd5I0kx/YOdU+6W7
	roOOB1aA8w40gGlf+BXcdCUUMFkS/BwwjvgDLHmRWUKuTnvCqFOe2U0MGBfHrLx2E8ae
	Zatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8Gas99UTOYbQW7pMo+r0dJZo1waHevJcwSd7f+OQ3bc=;
	b=j1TsfAb6rOFLVYP4sKM751PNahj4wqWrTXnxoeNoDK84fipnzqSYi/3xHg4pVGG1qQ
	95IE52K7ACeVwtDnVpwrcH5b0VbmZXRqQj29up8UwcIrW3L/KuiGLGiTRVkJL1l5jYOn
	Lh5J1bWwzBKt+VQKMHnSjv/kTqXKInbtWRMHCZNpb+cpCCLHlCEzOr7DbEIAy5Jwd4ya
	bG7zpFuQ4DTCh0rcKn7p7fodBuwxA7Nl8KMFhPw0a3PW3wcFWQEdBWw1nVtv5P9Tt4N0
	JxD2Ubz67FWOWdEmuKQ4yyEd88XPOL5xZx1MvgWTOUIaQ1o+1IHZrDXTFSY1PEVifArG
	a7sw==
X-Gm-Message-State: AE9vXwPqJEo3K6zPO53x8OCEUd6yt2DhStQ40ijkWAhv3r/eE+7co+my9LvNE+SwR3f0Q3COAcz6ZZSuH0HAWg==
X-Received: by 10.37.111.197 with SMTP id k188mr24012122ybc.122.1474261222089; 
	Sun, 18 Sep 2016 22:00:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.140.8 with HTTP; Sun, 18 Sep 2016 22:00:21 -0700 (PDT)
In-Reply-To: <71906ead-d7a3-c541-76e2-96824df5006c@windriver.com>
References: <1474076227-17032-1-git-send-email-Randy.MacLeod@windriver.com>
	<CABcZANk=aHGZVw5vnh5+KyQaxLa8=7NB2GuFt49P0B_hDyaXcQ@mail.gmail.com>
	<82ab3d71-56c0-44b8-a892-91cfc90c0330@windriver.com>
	<CABcZANnnuemBFW_JFQJn-sVeao2vFviexrq-ps743M_V2264kw@mail.gmail.com>
	<3356320e-19eb-636a-5c32-c4bdc855aa99@windriver.com>
	<71906ead-d7a3-c541-76e2-96824df5006c@windriver.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Mon, 19 Sep 2016 07:00:21 +0200
Message-ID: <CAFkk2KTAkK5MboGFsSFrWWuywFu1CWO3y0cGL1Cv-GsJPXrMmg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: add packageconfig for -file-
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
X-List-Received-Date: Mon, 19 Sep 2016 05:00:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2016 at 5:42 AM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
>
>
> On 09/19/2016 11:32 AM, Randy MacLeod wrote:
>>
>> On 2016-09-18 10:37 PM, Christopher Larson wrote:
>>>
>>>
>>> On Sun, Sep 18, 2016 at 7:32 PM, Randy MacLeod
>>> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrot=
e:
>>>
>>>     On 2016-09-17 01:09 AM, Christopher Larson wrote:
>>>
>>>
>>>         On Fri, Sep 16, 2016 at 6:37 PM, Randy MacLeod
>>>         <Randy.MacLeod@windriver.com
>>>         <mailto:Randy.MacLeod@windriver.com>
>>>         <mailto:Randy.MacLeod@windriver.com
>>>         <mailto:Randy.MacLeod@windriver.com>>> wrote:
>>>
>>>             Without a packageconfig dependency for the file utility,
>>> there's
>>>             a very rare compile faiure caused by a race where the magic=
.h
>>>             header file is not found:
>>>
>>>              ../../../git/lib/support/plausible.c:33:19: fatal error:
>>>         magic.h:
>>>             No such file or directory
>>>
>>>             This file, plausible.c, is part of libsupport.a which is us=
ed
>>> by
>>>             many binaries produced by the e2fsprogs package. plausible.=
c
>>>         attempts
>>>             to dynamically load libmagic.so if the e2fsprogs configure
>>>         detects
>>>             that magic was available. Adding the packageconfig will
>>>         eliminate
>>>             the build as well as the possible configure-time race
>>> condition.
>>>
>>>             Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com
>>>         <mailto:Randy.MacLeod@windriver.com>
>>>             <mailto:Randy.MacLeod@windriver.com
>>>         <mailto:Randy.MacLeod@windriver.com>>>
>>>             ---
>>>              meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>>         <http://e2fsprogs_1.43.bb>
>>>             <http://e2fsprogs_1.43.bb> | 1 +
>>>              1 file changed, 1 insertion(+)
>>>
>>>             diff --git
>>>         a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>>         <http://e2fsprogs_1.43.bb>
>>>             <http://e2fsprogs_1.43.bb>
>>>             b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>>         <http://e2fsprogs_1.43.bb>
>>>             <http://e2fsprogs_1.43.bb>
>>>             index f4855bc..1707cb9 100644
>>>             --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>>         <http://e2fsprogs_1.43.bb>
>>>             <http://e2fsprogs_1.43.bb>
>>>             +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>>         <http://e2fsprogs_1.43.bb>
>>>             <http://e2fsprogs_1.43.bb>
>>>             @@ -23,6 +23,7 @@ EXTRA_OECONF +=3D "--libdir=3D${base_libd=
ir}
>>>             --sbindir=3D${base_sbindir} \
>>>              EXTRA_OECONF_darwin =3D "--libdir=3D${base_libdir}
>>>             --sbindir=3D${base_sbindir} --enable-bsd-shlibs"
>>>
>>>              PACKAGECONFIG ??=3D ""
>>>             +PACKAGECONFIG[file] =3D ',,file'
>>>
>>>
>>>         This isn=E2=80=99t going to be good enough. You aren=E2=80=99t =
explicitly
>>>         enabling/disabling the option, so it=E2=80=99ll still detect ba=
sed on
>>>         what=E2=80=99s in
>>>         the sysroot, so recipe build order will result in
>>> non-deterministic
>>>         behavior.
>>>
>>>
>>>     Hi Christopher,
>>>
>>>     Thanks for the response but I don't understand.
>>>     I'm probably wrong so please explain.
>>>     It seems that you're suggesting that I add:
>>>      --with[out]-magic to e2fsprogs configure, and while
>>>     I could do that, it does not seem to be needed.
>>>
>>>
>>>     Short response:
>>>
>>>       This change forces 'file' to be built before e2fsprogs if 'file'
>>>       is present in the image or world build. Then e2fsprogs will
>>>       detect magic.h,libmagic.so and  the race is eliminated.
>>>
>>>
>>> That=E2=80=99s only the case if =E2=80=98file=E2=80=99 is in PACKAGECON=
FIG, if not, it=E2=80=99ll still
>>> behave the way it did before, and change its deps based on build order.
>>> Our policy is to avoid floating deps period, regardless of
>>> PACKAGECONFIG. If a given packageconfig is not enabled, then explicitly
>>> disable the dependency, don=E2=80=99t detect and use it anyway.
>>http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#checking-=
for-missing-build-time-dependencies
>>
>> Ah right and now I see some uses where there would not be a
>> package dependency required.
>>
>> I'll likely send a v2 adding just:
>>    PACKAGECONFIG ??=3D "file"
>
>
> I'm afraid that this can't fix the floating deps, if file is a must
> and can't be disabled, you can set:
>
> DEPENDS +=3D "file"
>
> rather than use a PACKAGECONFIG.
>
>> since 'fuse' is in the meta-filesystems layer but
>
>
> For fuse:
> PACKAGECONFIG ??=3D ""
> PACKAGECONFIG[fuse] =3D '--enable-fuse2fs,--disable-fuse2fs,fuse'
>
> It is disabled by default, but other layers use a e2fsprogs.bbappend
> or PACKAGECONFIG_pn-e2fsprogs =3D "fuse" in conf file to enable it.
>
>> I don't understand how the fuse dependency gets fixed since
>
>
> It is disabled by default (--disable-fuse2fs), this can fix the
> floating deps issue.
>
> // Robert

There is a relevant new section in the 2.2 reference manual by the
way, that explains what floating dependencies are and why they are
problematic:

http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#checking-fo=
r-missing-build-time-dependencies

Cheers,
Ulf

>
>> it's not changed in meta-oe/meta-filesystems AFAIKT. Should the
>> fuse dependency be added as well so that builds that add
>> the meta-filesystems layer don't have this potential race?
>> I could do some testing to find out but it's late here.
>> Robert likely knows all about this so I'm
>> CCing him since he also committed the fuse change.
>>
>> It seems unlikely but we could have a pile of clean-up
>> to do...
>>
>> Thanks,
>> ../Randy
>>
>>> --
>>> Christopher Larson
>>> clarson at kergoth dot com
>>> Founder - BitBake, OpenEmbedded, OpenZaurus
>>> Maintainer - Tslib
>>> Senior Software Engineer, Mentor Graphics
>>
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

