Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3C7756006E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 17:04:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id y1so173741pgk.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 09:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jmZ3NXv8b3v4CZ1r5S2OhljD3JB9asrAdoqWlrZEjII=;
	b=OwbQKNp4jeCVJnwwwb25myDC53p9zi8ddns7fcisat7WT2A4ZnO/X0C4AtwC9wf22/
	xb/KUkWB6yU90SJfhMyyirxgeZMUTUCRprhZPZPeWNEJmji5p8KO+ktZYpzFN6FBj/cL
	hDjnY799Fykgb1Y53kSWqqFSmDpjQ4I0Z8qDFRPiG2AxPz4G3DGx4N7X0zSxU9KFNnOd
	lHhAY/67T17rszOlMWIQlHRnC575NghOgSj3IR1keEUZuwAW4PQUamKxBGC2qICpGC3O
	45GG2XRhPLnKlx0p6E424FWGHflNdt7+435zkqTeY7YJX/MSM7IAX1Kd0WstKQ64dMLx
	XysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=jmZ3NXv8b3v4CZ1r5S2OhljD3JB9asrAdoqWlrZEjII=;
	b=RoUHEeoPGHBmD+D8LbSPKP5vTSr5tx9++QSQddXXymxTJZOmjgPVNQinUYVbQNJGU1
	uNLW3R3L7lUZUmMcWEF3e/gQUmhvOiKz/9l+AnuW2azZGStaU428RvYqF90m7WacSAY7
	NEjOzJVK5SpZRbW0iQt5QIUb7vNAcWBUw28Yi+QmlPF1tt9j+Jio8s//rKtM1TZXovTN
	QcxPi/jjl3X68M48VuZyJVqkzEbhn2GnTG6a5iJ461ClNnrNNQBRScXBbF4hxdD+Ymjj
	sOtahzE2V/BLz+pkBW2qyRTIDVIdTU2woFPJ7h296F1C7xwnhEkbiUQncQdV55isbNbU
	PBhw==
X-Gm-Message-State: AHQUAuZHjTwfuaBrxODcPmyuaGMHqC0TvezmrD/5oU4jZCGzKZ0IIo85
	AT8KnLXqpjGnyAZ5Rkhkaj2k7X9S8Vg=
X-Google-Smtp-Source: AHgI3IZALZ3SWVNlFkpDE/WmwDajFPbGH6I6VgrHyxPOBpBs0GLPZhckhlRxMghf/1QPHyBHtLnxRg==
X-Received: by 2002:a62:e012:: with SMTP id f18mr335716pfh.119.1549299895976; 
	Mon, 04 Feb 2019 09:04:55 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:40c2:82ac:4641:f878?
	([2601:202:4180:c33:40c2:82ac:4641:f878])
	by smtp.gmail.com with ESMTPSA id
	h74sm1522098pfd.35.2019.02.04.09.04.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 09:04:55 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1549228389-17737-1-git-send-email-akuster808@gmail.com>
	<1951a562133743da9babfcb55f7f5345@XBOX04.axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <0c207fdd-c1c4-6559-be6c-7dacf26139e2@gmail.com>
Date: Mon, 4 Feb 2019 09:04:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1951a562133743da9babfcb55f7f5345@XBOX04.axis.com>
Subject: Re: [PATCH] timezone: refactor to simplify maint
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
X-List-Received-Date: Mon, 04 Feb 2019 17:04:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/4/19 1:04 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Armin Kuster
>> Sent: den 3 februari 2019 22:13
>> To: akuster808@gmail.com; openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] timezone: refactor to simplify maint
>>
>> move tzcode and tzdata-native into new dir
>>
>> Updates are now limited to the common include file.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../timezone.inc}                                   | 21 +++++----------------
>>  meta/recipes-extended/timezone/tzcode-native.bb     | 17 +++++++++++++++++
>>  .../{tzdata/tzdata_2018i.bb => timezone/tzdata.bb}  | 12 +-----------
>>  3 files changed, 23 insertions(+), 27 deletions(-)
>>  rename meta/recipes-extended/{tzcode/tzcode-native_2018i.bb => timezone/timezone.inc} (63%)
>>  create mode 100644 meta/recipes-extended/timezone/tzcode-native.bb
>>  rename meta/recipes-extended/{tzdata/tzdata_2018i.bb => timezone/tzdata.bb} (94%)
>>
>> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb b/meta/recipes-extended/timezone/timezone.inc
>> similarity index 63%
>> rename from meta/recipes-extended/tzcode/tzcode-native_2018i.bb
>> rename to meta/recipes-extended/timezone/timezone.inc
>> index f056370..38dadac 100644
>> --- a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
>> +++ b/meta/recipes-extended/timezone/timezone.inc
>> @@ -1,10 +1,11 @@
>> -# note that we allow for us to use data later than our code version
>> -#
>> -SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
>> +UMMARY = "Timezone data"
> SUMMARY? ;)
There was a letter tarif ; )

will send v2. thanks for the review.

- armin

>
>> +HOMEPAGE = "http://www.iana.org/time-zones"
>> +SECTION = "base"
>>  LICENSE = "PD & BSD & BSD-3-Clause"
>> -
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
>>
>> +PV = "2018i"
>> +
>>  SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
>>             http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
>>             "
>> @@ -16,15 +17,3 @@ SRC_URI[tzcode.sha256sum] = "aaacdb876ca6fb9d58e244b462cbc7578a496b1b10994381b4b
>>  SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
>>  SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
>>
>> -S = "${WORKDIR}"
>> -
>> -inherit native
>> -
>> -EXTRA_OEMAKE += "cc='${CC}'"
>> -
>> -do_install () {
>> -        install -d ${D}${bindir}/
>> -        install -m 755 zic ${D}${bindir}/
>> -        install -m 755 zdump ${D}${bindir}/
>> -        install -m 755 tzselect ${D}${bindir}/
>> -}
> //Peter
>


