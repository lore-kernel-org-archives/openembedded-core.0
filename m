Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 46B237E425
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 15:48:35 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id DD8CCA1066
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 17:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1559231288; bh=gcCrXvNxbhAeoC6IVghzjXxZ5zdWyK0PPy4ATNkcCno=; b=s
	OyeJA1eYBMPTZYU1WgXT/xRuxeaGAwNbkDV/ZNeFwMgtFyEBWVMcZBXxaTv0reZ/
	7WPRuj703pv9CXElJVuMQ5l2qzIb8OBkhIWR8eENaHoBeY02Ph0m72RNVKvPY/es
	lcwOBqQsmo68dyC1sQNuEU1yIdaEk3StY1oDAbRmEzh2yKaSiqJIQMDo2klJ6+5F
	Y6wkjEwgY5ytUpD+Qt9bE90Ds+gflctKe/siQURGZvzMCJQRiDAAeGaUuxZlNdm6
	kho2KQiwpNcDv4nGcG8udWEMYAUqBysuHzb5qxt+1inCDscBbD1ZOXBrdCWqHnw6
	SbaWkroQdvNSaoDrC1qng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559231307; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:mime-version:
	content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=9ZcVWVexJe8DWf0xmDWrHmnIq9OmUCaw2q24vXyb9OQ=;
	b=J+H2seXriSKcAFqJRbgKA6sAmHUeJDRVlmBJpYpm/R9Jqur0DGcEZqzP4AuVoWal5NsLrl
	lUcKhZpPOk3bqL2kb3jbfidOA7p1A9O7wcm3UL8mXmDfy8tHD75iBslVhjbqdtFeDOxmdV
	hdOGV3ZCFSh8CSUAlLQRuvMYhe2adhsVnyiW+dGt77IQoI2Wq/6xTV+JLtzwk9T7yVfV7I
	OTuZuLjBEkjwaHJKtCZy6HMlH7lN0wh21035uAeO0uaeZ55kMbr/5YLnHa2iDIUZqP0vRt
	vh69YF0XlGPVl4wyYODPp6Pn93fNSozynEUoyAceluF90eO6XD7FMAuWqXwb6Q==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id 8hEryeUhN6z4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 17:48:08 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20190526110642.5341-1-crg7475@mailbox.org>
	<20190526110642.5341-8-crg7475@mailbox.org>
	<bf1e68db18dc3517178df3810324c09c3954adf8.camel@intel.com>
	<a9e2fb9e-b4b9-93ea-a516-c8e5e5c3e854@mailbox.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <a4574a15-40c7-893e-1bc8-976fce816a0f@mailbox.org>
Date: Thu, 30 May 2019 17:48:07 +0200
MIME-Version: 1.0
In-Reply-To: <a9e2fb9e-b4b9-93ea-a516-c8e5e5c3e854@mailbox.org>
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
X-List-Received-Date: Thu, 30 May 2019 15:48:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Nevermind. Found it. It is in wayland-native.


On 30.05.19 17:39, Carlos Rafael Giani wrote:
> Yep, wayland-protocols was missing. I just added it.
>
> The other problem is odd. wayland is added as a dependency:
>
>     PACKAGECONFIG[wayland] = 
> "--enable-wayland,--disable-wayland,wayland wayland-protocols"
>
> and yet wayland-scanner is not installed in the recipe-sysroot-native 
> folder. The wayland-scanner binary is part of wayland-dev.
>
> Am I forgetting something?
>
>
> On 28.05.19 00:28, Mittal, Anuj wrote:
>> Looks like this needs a dependency on wayland-scanner and wayland-
>> protocols as well for this version?
>>
>> Error log from autobuilder:
>>
>> https://errors.yoctoproject.org/Errors/Details/247143/
>>
>> Thanks
>> Anuj
>>
>> On Sun, 2019-05-26 at 13:06 +0200, Carlos Rafael Giani wrote:
>>> Signed-off-by: Philippe Normand <philn@igalia.com>
>>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>>> ---
>>> .../0001-vaapsink-downgrade-to-marginal.patch | 4
>>> ++--
>>>   ...reamer1.0-vaapi_1.14.4.bb => gstreamer1.0-vaapi_1.16.0.bb} | 4
>>> ++--
>>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-
>>> vaapi_1.14.4.bb => gstreamer1.0-vaapi_1.16.0.bb} (93%)
>>>
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
>>> vaapi/0001-vaapsink-downgrade-to-marginal.patch b/meta/recipes-
>>> multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-
>>> marginal.patch
>>> index c861f3bed2..7945a923c9 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-
>>> vaapsink-downgrade-to-marginal.patch
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-
>>> vaapsink-downgrade-to-marginal.patch
>>> @@ -24,7 +24,7 @@ diff --git a/gst/vaapi/gstvaapi.c
>>> b/gst/vaapi/gstvaapi.c
>>>   index 9a82454..4d94f2b 100644
>>>   --- a/gst/vaapi/gstvaapi.c
>>>   +++ b/gst/vaapi/gstvaapi.c
>>> -@@ -210,7 +210,6 @@ plugin_init (GstPlugin * plugin)
>>> +@@ -195,7 +195,6 @@ plugin_init (GstPlugin * plugin)
>>>    {
>>>      GstVaapiDisplay *display;
>>>      GArray *decoders;
>>> @@ -32,7 +32,7 @@ index 9a82454..4d94f2b 100644
>>>         plugin_add_dependencies (plugin);
>>>    -@@ -235,10 +234,7 @@ plugin_init (GstPlugin * plugin)
>>> +@@ -220,10 +219,7 @@ plugin_init (GstPlugin * plugin)
>>>      gst_element_register (plugin, "vaapidecodebin",
>>>          GST_RANK_PRIMARY + 2, GST_TYPE_VAAPI_DECODE_BIN);
>>>    diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
>>> vaapi_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
>>> vaapi_1.16.0.bb
>>> similarity index 93%
>>> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-
>>> vaapi_1.14.4.bb
>>> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-
>>> vaapi_1.16.0.bb
>>> index 3896434104..4d7382a101 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
>>> @@ -13,8 +13,8 @@ SRC_URI = "
>>> https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
>>>              file://0001-vaapsink-downgrade-to-marginal.patch \
>>>              "
>>>   -SRC_URI[md5sum] = "2fae3442f5f23e7354a0c592bc7b9065"
>>> -SRC_URI[sha256sum] =
>>> "ce18dbfe961c6a8d31270231686075586bf7a7df62b778c8e7f5ec148251d0a3"
>>> +SRC_URI[md5sum] = "8c3f9ee3e47cbdb75a94f7183460b721"
>>> +SRC_URI[sha256sum] =
>>> "4e7fce626ee0590dca74b5a8341d25bac76307945131a970b414fc5895f5171f"
>>>     S = "${WORKDIR}/${REALPN}-${PV}"
>>>   DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base
>>> gstreamer1.0-plugins-bad"
>>> -- 
>>> 2.17.1
>>>

