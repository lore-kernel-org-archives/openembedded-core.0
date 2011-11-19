Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRqEb-00036N-Fw
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 20:05:54 +0100
Received: from mail79-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.22; Sat, 19 Nov 2011 18:58:49 +0000
Received: from mail79-ch1 (localhost [127.0.0.1])	by mail79-ch1-R.bigfish.com
	(Postfix) with ESMTP id EA79C5A0177	for
	<openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 19:00:12 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzzz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail79-ch1 (localhost.localdomain [127.0.0.1]) by mail79-ch1
	(MessageSwitch) id 1321729210832370_16953;
	Sat, 19 Nov 2011 19:00:10 +0000 (UTC)
Received: from CH1EHSMHS014.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.251])	by mail79-ch1.bigfish.com (Postfix) with ESMTP id
	C64574C0043 for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 19:00:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS014.bigfish.com
	(10.43.70.14) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Sat, 19 Nov 2011 18:58:46 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Sat, 19 Nov 2011 12:59:21 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Remove ttyS* from /etc/inittab that are not
	present
Thread-Index: AQHMpYhaUdp+eu0WmE6+kG2Z107JFZWyK8aAgAAiNgCAAlragIAAS0EA
Date: Sat, 19 Nov 2011 18:59:20 +0000
Message-ID: <CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
	<CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
	<CAP9ODKqyzY706Z+gpD6X2G2JBf6frki6S07=NabBxFMxB5pojg@mail.gmail.com>
In-Reply-To: <CAP9ODKqyzY706Z+gpD6X2G2JBf6frki6S07=NabBxFMxB5pojg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] Remove ttyS* from /etc/inittab that are not present
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
X-List-Received-Date: Sat, 19 Nov 2011 19:05:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <42B91C218E7DA04D84706666B580BD8F@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 8:29 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>> It must be online though in this case?
>
> The code you add needs to be running on target and doesn't work at
> rootfs built time. This is bad and adds more complications to
> read-only-fs support.

This works *perfectly* with a read only fs. Each time it boots removes
the non-working serial ports. One could argue that it does NOT work
completely as expected with a writable file system.

>>> This could be done with a specific package that could mangle the
>>> image at first boot if really need but doing it by default on oe-core
>>> seems the wrong way.
>>
>> Isn't that exactly what this is doing?
>>
>> Easy enough to add this to a separate recipe or bbapends elsewhere if
>> there is disagreement.
>
> The need to diverge from machine default is the exception and this
> could be handled on the image being built, as post rootfs hook or an
> specific package with postinst to be run at target boot to setup it,
> and not by default.

This will not work as a post rootfs hook as I've explained before. Let
me give you a more concrete example: We have a root file stored in
flash. We use it to boot from on a system with 4 serial ports. We use
the same image again to boot several kvm instances each of which only
have 1 serial port. The kvm instances will have spurious init messages
about respawning getty.

-M=



