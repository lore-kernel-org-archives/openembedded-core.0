Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Swxua-0004Wr-RF
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:06:09 +0200
Received: from mail193-tx2-R.bigfish.com (10.9.14.237) by
	TX2EHSOBE015.bigfish.com (10.9.40.35) with Microsoft SMTP Server id
	14.1.225.23; Thu, 2 Aug 2012 15:54:28 +0000
Received: from mail193-tx2 (localhost [127.0.0.1])	by
	mail193-tx2-R.bigfish.com (Postfix) with ESMTP id 5037F3800BB	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2012 15:54:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI1432I4015Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail193-tx2 (localhost.localdomain [127.0.0.1]) by mail193-tx2
	(MessageSwitch) id 1343922865786892_5022;
	Thu,  2 Aug 2012 15:54:25 +0000 (UTC)
Received: from TX2EHSMHS038.bigfish.com (unknown [10.9.14.237])	by
	mail193-tx2.bigfish.com (Postfix) with ESMTP id B3B5B3A0047	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2012 15:54:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS038.bigfish.com
	(10.9.99.138) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 2 Aug 2012 15:54:25 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Thu, 2 Aug 2012 10:54:24 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] foomatic-filters_4.0.16.bb: update recipe to
	work on Fedora 17
Thread-Index: AQHNcMcW+T8LwFS+QUyJoLWREtyjdQ==
Date: Thu, 2 Aug 2012 15:54:23 +0000
Message-ID: <CAEsOVNd=UwnxtwXvFoYvk4o1=zLwsdObJ=UuXa7LpXM=YMLH+A@mail.gmail.com>
References: <1343767324-11395-1-git-send-email-msm@freescale.com>
	<1343917830.9756.76.camel@ted>
In-Reply-To: <1343917830.9756.76.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] foomatic-filters_4.0.16.bb: update recipe to work on Fedora 17
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
X-List-Received-Date: Thu, 02 Aug 2012 16:06:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3EF1BADB429EE94296524BD61D75041B@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 2, 2012 at 9:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-07-31 at 15:42 -0500, Matthew McClintock wrote:
>> This fixes isses on distro that have perl in /bin/perl instead
>> of /usr/bin/perl such as Fedora 17
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  .../foomatic/foomatic-filters_4.0.16.bb            |    9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb b=
/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
>> index 5f145b0..d5ae4c7 100644
>> --- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
>> +++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
>> @@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independe=
nt PPD file. \
>>  "
>>
>>  DEPENDS +=3D "cups perl libxml2"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>>  LICENSE =3D "GPLv2+"
>>  LIC_FILES_CHKSUM =3D "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;=
md5=3D393a5ca445f6965873eca0259a17f833"
>> @@ -31,6 +31,13 @@ do_configure_prepend() {
>>      export CUPS_PPDS=3D${datadir}/cups/model
>>  }
>>
>> +PERLPATH =3D "${bindir}/env perl"
>> +PERLPATH_virtclass-nativesdk =3D "/usr/bin/env perl"
>> +
>> +do_install_append() {
>> +    sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${libdir}/cups/backend/=
beh
>> +}
>> +
>>  do_install_append_linuxstdbase() {
>>      install -d ${D}${exec_prefix}/lib/cups/filter
>>      ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/filter
>
> Could you adjust this to account for:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dac7a0311825e20c544=
d17bfd8be63546ad36e665
>
> please?

Sure - did not see the later change on this...

Updated and pushed here:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmattsm/m=
aster&id=3D973d055e33d5512fc4f2285c26b976ef8c21dc58

-M

>
> Thanks,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



