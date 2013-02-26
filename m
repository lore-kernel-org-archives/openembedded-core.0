Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1UATAu-0004xt-I6
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:39:36 +0100
Received: from mail75-db3-R.bigfish.com (10.3.81.242) by
	DB3EHSOBE010.bigfish.com (10.3.84.30) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Feb 2013 22:22:43 +0000
Received: from mail75-db3 (localhost [127.0.0.1])	by mail75-db3-R.bigfish.com
	(Postfix) with ESMTP id A2AAD2A0358;
	Tue, 26 Feb 2013 22:22:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 11
X-BigFish: VS11(z49a8vzbb2dI98dI9371I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h19cehbe9i1155h)
Received: from mail75-db3 (localhost.localdomain [127.0.0.1]) by mail75-db3
	(MessageSwitch) id 1361917361553740_23621;
	Tue, 26 Feb 2013 22:22:41 +0000 (UTC)
Received: from DB3EHSMHS011.bigfish.com (unknown [10.3.81.229])	by
	mail75-db3.bigfish.com (Postfix) with ESMTP id 84B98400142;
	Tue, 26 Feb 2013 22:22:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS011.bigfish.com
	(10.3.87.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Feb 2013 22:22:41 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.221]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Tue, 26 Feb 2013 22:22:30 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Anton Sergienko <anton.sergienko@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] kernel.bbclass, module-base.bbclass: Use CC to form
	KERNEL_CC
Thread-Index: AQHOFG/Don35qpCBak6MsmsunZ+1og==
Date: Tue, 26 Feb 2013 22:22:29 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A89192C@039-SN1MPN1-001.039d.mgd.msft.net>
References: <CAMEF+f=FAyLCaWwjzq+W=1QEZcEM3V1awR8-e5ogFdn923ndhg@mail.gmail.com>
	<20130226175608.GB13278@sakrah.homelinux.org>
In-Reply-To: <20130226175608.GB13278@sakrah.homelinux.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Tue, 26 Feb 2013 22:39:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E66F8AC939E9D64A9F758207288D827F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2013 at 11:56 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On (26/02/13 17:08), Anton Sergienko wrote:
>> Hi!
>> After the patch (commit c49f967384ccbfe131bbb33ee518014f3fc4b38f) to
>> meta/classes/kernel-arch.bbclass kernel build fails for arm machine with
>> hard floating point instruction set in CC (-mfloat-abi=3Dhard).
>> As I understand kernel should not be build with fpu specific floating po=
int
>> instructions(should not be any floating point operation at all), but CFL=
AGS
>> from machine-tune are propagated to CC and it also include -mfloat-abi
>> flag. Should not -mfloat-abi flag be filtered out in kernel-arch.bbclass=
 ?
>
> yes. I think this patch is creating more issues than its solving. I will
> think about decoupling KERNEL_CC from CC once again.

I just resubmitted my patch for this... It decouples all the extra
args while still keeping the ones specifically added.

-M=



