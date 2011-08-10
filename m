Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qr2jk-0003oe-LR
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 08:57:56 +0200
Received: by iyf13 with SMTP id 13so651669iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 23:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=sDYIkl2ejEbxyPP5YH/Zs/vjQymK9xoBI+U/QmXGWx8=;
	b=N4sbZtIAEaOef7IrM/1greAovfkBoStjzcMmPzzLhPAPMlD17s+VqWtz8V4G/uKI1m
	6PRLQWiilmLkPF1fhSPwVNiqQvVUEAYJIuORv8QSngoB9GbYGvKh1Y/Ka8CW/VHsZ+mX
	USr8WNOGthDLUMpc8nS87pIEifYtbo/k1wOec=
Received: by 10.43.132.65 with SMTP id ht1mr6508266icc.5.1312959205100;
	Tue, 09 Aug 2011 23:53:25 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n18sm508552ibg.1.2011.08.09.23.53.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 23:53:24 -0700 (PDT)
References: <24988974-E702-4404-BEB2-EB8B946BFC5E@kernel.crashing.org>
In-Reply-To: <24988974-E702-4404-BEB2-EB8B946BFC5E@kernel.crashing.org>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <A95A9FE2-E504-42AD-A695-44D25231CE70@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Aug 2011 23:54:42 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: finding libgcc.a with meta-toolchain-sdk toolchain
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
X-List-Received-Date: Wed, 10 Aug 2011 06:57:56 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Aug 9, 2011, at 9:20 PM, Kumar Gala <galak@kernel.crashing.org> wrote:

> Trying to build something like u-boot w/the toolchain produced by meta-too=
lchain-sdk and get the following:
>=20
> $ powerpc-poky-linux-gnuspe-ld -g -Ttext 0x40000 -o hello_world -e hello_w=
orld hello_world.o libstubs.o -L. -lgcc
> powerpc-poky-linux-gnuspe-ld: cannot find -lgcc

You are using ld. If you use gcc driver to do the linking it should do bette=
r
>=20
> If I take on a --verbose I get:
> attempt to open ./libgcc.so failed
> attempt to open ./libgcc.a failed
> attempt to open /opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/=
usr/local/lib/libgcc.so failed
> attempt to open /opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/=
usr/local/lib/libgcc.a failed
> attempt to open /opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/=
lib/libgcc.so failed
> attempt to open /opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/=
lib/libgcc.a failed
> attempt to open /opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/=
usr/lib/libgcc.so failed
> attempt to open /opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/=
usr/lib/libgcc.a failed
>=20
> What do we need to tweak so we can find libgcc.a?
>=20
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


