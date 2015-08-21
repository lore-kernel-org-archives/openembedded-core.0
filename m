Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7D60360557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 08:48:59 +0000 (UTC)
Received: by obbhe7 with SMTP id he7so53696843obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=b+PKbgsJci16rXdck88QA2VPGelN4iRhc9Ak26Falq4=;
	b=NTSSe0r0Kk3+ROxDfBcdCwYgPpOSKHrMntlmDJnGlP+9QWLruwzEernkb6PmcaBJ8r
	AXFqD8JnzV7jtaMvE3K4OxR6NM7iIBn5cjlLvpkA/Ky2lR0lsmFk59eoA0JM4b45FTLl
	qZEne8mm148iyMLG+XBmf+MRZh0Kmaoilyl+xeWBgULl4O3NEdu1xY7O1imFWHcPKyY2
	Fg1lUk9Cqta+C1HN2GXznhf7U4/QEq2SZtbW3o5eS25iXrRITX6fdhlpxVLxrnTM/qb9
	4CF0Iu7ZMc0e6MHU+7VdMH5q4hvw+g5ItWUD56KcQLLzkoiq4x7i6fDVMP5ch4Z1AyQR
	UMKw==
X-Gm-Message-State: ALoCoQkKbgGziqveYzhFTWfOrYdTygX8mimHpszm/JB/BIwlXSaiUH2FcA7DhtbVNBqjJd6/3Oex
X-Received: by 10.60.50.169 with SMTP id d9mr3893969oeo.9.1440146940037; Fri,
	21 Aug 2015 01:49:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 21 Aug 2015 01:48:30 -0700 (PDT)
In-Reply-To: <20150818080317.GC2458@jama>
References: <1439098101-9400-1-git-send-email-akuster808@gmail.com>
	<20150818080317.GC2458@jama>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 21 Aug 2015 11:48:30 +0300
Message-ID: <CAHiDW_HCSh-FquWyhib9WDSHxpTVB6iHu-5DP40ugP2=D3O3gw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nettle: clean up license information
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
X-List-Received-Date: Fri, 21 Aug 2015 08:49:00 -0000
Content-Type: text/plain; charset=UTF-8

On 18 August 2015 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Aug 09, 2015 at 10:58:21AM +0530, Armin Kuster wrote:
>> adding the license definitions on the few packages that
>> deviate from the overall package license.
>>
>> based on http://www.lysator.liu.se/~nisse/nettle/nettle.html#Copyright
>> and spot checking files.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> index f53afcc..f9d331f 100644
>> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
>> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
>> @@ -2,6 +2,15 @@ SUMMARY = "A low level cryptographic library"
>>  HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
>>  SECTION = "libs"
>>  LICENSE = "LGPLv2.1 & GPLv2"
>
> It would be nice to package GPLv2 files in separate package as well (or
> LGPLv2.1 library in seprate package) if you have time to do that.

Forgot to answer this, sorry.

For 2.7.1 what you suggest may work -- there may be some tools that
are GPLv2 that we could separate. But for the new version the strange
" "LGPLv3+ | GPLv2+" license combo is _not_ a result of the library
being LGPL and some utilities being GPL: the library itself (like a
lot of GNU stuff nowadays) is dual licensed like that.

It seems weird but actually makes sense for GNU: It forces all users
to comply with LGPLv3, except the GPLv2 programs that can't easily be
relicensed to GPLv3. Those GPLv2 programs would be incompatible with
the newer LGPLv3 libraries but this dual-licensing lets them off the
hook.

Jussi



>> +LICENSE_${PN}-cast = "CC0"
>> +LICENSE_${PN}-gosthash = "MIT"
>> +
>> +# both public and GPL license listed
>> +LICENSE_${PN}-md2 = "CC0 & LGPLv2.1+"
>> +LICENSE_${PN}-md4 = "CC0 & LGPLv2.1+"
>> +
>> +
>>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>>                      file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
>>                      file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

