Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3013F6011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:22:48 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id b35so8156102uaa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=V1cwyFptNe5vt7B5uUgIhdLrg5juaVZxn4t3V/vvmqU=;
	b=HMTlTp5NAbwkbOoE4k2Sa6fnh8rdTH8zzdQiBXnhnor7KfVr8xwf15+oFMJJH8LP0H
	QZMOtU7Mq13CAwRBoJI5vtlN5vRoctvaTVBnzDJPaNmIYxsXoEjhFemcx8u82dYcXHJ2
	2cJEVQ7j2taKmjFgriBZEiRJlBWhio7P2tqqu/N4q8QeqL771iQsdoTKnC6MS/bh9i4O
	Ou5Iy3kWC2uRhT6uo6wpbroPo1qFpqLm9nthT16CAVC5kImI+6zrhXWFlBE0t6g1FRQl
	2CDeSgjsFm3fqrV6o42X/j9EL0FibaWbk0Ld5fjOFzKTXger3Hoq9HDItwD8FSJB5y5R
	yMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=V1cwyFptNe5vt7B5uUgIhdLrg5juaVZxn4t3V/vvmqU=;
	b=A9Tqlqwa3EA7TtVc6iIYt46R5lD2nEl5gjnsCZ+bcj9j2sNDSASnvvUvlc4KgHrj6v
	Qpv4DGDMDTZXwa9okIPkN7/8wRsJ5Jsivq/eiMUxSzEZfgRdrGqR5q6FljnLR+aPT1OI
	7/kap2aAEYYOEJguuJ4KmcMNfqB3PKyJKdXsYjykA1bQYn/A1JTn/zJ4LVaP2ztQv9Jy
	dLd1Y0sy09vjXjMw00pitJpus0UVyzmwoQL0rp/qq0zuxR3f+/YKauLbCyA7XA5ethxy
	QSmOWhkidenG4vI/2eMFjKxV9KgHmBTl7QDbDhSzsuHn/8tTXrJ9VqGyXd2MYqa9gUL4
	krbQ==
X-Gm-Message-State: AKaTC02Y34WyD3xKJNogfhmTI0D3DH+EjwgHFIV8Qi7M3dPcTsxijyXGQvEJlsPdcKxhWcBFcRF4L1NYhxZpDQ==
X-Received: by 10.176.5.130 with SMTP id e2mr13115622uae.108.1482146569900;
	Mon, 19 Dec 2016 03:22:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Mon, 19 Dec 2016 03:22:48 -0800 (PST)
In-Reply-To: <CAJTo0LZbgGV9kd0bw8jGgfg0kLbJn0ANgETon7_gJxG5fWML7g@mail.gmail.com>
References: <CALbNGRThWRoOfZjN1BaQpT2hAGzuRCfHUnfG89gxQcDE=6cgUw@mail.gmail.com>
	<CAJTo0LZbgGV9kd0bw8jGgfg0kLbJn0ANgETon7_gJxG5fWML7g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 19 Dec 2016 12:22:48 +0100
Message-ID: <CALbNGRQ+hDgM+AsRFq3YYidr4S-7yDXbx+abbfA5tpLqKTD9JQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: 'From OE-Core rev: <commit-id>' in recent master commits
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
X-List-Received-Date: Mon, 19 Dec 2016 11:22:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 12:19 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 19 December 2016 at 11:14, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> just updated to latest HEAD and checked commits. Found a lot of commits
>> with
>>
>> (From OE-Core rev: <commit ID>)
>
>
> Can you point to any SHAs in particular that have this?
>
> Ross
Those and more

commit c87361fc886432a9db584712bf3e41ecd0541960
Author: Ross Burton <ross.burton@intel.com>
Date:   Thu Dec 15 17:19:46 2016 +0000

    lib/oe/package_manager: bail if createrepo can't be found

    If createrepo isn't found then the errors later are mysterious, so
explicitly
    check and error out early if it isn't there.

    (From OE-Core rev: e09636bbb3ea8ec58984197fd9c691bb908efe00)

    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 147d7802926153ef0abb12d5e738576d8dfd02d7
Author: Armin Kuster <akuster808@gmail.com>
Date:   Thu Dec 15 07:21:45 2016 -0800

    tzdata: update to 2016j

    Briefly: Saratov, Russia moves from +03 to +04 on 2016-12-04.

      Changes to future time stamps

        Saratov, Russia switches from +03 to +04 on 2016-12-04 at 02:00.
        This hives off a new zone Europe/Saratov from Europe/Volgograd.
        (Thanks to Yuri Konotopov and Stepan Golosunov.)

      Changes to past time stamps

        The new zone Asia/Atyrau for Atyra=C5=AB Region, Kazakhstan, is lik=
e
        Asia/Aqtau except it switched from +05/+06 to +04/+05 in spring
        1999, not fall 1994.  (Thanks to Stepan Golosunov.)

      Changes to past time zone abbreviations

        Asia/Gaza and Asia/Hebron now use "EEST", not "EET", to denote
    summer time before 1948. The old use of "EET" was a typo.

    (From OE-Core rev: a0b389b5f3effad5194109f9914dec6125b3569d)

    Signed-off-by: Armin Kuster <akuster808@gmail.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit f9d6b482f2275c054dff91b81ac901b612f9c9b4
