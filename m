Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SwxwA-0004a2-4x
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:07:46 +0200
Received: from mail123-co1-R.bigfish.com (10.243.78.248) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Thu, 2 Aug 2012 15:56:05 +0000
Received: from mail123-co1 (localhost [127.0.0.1])	by
	mail123-co1-R.bigfish.com (Postfix) with ESMTP id 71591A800F0	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2012 15:56:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I936eI1432I4015Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail123-co1 (localhost.localdomain [127.0.0.1]) by mail123-co1
	(MessageSwitch) id 1343922963691496_7888;
	Thu,  2 Aug 2012 15:56:03 +0000 (UTC)
Received: from CO1EHSMHS023.bigfish.com (unknown [10.243.78.235])	by
	mail123-co1.bigfish.com (Postfix) with ESMTP id 9D927B80051	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2012 15:56:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS023.bigfish.com
	(10.243.66.33) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 2 Aug 2012 15:56:02 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Thu, 2 Aug 2012 10:56:02 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] foomatic-filters_4.0.16.bb: update recipe to
	work on Fedora 17
Thread-Index: AQHNcMcW+T8LwFS+QUyJoLWREtyjdZdHAMmA
Date: Thu, 2 Aug 2012 15:56:01 +0000
Message-ID: <CAEsOVNfoif1RNqeZq64x-5iJ8FG8Nzaw7AQ81P8bBer7=nji=g@mail.gmail.com>
References: <1343767324-11395-1-git-send-email-msm@freescale.com>
	<1343917830.9756.76.camel@ted>
	<CAEsOVNd=UwnxtwXvFoYvk4o1=zLwsdObJ=UuXa7LpXM=YMLH+A@mail.gmail.com>
In-Reply-To: <CAEsOVNd=UwnxtwXvFoYvk4o1=zLwsdObJ=UuXa7LpXM=YMLH+A@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Aug 2012 16:07:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0FF28D96F73A5A4A9B2636808D58DD26@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 2, 2012 at 10:54 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Thu, Aug 2, 2012 at 9:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2012-07-31 at 15:42 -0500, Matthew McClintock wrote:
>>> This fixes isses on distro that have perl in /bin/perl instead
>>> of /usr/bin/perl such as Fedora 17
>>>
>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>> ---
>>>  .../foomatic/foomatic-filters_4.0.16.bb            |    9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb =
b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
>>> index 5f145b0..d5ae4c7 100644
>>> --- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
>>> +++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
>>> @@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independ=
ent PPD file. \
>>>  "
>>>
>>>  DEPENDS +=3D "cups perl libxml2"
>>> -PR =3D "r0"
>>> +PR =3D "r1"
>>>
>>>  LICENSE =3D "GPLv2+"
>>>  LIC_FILES_CHKSUM =3D "file://${WORKDIR}/foomatic-filters-${PV}/COPYING=
;md5=3D393a5ca445f6965873eca0259a17f833"
>>> @@ -31,6 +31,13 @@ do_configure_prepend() {
>>>      export CUPS_PPDS=3D${datadir}/cups/model
>>>  }
>>>
>>> +PERLPATH =3D "${bindir}/env perl"
>>> +PERLPATH_virtclass-nativesdk =3D "/usr/bin/env perl"
>>> +
>>> +do_install_append() {
>>> +    sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${libdir}/cups/backend=
/beh
>>> +}
>>> +
>>>  do_install_append_linuxstdbase() {
>>>      install -d ${D}${exec_prefix}/lib/cups/filter
>>>      ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/filter
>>
>> Could you adjust this to account for:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dac7a0311825e20c54=
4d17bfd8be63546ad36e665
>>
>> please?
>
> Sure - did not see the later change on this...
>
> Updated and pushed here:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmattsm=
/master&id=3D973d055e33d5512fc4f2285c26b976ef8c21dc58

Err, use this one:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmattsm/m=
aster&id=3D9e0c80ad919f63f524a51581873feda61a956b0e

-M

> -M
>
>>
>> Thanks,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



