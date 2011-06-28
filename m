Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QbfxQ-00025t-9v
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 23:36:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2011 14:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,439,1304319600"; d="scan'208";a="21213830"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2011 14:31:44 -0700
Received: from orsmsx106.amr.corp.intel.com (10.22.225.133) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 28 Jun 2011 14:31:44 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.138]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.75]) with mapi id
	14.01.0289.001; Tue, 28 Jun 2011 14:31:43 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFH] Native SDK wirdness
Thread-Index: AQHMNaOey0nF6EUL4UqdwK68A1QzFpTTZ6KAgAADGoD//9ePMA==
Date: Tue, 28 Jun 2011 21:31:42 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C027427@ORSMSX101.amr.corp.intel.com>
References: <BANLkTi=GQS+Rwv+srtcctpD3jDwu7RWv2Q@mail.gmail.com>
	<1309277809.20015.322.camel@rex>
	<BANLkTinGUawS4b7x2YdP+Tu+B=Ngkt4MbQ@mail.gmail.com>
In-Reply-To: <BANLkTinGUawS4b7x2YdP+Tu+B=Ngkt4MbQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.9.131.214]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 28 Jun 2011 21:36:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Here's what I got when I tried the same command against my sdk tarball

tar -tjf poky-eglibc-i686-i586-toolchain-gmae-1.0+snapshot-20110625.tar.bz2=
 |grep '\-gcc'
tar: Record size =3D 16 blocks
./opt/poky/1.0+snapshot/sysroots/i586-poky-linux/usr/src/debug/glib-2.0-1_2=
.28.8-r1/glib-2.28.8/glib/gatomic-gcc.c
./opt/poky/1.0+snapshot/sysroots/i686-pokysdk-linux/usr/bin/i586-poky-linux=
/i586-poky-linux-gcc
./opt/poky/1.0+snapshot/sysroots/i686-pokysdk-linux/usr/lib/i586-poky-linux=
/gcc/i586-poky-linux/4.6.1/include/stdint-gcc.h
./opt/poky/1.0+snapshot/sysroots/i686-pokysdk-linux/usr/include/curl/typech=
eck-gcc.h

Seems an issue with OE build?

Cheers,
Jessica
-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: Tuesday, June 28, 2011 9:28 AM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [RFH] Native SDK wirdness

On Tue, Jun 28, 2011 at 13:16, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-06-28 at 11:56 -0300, Otavio Salvador wrote:
>> I am probably doing something stupid but I couldn't figure it myself
>> so I am looking for some help here. Basically I need to prepare a SDK
>> for usage by our team mates to develop to our embedded OS. In theory I
>> got most of it already done but when I build the meta-toolchain recipe
>> the built sdk tarball lacks GCC and like.
>>
>> Any idea where I ought to look for a good example? Or any clue what I
>> am doing wrong?
>
> Could you share a list of files from your toolchain tarball please? It
> certainly should contain a cross compiler...

~% tar -tjf oecore-i686-i586-toolchain-devel.tar.bz2| grep '\-gcc'
./usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include/curl/typ=
echeck-gcc.h
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/include/curl/typech=
eck-gcc.h
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/qplatformdefs.h
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/qmake.conf
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/features/
./usr/local/oecore-i686-i586/sysroots/i586-oe-linux/usr/share/qt4/mkspecs/s=
ymbian/linux-gcce/features/default_post.prf
~%

I can provide the full list but it does seem to not include it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


