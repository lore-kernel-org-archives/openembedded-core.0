Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id AEBA5784F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 16:31:55 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id s21-v6so3051130pfm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mvUsMifvkn3FT++OTa4Suz5/jJme7YXjVnjwvlXo4KA=;
	b=crc2HotjaxuegtyFdMUUOZmPxB8f4W5U9vbC0sV6GoYOmmFfDzYnzQx4DkcA+hS151
	p1fRjHeqI/YFxDpl+KN+5ckzWQRazNQsK33XB2I4JRHjWdPE7MnlnAsRSImkY8QiZ4rt
	pMd9pEjg9dbCXCZO0FnP0qgGulY5B/icDJFVuf3879mO6Vle2tTUM0G1yr8s2JnjgDgR
	HCWcAWRuP6+XSkfajDoalPU9jwmEw6D48a+rOQ3RshKKA9fMIFlz6hUkxABQFsdH+9c/
	3s5ToRNHlSq6h/X+bIqfpgtIgg6OouNjFR30IFW8PIbnmauPhUHCGekLus8Usjj+8VQb
	p1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=mvUsMifvkn3FT++OTa4Suz5/jJme7YXjVnjwvlXo4KA=;
	b=grnQh5NMp9yrT02rWUamRCRPwVJE99br3E22GHYoRDTFT2JRa+QArRJutrFro4qZst
	fmVRWpLgGFshWeXZQRVeyq5D0Ik1OGP4yF5BXAyh8YLJiDqTkCpZ5dmXjVcR2l/KPKoj
	DVry/AqPKuxqtyVfLxc/q7l80fPhdIuLDrsuTRqShfsk5Jg7csuJH8iCRDhH1WVWBzjX
	GVC03zLcnCNjnczb8IfjTqgRaS2RBY6/5BJa317X/n7JHS+kav3Jdypr9Jnfe0+06veG
	A3qcaAI2auOXoqX6ZkZsm1ZUHRgrcLoxjmI18rtHuC2ULde9MEf3OX6ac9XVL18RfHRO
	qN1Q==
X-Gm-Message-State: APt69E3AxiQH0+ktCGmp0QYmPCcoFC9jxCdEUBBpAWT6p27JbfhVFwGE
	EpdX5zhBbARY+WRVHoH2RHiqwz9M
X-Google-Smtp-Source: AAOMgpdEa2BHIFyNknFMa4xCA/N1zxnDwGkAREHj2OxZTdsF3BmdG6hpOEJVsdZ3oE5mbYX9+tAJgw==
X-Received: by 2002:a62:f587:: with SMTP id
	b7-v6mr2906761pfm.158.1530721916186; 
	Wed, 04 Jul 2018 09:31:56 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:1caa:7afc:f307:5930])
	by smtp.gmail.com with ESMTPSA id
	r6-v6sm6070212pgv.0.2018.07.04.09.31.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jul 2018 09:31:55 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180704001137.41385-1-raj.khem@gmail.com>
	<CAJTo0LY75OXe6AmZvdOkT2LRe58k9ZEzgYBtf_xbqnhu7waY=A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <693877c1-05a2-85c0-3c42-97ab4b056fe0@gmail.com>
Date: Wed, 4 Jul 2018 09:31:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY75OXe6AmZvdOkT2LRe58k9ZEzgYBtf_xbqnhu7waY=A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa: Fix bild with waylang and egl
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
X-List-Received-Date: Wed, 04 Jul 2018 16:31:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/4/18 9:28 AM, Burton, Ross wrote:
> FWIW historically we just prepended PKG_CONFIG_SYSROOT or whatever the
> spelling was to the result of the pkg-config calls.  I didn't know
> about PKG_CHECK_VAR before, that's really useful!
> 

indeed it is.

> Have you tried pushing this upstream?  

No, not yet, PKG_CHECK_VAR would need pkgconfig 0.28+, for upstreaming 
we would need to account for that as well and also upstreaming has to 
agree to bumping minimum pkgconfig version to 0.28

Also note that I've a branch
> moving Mesa to Meson so we'll need to fix this again...
> 
> Ross
> 
> On 4 July 2018 at 01:11, Khem Raj <raj.khem@gmail.com> wrote:
>> When we have wayland enabled with egl then it enables the wayland
>> plugin which actually fails to build because its not finding wayland-protocol
>> xml templates in proper location which is recipe sysroot since
>> we are cross compiling
>>
>> Fixes build errors e.g.
>> make[4]: *** No rule to make target `//usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml', needed by `drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h'.  Stop.
>> make[4]: *** Waiting for unfinished jobs....
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> V2: Rebase on master
>>
>>   ...ss-compile-WAYLAND_PROTOCOLS_DATADIR.patch | 24 +++++++++++++++++++
>>   meta/recipes-graphics/mesa/mesa.inc           |  2 ++
>>   meta/recipes-graphics/mesa/mesa_18.1.3.bb     |  1 +
>>   3 files changed, 27 insertions(+)
>>   create mode 100644 meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
>>
>> diff --git a/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch b/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
>> new file mode 100644
>> index 0000000000..b4e3c4995f
>> --- /dev/null
>> +++ b/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
>> @@ -0,0 +1,24 @@
>> +use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
>> +
>> +This allows to override the wayland-protocols pkgdatadir with the
>> +WAYLAND_PROTOCOLS_DATADIR from environment.
>> +
>> +pkgconfig would return an absolute path in /usr/share/wayland-protocols
>> +for the pkgdatadir value, which is not suitable for cross-compiling.
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream-Status: Pending
>> +
>> +Index: mesa-18.1.2/configure.ac
>> +===================================================================
>> +--- mesa-18.1.2.orig/configure.ac
>> ++++ mesa-18.1.2/configure.ac
>> +@@ -1808,7 +1808,7 @@ for plat in $platforms; do
>> +         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >= $WAYLAND_REQUIRED])
>> +         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >= $WAYLAND_REQUIRED])
>> +         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
>> +-        WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
>> ++        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
>> +
>> +         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
>> +
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index d1723e3506..fed2900577 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -109,6 +109,8 @@ FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>>
>>   CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
>>
>> +EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
>> +
>>   # Remove the mesa dependency on mesa-dev, as mesa is empty
>>   RDEPENDS_${PN}-dev = ""
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa_18.1.3.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
>> index c47c57e9d8..6af1216b79 100644
>> --- a/meta/recipes-graphics/mesa/mesa_18.1.3.bb
>> +++ b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
>> @@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>>              file://0006-Use-Python-3-to-execute-the-scripts.patch \
>>              file://0007-dri-i965-Add-missing-time.h-include.patch \
>>              file://0008-egl-fix-build-race-in-automake.patch \
>> +           file://cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "b34273403a605f6f98ead00f0bdf8e0b"
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

