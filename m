Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54FCC78FCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 20:22:59 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id q184-v6so7154152vke.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 13:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jbJXfEEL1OO1ubFf4XGDN22uTa6haHYTVOJb3yHibBU=;
	b=uW3S1C2v9jJ0LNtXK6+8Qt1chFvwSHnAwSPkPYSvxmWnldWr6pvGtoIsv0MU6okBFP
	tFZbA2FI8Wg2JGhlaPERvvLAdwoHEr5H9NQ+/EjqKIVz+RWrSfH2sclhmGbKTH+M1N0p
	YEsV+iRKjGkyYo1lBoQjgQ/NgVcfVSFeYmwOv1Nom3C+j5IhEL4qSMLVxsV0Zfx7l5Xf
	zlh0swPBqQhkFYWCRdof7IAsOEl6ZVaLUGrLeNlmiPt9gK+3r1yHpAFy1LSOxwZcWSaG
	0qUjiDrfu+4663VIgenHixhPjsTTmNuUlrLIwYaGQScwuKOyO6RUDppjqyJ0uwRbQHgH
	R8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jbJXfEEL1OO1ubFf4XGDN22uTa6haHYTVOJb3yHibBU=;
	b=Q6vhqvWueZnMhJEJcAo5bO/yKjn2HcXydcoZc52HAUPzKxWUqYu+0SuOoKv4OCoSkn
	t6k0BWYWNbCi1Op/R/p7jPDkvN3YZwLkykxdY5mL1p/Ff1rhTh0Qt8xy97N16demrfPH
	+WMJB72clQod1YQO7aa9DxdSzhFj4samY59Qke91ikiHVB1nulZFdrPQ6QCSGTIiztqZ
	MUvDcGCYKvh8fkEkVUT7DClR5RmeLZ8vzjT2JxAXk942du4y/ATxWIQZ6YYkUKCfL6XM
	J85bYIIQg2qoSVSW6YReQJ4ZgKL7tZquyhtPemAOgkY4UCkCvzkYONV79hfx2jmf6PsM
	AAXg==
X-Gm-Message-State: APzg51DZ3bYU1SHZero/Wdw/HZMIGWOSD4IKmZuwde7MBu6HRZz1e4kK
	H+/c5xG+tqYViQWhv3LjH8pxnoZcWmK4J5DfhFc=
X-Google-Smtp-Source: ANB0VdaAA0ad0a9z5WapBKDbPKQtiWzPhpredszwzaCWTzp6pnDc/DhSMVIKmKk48cT2Lat/0U6IYInxXX2G8dk5k5U=
X-Received: by 2002:a1f:8b88:: with SMTP id
	n130-v6mr4339397vkd.83.1534796580207; 
	Mon, 20 Aug 2018 13:23:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 20 Aug 2018 13:22:59 -0700 (PDT)
In-Reply-To: <CAMKF1soPC5rCXEzZN78NuQS3qyFNQMv03QQVF8w3kduJn59tRQ@mail.gmail.com>
References: <20180820024616.12501-1-pkj@axis.com>
	<9efc95dd0b5186463b9e35dfa6d572513ed8e525.camel@linuxfoundation.org>
	<CAMKF1soPC5rCXEzZN78NuQS3qyFNQMv03QQVF8w3kduJn59tRQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Aug 2018 13:22:59 -0700
Message-ID: <CAJ86T=U_bNmw77eL-F7GJFUVe_zDzEMBpzRiHS397C1wxMwO7Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Add a dependency on virtual/crypt
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
X-List-Received-Date: Mon, 20 Aug 2018 20:22:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 12:45 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Aug 20, 2018 at 2:45 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Mon, 2018-08-20 at 04:46 +0200, Peter Kjellerstedt wrote:
>> > busybox needs crypt() if CONFIG_USE_BB_CRYPT is not defined.
>> >
>> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> > ---
>> >  meta/recipes-core/busybox/busybox.inc | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
>> > core/busybox/busybox.inc
>> > index 8c6dbbaf9b..a8ba10d21c 100644
>> > --- a/meta/recipes-core/busybox/busybox.inc
>> > +++ b/meta/recipes-core/busybox/busybox.inc
>> > @@ -3,7 +3,8 @@ DESCRIPTION = "BusyBox combines tiny versions of many
>> > common UNIX utilities into
>> >  HOMEPAGE = "http://www.busybox.net"
>> >  BUGTRACKER = "https://bugs.busybox.net/"
>> >
>> > -DEPENDS += "kern-tools-native"
>> > +# Depend on virtual/crypt in case CONFIG_USE_BB_CRYPT is not defined
>> > +DEPENDS += "kern-tools-native virtual/crypt"
>>
>> I'm not a bug fan of adding dependencies which might not be needed. How
>> common is CONFIG_USE_BB_CRYPT not being defined? I assume that isn't
>> our default config?
>
> yes perhaps it should be packageconfig

Busybox doesn't use PACKAGECONFIG. Conditional configuration is
handled by adding / removing cfg fragments and testing whether SRC_URI
contains "foo.cfg" (and also parsing the final .config within tasks
such as do_install). Unfortunately that approach doesn't work so well
for conditional build dependencies...

Our Busybox defconfig does enable CONFIG_USE_BB_CRYPT (and there's no
cfg fragment to disable it) so the virtual/crypt dependency isn't
needed in our default builds.

Disabling busybox's internal crypt functions doesn't seem like a very
common thing to want to do.

config USE_BB_CRYPT
    bool "Use internal crypt functions"
    default y
    help
      Busybox has internal DES and MD5 crypt functions.
      They produce results which are identical to corresponding
      standard C library functions.

      If you leave this disabled, busybox will use the system's
      crypt functions. Most C libraries use large (~70k)
      static buffers there, and also combine them with more general
      DES encryption/decryption.

      For busybox, having large static buffers is undesirable,
      especially on NOMMU machines. Busybox also doesn't need
      DES encryption/decryption and can do with smaller code.

      If you enable this option, it will add about 4.8k of code
      if you are building dynamically linked executable.
      In static build, it makes code _smaller_ by about 1.2k,
      and likely many kilobytes less of bss.

