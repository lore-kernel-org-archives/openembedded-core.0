Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 41FF378432
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:32:58 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id o76-v6so3165272pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=O+a81z2GQ/5uGsDbTy9UEXTdeK6MB1NOSD/Ed52iK0A=;
	b=ZeVClCgB3ZNwN/CYAZ8UU0cW2QuIOOboC1t63IHKeycwE8l0Z29giqK75elAzRvdyK
	eJF3vWoEwXnYp7QA9uPbaW0o2LZOCNANPW7gR+lbyXhbXJafGGI3wU1kcjwO93i/CVVu
	R9cdzkASLB5Dinfy7UL81kH1T10nDslSSpLdMqYjBprb01281dijSyAGzNbddhlRzKlJ
	/AREkWFLYpJjEAJPcfBVk9CoV4Ih6KPHBTj4aSJN2jAus0hy7kfaDByjDaVBXGXwgJtt
	49/LcAN95jv9M49nsIFlOy2U+XjBzjmOqhpKGzy4qKGwd9RhSqVjheEfxdjA8aGSK/O9
	aR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=O+a81z2GQ/5uGsDbTy9UEXTdeK6MB1NOSD/Ed52iK0A=;
	b=unI6GD1mMHgD3OGasfVydlcGua1g5bcFB+rzWKMB0xVsZqRAlKK6zXzZ1vc9YLTdOs
	qyrCkEz0xE698LMXJWiJVaQaIiKh97I47nJt6bzkE+Nlm62D6EH9/DNhlbjlDy9lkz+u
	q+rjpyrdRHD82L55dUIdoUUG9n4jFVK0xk8kCEeonGmKk4Mn9L0pVXdjPC4QoclOu9zF
	ZcnoEqMJ6vgpLOE1F5Pkv9k2APjmFYmSmBExO34ebBZ5QrNUC7gWEP6HsR2fjZA7F3ir
	b6yXf68YVNIrN6sdkRZOodLSTM3SSlS/KTxIXAbIjI6kP2WD/64hRmfO+JejpC286H8A
	NDOw==
X-Gm-Message-State: ALKqPwdyf4DeFVTXNOZbR+nChFnNvsYShSYEImhNOWB0MviGuY+LqM+A
	yWEAMdvQLHbKC7kLDghvlaQBgQ==
X-Google-Smtp-Source: AB8JxZpcCmDQJuoW8WKgZPbLFo6SHcyGEn7NDkFLRrznafAttr/9vm4KrDBkcZP3lzBpR+38jCBpxw==
X-Received: by 2002:a62:ea1a:: with SMTP id t26-v6mr81680pfh.117.1526067179747;
	Fri, 11 May 2018 12:32:59 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:8061:c923:689d:cb43?
	([2601:202:4000:1184:8061:c923:689d:cb43])
	by smtp.gmail.com with ESMTPSA id
	c18-v6sm5556914pgu.63.2018.05.11.12.32.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 12:32:59 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>,
	"Huang, Jackie (Wind River)" <jackie.huang@windriver.com>
References: <20180315082445.8104-1-jackie.huang@windriver.com>
	<CAJTo0LavpHe=+2uJ=9JatGE_Yr1kLLwNA+v-kWNxmt=ReuLcnw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA015869526A@ALA-MBD.corp.ad.wrs.com>
	<CAJTo0LZ73iwvOtmFD_xbmtzCj=avFHtXqikwwRDL3Z5mjyeu+A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3354902d-1b59-4aa4-b853-5f4d7b2828ef@gmail.com>
Date: Fri, 11 May 2018 12:32:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ73iwvOtmFD_xbmtzCj=avFHtXqikwwRDL3Z5mjyeu+A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distcc: update to 3.3
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
X-List-Received-Date: Fri, 11 May 2018 19:32:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/10/2018 05:02 AM, Burton, Ross wrote:
> Hi Jackie,
>
> Did you get to look at the distcc 3.3 upgrade failures?  We're open
> again for updates and moving to 3.3 instead of a forked repository on
> Armin's personal github would be nice!
yes it would.

