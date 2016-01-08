Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 44FFF731A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 17:36:46 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id t15so56602240igr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=idatW77S3pTn9KHwwUqUE5GREBLJdYF9Cx018PhPwMM=;
	b=k48DGpQim169bJfkDF7Atw/zJL4D9kt0L8kw7kH7jvWEIBQkWdopyn2Mw6c2CmvSXJ
	566pIxSklpk+sZJSULSENMyJEBEhl4QZoBPYrTU5UOlrYoHrOb+BKSH3y2AlXE3DUr1L
	vOZ7DvaMbA5lwRiNQW8LU80o7qeINMW2dC+n6PUwnMSVLzmqoFKCFicXcrvEBqn1NDn/
	IUx1oSThV608mI01LCRuTHHwRlJMbjt6VyjSCEmdcgkTfBFkXq5Fw/YAv4RTkcVqnrY1
	Hmp7Sgb9iRTAg7IZ5kzH52OpIrH4PPnrQZGqZ1tuqukMSY6+mwLVS0ydy9dRSosfrGrt
	ghWw==
X-Received: by 10.50.115.106 with SMTP id jn10mr101076igb.77.1452274607266;
	Fri, 08 Jan 2016 09:36:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 09:36:17 -0800 (PST)
In-Reply-To: <CAJTo0LYzUihyMRQAnvuudC+SaPDU1yXdZ9zch=eESV4ZXbEZqw@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<aa131735726856532f21d5f3264251679ca7d030.1452248145.git.raj.khem@gmail.com>
	<CAJTo0LYzUihyMRQAnvuudC+SaPDU1yXdZ9zch=eESV4ZXbEZqw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 09:36:17 -0800
Message-ID: <CAMKF1soCD-Wo44KzJv2ivVrJ265SAug0YAgi9EinmU_kX9FgQg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 30/53] Revert "glib-2.0: build dependency cleanup"
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
X-List-Received-Date: Fri, 08 Jan 2016 17:36:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 2:39 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 10:18, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> -DEPENDS = "virtual/libiconv libffi zlib"
>> -DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', '
>> glib-2.0-native dbus', '', d)}"
>> +DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
>> +DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES',
>> 'ptest', ' dbus', '', d)}"
>>  DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native
>> zlib-native"
>> -DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext
>> nativesdk-libffi nativesdk-zlib"
>> +DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext
>> nativesdk-libffi nativesdk-zlib ${BPN}-native"
>
>
> Don't actually revert the original commit, just add the missing dependencies
> back.  The ptest changes were good and you're reverting those too.

ignore this.
this was a band-aid  for my build. I was hoping Kai to address it

>
> Ross

