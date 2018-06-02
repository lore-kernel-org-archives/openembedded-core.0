Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86AB160116
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 16:17:07 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id n3-v6so19104643lfe.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 09:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ns5Mv0X1iBxL+ebuXwV/KdeWhXdG41irff9z0CFUzQE=;
	b=UTCDrAUTRq9bk85CgXzVCi7IkWooUmjNmX/CK++e0v6HL0hpa/39SUGUlSjpPJ+jzy
	MjZE8FbtzKeN1uFENUUQ0dPz290yi4XiEcqNC2CKaO3m4rjLwYvD6uthUCFfdjJF41zY
	MK0lo2PwpgPN3hq4FQVmHI/CViBV3yZkBxFPQt2i8D54QWgz8IpywduAKU9+mrKbwA2u
	h7fF9cFMR3AceIJGWowsqiAmS+cbvxAUMjR0FumO747IU5LKiWq66V/E4mfZiZKKmtJE
	KIiMfxjVWE2sdesi1xuX+JMn4SyVLHWQbAsqb73nse7bKqptv9MJ4+oPBqHOtPnYXm6a
	KlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ns5Mv0X1iBxL+ebuXwV/KdeWhXdG41irff9z0CFUzQE=;
	b=HoXAp6ITP0jnyGZAaxFZ0AyVMg8L/s7TNxklIzqdKSCacOdhaY5cwxruOuHE33Wrtf
	PRfT2sw2lFg3pf/UhluaOLMj7Ec8eukFoR2XFYUF0k+mTnP0bj1ZjvZTCsTvYd1ewEQD
	ACb66nZE5BgygqSoTkc+q0UYVUqKrqu0SAiybN5tuLWi8prtyZSsp+sQgVRpxIo+EjvH
	ImaNJqBysVm38uAyESiU71wfnBoDnFLNMBg1elH6ALZQmc6REubAxK0htBI7pbuNW+mE
	i5MOb0IkEdooFlwzg5+EOUeSwrMwTZmQ1rV1jdDxOJUa5sy9rVqEzoBlqbfEFmVsmbV+
	tvXw==
X-Gm-Message-State: ALKqPwc7olihpU2t1c+N2VqBYwQxd2eyAMO93/x0vqHAX6NFYaU/NyH2
	0tDuCVzcNWZvaOyUBciE6g3/oYxzD63v8gEaEIY=
X-Google-Smtp-Source: ADUXVKLkvISOUhQwEW/RpmL8HcGH/sS5ceJ9gBO5TsdZ/ChtsUumK/8I2PzXg6PlGGg5gMHlVH7HrYEFxDBO0xmaTXk=
X-Received: by 2002:a19:1003:: with SMTP id
	f3-v6mr9740536lfi.114.1527956227906; 
	Sat, 02 Jun 2018 09:17:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Sat, 2 Jun 2018 09:16:37 -0700 (PDT)
In-Reply-To: <CANNYZj_4YMuZY8Up7ci4-1JGcW2HNAdAM7xG96WpF0mfVKD7EQ@mail.gmail.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<CANNYZj_4YMuZY8Up7ci4-1JGcW2HNAdAM7xG96WpF0mfVKD7EQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 2 Jun 2018 09:16:37 -0700
Message-ID: <CAKmqyKNtMxYvrrs17NShCOXTvbeS2Wc6sDAmDDNF+bV16G5hdQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] [meta] dbus: Fix X11 compille errors
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
X-List-Received-Date: Sat, 02 Jun 2018 16:17:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 1, 2018 at 10:06 PM, Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> Wait, why is this problem not seen by anyone else, particularly on the
> autobuilder? Can you provide the failure log please?

That is a good question.

I'll attach the logs when I'm back at work on Monday. I am building
for RISC-V which is probably why I see it when others don't.

Alistair

>
> And do the same for the other patch to atk.
>
> Alex
>
> 2018-06-02 1:14 GMT+03:00 Alistair Francis <alistair.francis@wdc.com>:
>> When building with X11 set in DISTRO_FEATURES we need to specify that we
>> depend on X11 native for building dbus. Otherwise we see missing include
>> file compile errors.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/recipes-core/dbus/dbus_1.12.8.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/dbus/dbus_1.12.8.bb b/meta/recipes-core/dbus/dbus_1.12.8.bb
>> index b3ddaafab5..40868628f6 100644
>> --- a/meta/recipes-core/dbus/dbus_1.12.8.bb
>> +++ b/meta/recipes-core/dbus/dbus_1.12.8.bb
>> @@ -6,6 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>>                      file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
>>  DEPENDS = "expat virtual/libintl autoconf-archive"
>> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-native', '', d)}"
>>  RDEPENDS_dbus_class-native = ""
>>  RDEPENDS_dbus_class-nativesdk = ""
>>  PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

