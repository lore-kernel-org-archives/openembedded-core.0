Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D9A0F78568
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 17:04:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m129-v6so6488809wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=vGyTqPyZYQQQpd2l54dZxC5suF0uTF2PZvV5eFGw72c=;
	b=ZiwjqzfuUqfZe8CegoUC2AVDfp3YgEoY9qsBJOGNTKsXaNYdzAynLV7O8FEO95DaXb
	QABmqkdBUM8HRsWBHlb1bLAkT2z9oymnOv4oA31hFu33SZ8S6SYkBE6BGx48fCLTjFbG
	yIeEU3qN2Y/Y6PaaRYetLBah20sITE2Q/ZF/RSJMTZw/fRmkHTVOFQsr5HKRpVhtpxmF
	dcskEMkCBMWXmlI7nt8rYD619nmC4prcJ31hfrz0++CdXkJbfyxhLOTKFi5x38xOy+rq
	5937BBd36hfzXZDQpPtF0EK9qzm8og6cExIQ01eG8FkGCbIdHYKPzaZ2da/aKlIDjxS6
	SdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=vGyTqPyZYQQQpd2l54dZxC5suF0uTF2PZvV5eFGw72c=;
	b=gtfO7ENV4b3necCF77XyKzrmSs9NdevW8pxo4vcLxoWgZ03uVFu505+fng7NSJuJyZ
	cFzLfT6GKEGtgaG1K8ZDVTRDl15WIpSvqAzZHutAdge/kIW4IkBy3XrRmxGJw0tjIzYr
	bIXhnX6vR9EOlcDCdcgq4u3hYyGGgQ3ZmKfaJPs+Xpn3Y04AC4Rrcoe0ZcOD9EzXFCJ5
	tztb11XNFcs0ywy8OcnatOVryb0g/XoQuNLrATWKC1hLljIkbn8oPB43OX3+k7gdi3TZ
	Ss1ubkTb6ldcCmu8kBFdgJYXz6SsKI2v3CuePYc8NXFh6+DYE5xYmd3GJGEgxEVYFgAr
	k0jw==
X-Gm-Message-State: APt69E3OBbkkuIOIAizjLIks9jA9fbx3vEjZH9U0hMqLO3I+dEHnWEOM
	qPR0hVF1khu1s6YjRHT7pHiTXw2v/QY=
X-Google-Smtp-Source: ADUXVKIoIKlSZ4ChheChROarXuSYBBmjdg+wXwiCit+iH61R6nxMlEBDCD9jbwceFpbDOoGr2lr3zg==
X-Received: by 2002:aa7:d0d2:: with SMTP id
	u18-v6mr11545986edo.205.1528218277294; 
	Tue, 05 Jun 2018 10:04:37 -0700 (PDT)
Received: from ?IPv6:2a04:ae08:1403:ff00:489:7961:466d:7cf7?
	([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	2-v6sm15695494edz.67.2018.06.05.10.04.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 10:04:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: "Burton, Ross" <ross.burton@intel.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20180605160643.23035-1-dev@sashko.rv.ua>
	<CAJTo0LaneaCdQcEW6tFEFm8xXg2+wfrQ098FE542sNZc9DcDHw@mail.gmail.com>
Message-ID: <b3eb0819-7b8f-e101-1977-190a36b53897@sashko.rv.ua>
Date: Tue, 5 Jun 2018 19:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaneaCdQcEW6tFEFm8xXg2+wfrQ098FE542sNZc9DcDHw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] iso-codes: update to 3.79 and fix SRC_URI
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
X-List-Received-Date: Tue, 05 Jun 2018 17:04:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ross -

We've discussed this. Check out discussion of v2 of the patch, please.


On 05/06/18 19:00, Burton, Ross wrote:
> No need to change to git, salsa has a tarball at
> https://salsa.debian.org/iso-codes-team/iso-codes/tags.
>
> Ross
>
> On 5 June 2018 at 17:06, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Updated package to version 3.79.
>>
>> The original FTP server, alioth.debian.org has been permanently taken
>> down by the Debian Project and replaced with salsa.debian.org.
>>
>> Source: https://wiki.debian.org/Alioth
>>
>> Also added HOMEPAGE, and BUGTRACKER.
>>
>> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
>> ---
>>   .../iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb} | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>   rename meta/recipes-support/iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb} (56%)
>>
>> diff --git a/meta/recipes-support/iso-codes/iso-codes_3.77.bb b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
>> similarity index 56%
>> rename from meta/recipes-support/iso-codes/iso-codes_3.77.bb
>> rename to meta/recipes-support/iso-codes/iso-codes_3.79.bb
>> index bd613ac573..72cb542f18 100644
>> --- a/meta/recipes-support/iso-codes/iso-codes_3.77.bb
>> +++ b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
>> @@ -1,15 +1,19 @@
>>   SUMMARY = "ISO language, territory, currency, script codes and their translations"
>> +HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
>> +BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
>> +
>>   LICENSE = "LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>>
>> -SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
>> -SRC_URI[md5sum] = "9d0d06cfb4634428b300845edcd7140a"
>> -SRC_URI[sha256sum] = "21cd73a4c6f95d9474ebfcffd4e065223857720f24858e564f4409b19f7f0d90"
>> +SRC_URI = "git://git@salsa.debian.org/iso-codes-team/iso-codes.git;protocol=git"
>> +SRCREV = "c1d5dd96b33cb815ebc21d2708bc045b1545249d"
>>
>>   # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
>>   # are inhibited by allarch
>>   DEPENDS = "gettext-native"
>>
>> +S = "${WORKDIR}/git"
>> +
>>   inherit allarch autotools
>>
>>   FILES_${PN} += "${datadir}/xml/"
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


