Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy8wv-0007bg-B2
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 00:05:25 +0200
Received: by obc16 with SMTP id 16so1297900obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 14:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=p5JZ7Ae2FNE3iekMQiC7kNefjeoPiy3u7FNydIGaLqg=;
	b=ByQAhhHdoWFqSROReq5bFnFJd9frcenecDUtlNRsKSFE+tlY0kzEvF3V/K6umaqu60
	Snvq48BL8fle3Mixoa5j23PIL+QEkTqODCB5dVk5v1uN3/xsSJhqAxbSU5pyRHZ5XfXn
	+WVbdI+NiXh5kzEPxk5mWyWD1grAlp2D8AXyAlNKI0To0YH7Xrn8iIvkblyBRXr8ksBk
	TbLrZjIUOBmuCBwwtO/ZiADbfzu1MHI0OmnbOrfw+4R+rBtV0pWyfOKVPBPNxjPtvXZP
	Pu4YJdznnRm21CjfwMC/BSQYiJZGL5zz5gSj8tCM0GKgLwxCQcK6YsPhWTcpKSqBXKeM
	8b4A==
MIME-Version: 1.0
Received: by 10.182.16.3 with SMTP id b3mr16040153obd.72.1344203620862; Sun,
	05 Aug 2012 14:53:40 -0700 (PDT)
Received: by 10.60.33.129 with HTTP; Sun, 5 Aug 2012 14:53:40 -0700 (PDT)
X-Originating-IP: [188.79.230.198]
In-Reply-To: <CABcZANkq+Mjbogf8=P-G=gmh=Mrqj4M+f49E7Vk2H_tiK+ioFA@mail.gmail.com>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
	<1344196136-7643-14-git-send-email-javier@dowhile0.org>
	<CABcZANkq+Mjbogf8=P-G=gmh=Mrqj4M+f49E7Vk2H_tiK+ioFA@mail.gmail.com>
Date: Sun, 5 Aug 2012 23:53:40 +0200
Message-ID: <CABxcv=k2HyobTKctqQg6M-ORcvGLRqmZRg8ix8LYT-pauTJFXQ@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlIUA90BdfBLfLihqF3N2BFNc4kaDVxffHnkJRULTLizAOU+CFHf2XvpoFcdYCBlAfIQ+IU
Subject: Re: [PATCH v2 13/28] external-sourcery: use ${prefix} and ${libdir} instead of /usr and /usr/lib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 22:05:25 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 5, 2012 at 11:34 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Sun, Aug 5, 2012 at 12:48 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
>> It is considered good practice to use the build system provided
>> variables instead of directly specify hardcoded paths.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
>> ---
>>  .../meta/external-sourcery-toolchain.bb            |    8 ++++----
>>  1 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
>> index 74c82ec..1def79e 100644
>> --- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
>> +++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
>> @@ -24,7 +24,7 @@ PROVIDES += "\
>>         virtual/linux-libc-headers \
>>  "
>>  PV = "${CSL_VER_MAIN}"
>> -PR = "r7"
>> +PR = "r8"
>>
>>  #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
>>
>> @@ -38,10 +38,10 @@ do_install() {
>>         cp -a $sysroot/etc/. ${D}${sysconfdir}
>>         cp -a $sysroot/sbin/. ${D}${base_sbindir}
>>
>> -       install -d ${D}/usr
>> +       install -d ${D}${prefix}
>>         for usr_element in bin libexec sbin share ${base_libdir}; do
>>                 usr_path=$sysroot/usr/$usr_element
>> -               cp -a $usr_path ${D}/usr/
>> +               cp -a $usr_path ${D}${prefix}/
>>         done
>>         for datadir_element in man info; do
>>                 datadir_path=$sysroot/usr/$datadir_element
>> @@ -81,7 +81,7 @@ external_toolchain_sysroot_adjust() {
>>
>>         # If the usr/lib directory doesn't exist, the toolchain fails to even
>>         # try to find crti.o in a completely different directory (usr/lib64)
>> -       install -d ${SYSROOT_DESTDIR}/usr/lib
>> +       install -d ${SYSROOT_DESTDIR}${libdir}
>
>
> This is wrong. This line creates usr/lib *explicitly* to cover the
> case where libdir is set to something else (e.g. usr/lib64). As the
> comment says, the toolchain will fail to search the real libdir if the
> usr/lib dir does not exist.
> --
> Christopher Larson
>

Hi Christopher,

Thanks for explaining me this, I didn't know that libdir weren't use on purpose.

This patch can be discarded from the patch-set then.

Best regards,
Javier


