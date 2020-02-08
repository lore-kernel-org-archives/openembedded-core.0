Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFBA4605B8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 19:19:02 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id u10so1293960qvi.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 11:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xKrZbGbcNhatjrOmxXMMQQparRTJMs7QiHxITtJYjYQ=;
	b=eJThakehMpc7Smo++rGgDr7/bt8s2+5AVhQOEcElMzWqBiTP+NSn3g3tG7hjgEarkW
	wagLqxxl3dvY6CBsGZV8zhuL4HzUWiw7UyPq30cUdfFnBayuo7nI3ez/PeiQUE9ciUk8
	k75sXBrc63Y86q+trYa7W7d0bAXVq8gaA9AeUIDOom8DS5TOFTr/SGrd7cELVfsLJavD
	9dq2ZDU+yfS0Xc6KscowI4ViQ5SiKCzojfyeOuD6El/BVsnHeyvV6fh6z4EYw+0qRKjx
	TxQHkTJ66m+eU0EHPnBeSI8OgC0YGXPBxerO/qdUFeUPTXPc5zGJtiGubulQBBwWJuiG
	eGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xKrZbGbcNhatjrOmxXMMQQparRTJMs7QiHxITtJYjYQ=;
	b=NqfKOkhMbFya5TvMQTufTyjnZerk3/SXy15Ymi11eUFGO2KuGucXVV6jqENOhWMiM1
	7h27pT6ceto4x39y6zL0w9qWQBrUBXtUWn9iFPpuhtG+DowCe4TB0V6lNBrNkP8pta/p
	3pwDK5ZYbMfFQFoS4KnKQpVikM+0MzXUqFPTTww4AEMlPvNBRaeeHJq7ELoHICKJuiGh
	33l+zf8AAjQ27Sec7dlJ/WMxrfl4SWKO8uVQM7qaR9kZrFZh3HAjmbrNx5YG2FySZjWu
	4lOOmbMy7m+vFRGlc42CCNRZsxKEOgZw9gjhseZdx9W118kw/f+l7VQaaLFr/Pl+TJ3e
	hqyQ==
X-Gm-Message-State: APjAAAUWfDINC0tZ0Qu8/pyCgEAvhTGklOGiWj251/mRNz0SAJqRZRnY
	sS43pWnDImdTZHtIxpJEnCauiX/3XiUZaNNKDIc=
X-Google-Smtp-Source: APXvYqzs7TfcWHyOknvouNcHXjQC2S4g0Xg/LE3OC1YLjnMOzKq4VtmZjjAlBRmC8Eh8K3zjD45ftBS+V97VHrjeciw=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr3887820qvm.206.1581189543083; 
	Sat, 08 Feb 2020 11:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20200208000110.29065-1-scott.branden@broadcom.com>
	<CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
	<55bb9c66-a419-c43d-111b-e5442db8df91@broadcom.com>
In-Reply-To: <55bb9c66-a419-c43d-111b-e5442db8df91@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Feb 2020 11:18:37 -0800
Message-ID: <CAMKF1spFfVojndyrOXa6TFXHUO-DNR3xr3Dj7jwGa8g--Pdz1Q@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
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
X-List-Received-Date: Sat, 08 Feb 2020 19:19:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 8:02 PM Scott Branden <scott.branden@broadcom.com> wrote:
>
> Hi Khem,
>
> On 2020-02-07 5:12 p.m., Khem Raj wrote:
>
>
>
> On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>>
>> Add x265 recipe from latest revision of stable branch.
>
>
> I wonder if it belongs to core are there deps on it that we need in common metadata
>
> I simply followed where x264 recipe is located and placed x265 beside it.
> Both are needed when enabled in ffmpeg.
>
> I don't know if that answers your question as to where they should be located.
>>

idea is to keep small and therefore we should assess the inclusions in core
we have many packageconfigs which require packages from other layers
so if ffmpeg needs it and is optional then it should be fine to keep
it in meta-multimedia and packageconfig in ffmpeg disabled by default.

>>
>>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>  meta/recipes-multimedia/x265/x265_git.bb | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>>
>> diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
>> new file mode 100644
>> index 0000000000..796fbbc13a
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/x265/x265_git.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "H.265/HEVC video encoder"
>> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>> +
>> +LICENSE = "GPLv2"
>> +LICENSE_FLAGS = "commercial"
>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>> +
>> +DEPENDS = "gnutls zlib libpcre"
>> +
>> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
>> +          "
>> +
>> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>> +
>> +S = "${WORKDIR}/git/source"
>> +
>> +inherit lib_package pkgconfig cmake
>> +
>> +AS[unexport] = "1"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

