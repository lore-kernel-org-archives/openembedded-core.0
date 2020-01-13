Return-Path: <crg7475@mailbox.org>
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by mail.openembedded.org (Postfix) with ESMTP id 53DA87FC9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 15:38:04 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 47xHmD5nS4zKmZj;
	Mon, 13 Jan 2020 16:38:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1578929878; bh=Wy0cuULxY9izcVVk1siVha2op+AMZ8nH8KEGkE6+7b0=; b=M
	HsOaAeNsk9IVcSypo/a/AhkkzYxt7pez3WIvM8oP+BHKTQXlbKuQVK412/+8UEIu
	2eW54npAi2bfKRle9AqctDviD0bcig2A/FhlhS30WnQ51jQmFlV2xiLBpDPYzMwK
	UczfES6nrrumm9QMbK0qYUBHgYIBzY5kozUOxL8HdYYyObjcabL49WbxqOv8muU/
	EgYZTAQ+YSH2HpOTpPxY7zhd5sX+ysLaHlMJElbEQVXqf19Fj3oA7T0RtsCw+6D5
	fp3fHFp/pKGP19DGghbgLQH70bzqchW9xTkz75H5vfR0IPAcfmYwEqcHi2nXN/+W
	lBCf/3oQC57RxgdYCmw7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578929882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=p9sKKtlg/1pgpFfl+YykwCRXy7ksUQxSfj46hpoXq6k=;
	b=waOa3ZsjBEigiEhhpsHjYQYL+/jNcdxYuHIwBVy82EB4cediw0WyQn4cOzZPny4AYeE5t0
	DQorA12f/mo4waBkx4gET9Gb3HfwWMQGDxplV9JI/ozEjrHoRicRHWKKyWCO2S+sYqFvaA
	s7n1rMIUWy5FxqpddxUK1vbsSwNxu16J0r+4B2TXU291aq7GLUqqdEz6zLva84OA96abc3
	XtPSi+lfeLaZuBMJCMrZri/Kgm/+YyorvvODjD9Wi5nyN8dGMjxJk5jvuR8IV0qkdYpsPv
	qzFYfGYzLgAnagROgMLsFna5rrwOFqSSl4hiiWhIjc2OAyyeFwus/nYZuQem9w==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
	[80.241.56.115]) (amavisd-new, port 10030)
	with ESMTP id livR8sgYZ5Fr; Mon, 13 Jan 2020 16:37:58 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
	<a7a27af5-86c6-de19-d426-d8e62f2e8497@mailbox.org>
	<10f99a93a316115216d4e63d2b34a84dfc9e6925.camel@linuxfoundation.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <a2b0cd22-c849-2bc4-9032-485ad4d51108@mailbox.org>
Date: Mon, 13 Jan 2020 16:37:57 +0100
MIME-Version: 1.0
In-Reply-To: <10f99a93a316115216d4e63d2b34a84dfc9e6925.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 13 Jan 2020 15:38:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Except that there is no such package. Also, even if I build GStreamer 
from scratch with all optional packageconfigs disabled, I do not get 
this error, nor do I get any warnings about potentially missing 
dependencies. So, I don't know what is going on here..

On 13.01.20 13:59, Richard Purdie wrote:
> On Mon, 2020-01-13 at 13:55 +0100, Carlos Rafael Giani wrote:
>> Nope. This is an odd one. Are you sure there isn't a problem with
>> the
>> setup itself? In step2c, I see:
>>
>>   > ERROR: core-image-sato-1.0-r0 do_testsdk: The toolchain
>> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-
>> glibc/deploy/sdk/oecore-i686-armv7vet2hf-neon-toolchain-
>> nodistro.0.sh
>> is not built. Build it before running the tests: 'bitbake <image> -c
>> populate_sdk' .
> 2c fails as earlier stepd didn't build. I think the real issue is
> step1b which says:
>
> | Compiler for C supports arguments -Wdeclaration-after-statement: YES
> | Found pkg-config: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
> | Run-time dependency x11 found: YES 1.6.9
> | Run-time dependency glib-2.0 found: YES 2.62.4
> | Run-time dependency gobject-2.0 found: YES 2.62.4
> | Run-time dependency gio-2.0 found: YES 2.62.4
> | Run-time dependency gio-unix-2.0 found: YES 2.62.4
> | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
> | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
> | Dependency gtk+-3.0 skipped: feature examples disabled
> | Dependency gtk+-x11-3.0 skipped: feature examples disabled
> | Run-time dependency gstreamer-1.0 found: YES 1.16.1
> | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
> | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
> | Found CMake: NO
> | Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig and cmake)
> | Looking for a fallback subproject for the dependency gstreamer-check-1.0
> | Subproject directory not found and gstreamer.wrap file not found
> | Subproject  subprojects/gstreamer is buildable: NO (disabling)
> | Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer found: NO
> |
> | meson.build:309:0: ERROR: Could not find dependency gst_controller_dep in subproject gstreamer
> |
> | A full log can be found at /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
> | WARNING: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1 exit 1 from 'exit 1'
> |
> NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure: Failed
>
> | Compiler for C supports arguments -Wdeclaration-after-statement: YES
> | Found pkg-config: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
> | Run-time dependency x11 found: YES 1.6.9
> | Run-time dependency glib-2.0 found: YES 2.62.4
> | Run-time dependency gobject-2.0 found: YES 2.62.4
> | Run-time dependency gio-2.0 found: YES 2.62.4
> | Run-time dependency gio-unix-2.0 found: YES 2.62.4
> | Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
> | Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
> | Dependency gtk+-3.0 skipped: feature examples disabled
> | Dependency gtk+-x11-3.0 skipped: feature examples disabled
> | Run-time dependency gstreamer-1.0 found: YES 1.16.1
> | Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
> | Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
> | Found CMake: NO
> | Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig and cmake)
> | Looking for a fallback subproject for the dependency gstreamer-check-1.0
> | Subproject directory not found and gstreamer.wrap file not found
> | Subproject  subprojects/gstreamer is buildable: NO (disabling)
> | Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer found: NO
> |
> | meson.build:309:0: ERROR: Could not find dependency gst_controller_dep in subproject gstreamer
> |
> | A full log can be found at /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
> | WARNING: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1 exit 1 from 'exit 1'
> |
> NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure: Failed
>
> missing a check dependency?
>
> Cheers,
>
> Richard
>
>