- armin
>
> Ross
>
> On 22 March 2018 at 01:09, Huang, Jackie (Wind River)
> <jackie.huang@windriver.com> wrote:
>> I will take a look and fix, thanks!
>>
>>
>>
>> Thanks,
>>
>> Jackie
>>
>>
>>
>> From: Burton, Ross [mailto:ross.burton@intel.com]
>> Sent: Wednesday, March 21, 2018 18:44
>> To: Huang, Jie (Jackie)
>> Cc: OE-core
>> Subject: Re: [OE-core] [PATCH] distcc: update to 3.3
>>
>>
>>
>> This fails to start under systemd so caused the QA to fail:
>>
>>
>>
>> https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/882/steps/Running%20Sanity%20Tests_7/logs/stdio
>>
>>
>>
>> Ross
>>
>>
>>
>> On 15 March 2018 at 08:24, <jackie.huang@windriver.com> wrote:
>>
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> * update to version 3.3
>> * Remove 0001-zeroconf-Include-fcntl.h.patch since it's
>>   included in v3.3
>> * Add update-distcc-symlinks into FILES.
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>  .../distcc/{distcc_3.2.bb => distcc_3.3.bb}        | 10 +++++---
>>  .../files/0001-zeroconf-Include-fcntl.h.patch      | 29
>> ----------------------
>>  2 files changed, 6 insertions(+), 33 deletions(-)
>>  rename meta/recipes-devtools/distcc/{distcc_3.2.bb => distcc_3.3.bb} (91%)
>>  delete mode 100644
>> meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
>>
>> diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb
>> b/meta/recipes-devtools/distcc/distcc_3.3.bb
>> similarity index 91%
>> rename from meta/recipes-devtools/distcc/distcc_3.2.bb
>> rename to meta/recipes-devtools/distcc/distcc_3.3.bb
>> index b6da65a582a..a266e7dde9b 100644
>> --- a/meta/recipes-devtools/distcc/distcc_3.2.bb
>> +++ b/meta/recipes-devtools/distcc/distcc_3.3.bb
>> @@ -14,14 +14,15 @@ PACKAGECONFIG[popt] =
>> "--without-included-popt,--with-included-popt,popt"
>>
>>  RRECOMMENDS_${PN} = "avahi-daemon"
>>
>> -SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
>> +SRC_URI = "git://github.com/distcc/distcc.git;branch=master \
>>             file://separatebuilddir.patch \
>> -           file://0001-zeroconf-Include-fcntl.h.patch \
>>             file://default \
>>             file://distccmon-gnome.desktop \
>>             file://distcc \
>>             file://distcc.service"
>> -SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
>> +
>> +SRCREV = "002e68b766ccd7ad05551e67d162b71a7a773d0d"
>> +
>>  S = "${WORKDIR}/git"
>>  UPSTREAM_VERSION_UNKNOWN = "1"
>>
>> @@ -60,9 +61,10 @@ PACKAGES += "distcc-distmon-gnome"
>>
>>  FILES_${PN} = " ${sysconfdir} \
>>                 ${bindir}/distcc \
>> -    ${bindir}/lsdistcc \
>> +               ${bindir}/lsdistcc \
>>                 ${bindir}/distccd \
>>                 ${bindir}/distccmon-text \
>> +               ${sbindir}/update-distcc-symlinks \
>>                 ${systemd_unitdir}/system/distcc.service"
>>  FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
>>                                 ${datadir}/distcc"
>> diff --git
>> a/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
>> b/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
>> deleted file mode 100644
>> index b17ec9c9599..00000000000
>> --- a/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -From 8331fc4759d809512f404e7a27f817ad6d616450 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 13 Apr 2015 18:00:33 -0700
>> -Subject: [PATCH] zeroconf: Include fcntl.h
>> -
>> -We need it for getting deinitions for O_* e.g. O_CREAT
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - src/zeroconf.c | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/src/zeroconf.c b/src/zeroconf.c
>> -index 414ddc4..31bd33f 100644
>> ---- a/src/zeroconf.c
>> -+++ b/src/zeroconf.c
>> -@@ -33,6 +33,7 @@
>> - #include <unistd.h>
>> - #include <stdlib.h>
>> - #include <limits.h>
>> -+#include <fcntl.h>
>> -
>> - #include <avahi-common/domain.h>
>> - #include <avahi-common/error.h>
>> ---
>> -2.1.4
>> -
>> --
>> 2.13.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>


