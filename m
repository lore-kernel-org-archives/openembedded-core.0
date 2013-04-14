Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URNas-0000mn-2Z
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 16:07:58 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so1791228ead.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 06:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=bDEGH85oAcbTvnH3vYDmJQmvJlFmwH0PG9ziWNMMXEA=;
	b=o57s88LW92R5vvmRqOYEzfMI+WNvPkDJxA1LN3Qq4TlCsioScJX116GiLCIaomKyEc
	mNQJX7bMbS54F59z/oka4qz3Zo57Jh2FJrCr5TN7JgekczhxbNcO8MU/0dIrBNLrQp2o
	pli1lNyDM6AJotYMY6CjyDr3LrpymsEoAKGsV9LEfYi3HjdQo0MVf32hCFPTmMe6pp7Z
	4EaA8NTWROMRXoANJuLXPaK+as3geBftXXtX+20oOPOq38umkLrsE020+J+IBSSxrwxt
	jAQdhXmGo8ijWBCI69hT4g6IgJDqrSho9BFA1znaySBvOAVlxxgWgYZl5xU9JagoDEhr
	ULcg==
X-Received: by 10.14.104.6 with SMTP id h6mr50910941eeg.5.1365947418864;
	Sun, 14 Apr 2013 06:50:18 -0700 (PDT)
Received: from ?IPv6:2001:610:612::1cd5:7e72:317b:cd33?
	([2001:610:612:0:1cd5:7e72:317b:cd33])
	by mx.google.com with ESMTPS id j44sm12105206eeu.10.2013.04.14.06.50.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 06:50:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2868224.qKIdN0gebe@helios>
Date: Sun, 14 Apr 2013 15:50:15 +0200
Message-Id: <4CAA4CCA-5F6E-4375-A60F-9AD8EF455AB2@dominion.thruhere.net>
References: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
	<2868224.qKIdN0gebe@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkeF8iA5Sg12gfOJpLe9z4FG8fJ0UxFc2S4BVRsrZKfKj4zzc52+EAkR6ylkVp2r8mVM8EU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: define fdt_t types in libfdt_env.h from qemu
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
X-List-Received-Date: Sun, 14 Apr 2013 14:07:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 apr. 2013, om 13:57 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Saturday 13 April 2013 20:35:11 Henning Heinold wrote:
>> From: Henning Heinold <heinold@inf.fu-berlin.de>
>>=20
>> * fixes
>> In file included from
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/libfdt.h:55:0, from
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qe=
m
>> u-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
>> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x
>> /usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'
>=20
> I still can't reproduce this issue on F18 with dtc-native built. What =
triggers=20
> it exactly?

Updating dtc-native to current git will trigger it. I have a patch to do =
that, but haven't sent it yet due to the qemu breakage above.=


