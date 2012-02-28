Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S2Wf9-0000kq-9k
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 00:40:55 +0100
Received: from mail139-tx2-R.bigfish.com (10.9.14.247) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Tue, 28 Feb 2012 23:17:22 +0000
Received: from mail139-tx2 (localhost [127.0.0.1])	by
	mail139-tx2-R.bigfish.com (Postfix) with ESMTP id C94D220020F	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 23:17:22 +0000 (UTC)
X-SpamScore: -14
X-BigFish: VS-14(zz9371I1432N98dK14ffOzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail139-tx2 (localhost.localdomain [127.0.0.1]) by mail139-tx2
	(MessageSwitch) id 133047104173476_6044;
	Tue, 28 Feb 2012 23:17:21 +0000 (UTC)
Received: from TX2EHSMHS023.bigfish.com (unknown [10.9.14.241])	by
	mail139-tx2.bigfish.com (Postfix) with ESMTP id 0DC2F4E0046	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 23:17:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS023.bigfish.com
	(10.9.99.123) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 28 Feb 2012 23:17:20 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Tue, 28 Feb 2012 17:17:11 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Including the kernel in the image
Thread-Index: AQHM9m8ZlpKjh16A9kKUYHCvFdkT+w==
Date: Tue, 28 Feb 2012 23:17:11 +0000
Message-ID: <CAEsOVNfdCJDXDk5P0Fr4g5r6PU=mQbJfyLpFrw+ifuC3-rMrcw@mail.gmail.com>
References: <1808929.8Oa6VYabAJ@helios>
In-Reply-To: <1808929.8Oa6VYabAJ@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Including the kernel in the image
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
X-List-Received-Date: Tue, 28 Feb 2012 23:40:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B874AE1240A90C4989A114F1925AE9FF@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 9:48 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi all,
>
> For some boot configurations (e.g. kexecboot) having the kernel binary in=
 the
> image is required. In OE Classic, task-boot used to always include the ke=
rnel
> binary in the image (via RRECOMMENDS, so it could be uninstalled). We don=
't
> currently have this in OE-Core and I was wondering what the new preferred=
 way
> to have this done would be.
>
> Obviously we could go and add it to various images or even to task-core-b=
oot
> again but I'm not sure that's ideal. Wanting the kernel in the image is r=
eally
> machine-specific (or to be precise, boot method specific); so I'm wonderi=
ng if
> adding it to MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS for all machines likely =
to
> need it is the right thing to do?

kexec and qemu/kvm could use this...

-M=



