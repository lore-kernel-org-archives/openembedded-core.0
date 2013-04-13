Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UR5yX-00018l-0P
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Apr 2013 21:19:01 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so1709622eaf.31
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2013 12:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=xeCFWHzxikeNzZWhAomFxCNnXSQnb2Y600uQBrURlcg=;
	b=fN6Fi2U8RR8B+6qgUoh7PQthsm0KMU20N8rz6r8/GeM1ktnXTvon+N4+AsZlQU29hj
	IKEabedZjyZ6VeG5eqJ+YwvODTkcdn2jYn36TO+hlKuKWA+028r+yd3XnWFYXUho9Mun
	KG6c8yl7yQYHlSSaWWEggzUdaXUlJb7/N05PNnBHocNn56XJQ2+YXQyVB+hm8O6cGPmu
	vq1HMwRu6S3QHjKRXuhqnp7NXe/gF61BrPOUZNcyekTlJGPhrY9A1eCvCjbNeULBbVS5
	6NpsWWbeGKs5jUzBrHccHL+8+ZTNuwRiFQkDk5lBPpgi4JfYSbSDi4YjY7Br/pqBqUo/
	Jx3g==
X-Received: by 10.15.34.199 with SMTP id e47mr42117323eev.35.1365879694416;
	Sat, 13 Apr 2013 12:01:34 -0700 (PDT)
Received: from ?IPv6:2001:610:612::bd86:e691:6957:cf66?
	([2001:610:612:0:bd86:e691:6957:cf66])
	by mx.google.com with ESMTPS id t4sm17907208eel.0.2013.04.13.12.01.32
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 12:01:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
Date: Sat, 13 Apr 2013 21:01:33 +0200
Message-Id: <8758D8EB-B063-4E8F-9407-632C3DF0AEAC@dominion.thruhere.net>
References: <1365878111-23737-1-git-send-email-heinold@inf.fu-berlin.de>
To: Henning Heinold <heinold@inf.fu-berlin.de>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmRQyqbPige6s2obafFodLslC7xaCqSv1IaxxrxyfEsNylkcLQyRClG3Wz44KobJ4i5iJQT
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
X-List-Received-Date: Sat, 13 Apr 2013 19:19:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 apr. 2013, om 20:35 heeft Henning Heinold =
<heinold@inf.fu-berlin.de> het volgende geschreven:

> From: Henning Heinold <heinold@inf.fu-berlin.de>
>=20
> * fixes
> In file included from =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/libfdt.h:55:0,
>                 from =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/work/x86_64-linux/qe=
mu-native/1.4.0-r0/qemu-1.4.0/hw/arm/../../device_tree.c:28:
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:58:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:59:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:60:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:61:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:62:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:63:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:64:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:67:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:70:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:73:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:77:2: error: unknown type name 'fdt64_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:78:2: error: unknown type name 'fdt64_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:82:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:87:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:88:2: error: unknown type name 'fdt32_t'
> =
/home/oe/setup-scripts/build/tmp-angstrom_next-uclibc/sysroots/x86_64-linu=
x/usr/include/fdt.h:89:2: error: unknown type name 'fdt32_t'
>=20
> Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>



Tested-by: Koen Kooi <koen@dominion.thruhere.net>=


