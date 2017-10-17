Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 01FC6782E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:24:44 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t188so1702650pfd.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J/FUWYWr77SMuq2b/TK8blp02T6s8kdB2G+H6CHBhYI=;
	b=D1ghVcTsmd+X7jFaZ79Nw+y+agbpizKttagoXECh2MCILE74VZ2rtBa4qx9i4WOtbD
	lO5axz0VtjqkKwMnARigjexWFfbV21EBJhhHsOUTeEdVv6goPJqSf8ziuPot1gfQpwrs
	w60uhm2z8/eCkO1Rr94HRQ/kABY2szZijPV5bIyWW/v+5+VeKCP6wWiLlVpp1YcqpT8t
	R52aFdJAFC344NnRXcB56sgm07nssl2TMZQybKzmVLdAOjVwlN8ycSFcOkhh/Ias3/pt
	hUFwztaDF08zsA+IQUhWO/5073LV10XEj2C/4lM5HF+eqh0wSU/Z6hga/dFUmc6QIwhZ
	ryVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J/FUWYWr77SMuq2b/TK8blp02T6s8kdB2G+H6CHBhYI=;
	b=kxoLimhf75l30+Ky5DBrO7Nce+Tmf9FbBngOoYZk2wHRAEMRel9e6f0p5U67P6dNzX
	hkUmFD/P+qb1Rl0A/oB770dIGiMQ6Ewawn3X1c4kTlGlC/k0pKoU+J799HJNX3hEMOfY
	WYUhGrCH1E48ORi+IBtPVpRgER38ze/1pDBrKJ+S2HlCIkiwEaorxn5fSoPPF72Ds0CH
	X1WKGrVr8NBcuN+uUcr14QckNUkDxSp0audwunmQjHMRRSV5igzRc2vB5881R2u6L3b/
	AQIrIjcYMcoIcnIJ0YbGceKHiMSqPyNKYVKcj/2kSTJuMsL6xCb4tyficKScqDAFBELM
	M0KQ==
X-Gm-Message-State: AMCzsaXle13GjT1lpemerjSsy1H9AoRuPcqMYamq379OPXoXdh6stkPc
	hm05q59Aj/KW2iIAfiq8MJAi9bVSdZ3/ifNj7xg=
X-Google-Smtp-Source: AOwi7QBE9zhzB/FxF6bVxtHp/ie3UEiq7DB1H3eFY/CNibEGDHDZcL7AeTsyFD7mzoUG0i9jQVAQMIMzUU2fnrHx3lo=
X-Received: by 10.84.138.1 with SMTP id 1mr12568708plo.404.1508257486229; Tue,
	17 Oct 2017 09:24:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 09:24:15 -0700 (PDT)
In-Reply-To: <CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
	<CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 09:24:15 -0700
Message-ID: <CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 16:24:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Curious how you hit this with master.  For me:
>
> checking for check >= 0.9.9... no
> configure: WARNING: check not found - skipping building unit tests
>
> The configure script uses pkg-config so shouldn't be picking up host
> binaries.  Can you dig a little?
>

do you have ptests on

> Ross
>
> On 14 October 2017 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Fixes failures like
>>
>> test-main.o ../../libevdev-1.5.2/test/test-main.c
>> | ../../libevdev-1.5.2/test/test-main.c:24:19: fatal error: check.h: No
>> such file or directory
>> |  #include <check.h>
>> |                    ^
>> | compilation terminated.
>> | make[2]: *** [test-main.o] Error 1
>>
>> Change-Id: I73fce0532b91fe410d509ae55ff471ad2ea5d929
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-support/libevdev/libevdev_1.5.7.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/libevdev/libevdev_1.5.7.bb
>> b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
>> index f740da206e..4b54971b1c 100644
>> --- a/meta/recipes-support/libevdev/libevdev_1.5.7.bb
>> +++ b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
>> @@ -6,6 +6,8 @@ LICENSE = "MIT-X"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
>>
>> file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
>>
>> +DEPENDS += "libcheck"
>> +
>>  SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
>>
>>  SRC_URI[md5sum] = "4f1cfaee8d75ea3fbbfeb99a98730952"
>> --
>> 2.14.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

