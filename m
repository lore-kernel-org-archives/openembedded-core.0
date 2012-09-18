Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6m5-0001F9-FP
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 01:00:13 +0200
Received: from mail30-am1-R.bigfish.com (10.3.201.245) by
	AM1EHSOBE009.bigfish.com (10.3.204.29) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:47:32 +0000
Received: from mail30-am1 (localhost [127.0.0.1])	by mail30-am1-R.bigfish.com
	(Postfix) with ESMTP id 92A201600FF;
	Tue, 18 Sep 2012 22:47:32 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail30-am1 (localhost.localdomain [127.0.0.1]) by mail30-am1
	(MessageSwitch) id 134800845113209_17181;
	Tue, 18 Sep 2012 22:47:31 +0000 (UTC)
Received: from AM1EHSMHS001.bigfish.com (unknown [10.3.201.231])	by
	mail30-am1.bigfish.com (Postfix) with ESMTP id EAEC74A004A;
	Tue, 18 Sep 2012 22:47:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS001.bigfish.com
	(10.3.207.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:47:28 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Tue, 18 Sep 2012 17:47:26 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] insane.bbclass: skip checking arch
	(machine/bits) for powerpc kernel recipe
Thread-Index: AQHNle8trn5crop4SU+lByBtq3l/LpeQsy0A
Date: Tue, 18 Sep 2012 22:47:26 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68B84B@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<1348006091-14992-6-git-send-email-msm@freescale.com>
	<CAMKF1sqYh2BR_3z2OP-WvMCyFPk4nK9uqLZRK7ApQz4hV76OEg@mail.gmail.com>
In-Reply-To: <CAMKF1sqYh2BR_3z2OP-WvMCyFPk4nK9uqLZRK7ApQz4hV76OEg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: skip checking arch (machine/bits) for powerpc kernel recipe
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
X-List-Received-Date: Tue, 18 Sep 2012 23:00:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C46C00D80D280B44A5F2BF67B74187EC@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 5:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Sep 18, 2012 at 3:08 PM, Matthew McClintock <msm@freescale.com> w=
rote:
>> For a 32-bit machine, we still might always (or optionally) want to buil=
d a
>> 64-bit kernel so we add an exception.
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> Not sure if we should just skip for all virtual/kernel's?
>>
>>  meta/classes/insane.bbclass |    6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index e74eb3f..2ca1b49 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -366,11 +366,13 @@ def package_qa_check_arch(path,name,d, elf, messag=
es):
>>
>>      # Check the architecture and endiannes of the binary
>>      if not ((machine =3D=3D elf.machine()) or \
>> -       ("virtual/kernel" in provides) and (target_os =3D=3D "linux-gnux=
32")):
>> +       ("virtual/kernel" in provides) and (target_os =3D=3D "linux-gnux=
32") or \
>> +       ("virtual/kernel" in provides) and (target_arch =3D=3D "powerpc"=
)):
>
> I feel using powerpc target_arch here is a broad brush. Can there be
> some other variable in metadata
> that could indicate 64bit kernel and a 32bit ppc userspace combo of
> some sort ? or may be a variable
> stating that this machine's kernel is 64bit and use that here instead.

I added BUILD_64BIT_KERNEL in my layer for building a 64-bit kernel on
a 32-bit machine, we could use this (or another "better" name)

-M

>
>>          messages.append("Architecture did not match (%d to %d) on %s" %=
 \
>>                   (machine, elf.machine(), package_qa_clean_path(path,d)=
))
>>      elif not ((bits =3D=3D elf.abiSize()) or  \
>> -       ("virtual/kernel" in provides) and (target_os =3D=3D "linux-gnux=
32")):
>> +       ("virtual/kernel" in provides) and (target_os =3D=3D "linux-gnux=
32") or \
>> +       ("virtual/kernel" in provides) and (target_arch =3D=3D "powerpc"=
)):
>>          messages.append("Bit size did not match (%d to %d) %s on %s" % =
\
>>                   (bits, elf.abiSize(), bpn, package_qa_clean_path(path,=
d)))
>>      elif not littleendian =3D=3D elf.isLittleEndian():
>> --
>> 1.7.9.7
>>
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



