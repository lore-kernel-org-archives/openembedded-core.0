Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 34C3B73231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 12:43:15 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so72376884wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 05:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-type;
	bh=qvH+qzIHX43SuGGzcuvlayAx6pwHHUKzqTiUKEKF74o=;
	b=kORTRW4/k+AYBONS5txN2Rlx+Pv0KzdHEeusep7nDuRESjIdvQcCKGJD4y3bGmwsw/
	V3XnjwL4iDeaYt0JG65ebggcks/9TGkYGyDS934dcF0+iosGAZtdwTPMTHP9Ab1cuPbo
	eaXq6RQxnOJf8n6ZVeWIWD86J5tjzpbDSxyDaWcQgvo5keWk+zd9snvRieKutGAH1VS1
	xgJnlOesbme2nTy+5MYtGJRzUrj74PfHfVxD5SskQUs+JmN+7zP/3bZ6JwuKsyQLZ7yq
	HV4DZ8sXronXRkXV605z1Z/4MF+Uf0vIs2psj6HxVtTckUmXWY9beVKMVYtsPiqW6gQ4
	zZNQ==
X-Gm-Message-State: ALoCoQmPHzmZrdiL8GX5EBUDQ23/+Cg4nG4se6aw9vDlEvBMfnfoV3TXORqpTUq+iYhxbtwMNA5o
X-Received: by 10.180.80.138 with SMTP id r10mr6104318wix.18.1439469795332;
	Thu, 13 Aug 2015 05:43:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.175.160 with HTTP; Thu, 13 Aug 2015 05:42:45 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 13 Aug 2015 15:42:45 +0300
Message-ID: <CAHiDW_EGaGer0d0RVaqzT6ats9aqDEpzMieUxwbgYffVRYADbA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gnutls/nettle/gmp licensing and versions
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
X-List-Received-Date: Thu, 13 Aug 2015 12:43:20 -0000
Content-Type: text/plain; charset=UTF-8

On 12 August 2015 at 17:14, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> Hi,
>
> I realise I'm a bit late (with the commit in master already) but I'm
> looking at upgrading this recipe and had some questions on this patch
> and the recipe in general.
>
> On 9 August 2015 at 08:28, Armin Kuster <akuster808@gmail.com> wrote:
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
> I think this is wrong, whichever version you look at -- our current
> version is just "LGPLv2.1+", the current upstream release is "LGPLv3+
> | GPLv2+"
>
> I'm going to send a patch upgrading the recipe to the current upstream
> release (and setting license to "LGPLv3+ | GPLv2+"): it might seem
> like this makes gnutls effectively LGPLv3 but that actually happened
> last year with the gmp upgrade. Comments on this welcome.

Alexander just pointed out to me that there was a discussion on gnutls
and nettle already in July (which I missed in my
back-from-holiday-email-binge). It seems that the consensus was to
preserve LGPLv2 versions.

This is what the current situation looks to me -- please correct if I'm wrong:
* gmp is "GPLv2+ | LGPLv3+"
* nettle is "LGPLv2.1+" but depends on gmp
* gnutls "LGPLv2.1+" but depends on nettle

This effectively makes gnutls "GPLv2+ | LGPLv3+" as far as I can see.
If we want to preserve a LGPLv2 gnutls, we need to bring back an older
version of gmp (I think 4.2.1).


>> +LICENSE_${PN}-cast = "CC0"
>> +LICENSE_${PN}-gosthash = "MIT"
>> +
>> +# both public and GPL license listed
>> +LICENSE_${PN}-md2 = "CC0 & LGPLv2.1+"
>> +LICENSE_${PN}-md4 = "CC0 & LGPLv2.1+"
>
> From the reference I had the impression this "LICENSE_something"
> construct would imply there is a package "something". But the nettle
> recipe does not produce "nettle-cast" or any of these. What is the
> purpose here?
>
> Thanks,
>  Jussi
>
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

