Return-Path: <scott.branden@broadcom.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA2160926
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 21:17:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w12so9615266wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 13:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=bZl10uvczpa12aSXU+mh5QEBusoYcbMPDHg1rtE63fA=;
	b=ZaGQR5oN9zB9LELvjZHvHC+kLsUKMAejxdrjq262ALrA+vUJLSvebW8qoN7hLaAFgz
	6L3GriRDOqGzvcbvOGFDnUxcFwhWKDamnUKkpgJS9Yth5qe7wu6jsxmhT+Cr5xebwG0m
	/FiU9CDXQzdCgAd1fEMvZh9cQcyo+hctcwf/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bZl10uvczpa12aSXU+mh5QEBusoYcbMPDHg1rtE63fA=;
	b=js8Gw/MoODJnHA+h6+n0GQXEgtQ81ImwEhDILNqOwUwVh9lvzH1gocdcNkR0LGM2PS
	sHojTV13vMHrO3VyynbheuLBop4iAmu5SjY/vVdwvo01skdLHvasKdbxAmbSgHYGLnsP
	oB6V7caALtB5FkXZkGy+xeyVJ9mGWYgS2wMLxc4aQ2pGUDQ8AhQSvZw0M4JbkhejFsWa
	EWyolaJPWdp5wmjm3Df7Z05q3xTV8Hnah+dGa9k1bk5pOiJuDqZUycda+z/jG0xBzzEp
	0a3xCgbKbvVAgvjF4c/t2B1C22th5RBNZRHuyrXoGfLO2Qt1vIMHlzol9rtppEIO/dUB
	YM5w==
X-Gm-Message-State: APjAAAV24dNFkEFjNAL0o2VbQFa+KVnyP2Z+LiCc1xqXW2AF2rWZVL2y
	jur/U3iBfDSbcCBnuVhWSAMbGafdXZb0QWftqBP7ZUf+e8ukJXxKmyrL97yTVyG2omB1cdtFMYk
	8cZ1+g3lifYmt+JhCxj/z6qTWmrM07kG21WFyB66qsHDMYn9ASxNGyNRgYgMWf8WEkgdVk0L/3u
	Bn5/HC1aYacrNUntkbFr4Wm314Kjs=
X-Google-Smtp-Source: APXvYqxzK3nlfqWwMDZ+cMJHYepWVj/abTBfK87RHsKWxHz6UTNCy1D4IbhuS8d7ElgVtUOFlbdHlQ==
X-Received: by 2002:adf:e543:: with SMTP id z3mr3745136wrm.369.1581369432837; 
	Mon, 10 Feb 2020 13:17:12 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	a16sm2155546wrt.30.2020.02.10.13.17.11
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 10 Feb 2020 13:17:12 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200208000110.29065-1-scott.branden@broadcom.com>
	<CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
	<55bb9c66-a419-c43d-111b-e5442db8df91@broadcom.com>
	<CAMKF1spFfVojndyrOXa6TFXHUO-DNR3xr3Dj7jwGa8g--Pdz1Q@mail.gmail.com>
	<2159565f-eaca-697d-0711-e39aeccb1ba2@broadcom.com>
	<CAMKF1srW_aR=4TZBxTdnTXwRWZg0u7TDhiNme9JsE8NSzXy_sw@mail.gmail.com>
	<6cf5b86f-5055-0573-61ab-ad4717af5c2d@broadcom.com>
	<CANNYZj_HaQAVfJ0f8jK2NXePovceXSZwJFdBMMVBSL4Fs_MqTw@mail.gmail.com>
	<CAMKF1spnPDqoOfSHs8tZSJGC54HnKk167sochq8MMh5X_ddu=w@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <871ad7a3-93ba-8f45-7b9b-2ae458782118@broadcom.com>
Date: Mon, 10 Feb 2020 13:17:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spnPDqoOfSHs8tZSJGC54HnKk167sochq8MMh5X_ddu=w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] x265: add x265 recipe
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
X-List-Received-Date: Mon, 10 Feb 2020 21:17:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2020-02-10 8:01 a.m., Khem Raj wrote:
> On Mon, Feb 10, 2020 at 3:42 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>> As long as we're consistent, I'm ok with either option. I think it's ultimately up to RP to make the call.
>>
>>
> The usecase is fine, as long as we add x265 support to gst plugins and
> ffmeg and it gets tested via reference
> images, I see no issues adding it.
I'm changing my opinion now and leaning toward meta-multimedia as Khem 
originally suggested.
For the simple reason that I think x265 only builds (easily) for x86 
based platforms.

