Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBWVe-0005zU-79
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 20:48:03 +0200
Received: from mail48-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 18:42:25 +0000
Received: from mail48-tx2 (localhost.localdomain [127.0.0.1])	by
	mail48-tx2-R.bigfish.com (Postfix) with ESMTP id DB5CFA98173	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 18:42:24 +0000 (UTC)
X-SpamScore: -18
X-BigFish: VS-18(zzbb2dK9371K936eK1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail48-tx2 (localhost.localdomain [127.0.0.1]) by mail48-tx2
	(MessageSwitch) id 1317840096263339_5933;
	Wed,  5 Oct 2011 18:41:36 +0000 (UTC)
Received: from TX2EHSMHS022.bigfish.com (unknown [10.9.14.249])	by
	mail48-tx2.bigfish.com (Postfix) with ESMTP id 3A3E84004F	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 18:41:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS022.bigfish.com
	(10.9.99.122) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 18:41:29 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 13:41:28 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/6] Fix sysprof for powerpc64
Thread-Index: AQHMg45kmll0mnSWpki4iAxH2ajb3w==
Date: Wed, 5 Oct 2011 18:41:27 +0000
Message-ID: <CAEsOVNce1G3Y2J6FMvKDHHjxttJrsL3H8VCR_KjmBaiZde78Eg@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com> <1317814555.14671.137.camel@ted>
	<1317839445.2979.0.camel@lenovo.internal.reciva.com>
In-Reply-To: <1317839445.2979.0.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 05 Oct 2011 18:48:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <950CEF550BF9A94BAE02173DB7AF3FE5@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 1:30 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2011-10-05 at 12:35 +0100, Richard Purdie wrote:
>> On Tue, 2011-10-04 at 17:05 -0700, Khem Raj wrote:
>> > On 10/4/2011 3:03 PM, Matthew McClintock wrote:
>> > > sysprof will not build properly without this defined
>> > >
>> > > Signed-off-by: Matthew McClintock<msm@freescale.com>
>> > > ---
>> > > No comments on original patch sent
>> > >
>> > > =A0 meta/recipes-kernel/sysprof/sysprof_git.bb | =A0 =A02 ++
>> > > =A0 1 files changed, 2 insertions(+), 0 deletions(-)
>> > >
>> > > diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recip=
es-kernel/sysprof/sysprof_git.bb
>> > > index 10bde04..271b5d8 100644
>> > > --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
>> > > +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
>> > > @@ -16,6 +16,8 @@ SRC_URI_append_arm =A0=3D " file://rmb-arm.patch"
>> > > =A0 SRC_URI_append_mips =3D " file://rmb-mips.patch"
>> > > =A0 SRC_URI_append_powerpc =3D " file://ppc-macro-fix.patch"
>> > >
>> > > +export CFLAGS_append_powerpc64 =3D " -D__ppc64__"
>> > > +
>> >
>> > this is a gcc built-in define I wonder why you need to add it explicit=
ly
>>
>> Are you sure? Is the built-in define not __powerpc64__ ?
>
> Yes, __powerpc64__ is the generic one. =A0I think __ppc64__ is only a
> predefine on Darwin.

This seems to be recently fixed upstream. I will just add a patch for
this, it's not even in 1.1.8 which we just updated too in oe-core.

-M=



