Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA39860616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:29:50 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id u68so764325uau.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 18:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=t/TjD2mqEeU4R7CWlK+WJ37XgzSZSP/vNQxcrEIavCA=;
	b=PuJvB7Qc0KadHnKITN09LiyywCJNK8SfxtcKlEoelJ6mmJBFAk4zmIJ02Ai6iVEuCW
	rYkaYr4K+pUU/4IkxUmSAE3XF/7o2XbPJc9ZHFku1J+AxRhmlPX5Fkia1zUSgPccBeL7
	Bua2W20VseTPcPNIagLafxZyyoYCipfTqec154IWBJJSTp/PV1Nehj3mrQGbdlKzl/n4
	CwW5tAfNi0ZRF7BmB2vcR7TZYpWHl27x4XJTTHSMSQEYEH9D4Y5I6uzHyxrFITL9pLcx
	WQnJtfXaRF75gwQsLGhY8V6ekWGBQI/KTP8GvClrSKrVUT1DlI3EEHXdJRH9Mw0GlK3c
	o/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=t/TjD2mqEeU4R7CWlK+WJ37XgzSZSP/vNQxcrEIavCA=;
	b=fwdsGJj4fe3bGnMd3c3Qjr8HqcUjXifx9JfjgAlNdypncObhwoYC45R+9dCt9097VQ
	J4WPGP6pRkeFCrnI8f7+WbMilwu64KCuqCrutmcL1yen6uGwyxcL133EkRBBnndx1hQQ
	ITe6kb9AhN9DhHBhlkl+q77cieAAxPKJDpe1bM3+iBQX0M0UJsH/81/kJ1t4vQvvuMkx
	2FFXJx1Kg/Ar4sC8pVkWUGuJYlTWMwDnSvJJHUzS1Jpx0rgSE0cUs9HJayExoceuiF46
	ADvQheVwU2f2hF1kzwpyaGMphwA7UBErhacVwt1z/D65x4mkG0fHGgVTRItOK/DVmoF3
	on9A==
X-Gm-Message-State: AA6/9Rm6YxnR+GUXmomcRb1Am26OZUfXvzt0tFbq1NGGUZLBg5Rh4RloM8rQI52mr0NwQCb3DV5k4tKQWIIHvA==
X-Received: by 10.176.2.73 with SMTP id 67mr2428839uas.40.1474594192071; Thu,
	22 Sep 2016 18:29:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Thu, 22 Sep 2016 18:29:21 -0700 (PDT)
In-Reply-To: <CAJTo0LYY6H_X6oS_3MBZZ6StPo=0TF+ANB=Wo3e=4ELkEJEXhg@mail.gmail.com>
References: <1472708151-1708-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<C43D7C6FFC265C429F44FEB1C68F1B25633E1761@G08CNEXMBPEKD03.g08.fujitsu.local>
	<CAJTo0LYY6H_X6oS_3MBZZ6StPo=0TF+ANB=Wo3e=4ELkEJEXhg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Sep 2016 18:29:21 -0700
Message-ID: <CAMKF1soW5Xmx963g40gW3128hc9_oGeByix590D5OywcqUswnw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ruby: 2.2.5 -> 2.3.1
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
X-List-Received-Date: Fri, 23 Sep 2016 01:29:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 12:58 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
> This upgrade missed the M3 window which was the last time that upgrades a=
re
> acceptable, so it will have to wait until after the 2.2 release.

I think this will be ok, its a 2.2 to 2.3 upgrade while it seems its
quite compatible but
major upgrades always should be given some soak time.

>
> Ross
>
> On 22 September 2016 at 02:39, Wang, Xin <wangxin2015.fnst@cn.fujitsu.com=
>
> wrote:
>>
>> ping
>>
>> -----Original Message-----
>> From: Wang, Xin/=E7=8E=8B =E9=91=AB
>> Sent: Thursday, September 01, 2016 1:36 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Wang, Xin/=E7=8E=8B =E9=91=AB
>> Subject: [OE-core][PATCH] ruby: 2.2.5 -> 2.3.1
>>
>> 1) Upgrade ruby from 2.2.5 to 2.3.1.
>> 2) Modify LIC_FILES_CHKSUM, since the date in it has been changed, But t=
he
>> LICENSE has not been changed.
>>
>> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
>> ---
>>  meta/recipes-devtools/ruby/ruby.inc                         | 2 +-
>>  meta/recipes-devtools/ruby/{ruby_2.2.5.bb =3D> ruby_2.3.1.bb} | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)  rename
>> meta/recipes-devtools/ruby/{ruby_2.2.5.bb =3D> ruby_2.3.1.bb} (89%)
>>
>> diff --git a/meta/recipes-devtools/ruby/ruby.inc
>> b/meta/recipes-devtools/ruby/ruby.inc
>> index fde67e9..f38ebb0 100644
>> --- a/meta/recipes-devtools/ruby/ruby.inc
>> +++ b/meta/recipes-devtools/ruby/ruby.inc
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
>>      file://COPYING;md5=3D837b32593517ae48b9c3b5c87a5d288c \
>>      file://BSDL;md5=3D19aaf65c88a40b508d17ae4be539c4b5\
>>      file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263\
>> -    file://LEGAL;md5=3Dc440adb575ba4e6e2344c2630b6a5584\
>> +    file://LEGAL;md5=3D78e8a29b8cc93e042990dbbb5572b1e1\
>>  "
>>
>>  DEPENDS =3D "ruby-native zlib openssl tcl libyaml db gdbm readline"
>> diff --git a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
>> b/meta/recipes-devtools/ruby/ruby_2.3.1.bb
>> similarity index 89%
>> rename from meta/recipes-devtools/ruby/ruby_2.2.5.bb
>> rename to meta/recipes-devtools/ruby/ruby_2.3.1.bb
>> index 5a64582..f9f5b33 100644
>> --- a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
>> +++ b/meta/recipes-devtools/ruby/ruby_2.3.1.bb
>> @@ -1,7 +1,7 @@
>>  require ruby.inc
>>
>> -SRC_URI[md5sum] =3D "bd8e349d4fb2c75d90817649674f94be"
>> -SRC_URI[sha256sum] =3D
>> "30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3"
>> +SRC_URI[md5sum] =3D "0d896c2e7fd54f722b399f407e48a4c6"
>> +SRC_URI[sha256sum] =3D
>> "b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd"
>>
>>  # it's unknown to configure script, but then passed to extconf.rb  #
>> maybe it's not really needed as we're hardcoding the result with
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

