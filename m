Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHH6e-0003Uq-3l
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 18:06:16 +0200
Received: by wgbdr12 with SMTP id dr12so3530767wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=DM7aZX/XVZGob7meN/3f8Bio9r3aA5aTriKNWe2WwZY=;
	b=asEGLOB7GkT6ZiZCRncMk8d1t14tZWRgxonIvO3q1B8A5CNc23PEk8hPWFirMPMT3q
	TDiPVhGrBTYDbLkaHrxUXuZ5nu3ntRGRNkSXB6DHpbZGV4s1uKxjSkaLylsQjrW3zbvY
	YMlli04yTlCYk9n7nJckpkUbwIJheVsp1PvKdU87G4JT3us7MMT1rMXI/tTYzauIEnxh
	PkV8qBBs0jjJx++PD3GoQJRHyQQnab2VNHfDApvAtCziqMe3Lm0axICHqQVZHZ74pr0E
	Sv8FasEpTcIk6+upNw6jtNRh3TS/VhgkW2apVaTt8o9Oy9HcW/xyyaDB1/DwaYemwk03
	MAXw==
Received: by 10.216.136.13 with SMTP id v13mr4250329wei.32.1333987019523;
	Mon, 09 Apr 2012 08:56:59 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l5sm31201834wia.11.2012.04.09.08.56.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:56:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F82FD70.9080609@windriver.com>
Date: Mon, 9 Apr 2012 17:56:57 +0200
Message-Id: <1B24CCF7-14B3-47EC-9CF9-369EB44A3C70@dominion.thruhere.net>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
	<CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
	<4F7F85DC.2000301@windriver.com>
	<4F820472.1080109@opendreambox.org>
	<4F82FD70.9080609@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmWdcE0gJVgi5W+Iy9JhgpaFqBrf/CkT/IyG3SQwNpVIzdkNezHGOxFLBtlZ2ShwdgDqa3y
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Mon, 09 Apr 2012 16:06:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2012, om 17:17 heeft Mark Hatle het volgende geschreven:

> On 4/8/12 4:34 PM, Andreas Oberritter wrote:
>> On 07.04.2012 02:10, Mark Hatle wrote:
>>> Just ran a local build with the qemumips machine, this is a standard
>>> mips32 target.
>>>=20
>>> =46rom the configure line for eglibc:
>>>=20
>>> =
/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/work/mips32-oe-linu=
x/eglibc-2.13-r23+svnr15508/eglibc-2_13/libc/configure
>>> --build=3Dx86_64-linux --host=3Dmips-oe-linux --target=3Dmips-oe-linux=

>>> --prefix=3D/usr --exec_prefix=3D/usr --bindir=3D/usr/bin =
--sbindir=3D/usr/sbin
>>> --libexecdir=3D/usr/libexec --datadir=3D/usr/share --sysconfdir=3D/etc=

>>> --sharedstatedir=3D/com --localstatedir=3D/var --libdir=3D/usr/lib
>>> --includedir=3D/usr/include --oldincludedir=3D/usr/include
>>> --infodir=3D/usr/share/info --mandir=3D/usr/share/man =
--disable-silent-rules
>>> --disable-dependency-tracking
>>> =
--with-libtool-sysroot=3D/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-e=
glibc/sysroots/qemumips
>>> --enable-kernel=3D2.6.16 --without-cvs --disable-profile =
--disable-debug
>>> --without-gd --enable-clocale=3Dgnu
>>> --enable-add-ons=3Dports,nptl,libidn,ports
>>> =
--with-headers=3D/msp-lpggp1/mhatle/git/oe-core/build-mips32/tmp-eglibc/sy=
sroots/qemumips/usr/include
>>> --without-selinux
>>>=20
>>> The system is correctly setting the target to "mips-oe-linux".
>>>=20
>>> I checked and bash is the same way.
>>>=20
>>> So the canonical arch is correct, the mips32 is only the packaging
>>> arch.  It was always intended that the packaging arch be used in =
full on
>>> MIPS.  (This will allow us to specify mips32r2, mipsiii, mipsiv, etc =
as
>>> necessary if we expand the mips tunings.)
>>=20
>> I don't think such a change should be done only few days before a
>> release. Until this patch was applied, the packaging arch has always
>> been mipsel, not mips32el. Please, revert or fix this!
>=20
> This is easy to change to the previous behavior...  however it was a =
bug in the original implementation.
>=20
> But again, I stress nothing changed except for the packaging arch... =
the way the packages are configured, compiled, installed remain the =
same, only the package arch has changed.=20

"only"




