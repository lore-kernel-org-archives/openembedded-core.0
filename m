Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9fh7-0005TR-A0
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:12:13 +0200
Received: from mail52-ch1-R.bigfish.com (216.32.181.169) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 15:51:36 +0000
Received: from mail52-ch1 (localhost.localdomain [127.0.0.1])	by
	mail52-ch1-R.bigfish.com (Postfix) with ESMTP id 9109F1840107	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 15:51:36 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail52-ch1 (localhost.localdomain [127.0.0.1]) by mail52-ch1
	(MessageSwitch) id 1317397896427944_1815;
	Fri, 30 Sep 2011 15:51:36 +0000 (UTC)
Received: from CH1EHSMHS004.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail52-ch1.bigfish.com (Postfix) with ESMTP id
	58D48E004E for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 15:51:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS004.bigfish.com
	(10.43.70.4) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 15:51:35 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Fri, 30 Sep 2011 10:51:33 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 10/16] Fix mdadm for powerpc64
Thread-Index: AQHMf4jTUysgKKk7IkWOexenbI4Kgg==
Date: Fri, 30 Sep 2011 15:51:33 +0000
Message-ID: <CAEsOVNej5XjNzLnrxXVexEBj4xGDoVsrhSbzLZe71A4kpTWGWw@mail.gmail.com>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
	<1317382729.12332.174.camel@ted>
In-Reply-To: <1317382729.12332.174.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Fri, 30 Sep 2011 16:12:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D2F041EEC297BF42BD71803E054B76C9@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 6:38 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> That isn't quite what I meant, that also overwrites anything existing in
> CXFLAGS just in a different way. Also, I suspect you mean CXXFLAGS?
>
> I'd meant something like:
>
> CXXFLAGS_append_powerpc64 =3D " -Wno-error=3Dformat"

In the mdadm Makefile it gives the following instructions:

# define "CXFLAGS" to give extra flags to CC.
# e.g.  make CXFLAGS=3D-O to optimise

So I was following that...

-M=



