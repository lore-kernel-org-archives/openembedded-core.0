Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbiDz-0005Iq-7S
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 02:01:47 +0200
Received: by pwi1 with SMTP id 1so539390pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 16:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=Z8XtBXXG+o2ImVvDc09h5J1i2ICycZYvWLPARhC8ftI=;
	b=H2Wbpr5B2GR7Op+l1ErGXGqPo6B7yTErRo9bzbLVWjaFuzRuLVXX5m5fBYG3WOdE7Z
	ITsO1wCxNbOocBU8cvDje3IGplJso2KTpsmB5WTQctotDeGg1hT+LleuF1erSZJvSxjG
	7cX5frsPP71Bk8RHGA1B81iVxObvSTnFPmY+A=
Received: by 10.142.164.21 with SMTP id m21mr88713wfe.116.1309305484748;
	Tue, 28 Jun 2011 16:58:04 -0700 (PDT)
Received: from [10.0.0.151] ([96.24.72.190])
	by mx.google.com with ESMTPS id e13sm424734wfd.13.2011.06.28.16.58.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 16:58:04 -0700 (PDT)
References: <BANLkTi=GQS+Rwv+srtcctpD3jDwu7RWv2Q@mail.gmail.com>
	<1309277809.20015.322.camel@rex>
	<BANLkTinGUawS4b7x2YdP+Tu+B=Ngkt4MbQ@mail.gmail.com>
	<C6510F6D410BB64A8C15398EDC6B847C027427@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C027427@ORSMSX101.amr.corp.intel.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <5673734F-7C0A-40A9-B4B4-3098252D0622@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jun 2011 16:58:18 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFH] Native SDK wirdness
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
X-List-Received-Date: Wed, 29 Jun 2011 00:01:47 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jun 28, 2011, at 2:31 PM, "Zhang, Jessica" <jessica.zhang@intel.com> wrot=
e:

> Hi Otavio,
>=20
> Here's what I got when I tried the same command against my sdk tarball
>=20
> tar -tjf poky-eglibc-i686-i586-toolchain-gmae-1.0+snapshot-20110625.tar.bz=
2 |grep '\-gcc'
> tar: Record size =3D 16 blocks
> ./opt/poky/1.0+snapshot/sysroots/i586-poky-linux/usr/src/debug/glib-2.0-1_=
2.28.8-r1/glib-2.28.8/glib/gatomic-gcc.c
> ./opt/poky/1.0+snapshot/sysroots/i686-pokysdk-linux/usr/bin/i586-poky-linu=
x/i586-poky-linux-gcc
> ./opt/poky/1.0+snapshot/sysroots/i686-pokysdk-linux/usr/lib/i586-poky-linu=
x/gcc/i586-poky-linux/4.6.1/include/stdint-gcc.h
> ./opt/poky/1.0+snapshot/sysroots/i686-pokysdk-linux/usr/include/curl/typec=
heck-gcc.h
>=20
> Seems an issue with OE build?
>=20
> Cheers,
> Jessica
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde=
d-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
> Sent: Tuesday, June 28, 2011 9:28 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [RFH] Native SDK wirdness
>=20
> On Tue, Jun 28, 2011 at 13:16, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2011-06-28 at 11:56 -0300, Otavio Salvador wrote:
>>> I am probably doing something stupid but I couldn't figure it myself
>>> so I am looking for some help here. Basically I need to prepare a SDK
>>> for usage by our team mates to develop to our embedded OS. In theory I
>>> got most of it already done but when I build the meta-toolchain recipe
>>> the built sdk tarball lacks GCC and like.
>>>=20
>>> Any idea where I ought to look for a good example? Or any clue what I
>>> am doing wrong?
>>=20
>> Could you share a list of files from your toolchain tarball please? It
>> certainly should contain a cross compiler...
>=20
> ~% tar -tjf oecore-i686-i586-toolchain-devel.tar.bz2| grep '\-gcc'
> ./usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include/curl/ty=
pecheck-gcc.h
> ./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/include/curl/typec=
heck-gcc.h
> ./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/=
symbian/linux-gcce/
> ./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/=
symbian/linux-gcce/qplatformdefs.h
> ./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/=
symbian/linux-gcce/qmake.conf
> ./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/=
symbian/linux-gcce/features/
> ./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/=
symbian/linux-gcce/features/default_post.prf
> ~%
>=20
> I can provide the full list but it does seem to not include it.

What steps did u follow to build.
Ant local patches
>=20
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


