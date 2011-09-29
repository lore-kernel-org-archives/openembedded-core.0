Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=AM1EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9LZn-0002uW-NE
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:43:19 +0200
Received: from mail6-am1-R.bigfish.com (10.3.201.244) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 18:22:47 +0000
Received: from mail6-am1 (localhost.localdomain [127.0.0.1])	by
	mail6-am1-R.bigfish.com (Postfix) with ESMTP id 622F117104FA	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:22:47 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371K936eK1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail6-am1 (localhost.localdomain [127.0.0.1]) by mail6-am1
	(MessageSwitch) id 1317320522472744_32655;
	Thu, 29 Sep 2011 18:22:02 +0000 (UTC)
Received: from AM1EHSMHS010.bigfish.com (unknown [10.3.201.247])	by
	mail6-am1.bigfish.com (Postfix) with ESMTP id 652F218E0055	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:22:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS010.bigfish.com
	(10.3.207.110) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 18:22:00 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Thu, 29 Sep 2011 13:21:58 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 07/16] Fix lttng-ust for powerpc64
Thread-Index: AQHMftSs0fOwPeJsS0ObTNCRdOxOhg==
Date: Thu, 29 Sep 2011 18:21:58 +0000
Message-ID: <CAEsOVNd7317kDeGBNB6HLy2bpQB102piFtAMxVriX1GocaCXew@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-7-git-send-email-msm@freescale.com>
	<1317311457.12332.99.camel@ted>
In-Reply-To: <1317311457.12332.99.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 07/16] Fix lttng-ust for powerpc64
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
X-List-Received-Date: Thu, 29 Sep 2011 18:43:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D5CD987B156B6148AF1CA7B6A778AAAF@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 10:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-09-28 at 23:21 -0500, Matthew McClintock wrote:
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> =A0meta/recipes-kernel/lttng/fix-powerpc64.patch | =A0 17 ++++++++++++++=
+++
>> =A0meta/recipes-kernel/lttng/lttng-ust_0.15.bb =A0 | =A0 =A03 ++-
>> =A02 files changed, 19 insertions(+), 1 deletions(-)
>> =A0create mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch
>>
>> diff --git a/meta/recipes-kernel/lttng/fix-powerpc64.patch b/meta/recipe=
s-kernel/lttng/fix-powerpc64.patch
>> new file mode 100644
>> index 0000000..d347979
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng/fix-powerpc64.patch
>> @@ -0,0 +1,17 @@
>> +Upstream-Status: Inappropriate configuration
>
> Is this really inappropriate for upstream? It looks reasonable to me...

Seems reasonable. What is the policy on this? Can I mark it "this
should be upstreamed" or must I mark it "this was sent upstream" and
then upstream the change?

>
>> +
>> +Add bit to detect if we are running on powerpc64 and treat it the
>> +same as ppc64
>> +
>> +Index: ust-0.15/configure.ac
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- ust-0.15.orig/configure.ac
>> ++++ ust-0.15/configure.ac
>> +@@ -111,6 +111,7 @@ changequote([,])dnl
>> + =A0 =A0 x86_64) LIBFORMAT=3D"elf64-x86-64" ;;
>> + =A0 =A0 powerpc) LIBFORMAT=3D"elf32-powerpc" ;;
>> + =A0 =A0 ppc64) LIBFORMAT=3D"elf64-powerpc" ;;
>> ++ =A0 =A0powerpc64) LIBFORMAT=3D"elf64-powerpc" ;;
>> + =A0 =A0 s390) LIBFORMAT=3D"elf32-s390" ;;
>> + =A0 =A0 s390x) LIBFORMAT=3D"elf64-s390" ;;
>> + =A0 =A0 =A0 =A0 armv5) LIBFORMAT=3D"elf32-littlearm"; NO_UNALIGNED_ACC=
ESS=3D1 ;;
>> diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb b/meta/recipes-=
kernel/lttng/lttng-ust_0.15.bb
>> index 915e619..9dd4658 100644
>> --- a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
>> @@ -10,9 +10,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De647752e04=
5a8c45b6f583771bd561ef \
>>
>> =A0DEPENDS =3D "liburcu"
>>
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>> =A0SRC_URI =3D "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
>> +SRC_URI_append_powerpc64 =3D " file://fix-powerpc64.patch"
>
> Does this really need to be conditional on powerppc64? Looks like it can
> be applied unconditionally...

True, was trying to minimally effect other stuff. But I take it by the
comment you prefer this be done away with.

-M=



