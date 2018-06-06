Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BBEEE6AC00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 17:25:13 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r15-v6so12950196wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 10:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=C2urHg/hhVJRgrBmRhUrKkpjq+ryyHtUfocLu8o7ixs=;
	b=Uhrv/NLmPNYgcvUOmnKrS9F7EP8yom/iplHKpNqPfe8npx/eew2VuMq6dDn0gBhun/
	G9WwZrQJP5fL39hWg1uWoQFdqVaz5mvIYgwPdjNcUsNXkJ4QyhoMGsts9qJnWHqO58Ka
	tEtNgJib35Vd48x0dsoV14R8FirOzgpQl7WDztUgWBNR9jBrcyv15GYPa30+LLKFn8lY
	z56hYY4oOvPevNENhxkCGLIa011s2a8lPrtmOoPjc6yWjn68JZYkzU7dsAaTyKzxyLs0
	lgfc9mPC4kkL2Bhq0E4C5zuLAMEARBy3vL8LHRGwgmu/fS0C0I2ursucdacDRsQmFxEG
	p6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=C2urHg/hhVJRgrBmRhUrKkpjq+ryyHtUfocLu8o7ixs=;
	b=CLr7ajEmHeasfHlacTW3haogeT3LHfP6xhbNF+8A2rVVflmn0TsGf1Wetr7APMFDeL
	JBaDUCjLHpsEtch4D6xyIGU0g05PxOaOjU1icWWuE48fBmuutJU+s7fuWECN9EaNwtVi
	TxNA7Tm1ouTeKzdR99uew35rOFAv7oCMyrZQECJxCl31jjgQ9em5sqRDJ3XE1kus3K6d
	ZZPJexo3BTTjhMwFhCO/Qi98OffNdDbqjqR+dyJj/09icW4XmVAxWuJH3KWnWW7kCIV2
	aR4R7TpeD3Pd7SpBs2lzp6zVo7pyigIpB2Rgc+hfDPAXhZ8oKyIlf7phxn6B4896pEwN
	KIaw==
X-Gm-Message-State: APt69E0yuXAnf70/VQnkKY/3osIz9ozH15TCqpI9optCI1LvIvYFioO1
	yxAsrwCoCoowIqQJPvZCTofVILTWMv8=
X-Google-Smtp-Source: ADUXVKLIsq3U/FP/OkQ7cfRfvoCZJzXFilLPqojKudkvcgtfql2WSiZ3GlGSuKTbfVlcx2YMOynrCg==
X-Received: by 2002:a50:a8a2:: with SMTP id
	k31-v6mr4652918edc.161.1528305914122; 
	Wed, 06 Jun 2018 10:25:14 -0700 (PDT)
Received: from ?IPv6:2a04:ae08:1403:ff00:489:7961:466d:7cf7?
	([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	b58-v6sm18501714edb.59.2018.06.06.10.25.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 10:25:13 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: "Burton, Ross" <ross.burton@intel.com>, alex.kanavin@gmail.com,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
References: <20180604163905.17292-1-dev@sashko.rv.ua>
	<CAJTo0Lb6RUUcs4Xv+OOo7N8pHyAW2Oeg60jNTeprxiNrA_5MwA@mail.gmail.com>
Message-ID: <6930e1ac-2a66-5160-1374-b97e67f84cf1@sashko.rv.ua>
Date: Wed, 6 Jun 2018 19:25:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb6RUUcs4Xv+OOo7N8pHyAW2Oeg60jNTeprxiNrA_5MwA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] minicom: fix SRC_URI
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
X-List-Received-Date: Wed, 06 Jun 2018 17:25:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Gentlemen,

Could you please clarify which source should be used for SRC_URI instead 
of alioth.debian.org?

Thanks.


On 05/06/18 21:35, Burton, Ross wrote:
> The Debian mirror network can't be relied upon as files are removed
> once they're not in any releases.  For this reason, we prefer
> snapshot.debian.org for SRC_URI (with DEBIAN_MIRROR for the upstream
> check).
>
> Ross
>
> On 4 June 2018 at 17:39, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> The original source, alioth.debian.org has been permanently taken down
>> by the Debian Project. Use Debian mirrors instead.
>>
>> Source: https://wiki.debian.org/Alioth
>>
>> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
>> ---
>>   meta/recipes-extended/minicom/minicom_2.7.1.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
>> index e6afe2b655..d963da7436 100644
>> --- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
>> +++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
>> @@ -1,5 +1,5 @@
>>   SUMMARY = "Text-based modem control and terminal emulation program"
>> -HOMEPAGE = "http://alioth.debian.org/projects/minicom/"
>> +HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom/"
>>   DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
>>   SECTION = "console/network"
>>   DEPENDS = "ncurses virtual/libiconv"
>> @@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
>>                       file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
>>
>> -SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz \
>> +SRC_URI = "${DEBIAN_MIRROR}/main/m/minicom/minicom_${PV}.orig.tar.gz \
>>              file://allow.to.disable.lockdev.patch \
>>              file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
>>              file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
>> @@ -16,7 +16,7 @@ SRC_URI = "https://alioth.debian.org/frs/download.php/latestfile/3/${BP}.tar.gz
>>   SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
>>   SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
>>
>> -UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
>> +UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/minicom/"
>>
>>   PACKAGECONFIG ??= ""
>>   PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


