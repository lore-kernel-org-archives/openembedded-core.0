Return-Path: <crg7475@mailbox.org>
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by mail.openembedded.org (Postfix) with ESMTP id B0FB97FCA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:55:41 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 47xD8s3f1KzKmTn;
	Mon, 13 Jan 2020 13:55:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1578920135; bh=FsCMgI4F4EM+8bG9kM/V+6QzbaZQlhPuNwoOQsetxp4=; b=t
	62TMpSFHLHyg5P8NoFfpZYldPtA26jQqw9CsDoWcyQgpjm/CONG81M86suGllJpc
	PVQ/1gNpdeL9uhe70R12/vpd5z80aLJRiBjt7RodK0P7+bB9lvKsdabeTzZ52r9v
	Cz4RvRuSPfd5VGTgju6BNouU2jfJb0CqpT9HaqvK8VeIfYRaYS3kyZBQM5MpvN6f
	vXp9zuAQeGN+nxQVcU1qvhS9zACOKmyG9yfRyLQpfgRUQQdk+TIApiFgTWQi1z3S
	euIhAm66Eru28VfqoU06kVFVIYc7V4VUGhWLqefVQcnuxn7gUsI7daO52DDjD2Vb
	GTGhjnc3uTy8tlv2IDVRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578920139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=6DK/ogMYW1OOrtmuH6zI0X4nk0yFDd+3mHhzP7bfnJo=;
	b=isEWfnl3RniLxxFaj2L9jiWyDebJhHv8pkkbf0FDu4LEY4GiV+bjJS0mHg62uw3VFyoIcS
	NpEnSuAz1PLY19vhXkx7wB2qVm+gsNj46fvpFA4gykfBpP8ru8JRUn7hNa6JRpV4de5F3x
	ESh2gqDNwvFA3/z1s8aWX/4PDttodC4cwtUnxs9GJhiUNKNmLgsXBIiLRdzcJnPA0i3Tpc
	NEoe3ecO1HNjrXeWA9DvGVVkKyNsX8ycWvxROMDKxkO18ACepfPNQMqMDASNnc+HEYzCLM
	WQpsMiKjdW9prfq9M0aN24FyKz5it6yfwraFogyzU4OdSjccg+znFcbsoisFGw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
	(amavisd-new, port 10030)
	with ESMTP id cxCj-2HyIyxi; Mon, 13 Jan 2020 13:55:35 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <a7a27af5-86c6-de19-d426-d8e62f2e8497@mailbox.org>
Date: Mon, 13 Jan 2020 13:55:34 +0100
MIME-Version: 1.0
In-Reply-To: <725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 13 Jan 2020 12:55:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nope. This is an odd one. Are you sure there isn't a problem with the 
setup itself? In step2c, I see:

 > ERROR: core-image-sato-1.0-r0 do_testsdk: The toolchain 
/home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/deploy/sdk/oecore-i686-armv7vet2hf-neon-toolchain-nodistro.0.sh 
is not built. Build it before running the tests: 'bitbake <image> -c 
populate_sdk' .

On 13.01.20 13:18, Richard Purdie wrote:
> On Sun, 2020-01-12 at 14:59 +0100, Carlos Rafael Giani wrote:
>> * gstreamer1.0-plugins-common.inc
>>    The old gstreamer1.0-plugins.inc file, adapted for meson
>> * gstreamer1.0-plugins-packaging.inc
>>    The old gst-plugins-package.inc file, adapted for meson
>> * gstreamer1.0-ptest.inc
>>    Common code for meson based PTest support; autogenerates the run-ptest
>>    file and is designed to use the gnome-desktop-testing suite runner
>>    (which is why the .inc files inherits from ptest-gnome)
>>
>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>> ---
>>   .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
>>   .../gstreamer1.0-plugins-packaging.inc        | 70 +++++++++++++++++++
>>   .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
>>   3 files changed, 138 insertions(+)
>>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
>>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> Thanks for this, I know its not an easy patch set to sort out!
>
> I ran it on the autobuilder for testing since there was bandwidth
> available and there was one issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1455
>
> which was in a plain OE-Core + bitbake build (no poky, so nodistro).
>
> Any idea what is wrong there?
>
> Cheers,
>
> Richard
>

