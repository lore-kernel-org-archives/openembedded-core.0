Return-Path: <crg7475@mailbox.org>
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by mail.openembedded.org (Postfix) with ESMTP id B50667FA14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 19:13:25 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 47y0VG2BgyzQlF9;
	Tue, 14 Jan 2020 20:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1579029202; bh=I+4QhSXoj6lCrVKNRhQpuLsoyWJVF6YrY3JCAoBzbQ8=; b=h
	r9L27chExy1Yt8YE0vpgIH8Vh97XjyLInUdQBevFhGHJy5f9EJT2T//cCiOZ+Lzj
	2nao68hPHWhzb5fzi7xgBS83v4lS6X2nAVSX1qfXGytMhpGQpqlEoUSdT4IdKYad
	aACdnKyOOltX/yB+aLFk6ohrPePupF4Q7bAAjL7XsOP4a8AGvnNFw/BTBOsnP22Z
	e2YY7/nHuOgQeXOO1FSr76toS/X29nYTtGXrHMrcKHhVVyK0ZPv7aCeTKBW2uzPf
	j2EMZkjilNjsuaM5a3m/0B98RF0VY//eTb6oJjird8VtwxymNpuVdoNJs2xv2UO/
	XuTa+5U20wtwsl23Gy9nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1579029204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=pHySe4fH3ntNAmaIL68fmKp9f5tq/8Q1grHe0JzDKTo=;
	b=CMmV4HIvqIPLu5zLsKin6pldj011o/AYsk02psQRIqnN/3/7rPu4Hy63+9N1SOyePnw61k
	qRwkukNcx3MbG9na69+pQWKhJVIRrnBKjX5Px1mj5vJ1X183/JhcMfCFOZM0TdIQePHTwT
	XfXgry8PIHnHa4sr20wasNKEIeXSgk9xyEVlMY2uiaqR96daumCD4Ux4ZWz00c5r7ZP/bo
	FjX7BPWmYOx7GNmV+BN0R+yoAKRhmaRkVD9d+IBh7fUi7+bEjzMavayMytB4nrsEtvOXUy
	LGBw+754gLQmpdBaseHiDHNs9JTZnp1Np2j34JpA7wOL8Ne687bIscL9xGGoTA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030)
	with ESMTP id hDxO6A5CupkW; Tue, 14 Jan 2020 20:13:22 +0100 (CET)
To: Khem Raj <raj.khem@gmail.com>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
	<a7a27af5-86c6-de19-d426-d8e62f2e8497@mailbox.org>
	<10f99a93a316115216d4e63d2b34a84dfc9e6925.camel@linuxfoundation.org>
	<a2b0cd22-c849-2bc4-9032-485ad4d51108@mailbox.org>
	<CANNYZj9teCJ8-B_Zq51zKzCC+mHK5f0CseRm4LDymT9Ci5JBwQ@mail.gmail.com>
	<CANNYZj-Vd2E76rvAbxw8xNeyQa-SWy_zwomCOcSSKViCYdATDw@mail.gmail.com>
	<91334112-4d52-8f7e-d656-8989cc462b93@mailbox.org>
	<CAMKF1squ+0fQm-7SKL039M8SWh8hyjaQr+61VCd9GFmrZ4OaAQ@mail.gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <21b54124-d3d9-d0d9-7d13-8d8e5d2eccb1@mailbox.org>
Date: Tue, 14 Jan 2020 20:13:21 +0100
MIME-Version: 1.0
In-Reply-To: <CAMKF1squ+0fQm-7SKL039M8SWh8hyjaQr+61VCd9GFmrZ4OaAQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] gstreamer: Add common .inc files for meson based recipes
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
X-List-Received-Date: Tue, 14 Jan 2020 19:13:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hm alright, then I guess there are no showstoppers for merging anymore. 
The qt5 thing can be added in a followup commit.