That being the case:
we only add the packageconfig option to ffmpeg but don't enable by 
default in the PACKAGECONFIG default in the ffmpeg recipe.
PACKAGECONFIG[x265] = "--enable-libx265,--disable-libx265,x265"

And add the x265 recipe to meta-multimedia and limit to x86 at this time.
Is this what I would set in the x265 recipe?

COMPATIBLE_MACHINE_x86 = "(.*)"
COMPATIBLE_MACHINE_x86-64 = "(.*)"
>> Alex
>>
>> On Mon, 10 Feb 2020 at 07:16, Scott Branden via Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>>
>>>
>>> On 2020-02-09 3:35 p.m., Khem Raj wrote:
>>>> On Sun, Feb 9, 2020 at 11:27 AM Scott Branden
>>>> <scott.branden@broadcom.com> wrote:
>>>>>
>>>>> On 2020-02-08 11:18 a.m., Khem Raj wrote:
>>>>>> On Fri, Feb 7, 2020 at 8:02 PM Scott Branden <scott.branden@broadcom.com> wrote:
>>>>>>> Hi Khem,
>>>>>>>
>>>>>>> On 2020-02-07 5:12 p.m., Khem Raj wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>>>>>>> Add x265 recipe from latest revision of stable branch.
>>>>>>> I wonder if it belongs to core are there deps on it that we need in common metadata
>>>>>>>
>>>>>>> I simply followed where x264 recipe is located and placed x265 beside it.
>>>>>>> Both are needed when enabled in ffmpeg.
>>>>>>>
>>>>>>> I don't know if that answers your question as to where they should be located.
>>>>>> idea is to keep small and therefore we should assess the inclusions in core
>>>>>> we have many packageconfigs which require packages from other layers
>>>>>> so if ffmpeg needs it and is optional then it should be fine to keep
>>>>>> it in meta-multimedia and packageconfig in ffmpeg disabled by default.
>>>>> I don't see why x264 would be in core and x265 in meta-multimedia.
>>>>> Both should be moved to meta-multimedia then?
>>>>>
>>>> I followed the thread a bit and I see there are followups where
>>>> usecase for other recipes in core is now
>>>> established, where this seemed a leaf package being added to oe-core,
>>>> So perhaps it should be added
>>>> to validation loops as well like x264.
>>> I leave it to the powers that be to decide where to place this recipe.
>>>>> I think you would also require a bbappend to fffmpeg recipe to add x264
>>>>> and x265 to ffmpeg packageconfig.
>>>>> if that is the case, why not move ffmpeg to meta-multimedia as well?
>>>>>
>>>> You would not go down that line of thought since these packages are in
>>>> the dependency chain for validating reference
>>>> images in core along with they being used by other packages from other layers.
>>>>
>>>>>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>>>>>>> ---
>>>>>>>>     meta/recipes-multimedia/x265/x265_git.bb | 20 ++++++++++++++++++++
>>>>>>>>     1 file changed, 20 insertions(+)
>>>>>>>>     create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>>>>>>>>
>>>>>>>> diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000000..796fbbc13a
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/meta/recipes-multimedia/x265/x265_git.bb
>>>>>>>> @@ -0,0 +1,20 @@
>>>>>>>> +SUMMARY = "H.265/HEVC video encoder"
>>>>>>>> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
>>>>>>>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>>>>>>>> +
>>>>>>>> +LICENSE = "GPLv2"
>>>>>>>> +LICENSE_FLAGS = "commercial"
>>>>>>>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>>>>>>>> +
>>>>>>>> +DEPENDS = "gnutls zlib libpcre"
>>>>>>>> +
>>>>>>>> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
>>>>>>>> +          "
>>>>>>>> +
>>>>>>>> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>>>>>>>> +
>>>>>>>> +S = "${WORKDIR}/git/source"
>>>>>>>> +
>>>>>>>> +inherit lib_package pkgconfig cmake
>>>>>>>> +
>>>>>>>> +AS[unexport] = "1"
>>>>>>>> --
>>>>>>>> 2.17.1
>>>>>>>>
>>>>>>>> --
>>>>>>>> _______________________________________________
>>>>>>>> Openembedded-core mailing list
>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


