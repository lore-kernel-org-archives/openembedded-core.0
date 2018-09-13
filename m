Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 32FFC7992F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 17:34:38 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j9-v6so2022858otl.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fitU53prS0s9DCxEnG5KXsQcHEGBG6PMk63ahnDT5AM=;
	b=kN+7l/2DaN3v1dZ0G3aCfJMaZ1VYRse+zu/7Z7wiWjRXXgGUyw/t1DPgQ+epjzA9L6
	nzPEqSgsB19V4LbGptb+Y3zOvb7xq38RU4Wk/04FhvXa8PfDNMEdli/atlwnekMj1RUT
	QLXOE0HhYz2a0p0rnqB/yiT++l1W1w9TPWIigUsnPJrvjT+OiZcGHcqMPNLcPPIpk+ww
	4EM7MQv4bikzssYG/nxBzC1HnojOnLLihfgJ/yS+fA0tSVHoQmdXmdYOVWkBfsGyEpA6
	KidoZJ5ftFb+Z9oFk19gEPMyW0WgjRnly+HkvvMXfsL5nK9UdMjilsAe3lDLMtq/1PCp
	yxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fitU53prS0s9DCxEnG5KXsQcHEGBG6PMk63ahnDT5AM=;
	b=jsvfOZSkhr75xFW86YMpehJyRNUAhILxySgt4T+5AZh1k9F2qfNRVW1Md8qZ9Kt+aM
	IwNVxUxcrcXgB9W5WQCe6UT2+d5QyCsYwJ8I4wi35HEk+F3UyJPZQW6JXbxz3zkw+ykg
	kYJC61ElqnVljJ/NRKmCo10uZgBO9dZwLTGqZNYTfjF6Q4UXVK3beU0uHowt5Pz01DJ4
	uwTFfueQQbFVsjwlMf2tn7A7kMLWC/+Y0hceNxkAL3JNg8b1ngVsGrCeoKsMNTjKfLIF
	ofrALUxZyasu/AQyZ+t+z9Hndq7cOSaFOdO0WdgCxKpV4i0SqGqpGaZKSXnAL6F40VUi
	/Bjw==
X-Gm-Message-State: APzg51A0x/Ft/ZIgNNERN73x7zMk/wdW0BiuvOYLiqrrrrvkBpl/TFw6
	MPIVx8MIe75Shb5TBprYgq6zM/BIPlGPN85klov9TneE
X-Google-Smtp-Source: ANB0VdZbzuAjFxeI0P1R6rjDwibcdKCoqO78hmZujm+q++yEAxX3iteYsIICQwgxDeJAAGe6dKiPOku0epOhCGa3YFY=
X-Received: by 2002:a9d:844:: with SMTP id 62-v6mr1810783oty.159.1536860079966;
	Thu, 13 Sep 2018 10:34:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Thu, 13 Sep 2018 10:34:19 -0700 (PDT)
In-Reply-To: <CAMKF1spTqL8tug6OAcAeo6EPNysTiadQj+xhKrs==G-szv4f4g@mail.gmail.com>
References: <20180911093750.5460-1-ross.burton@intel.com>
	<CAMKF1spTqL8tug6OAcAeo6EPNysTiadQj+xhKrs==G-szv4f4g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Sep 2018 18:34:19 +0100
Message-ID: <CAJTo0LYf54zjQriGe6KkCG+5iD=ArRVjFegraOJrMTjJMYz14g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] yasm: remove
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
X-List-Received-Date: Thu, 13 Sep 2018 17:34:39 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, sorry, I've a patch here but didn't send it.  I'll submit it later today.

As yasm is a fork of nasm, there's a good chance that either can be used.

Ross

On 13 September 2018 at 17:39, Khem Raj <raj.khem@gmail.com> wrote:
> There are packages in other layers e.g. firefox which still depend on
> yasm. Can we move it to meta-oe instead of completely dropping it.
> On Tue, Sep 11, 2018 at 2:38 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Nothing in oe-core is using yasm now that gstreamer-libav and ffmpeg are using
>> nasm, so remove it from oe-core.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc |  1 -
>>  meta/recipes-devtools/yasm/yasm_1.3.0.bb | 16 ----------------
>>  2 files changed, 17 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/yasm/yasm_1.3.0.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index 2ecc3d61e38..0c65e8f816c 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -732,6 +732,5 @@ RECIPE_MAINTAINER_pn-xvideo-tests = "Maxin B. John <maxin.john@intel.com>"
>>  RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
>>  RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
>>  RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
>> -RECIPE_MAINTAINER_pn-yasm = "Yi Zhao <yi.zhao@windriver.com>"
>>  RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
>>  RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
>> diff --git a/meta/recipes-devtools/yasm/yasm_1.3.0.bb b/meta/recipes-devtools/yasm/yasm_1.3.0.bb
>> deleted file mode 100644
>> index 31af1e287e9..00000000000
>> --- a/meta/recipes-devtools/yasm/yasm_1.3.0.bb
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
>> -LICENSE = "BSD"
>> -HOMEPAGE = "http://www.tortall.net/projects/yasm/"
>> -
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=a12d8903508fb6bfd49d8d82c6170dd9"
>> -
>> -SRC_URI = "http://www.tortall.net/projects/yasm/releases/${BP}.tar.gz"
>> -
>> -SRC_URI[md5sum] = "fc9e586751ff789b34b1f21d572d96af"
>> -SRC_URI[sha256sum] = "3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f"
>> -
>> -export CCLD_FOR_BUILD = "${CC_FOR_BUILD}"
>> -
>> -inherit autotools gettext
>> -
>> -BBCLASSEXTEND = "native"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

