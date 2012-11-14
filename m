Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TYgvz-0006Ax-EB
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 18:39:31 +0100
Received: from mail183-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.23; Wed, 14 Nov 2012 17:25:34 +0000
Received: from mail183-tx2 (localhost [127.0.0.1])	by
	mail183-tx2-R.bigfish.com (Postfix) with ESMTP id BCA784401BF;
	Wed, 14 Nov 2012 17:25:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zz98dI9371I936eI1432Izz1de0h1202h1d1ah1d2ahzz8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bhbe9i15d0l1155h)
Received: from mail183-tx2 (localhost.localdomain [127.0.0.1]) by mail183-tx2
	(MessageSwitch) id 1352913933321300_10558;
	Wed, 14 Nov 2012 17:25:33 +0000 (UTC)
Received: from TX2EHSMHS019.bigfish.com (unknown [10.9.14.251])	by
	mail183-tx2.bigfish.com (Postfix) with ESMTP id 396B61C00C3;
	Wed, 14 Nov 2012 17:25:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS019.bigfish.com
	(10.9.99.119) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 14 Nov 2012 17:25:30 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.103]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0318.003; Wed, 14 Nov 2012 17:25:30 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] classes: Be consistent about
	sstate-inputdirs/outputdirs ending with '/'
Thread-Index: AQHNwo0LORWgl3DMFUufsX8PdbwOyg==
Date: Wed, 14 Nov 2012 17:25:29 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A780C36@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1352815500.24487.123.camel@ted>
	<20121114150945.GN3928@jama.jama.net>
	<20121114152206.GO3928@jama.jama.net>
	<1352908789.15477.8.camel@ted>
In-Reply-To: <1352908789.15477.8.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Be consistent about sstate-inputdirs/outputdirs ending with '/'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 17:39:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <543E0CDE4DCC344B926E265F42A0AE75@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 9:59 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-11-14 at 16:22 +0100, Martin Jansa wrote:
>> On Wed, Nov 14, 2012 at 04:09:45PM +0100, Martin Jansa wrote:
>> > On Tue, Nov 13, 2012 at 02:05:00PM +0000, Richard Purdie wrote:
>> > > If sstate-inputdirs and sstate-outputdirs don't match with ending '/=
'
>> > > characters, the manifest file can end up corrupted. This change
>> > > ensures the metadata is consistent in ending do_populate_root tasks
>> > > with this character to avoid manifest file corruption.
>> > >
>> > > diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/=
recipes-devtools/gcc/gcc-cross-initial.inc
>> > > index ff6556c..1ac1db6 100644
>> > > --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> > > +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
>> > > @@ -74,6 +74,6 @@ sysroot_stage_all() {
>> > >   mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGIN=
G_DIR_TARGET}${target_libdir}/ || true
>> > >  }
>> > >
>> > > -do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STA=
GING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdi=
r}"
>> > > -do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_HOST} ${S=
TAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"
>> > > +do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STA=
GING_DIR_HOST}/ ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libd=
ir}/"
>> > > +do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_HOST}/ ${=
STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}/"
>> >
>> > Not sure if it can be caused by this, but building from scratch fails
>> > today with:
>> >
>>
>> with some added debug output it looks like trying to move the same direc=
tory twice:
>> WARNING: Moving
>> /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/=
sstate-install-populate-sysroot/
>> to
>> /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/=
sysroot-destdir///OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/
>> WARNING: Moving
>> /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/=
sstate-install-populate-sysroot/
>> to
>> /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/=
sysroot-destdir///OE/oe-core/tmp-eglibc/sysroots/qemux86-64//lib/
>> ERROR: Error executing a python function in
>> /OE/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross-initia=
l_4.7.bb:
>
> There is something missing from after sstate-install-populate-sysroot/.
> I've pushed a fix into master. Its only appearing when installing from
> sstate.

I've seen this on older releases also...

-M=



