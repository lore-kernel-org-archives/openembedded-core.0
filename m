Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T9SJh-0000V5-A3
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 04:59:41 +0200
Received: from mail190-ch1-R.bigfish.com (10.43.68.226) by
	CH1EHSOBE003.bigfish.com (10.43.70.53) with Microsoft SMTP Server id
	14.1.225.23; Thu, 6 Sep 2012 02:47:16 +0000
Received: from mail190-ch1 (localhost [127.0.0.1])	by
	mail190-ch1-R.bigfish.com (Postfix) with ESMTP id A7E5B3800DB;
	Thu,  6 Sep 2012 02:47:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I936eI1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail190-ch1 (localhost.localdomain [127.0.0.1]) by mail190-ch1
	(MessageSwitch) id 1346899633989361_17766;
	Thu,  6 Sep 2012 02:47:13 +0000 (UTC)
Received: from CH1EHSMHS006.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail190-ch1.bigfish.com (Postfix) with ESMTP id
	E497A320049;	Thu,  6 Sep 2012 02:47:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS006.bigfish.com
	(10.43.70.6) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 6 Sep 2012 02:47:13 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.37]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Wed, 5 Sep 2012 21:47:12 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/8] Patches for LSB perl test
Thread-Index: AQHNi9nqoGWfjEQCwUmQg5f+OU9BXg==
Date: Thu, 6 Sep 2012 02:47:12 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A653064@039-SN1MPN1-003.039d.mgd.msft.net>
References: <cover.1346406022.git.kai.kang@windriver.com>
	<504617C7.7090905@linux.intel.com>
In-Reply-To: <504617C7.7090905@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "Zhenfeng.Zhao@windriver.com" <Zhenfeng.Zhao@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Patches for LSB perl test
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
X-List-Received-Date: Thu, 06 Sep 2012 02:59:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A749699221AACA4F8F200BD347C5858F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 4, 2012 at 10:01 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/31/2012 03:00 AM, Kang Kai wrote:
>>
>> The following changes since commit
>> b4c5725af4cd85d5644f0373e2674e903c4eab2b:
>>
>>    yocto-bsp: add missing xserver-xf86-config .bbappend for qemu
>> (2012-08-25 14:47:07 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib kangkai/lsb
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/lsb
>>
>> Kang Kai (8):
>>    libclass-isa-perl: add it
>>    perl: package modules Pod-Html and Tie-Hash-NamedCapture
>>    libpod-plainer-perl: add it
>>    libdumpvalue-perl: add it
>>    libenv-perl: add it
>>    libfile-checktree-perl: add it
>>    libi18n-collate-perl: add it
>>    task-core-lsb: add packages
>>
>>   meta/recipes-devtools/perl/perl-5.14.2/config.sh   |    2 +-
>>   .../perl/libclass-isa-perl_0.36.bb                 |   32
>> +++++++++++++++++++
>>   .../perl/libdumpvalue-perl_1.16.bb                 |   20 ++++++++++++
>>   meta/recipes-extended/perl/libenv-perl_1.03.bb     |   22 ++++++++++++=
+
>>   .../perl/libfile-checktree-perl_4.41.bb            |   33
>> ++++++++++++++++++++
>>   .../perl/libi18n-collate-perl_1.02.bb              |   22 ++++++++++++=
+
>>   .../perl/libpod-plainer-perl_1.03.bb               |   24 ++++++++++++=
++
>>   meta/recipes-extended/tasks/task-core-lsb.bb       |    9 +++++-
>>   8 files changed, 162 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-extended/perl/libclass-isa-perl_0.36.b=
b
>>   create mode 100644 meta/recipes-extended/perl/libdumpvalue-perl_1.16.b=
b
>>   create mode 100644 meta/recipes-extended/perl/libenv-perl_1.03.bb
>>   create mode 100644
>> meta/recipes-extended/perl/libfile-checktree-perl_4.41.bb
>>   create mode 100644
>> meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb
>>   create mode 100644
>> meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb
>>
>
> Kang,
>
> Given that LSB 5.0 is coming out that removes many of these requirements,
> does it really make sense to add these and then remove them again in a
> future release. I understand we are trying to be as
> compliant as possible to LSB, but this may best be in a meta-lsb layer.

Is a meta-lsb layer coming? Will it be apart of poky?

-M

>
> Sau!
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



