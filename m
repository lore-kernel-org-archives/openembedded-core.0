Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=VA3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRr4Q-0004Jh-L6
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 20:59:27 +0100
Received: from mail41-va3-R.bigfish.com (10.7.14.246) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.22; Sat, 19 Nov 2011 19:37:17 +0000
Received: from mail41-va3 (localhost [127.0.0.1])	by mail41-va3-R.bigfish.com
	(Postfix) with ESMTP id 5EA1D440209	for
	<openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 19:37:00 +0000 (UTC)
X-SpamScore: -17
X-BigFish: VS-17(zz9371K1447M1432N98dKzz1202hzzz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail41-va3 (localhost.localdomain [127.0.0.1]) by mail41-va3
	(MessageSwitch) id 1321731419967245_4725;
	Sat, 19 Nov 2011 19:36:59 +0000 (UTC)
Received: from VA3EHSMHS027.bigfish.com (unknown [10.7.14.245])	by
	mail41-va3.bigfish.com (Postfix) with ESMTP id E792F5C0019	for
	<openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 19:36:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS027.bigfish.com
	(10.7.99.37) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Sat, 19 Nov 2011 19:37:17 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Sat, 19 Nov 2011 13:37:52 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Remove ttyS* from /etc/inittab that are not
	present
Thread-Index: AQHMpYhaUdp+eu0WmE6+kG2Z107JFZWyK8aAgAAiNgCAAlragIAAS0EAgAAKYwCAAABhAA==
Date: Sat, 19 Nov 2011 19:37:51 +0000
Message-ID: <CAEsOVNdpYvmxh3p=vwtE1oMUrOUjtcoR7k808+7mTAs7Zs=oSg@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
	<CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
	<CAP9ODKqyzY706Z+gpD6X2G2JBf6frki6S07=NabBxFMxB5pojg@mail.gmail.com>
	<CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
	<CAP9ODKqOrQ0zw=OFJ-OngO0g90paMPLyZ3dN-KcBWBjqLFaU-w@mail.gmail.com>
In-Reply-To: <CAP9ODKqOrQ0zw=OFJ-OngO0g90paMPLyZ3dN-KcBWBjqLFaU-w@mail.gmail.com>
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
X-List-Received-Date: Sat, 19 Nov 2011 19:59:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <17C3DA41C17E6543AD228D402A382D73@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 1:36 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>> This will not work as a post rootfs hook as I've explained before. Let
>> me give you a more concrete example: We have a root file stored in
>> flash. We use it to boot from on a system with 4 serial ports. We use
>> the same image again to boot several kvm instances each of which only
>> have 1 serial port. The kvm instances will have spurious init messages
>> about respawning getty.
>
> This usecase ought to be fulfilled with a specific package our boot
> script that does this setup on runtime. As I said I see the use-case
> but disagree about it being done on oe-core.

This is fine by me... thanks for the review.

-M=