Author: Armin Kuster <akuster808@gmail.com>
Date:   Thu Dec 15 07:21:44 2016 -0800

    tzcode-native: update to 2016j

    Changes to code

        zic no longer mishandles file systems that lack hard links, fixing
        bugs introduced in 2016g.  (Problems reported by Tom Lane.)
        Also, when the destination already contains symbolic links, zic
        should now work better on systems where the 'link' system call
        does not follow symbolic links.

    Changes to documentation and commentary

        tz-link.htm now documents the relationship between release version
        numbers and development-repository commit tags.  (Suggested by
        Paul Koning.)

        The 'Theory' file now documents UT.

        iso3166.tab now accents "Cura=C3=A7ao", and commentary now mentions
    the names "Cabo Verde" and "Czechia". (Thanks to Ji=C5=99=C3=AD Boh=C3=
=A1=C4=8D.)

    (From OE-Core rev: 3fb5ddce97af1d4ada0dcc7f9c0ceef6ac392918)

    Signed-off-by: Armin Kuster <akuster808@gmail.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit a4111417b1b46cc852bf96a443b0edb0a525f346
Author: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date:   Thu Dec 15 15:40:11 2016 +0100

    gstreamer1.0-plugins-bad: default to using egl

    With the current set of PACKAGECONFIG, we end up building with
'gles2' and neither
    'opengl', nor 'egl'. As a result we are building -bad with neither 'glx=
' nor
    'egl' platform support. So let's make sure that we at least have
egl by default
    (since we default to 'gles2').

    (From OE-Core rev: 4de8447c6536385ca134866682709efebf7d4e3d)

    Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 41061a812239dcfde2e4cd5636250ff2cd7e4cbb
Author: Mike Looijmans <mike.looijmans@topic.nl>
Date:   Thu Dec 15 14:31:57 2016 +0100

    linux-firmware: Split out Realtek chipsets rtl8188 rtl8723 rtl8821

    Add rtl8188 rtl8712 rtl8723 rtl8821 packages to install only
firmware for the
    corresponding chipset. Uses a rather blunt approach by simply
adding all firmware
    files with matching prefix, to keep the package count down a bit.

    (From OE-Core rev: 62a5c0a40d13594a0f16a01701e70dac5e492125)

    Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit c4b71ff17f630d5289a8105ec9465ff29ecd0e6c
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:09 2016 +0200

    xf86-video-intel: fix upstream version check

    Even though upstream hasn't tagged new versions for a long while,
    we should not report a bogus tag as something that can be updated to.

    (From OE-Core rev: e16e4892368ec2475853d69332f3732dbf7b06cd)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 428531463574f4e7722912d1960bd288df586c14
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:08 2016 +0200

    upstream-version-is-even.bbclass: exclude various alphas, betas,
pre-releases etc.

    Was a problem with perl in particular.

    (From OE-Core rev: cc40b3ad2c4a725f93d0b984f23d34d247cffb2f)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 4e8e884054b56c578d51d7b4af7150b77806368d
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:07 2016 +0200

    ghostscript: fix upstream version check

    (From OE-Core rev: 10001924baf112a4556c5e85c16c482cbf435950)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 4e0e95a02a231bbdb350b1971536f4d65f4e9490
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:06 2016 +0200

    vala: update to 0.34.4

    (From OE-Core rev: 798af66e2e11baf53eff6b7f0e370fb77a1c5f72)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 0c3dbaa5d62e9ce404d1203c0478512e36ab8136
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:05 2016 +0200

    sysprof: update to 3.22.3

    (From OE-Core rev: 4a8ea471e386adff9b8f8b535589e599c1491fa5)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit d4487c9ee54a90e2e11287d9c41dce675a65ad15
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:04 2016 +0200

    iso-codes: update to 3.72

    (From OE-Core rev: 232ce36bb17643355b0b282063609147aa51bc1f)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit ab43357dba96d4404a66baf7b998d81ef0b7ad1d
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:03 2016 +0200

    icu: update to 58.2

    (From OE-Core rev: 68eca85201c2e15ab5c197f3cc70d863fb021493)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 84c6a3bcf44950049bba255075177a0004058a44
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:02 2016 +0200

    gnutls: update to 3.5.7

    Add a 0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
    to fix a compile issue (incorrect creation of an empty header).

    Add a libunistring dependency as gnutls has gained it.

    (From OE-Core rev: b2ec343ad770c26f39f3a6d335e4bb3ccbf41aec)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 7c5462f5ff3303da8d7daa5f22827bd852987138
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Thu Dec 15 14:48:01 2016 +0200

    ffmpeg: update to 3.2.2

    (From OE-Core rev: b9b50814dfb40f8d124be736f7af9ed4d69bc6b3)

    Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