On 14.01.20 19:55, Khem Raj wrote:
> On Tue, Jan 14, 2020 at 10:37 AM Carlos Rafael Giani
> <crg7475@mailbox.org> wrote:
>> Nice find! But, there is still one issue Khem found, regarding errors in meta-multimedia plugins: https://errors.yoctoproject.org/Errors/Build/96752/
>>
> I have already fixed them. Also sent a patch to enable debug in
> gstreamer to support shark plugin
>
> https://patchwork.openembedded.org/patch/168874/
> https://git.openembedded.org/meta-openembedded/commit/?id=ea8604a0e3fe38a5a49690b1b92b5b4964e7b5da
> https://git.openembedded.org/meta-openembedded/commit/?id=449fe9920555d815dadb295d2fce61935486bce8
>
>> This, and the discussion about the qt5 packageconfig, means to me that a v2 set is warranted. What
> do you think?
>
> There is a packageconfig in a bbappend that I plan to propose once its in.
>
> https://github.com/YoeDistro/meta-qt5/commit/cf2505af20c67f975dc4630e6c45e19f15103ef1
>
> perhaps it could be in main recipe instead of bbappend.
>
>> On 14.01.20 16:51, Alexander Kanavin wrote:
>>
>> I just sent a patch for this, and for the ptest issue. Should be good to merge now!
>>
>> Alex
>>
>> On Mon, 13 Jan 2020 at 19:01, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>> I have reproduced this just now. You need to set up a special 'nodistro' configuration like this:
>>>
>>> bblayers.conf:
>>> BBLAYERS ?= " \
>>>    /home/alexander/development/poky/meta \
>>> "
>>> (and no other layers)
>>>
>>> local.conf:
>>>
>>> MACHINE ??= "qemuarm"
>>> DISTRO ?= "nodistro"
>>> INHERIT += 'uninative'
>>> require conf/distro/include/yocto-uninative.inc
>>> ... (dl_dir, sstate etc)
>>>
>>> and build gstreamer1.0-plugins-base.
>>>
>>> Alex
>>>
>>>
>>> On Mon, 13 Jan 2020 at 16:38, Carlos Rafael Giani <crg7475@mailbox.org> wrote:
>>>> Except that there is no such package. Also, even if I build GStreamer
>>>> from scratch with all optional packageconfigs disabled, I do not get
>>>> this error, nor do I get any warnings about potentially missing
>>>> dependencies. So, I don't know what is going on here..
>>>>
>>>> On 13.01.20 13:59, Richard Purdie wrote:
>>>>> On Mon, 2020-01-13 at 13:55 +0100, Carlos Rafael Giani wrote:
>>>>>> Nope. This is an odd one. Are you sure there isn't a problem with
>>>>>> the
>>>>>> setup itself? In step2c, I see:
>>>>>>
>>>>>>    > ERROR: core-image-sato-1.0-r0 do_testsdk: The toolchain
>>>>>> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-
>>>>>> glibc/deploy/sdk/oecore-i686-armv7vet2hf-neon-toolchain-
>>>>>> nodistro.0.sh
>>>>>> is not built. Build it before running the tests: 'bitbake <image> -c
>>>>>> populate_sdk' .
>>>>> 2c fails as earlier stepd didn't build. I think the real issue is
>>>>> step1b which says:
>>>>>
>>>>> | Compiler for C supports arguments -Wdeclaration-after-statement: YES
>>>>> | Found pkg-config: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
>>>>> | Run-time dependency x11 found: YES 1.6.9
>>>>> | Run-time dependency glib-2.0 found: YES 2.62.4
>>>>> | Run-time dependency gobject-2.0 found: YES 2.62.4
>>>>> | Run-time dependency gio-2.0 found: YES 2.62.4
>>>>> | Run-time dependency gio-unix-2.0 found: YES 2.62.4
>>>>> | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
>>>>> | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
>>>>> | Dependency gtk+-3.0 skipped: feature examples disabled
>>>>> | Dependency gtk+-x11-3.0 skipped: feature examples disabled
>>>>> | Run-time dependency gstreamer-1.0 found: YES 1.16.1
>>>>> | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
>>>>> | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
>>>>> | Found CMake: NO
>>>>> | Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig and cmake)
>>>>> | Looking for a fallback subproject for the dependency gstreamer-check-1.0
>>>>> | Subproject directory not found and gstreamer.wrap file not found
>>>>> | Subproject  subprojects/gstreamer is buildable: NO (disabling)
>>>>> | Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer found: NO
>>>>> |
>>>>> | meson.build:309:0: ERROR: Could not find dependency gst_controller_dep in subproject gstreamer
>>>>> |
>>>>> | A full log can be found at /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
>>>>> | WARNING: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1 exit 1 from 'exit 1'
>>>>> |
>>>>> NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure: Failed
>>>>>
>>>>> | Compiler for C supports arguments -Wdeclaration-after-statement: YES
>>>>> | Found pkg-config: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
>>>>> | Run-time dependency x11 found: YES 1.6.9
>>>>> | Run-time dependency glib-2.0 found: YES 2.62.4
>>>>> | Run-time dependency gobject-2.0 found: YES 2.62.4
>>>>> | Run-time dependency gio-2.0 found: YES 2.62.4
>>>>> | Run-time dependency gio-unix-2.0 found: YES 2.62.4
>>>>> | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
>>>>> | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
>>>>> | Dependency gtk+-3.0 skipped: feature examples disabled
>>>>> | Dependency gtk+-x11-3.0 skipped: feature examples disabled
>>>>> | Run-time dependency gstreamer-1.0 found: YES 1.16.1
>>>>> | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
>>>>> | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
>>>>> | Found CMake: NO
>>>>> | Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig and cmake)
>>>>> | Looking for a fallback subproject for the dependency gstreamer-check-1.0
>>>>> | Subproject directory not found and gstreamer.wrap file not found
>>>>> | Subproject  subprojects/gstreamer is buildable: NO (disabling)
>>>>> | Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer found: NO
>>>>> |
>>>>> | meson.build:309:0: ERROR: Could not find dependency gst_controller_dep in subproject gstreamer
>>>>> |
>>>>> | A full log can be found at /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
>>>>> | WARNING: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1 exit 1 from 'exit 1'
>>>>> |
>>>>> NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure: Failed
>>>>>
>>>>> missing a check dependency?
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

