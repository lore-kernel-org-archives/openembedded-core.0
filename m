Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRqZE-0003b1-99
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 20:27:12 +0100
Received: from mail144-ch1-R.bigfish.com (10.43.68.251) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.22; Sat, 19 Nov 2011 19:20:04 +0000
Received: from mail144-ch1 (localhost [127.0.0.1])	by
	mail144-ch1-R.bigfish.com (Postfix) with ESMTP id A8DBF40356	for
	<openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 19:20:33 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail144-ch1 (localhost.localdomain [127.0.0.1]) by mail144-ch1
	(MessageSwitch) id 132173042031414_10396;
	Sat, 19 Nov 2011 19:20:20 +0000 (UTC)
Received: from CH1EHSMHS010.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail144-ch1.bigfish.com (Postfix) with ESMTP id
	989F12A006E	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 19:19:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS010.bigfish.com
	(10.43.70.10) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Sat, 19 Nov 2011 19:18:43 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Sat, 19 Nov 2011 13:19:19 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Remove ttyS* from /etc/inittab that are not
	present
Thread-Index: AQHMpYhaUdp+eu0WmE6+kG2Z107JFZWyK8aAgAAiNgCAAlragIAAS0EAgAADrgCAAAHogA==
Date: Sat, 19 Nov 2011 19:19:18 +0000
Message-ID: <CAEsOVNd-mh-Vv0f+ZnS=UM-Z+6XwatEmX1N7vu8mv3_tWb7BAA@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
	<CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
	<CAP9ODKqyzY706Z+gpD6X2G2JBf6frki6S07=NabBxFMxB5pojg@mail.gmail.com>
	<CAEsOVNf_xbHAv22_drG+oXMMOCQCjLNc7tqpSA-N7yjAGEkxbA@mail.gmail.com>
	<1321729926.3389.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1321729926.3389.1.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sat, 19 Nov 2011 19:27:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4DE96EB0EF4D9047BBFD8701CA810AFD@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 1:12 PM, Phil Blundell <philb@gnu.org> wrote:
>> This works *perfectly* with a read only fs. Each time it boots removes
>> the non-working serial ports. One could argue that it does NOT work
>> completely as expected with a writable file system.
>
> Um, the patch you sent seems to modify /etc/inittab on the rootfs. =A0How
> can that work if the filesystem is read only?

Ok - I was thinking the root file system being reloaded each time and
the changes not being saved... not quite read only.

I guess it would not work read only but like I said it would be configurabl=
e.

-M=



