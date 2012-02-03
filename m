Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>)
	id 1RtGNi-0004F8-9W; Fri, 03 Feb 2012 11:28:38 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 820BA4B0188;
	Fri,  3 Feb 2012 11:20:38 +0100 (CET)
Date: Fri, 3 Feb 2012 11:20:37 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120203112037.314f9004@eb-e6520>
In-Reply-To: <20120203094104.GE3893@jama.jama.net>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
	<20120202084000.GD3697@jama.jama.net>
	<20120202091726.GG3697@jama.jama.net>
	<20120202111127.0b9d886a@eb-e6520>
	<20120203072808.GB3893@jama.jama.net>
	<20120203094104.GE3893@jama.jama.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] SDK confusion Was: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Fri, 03 Feb 2012 10:28:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Fri, 3 Feb 2012 10:41:05 +0100,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> in x86_64-oesdk-linux there are only gcc+binutils crosssdk
> binutils-crosssdk-2.22-r2  gcc-crosssdk-4.6.2+svnr181430-r22  gcc-crosssd=
k-initial-4.6.2+svnr181430-r22  gcc-crosssdk-intermediate-4.6.2+svnr181430-=
r22
> the rest is in=20
> x86_64-nativesdk-oesdk-linux
>=20
> gdb-cross-canadian-arm is only package were exec_prefix points to oecore-=
x86_64-arm
> ./gdb-cross-canadian-arm-7.3.1-r5.1/temp/run.do_configure.1688
> export exec_prefix=3D"/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-=
linux/usr"
>=20
> while all nativesdk packages are using oecore-x86_64-x86_64
> ./python-nativesdk-2.7.2-r0.5/temp/run.do_configure.14043
> export exec_prefix=3D"/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oes=
dk-linux/usr"
>=20
here is the big difference when using Angstrom :
python-nativesdk-2.7.2-r0.5/temp/run.do_configure.30951:73:export
exec_prefix=3D"/usr/local/angstrom-eglibc-x86_64-armv7a/sysroots/x86_64-ang=
stromsdk-linux/usr"
I don't yet know where this difference comes from.

Eric
--=20
http://eukrea.com/en/news/104-2012


