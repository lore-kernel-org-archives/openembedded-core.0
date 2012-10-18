Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TOju3-0004hb-Gt
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 08:48:23 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so7037729pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 23:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=XdUK3m6GqeAlLpUpwr0sfLtsql8EalULmJIoCvDXQZQ=;
	b=dFSJN4SsaIsmV0+JWwp9xcHBTrlDNkKjAsNnrfS6dEXTuRq86m2K8cbHhgCm3VxEFA
	DrhAyj7bB6vBNQaxZ9r0MPlsYmfo5csZ3t5Kc4oNEh/tAByv1CiqXZy+uiV+4XruL5T7
	h0UtmTLEcJNvu+3OG05slDj2Z7IO0lZHRaX5iR/kaA+8s3tCEOJFPdbVTX9/2G/Sx9aN
	3SaFfyFdSXA8RXuBaYq++UOBV09NvEhIqL5sxUhj/9SF6S2t8Lf6SpOE3BRazfHoN/EL
	SEa4S5epsve1NgHOPNGPzUggjdYLSr/0zUynhUipYkwYrLmtXs6Kljj+qGwUJeTIhAgJ
	E6gg==
Received: by 10.68.222.231 with SMTP id qp7mr4480629pbc.7.1350542103805;
	Wed, 17 Oct 2012 23:35:03 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	rz10sm13746161pbc.32.2012.10.17.23.34.59
	(version=SSLv3 cipher=OTHER); Wed, 17 Oct 2012 23:35:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <DD178F3D66989248ABAC4C14253F477F11E36C@039-SN2MPN1-021.039d.mgd.msft.net>
Date: Wed, 17 Oct 2012 23:35:12 -0700
Message-Id: <335274E5-34DE-4732-A0AD-BF051D6FEF2F@gmail.com>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<7A2134DD-519C-4FFB-ACEE-8E36E7A5A088@gmail.com>
	<DD178F3D66989248ABAC4C14253F477F11E36C@039-SN2MPN1-021.039d.mgd.msft.net>
To: Dutta Yashpal-B05456 <B05456@freescale.com>
X-Mailer: Apple Mail (2.1499)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev kernel module recipe
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
X-List-Received-Date: Thu, 18 Oct 2012 06:48:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 17, 2012, at 11:27 PM, Dutta Yashpal-B05456 =
<B05456@freescale.com> wrote:

>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Thursday, October 18, 2012 11:44 AM
>> To: Dutta Yashpal-B05456
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] cryptodev kernel module recipe
>>=20
>>=20
>> On Oct 18, 2012, at 2:57 AM, Yashpal Dutta =
<yashpal.dutta@freescale.com>
>> wrote:
>>=20
>>> +-install:
>>> ++modules_install:
>>> + 	make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` modules_install
>>> +-	@echo "Installing cryptodev.h in /usr/include/crypto ..."
>>> +-	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
>>> ++	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto =
..."
>>> ++	@install -D crypto/cryptodev.h
>> $(PREFIX)/usr/include/crypto/cryptodev.h
>>> +
>>=20
>> why is it installing linux headers under /usr/include shouldn't they =
be
>> under usr/include/linux ?
> [Yash] That is how original cryptodev module makefile is installing =
the file for packages like openssl.
> Here is one instance where openssl is referring cryptodev.h:
>=20
> crypto/engine/eng_cryptodev.c:#include <crypto/cryptodev.h>
> crypto/evp/openbsd_hw.c:#include <crypto/cryptodev.h>
>=20

hmm ok.=20=


