Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RV97I-0000wQ-DJ
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 22:52:01 +0100
Received: from mail35-am1-R.bigfish.com (10.3.201.252) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.22; Mon, 28 Nov 2011 21:29:18 +0000
Received: from mail35-am1 (localhost [127.0.0.1])	by mail35-am1-R.bigfish.com
	(Postfix) with ESMTP id 7842E140399;
	Mon, 28 Nov 2011 21:29:17 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail35-am1 (localhost.localdomain [127.0.0.1]) by mail35-am1
	(MessageSwitch) id 1322515692985528_20743;
	Mon, 28 Nov 2011 21:28:12 +0000 (UTC)
Received: from AM1EHSMHS020.bigfish.com (unknown [10.3.201.249])	by
	mail35-am1.bigfish.com (Postfix) with ESMTP id 4798280056;
	Mon, 28 Nov 2011 21:28:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS020.bigfish.com
	(10.3.206.23) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 28 Nov 2011 21:28:08 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Mon, 28 Nov 2011 15:28:54 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] rpm_5.4.0.bb: Add xz as rpm DEPENDS
Thread-Index: AQHMrhS6xOfQA1VQb0e5kjrRVLfhsw==
Date: Mon, 28 Nov 2011 21:28:53 +0000
Message-ID: <CAEsOVNeCt0x9Rf5FPp-HH47mn_fdYsbAfkX6QaX0kiRahv5OHg@mail.gmail.com>
References: <1322035877-18151-1-git-send-email-msm@freescale.com>
	<1322070364.15626.17.camel@ted>
In-Reply-To: <1322070364.15626.17.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] rpm_5.4.0.bb: Add xz as rpm DEPENDS
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
X-List-Received-Date: Mon, 28 Nov 2011 21:52:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3E5C249821B1514292E289E2BD9B05C8@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 11:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> =A01 files changed, 2 insertions(+), 2 deletions(-)DISTRO_FEATURES_BACKF=
ILLCONSIDERED
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devto=
ols/rpm/rpm_5.4.0.bb
>> index 356512a..87fb833 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
>> @@ -42,10 +42,10 @@ HOMEPAGE =3D "http://rpm5.org/"
>> =A0LICENSE =3D "LGPL 2.1"
>> =A0LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1"
>>
>> -DEPENDS =3D "bzip2 zlib db openssl elfutils expat libpcre attr acl popt=
 ${extrarpmdeps}"
>> +DEPENDS =3D "bzip2 zlib db openssl elfutils expat libpcre attr acl popt=
 xz ${extrarpmdeps}"
>> =A0extrarpmdeps =3D "python perl"
>> =A0extrarpmdeps_virtclass-native =3D "file-native"
>> -PR =3D "r22"
>> +PR =3D "r23"
>>
>> =A0# rpm2cpio is a shell script, which is part of the rpm src.rpm. =A0It=
 is needed
>> =A0# in order to extract the distribution SRPM into a format we can extr=
act...
>
> If we don't need xy (we don't as far as I know?), could we just disable
> it instead?

Updated patch sent to list...

-M=



