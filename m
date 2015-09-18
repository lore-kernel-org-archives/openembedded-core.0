Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 099D275772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:29:24 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so36238411pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 19:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=zoCXm+0aMKfio21ms7f426qOPE2dr7mRSuI9fLZ8rLI=;
	b=WqCT0yv9fLRW0gw/EbEPkgpYb7RsnoyPTpr0cxbgt3KQEPqopIeIe9sXGg0CewKyxd
	c4tV8G45qze5C+4q8tZa5wRdxh/4JLoyhBPQz4Zou0G4UUL6iv6DHbDTvWk9do6jyxq8
	Wls3jXcfA1trfiKntdjY7xseHgOI5kjKwt1G88ZugNaWMDxVjozhycbMp0ukJLZH28YT
	Qes2pG3bQXRvB6Aez8sW9dyLuxh+lZHohLoz0VeJOA+umb1v5JURq9RVJZT5z+unj/pm
	JuMmzudRMwe1w9sDyBsQXCD7FSw2MZ3NEBqWKDWirC14NG4ad6BV5dHqeEsm6owpL8Xj
	dkHg==
X-Received: by 10.66.159.130 with SMTP id xc2mr4205886pab.157.1442543364963;
	Thu, 17 Sep 2015 19:29:24 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1079:2f51:a2f9:e171?
	([2601:646:8601:4580:1079:2f51:a2f9:e171])
	by smtp.gmail.com with ESMTPSA id u1sm5772928pbz.56.2015.09.17.19.29.23
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Sep 2015 19:29:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <201509180353.50008.marex@denx.de>
Date: Thu, 17 Sep 2015 19:29:23 -0700
Message-Id: <522F3BE7-218C-4105-BED1-B9EC7F7A1A5F@gmail.com>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<1442500317-9064-9-git-send-email-marex@denx.de>
	<ED902330-8DA9-4BA5-B910-81AD6C64B86C@gmail.com>
	<201509180353.50008.marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3094)
Cc: lftan@altera.com, waltergoossens@home.nl,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] libgpg-error: Add support for nios2
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
X-List-Received-Date: Fri, 18 Sep 2015 02:29:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 17, 2015, at 6:53 PM, Marek Vasut <marex@denx.de> wrote:
>=20
> On Friday, September 18, 2015 at 03:41:40 AM, Khem Raj wrote:
>>> On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
>>>=20
>>> Add a patch which adds a configuration for the nios2 processor.
>>>=20
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> .../0001-libgpg-error-Add-nios2-support.patch      | 45
>>> ++++++++++++++++++++++ .../libgpg-error/libgpg-error_1.19.bb         =
  =20
>>> |  4 +-
>>> 2 files changed, 48 insertions(+), 1 deletion(-)
>>> create mode 100644
>>> =
meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nio
>>> s2-support.patch
>>>=20
>>> diff --git
>>> =
a/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-n
>>> ios2-support.patch
>>> =
b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-n
>>> ios2-support.patch new file mode 100644
>>> index 0000000..8362c69
>>> --- /dev/null
>>> +++
>>> =
b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-n
>>> ios2-support.patch @@ -0,0 +1,45 @@
>>> +=46rom b2af652f43991e4ce6297917da542a9eb5135939 Mon Sep 17 00:00:00 =
2001
>>> +From: Marek Vasut <marex@denx.de>
>>> +Date: Thu, 17 Sep 2015 03:28:06 +0200
>>> +Subject: [PATCH] libgpg-error: Add nios2 support
>>> +
>>> +Add configuration for the NIOS2 processor.
>>> +
>>> +Signed-off-by: Marek Vasut <marex@denx.de>
>>> +---
>>> + src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h | 23
>>> +++++++++++++++++++++++ + 1 file changed, 23 insertions(+)
>>> + create mode 100644 =
src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
>>> +
>>> +diff --git a/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
>>> b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h +new file mode
>>> 100644
>>> +index 0000000..3a24571
>>> +--- /dev/null
>>> ++++ b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
>>> +@@ -0,0 +1,23 @@
>>> ++## lock-obj-pub.nios2-unknown-linux-gnu.h
>>> ++## File created by gen-posix-lock-obj - DO NOT EDIT
>>> ++## To be included by mkheader into gpg-error.h
>>> ++
>>=20
>> how was this file generated ?
>=20
> There's a tool for that, see src/gen-posix-lock-obj.c . Since I don't =
have
> a running NIOS2/f yet, I had to approximate what it does. If you read =
the
> source code, it's quite trivial in fact.

I understood the code, I was asking if this was a copy of some other =
arch or freshly generated by the described
generation process. But seems you answered this.



