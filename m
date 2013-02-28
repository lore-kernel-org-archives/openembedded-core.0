Received: from mail-ie0-f169.google.com ([209.85.223.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAuVY-0001JY-TG
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 04:50:33 +0100
Received: by mail-ie0-f169.google.com with SMTP id 13so1560164iea.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 19:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=z8x0LTWN0iScK+cInwvVsOjOGcDx8e213OK/3DGIjb4=;
	b=PTS33V5nxKyDWikGLRMr9hLuBFi+3MeTazFBYvjs9+lXGiPu5Y8xZqZrsRnyiV6RmS
	gOt4sW0Op+gbez/t+uzv5RDDrtKA5GNKA1dWrfeqj0VFCnvb3LVr6hx7QWA8JYAV80p1
	IjrTtcruHI6hnV2OJATxWie9jcXsh105C963O8WOQ0pOqim3TybOVITXQG6wM7ItSnak
	kaxaOW6ZdcJ93s6UGgWhlhOsvGSIyyky9V992q+xwIKxHgpLNHigBa2JMNTPA2Avb6//
	+gJGQpSgzaOh1LO0KDi7iZfzBJsv8FfZM7wgnlEjqt5V0PDzsQbLIq5hMicHeAHcJ7eb
	+LUg==
X-Received: by 10.50.17.131 with SMTP id o3mr2478055igd.112.1362022430866;
	Wed, 27 Feb 2013 19:33:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Wed, 27 Feb 2013 19:33:20 -0800 (PST)
In-Reply-To: <512EB49E.7040404@linux.intel.com>
References: <1361950227-15560-1-git-send-email-raj.khem@gmail.com>
	<512EB49E.7040404@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2013 19:33:20 -0800
Message-ID: <CAMKF1squM5Gu=TqFQzq1Xkx0LNOw=ywLJy4gDhmxaBJ0XBFv2Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 1.4.0 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 03:50:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 27, 2013 at 5:36 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/26/2013 11:30 PM, Khem Raj wrote:
>>
>> Tested qemu on x86-64 target and qemu-native
>> no obvious problems seen in testing
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../qemu/files/fix-configure-checks.patch          |   10 +++++-----
>>   meta/recipes-devtools/qemu/qemu.inc                |    2 +-
>>   .../qemu/{qemu_1.3.1.bb => qemu_1.4.0.bb}          |    6 ++----
>>   3 files changed, 8 insertions(+), 10 deletions(-)
>>   rename meta/recipes-devtools/qemu/{qemu_1.3.1.bb => qemu_1.4.0.bb} (62%)
>>
>> diff --git a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
>> b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
>> index ef77c92..294c220 100644
>> --- a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
>> +++ b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
>> @@ -8,14 +8,14 @@ Patch from Paul Eggleton, Comments by RP 28/11/10
>>
>>   Upstream-Status: Inappropriate [embedded specific]
>>
>> -Index: qemu-1.2.0/configure
>> +Index: qemu-1.4.0/configure
>>   ===================================================================
>> ---- qemu-1.2.0.orig/configure  2012-09-05 07:03:06.000000000 -0700
>> -+++ qemu-1.2.0/configure       2012-09-06 13:55:07.007793823 -0700
>> -@@ -281,6 +281,7 @@
>> +--- qemu-1.4.0.orig/configure  2013-02-15 15:05:35.000000000 -0800
>> ++++ qemu-1.4.0/configure       2013-02-25 13:44:17.915273181 -0800
>> +@@ -286,6 +286,7 @@
>>    QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
>>    QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
>> $QEMU_CFLAGS"
>> - QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/fpu"
>> + QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/include"
>>   +QEMU_CFLAGS="$QEMU_CFLAGS $CFLAGS"
>>    if test "$debug_info" = "yes"; then
>>        CFLAGS="-g $CFLAGS"
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc
>> b/meta/recipes-devtools/qemu/qemu.inc
>> index 6c44b31..2b60347 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -32,7 +32,7 @@ SRC_URI_append_class-nativesdk = "\
>>       file://relocatable_sdk.patch \
>>       "
>>
>> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)}
>> --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa
>> --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg
>> --disable-bluez --with-system-pixman --disable-smartcard"
>> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)}
>> --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa
>> --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg
>> --disable-bluez --with-system-pixman"
>>
>
> Why did you remove the --disable-smartcard?

This option is gone in 1.4 and only softmmu version include usb.mak
which will enable CONFIG_USB_SMARTCARD
and bring in the card emulation.


