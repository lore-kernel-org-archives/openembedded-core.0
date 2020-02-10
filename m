Return-Path: <scott.branden@broadcom.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3BFD4608E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 06:15:38 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a6so2402427plm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 22:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=s989MW6nBLKIHnqA8JkmHvfW/viUSUMufOekW9B+SCc=;
	b=TcL6Fy8afGWzL88h74ziW2YtYyvjbxlDRNF1561cWr0Euw2PWFqIS27QXHMj3bkUZj
	cBEqO8jgO5H/VmdN3TrvP0PqhDw4JnNppEVCcuwP9Y8vaNgGQgmYpTPWST/uj527bX2q
	WVUGZn/Kgop93RLEJkkXASYXpdz3GfguI7tf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=s989MW6nBLKIHnqA8JkmHvfW/viUSUMufOekW9B+SCc=;
	b=L8rdLOCW73OlAxGWbUnXC9ByfQsFhbkKYvNRCNZ/3cF3BIWst/ihrAoma/UJXsIyUQ
	JVV7yBQ6q6TUIT9QYhBuIksWfIV8QB1DErGubUTFSTCqoe8zeoS8G6i02XInAbHQT/dO
	o/Rc+s2DdU8bBwQSaifzLB3AYI4Rpfa6nKH8uVhvjRz+jh6iEO7sWuUu2kB7ffC7Vwsv
	gXYwxk4rG80gy7ICZ6bQD30WXnW30fcvpGc6wRcwrstzOSR5ZGPDEe7EIJz0ttHkQDWz
	AWmWQyfpeqjeM9dmJtcxj3/Xz+4x3SyPBqpWWRwYksbdNGDOpuIdWlWahh8v85473Y8K
	BWJA==
X-Gm-Message-State: APjAAAUiaxvmb9jwQe/0RLPq6ahw+TrG6einoIxEQEoHtqlsH9BhHcEq
	qxcHkBnpBeiQy0BqlxPW745ex3zkDI0qa2jY2l7k6OG0KC/ltoaP26zRBaA3eiGlbASLmhYP9h7
	b7lrdTvUlXFeUcZmWmchXdgL5t81ocmUPryQhoAeG+hIeegGyp6MZ5PS4281JsjwIo25i0xGiVI
	3jxe45vlRt0U3t+fMeUegxKxhbYGk=
X-Google-Smtp-Source: APXvYqx7xBOk7qpIkiUSJeG61ak9GlKnG0eCckGVQUfmAti8wK4PZyaBPa9kDr3roZIR7MKECGIoyA==
X-Received: by 2002:a17:902:b612:: with SMTP id
	b18mr10810556pls.318.1581315338681; 
	Sun, 09 Feb 2020 22:15:38 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id u2sm10907339pgj.7.2020.02.09.22.15.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 09 Feb 2020 22:15:38 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <20200208000110.29065-1-scott.branden@broadcom.com>
	<CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
	<55bb9c66-a419-c43d-111b-e5442db8df91@broadcom.com>
	<CAMKF1spFfVojndyrOXa6TFXHUO-DNR3xr3Dj7jwGa8g--Pdz1Q@mail.gmail.com>
	<2159565f-eaca-697d-0711-e39aeccb1ba2@broadcom.com>
	<CAMKF1srW_aR=4TZBxTdnTXwRWZg0u7TDhiNme9JsE8NSzXy_sw@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <6cf5b86f-5055-0573-61ab-ad4717af5c2d@broadcom.com>
Date: Sun, 9 Feb 2020 22:15:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srW_aR=4TZBxTdnTXwRWZg0u7TDhiNme9JsE8NSzXy_sw@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Feb 2020 06:15:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2020-02-09 3:35 p.m., Khem Raj wrote:
> On Sun, Feb 9, 2020 at 11:27 AM Scott Branden
> <scott.branden@broadcom.com> wrote:
>>
>>
>> On 2020-02-08 11:18 a.m., Khem Raj wrote:
>>> On Fri, Feb 7, 2020 at 8:02 PM Scott Branden <scott.branden@broadcom.com> wrote:
>>>> Hi Khem,
>>>>
>>>> On 2020-02-07 5:12 p.m., Khem Raj wrote:
>>>>
>>>>
>>>>
>>>> On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>>>> Add x265 recipe from latest revision of stable branch.
>>>> I wonder if it belongs to core are there deps on it that we need in common metadata
>>>>
>>>> I simply followed where x264 recipe is located and placed x265 beside it.
>>>> Both are needed when enabled in ffmpeg.
>>>>
>>>> I don't know if that answers your question as to where they should be located.
>>> idea is to keep small and therefore we should assess the inclusions in core
>>> we have many packageconfigs which require packages from other layers
>>> so if ffmpeg needs it and is optional then it should be fine to keep
>>> it in meta-multimedia and packageconfig in ffmpeg disabled by default.
>> I don't see why x264 would be in core and x265 in meta-multimedia.
>> Both should be moved to meta-multimedia then?
>>
> I followed the thread a bit and I see there are followups where
> usecase for other recipes in core is now
> established, where this seemed a leaf package being added to oe-core,
> So perhaps it should be added
> to validation loops as well like x264.
I leave it to the powers that be to decide where to place this recipe.
>
>> I think you would also require a bbappend to fffmpeg recipe to add x264
>> and x265 to ffmpeg packageconfig.
>> if that is the case, why not move ffmpeg to meta-multimedia as well?
>>
> You would not go down that line of thought since these packages are in
> the dependency chain for validating reference
> images in core along with they being used by other packages from other layers.
>
>>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>>>> ---
>>>>>    meta/recipes-multimedia/x265/x265_git.bb | 20 ++++++++++++++++++++
>>>>>    1 file changed, 20 insertions(+)
>>>>>    create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>>>>>
>>>>> diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
>>>>> new file mode 100644
>>>>> index 0000000000..796fbbc13a
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-multimedia/x265/x265_git.bb
>>>>> @@ -0,0 +1,20 @@
>>>>> +SUMMARY = "H.265/HEVC video encoder"
>>>>> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
>>>>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>>>>> +
>>>>> +LICENSE = "GPLv2"
>>>>> +LICENSE_FLAGS = "commercial"
>>>>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>>>>> +
>>>>> +DEPENDS = "gnutls zlib libpcre"
>>>>> +
>>>>> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
>>>>> +          "
>>>>> +
>>>>> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>>>>> +
>>>>> +S = "${WORKDIR}/git/source"
>>>>> +
>>>>> +inherit lib_package pkgconfig cmake
>>>>> +
>>>>> +AS[unexport] = "1"
>>>>> --
>>>>> 2.17.1
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


