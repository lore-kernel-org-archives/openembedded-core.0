Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id D05E060F52
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 19:27:47 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gv17so3233016pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 11:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Z0ByQWTSiTlh5Xq/6A79rPTjT0fE+AVKFUiirT8KmNY=;
	b=WqrlaH3E3AeeraoaTKf9qRQpn+uaffmRVdeRdGx5UCD77+Nzwf6rw4Xeb0Rj4Yfzrn
	z0ZRxrgkic7DuhSnUU13rvKLKNP7lXtqx3DDBuflnpO+CZb09yWDreTCKqFA9cSqn0pE
	WD41fiowCQt4URDuG9x5bv6lwPPL/emVzooQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Z0ByQWTSiTlh5Xq/6A79rPTjT0fE+AVKFUiirT8KmNY=;
	b=cXY4UFnWb88BdbF/wopTvpX+M9oJTP6sWCXFMsLDC3QB8puu4OBl+X0qppgMv7zKA+
	XE3FfNzVBC7Uo9+WaSrVxO2igyT00YbLW4fX0eoFsBPYUD1ArwjXaVIX0y2T+qa0rp0d
	lJjmJzc9wJt7a2w8CbPAEL+1+42nR/7aK+cUEI93IPlSQl1E/C8xiiKLRIHRpnzb/FjH
	+Pg4AtBKcaVGRoknP7AplK7Gum5D/2X5VPPVxBv80dnFOdDNxNP8GIGQHv1xJOMV74cz
	/ev+udMUcVuYszYhN13SMBF2CSLeLVcQXRuAi/0FegMBiuw1qCvBP6/AMLu94ioHZokm
	mlcQ==
X-Gm-Message-State: APjAAAWQlFWskIeWgmxqnz8lzSIyVgBSUPBuHXvWhqYjj0WvyVh48WRA
	Oa8Qt7nKAdO/Nc8UfHByn2o4KkIYColYsCiuBtuU86sNDA5soRp2f4kMfNUGezKCa1Tp7jANXSr
	/EFhdm44xBOpB2FlxzfLTLEa72yGfpbzo9+wwZvUk8Le6xjTlX/OStpq+tK3vXBu4r44EalsUjM
	4SBWAXhmLyqBh5IjMjBrD57PE7DOc=
X-Google-Smtp-Source: APXvYqzlwOjnri1Ds9YtO2MEMzEESLM/J+eNMEoSpM40UKk9cLSArO/rLNHM6ws6ScCjROWQLvLm3w==
X-Received: by 2002:a17:90a:e653:: with SMTP id
	ep19mr17047336pjb.58.1581276468261; 
	Sun, 09 Feb 2020 11:27:48 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	y76sm10186274pfc.87.2020.02.09.11.27.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 09 Feb 2020 11:27:47 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <20200208000110.29065-1-scott.branden@broadcom.com>
	<CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
	<55bb9c66-a419-c43d-111b-e5442db8df91@broadcom.com>
	<CAMKF1spFfVojndyrOXa6TFXHUO-DNR3xr3Dj7jwGa8g--Pdz1Q@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <2159565f-eaca-697d-0711-e39aeccb1ba2@broadcom.com>
Date: Sun, 9 Feb 2020 11:27:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spFfVojndyrOXa6TFXHUO-DNR3xr3Dj7jwGa8g--Pdz1Q@mail.gmail.com>
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
X-List-Received-Date: Sun, 09 Feb 2020 19:27:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2020-02-08 11:18 a.m., Khem Raj wrote:
> On Fri, Feb 7, 2020 at 8:02 PM Scott Branden <scott.branden@broadcom.com> wrote:
>> Hi Khem,
>>
>> On 2020-02-07 5:12 p.m., Khem Raj wrote:
>>
>>
>>
>> On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>> Add x265 recipe from latest revision of stable branch.
>>
>> I wonder if it belongs to core are there deps on it that we need in common metadata
>>
>> I simply followed where x264 recipe is located and placed x265 beside it.
>> Both are needed when enabled in ffmpeg.
>>
>> I don't know if that answers your question as to where they should be located.
> idea is to keep small and therefore we should assess the inclusions in core
> we have many packageconfigs which require packages from other layers
> so if ffmpeg needs it and is optional then it should be fine to keep
> it in meta-multimedia and packageconfig in ffmpeg disabled by default.
I don't see why x264 would be in core and x265 in meta-multimedia.
Both should be moved to meta-multimedia then?

I think you would also require a bbappend to fffmpeg recipe to add x264 
and x265 to ffmpeg packageconfig.
if that is the case, why not move ffmpeg to meta-multimedia as well?

>
>>>
>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>> ---
>>>   meta/recipes-multimedia/x265/x265_git.bb | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>   create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>>>
>>> diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
>>> new file mode 100644
>>> index 0000000000..796fbbc13a
>>> --- /dev/null
>>> +++ b/meta/recipes-multimedia/x265/x265_git.bb
>>> @@ -0,0 +1,20 @@
>>> +SUMMARY = "H.265/HEVC video encoder"
>>> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
>>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>>> +
>>> +LICENSE = "GPLv2"
>>> +LICENSE_FLAGS = "commercial"
>>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>>> +
>>> +DEPENDS = "gnutls zlib libpcre"
>>> +
>>> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
>>> +          "
>>> +
>>> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>>> +
>>> +S = "${WORKDIR}/git/source"
>>> +
>>> +inherit lib_package pkgconfig cmake
>>> +
>>> +AS[unexport] = "1"
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


