Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBEF7E3AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 15:39:21 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 18078A0126;
	Thu, 30 May 2019 17:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1559230754; bh=91uUkHD8yQZGM7XdhPil4qJjm7U8F0ebX5cHnxD70Hs=; b=f
	U4sxpyG+jC0+2c8FCMhIqxvy0YmjiNUxkd1PO8wffRmZczS3ccDd4OhmkQaH4M4q
	uZ7189yOxG+AgikRvRZxJ/nBZUoC2BHKA1bK+PkADTjx5votV83AHqxazwi3O7vA
	l5BOB4CXA2YbJBGcpPyOi7Bl1Tngaof5zgNcVFBQSNGkEbHyAEMjfucdpYChhvQN
	AXxpFfvLfmyk9q8l6F6BVwPhptoMFCru4QIpGEI5Uq/jKtTLg7m3sAWqTpRPc7+P
	RskhKN1Keo9NyMLsD8xL16q7krAG+ffF7DfJvbAAdDcNQRae1bE+2wfAgTkUSonE
	DSXhZOU5zZAK4nQxYeVRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559230759; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:mime-version:
	content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=H8lgvhercfCHQCtOlQb6YDeVOQINzQSpS7yyLsgUQvs=;
	b=D860mybiUW64iCFKpqAqqhMDtPNiQw2tu1jiHvl+PdoVH9zHe4MMRwhFYQwGwIJx4Fnq8p
	2PBeblqhKDX806aXcEsNmEFRw3HRj2oY2ycCzCvvKmchxnu5Y/nrSNJJyimiHPsvOylWDe
	0RM/SlRDP/zEGrJ7cYbNhl5gXikfHtt0Tbm/aCsdFqvUlI67tXVLutFpQ4UdNg7YGlxUi4
	uz56p+dGpylptQpsK8rKEpSh6WC9NS+WWKFwLH+bUvlU4C8vyeLYlS10AwkRQU8AZfjUVN
	ZYMXAp4oYiooHIrKxQgWGwk1jcwAQp3wtLDZNJCciLsAbT9rUdmBYegvyNKWqg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030)
	with ESMTP id OqVvQoixqpua; Thu, 30 May 2019 17:39:14 +0200 (CEST)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190526110642.5341-1-crg7475@mailbox.org>
	<20190526110642.5341-8-crg7475@mailbox.org>
	<bf1e68db18dc3517178df3810324c09c3954adf8.camel@intel.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <a9e2fb9e-b4b9-93ea-a516-c8e5e5c3e854@mailbox.org>
Date: Thu, 30 May 2019 17:39:12 +0200
MIME-Version: 1.0
In-Reply-To: <bf1e68db18dc3517178df3810324c09c3954adf8.camel@intel.com>
Subject: Re: [PATCH 08/11] gstreamer1.0-vaapi: upgrade to version 1.16.0
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
X-List-Received-Date: Thu, 30 May 2019 15:39:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Yep, wayland-protocols was missing. I just added it.

The other problem is odd. wayland is added as a dependency:

     PACKAGECONFIG[wayland] = 
"--enable-wayland,--disable-wayland,wayland wayland-protocols"

and yet wayland-scanner is not installed in the recipe-sysroot-native 
folder. The wayland-scanner binary is part of wayland-dev.

Am I forgetting something?


On 28.05.19 00:28, Mittal, Anuj wrote:
> Looks like this needs a dependency on wayland-scanner and wayland-
> protocols as well for this version?
>
> Error log from autobuilder:
>
> https://errors.yoctoproject.org/Errors/Details/247143/
>
> Thanks
> Anuj
>
> On Sun, 2019-05-26 at 13:06 +0200, Carlos Rafael Giani wrote:
>> Signed-off-by: Philippe Normand <philn@igalia.com>
>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>> ---
>>   .../0001-vaapsink-downgrade-to-marginal.patch                 | 4
>> ++--
>>   ...reamer1.0-vaapi_1.14.4.bb => gstreamer1.0-vaapi_1.16.0.bb} | 4
>> ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-
>> vaapi_1.14.4.bb => gstreamer1.0-vaapi_1.16.0.bb} (93%)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
>> vaapi/0001-vaapsink-downgrade-to-marginal.patch b/meta/recipes-
>> multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-
>> marginal.patch
>> index c861f3bed2..7945a923c9 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-
>> vaapsink-downgrade-to-marginal.patch
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-
>> vaapsink-downgrade-to-marginal.patch
>> @@ -24,7 +24,7 @@ diff --git a/gst/vaapi/gstvaapi.c
>> b/gst/vaapi/gstvaapi.c
>>   index 9a82454..4d94f2b 100644
>>   --- a/gst/vaapi/gstvaapi.c
>>   +++ b/gst/vaapi/gstvaapi.c
>> -@@ -210,7 +210,6 @@ plugin_init (GstPlugin * plugin)
>> +@@ -195,7 +195,6 @@ plugin_init (GstPlugin * plugin)
>>    {
>>      GstVaapiDisplay *display;
>>      GArray *decoders;
>> @@ -32,7 +32,7 @@ index 9a82454..4d94f2b 100644
>>    
>>      plugin_add_dependencies (plugin);
>>    
>> -@@ -235,10 +234,7 @@ plugin_init (GstPlugin * plugin)
>> +@@ -220,10 +219,7 @@ plugin_init (GstPlugin * plugin)
>>      gst_element_register (plugin, "vaapidecodebin",
>>          GST_RANK_PRIMARY + 2, GST_TYPE_VAAPI_DECODE_BIN);
>>    
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
>> vaapi_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
>> vaapi_1.16.0.bb
>> similarity index 93%
>> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-
>> vaapi_1.14.4.bb
>> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-
>> vaapi_1.16.0.bb
>> index 3896434104..4d7382a101 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
>> @@ -13,8 +13,8 @@ SRC_URI = "
>> https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
>>              file://0001-vaapsink-downgrade-to-marginal.patch \
>>              "
>>   
>> -SRC_URI[md5sum] = "2fae3442f5f23e7354a0c592bc7b9065"
>> -SRC_URI[sha256sum] =
>> "ce18dbfe961c6a8d31270231686075586bf7a7df62b778c8e7f5ec148251d0a3"
>> +SRC_URI[md5sum] = "8c3f9ee3e47cbdb75a94f7183460b721"
>> +SRC_URI[sha256sum] =
>> "4e7fce626ee0590dca74b5a8341d25bac76307945131a970b414fc5895f5171f"
>>   
>>   S = "${WORKDIR}/${REALPN}-${PV}"
>>   DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base
>> gstreamer1.0-plugins-bad"
>> -- 
>> 2.17.1
>>

