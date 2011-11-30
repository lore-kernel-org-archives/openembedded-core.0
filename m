Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVo1H-00054C-0b
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:32:32 +0100
Received: from mail150-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.22; Wed, 30 Nov 2011 17:25:49 +0000
Received: from mail150-ch1 (localhost [127.0.0.1])	by
	mail150-ch1-R.bigfish.com (Postfix) with ESMTP id 006172C036C	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 17:25:48 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(z2e28uz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail150-ch1 (localhost.localdomain [127.0.0.1]) by mail150-ch1
	(MessageSwitch) id 1322673946919073_18491;
	Wed, 30 Nov 2011 17:25:46 +0000 (UTC)
Received: from CH1EHSMHS001.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail150-ch1.bigfish.com (Postfix) with ESMTP id
	D2AC2580045	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 17:25:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS001.bigfish.com
	(10.43.70.1) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 30 Nov 2011 17:25:46 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Wed, 30 Nov 2011 11:25:46 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] siggen.py: If both sigs have a variable in
	it's whitelist then don't say it's changed
Thread-Index: AQHMr4UYdq8RZuzYlk6o3byHbpkEYQ==
Date: Wed, 30 Nov 2011 17:25:46 +0000
Message-ID: <CAEsOVNfc2zZysjq6HdxQJpccCE5vw8HxmthCC2SKGkVDwy_R+w@mail.gmail.com>
References: <1322639707-7798-1-git-send-email-msm@freescale.com>
	<1322639707-7798-2-git-send-email-msm@freescale.com>
In-Reply-To: <1322639707-7798-2-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] siggen.py: If both sigs have a variable in it's whitelist then don't say it's changed
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
X-List-Received-Date: Wed, 30 Nov 2011 17:32:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C391E81EE582924FA4BE45F727FF7E1F@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 1:55 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> Some BB_HASHBASE_WHITELIST variables are in the lists of variable
> dependencies for signatures. Ignore those differences in lists
> since this difference does not matter
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>

Sent this to bitbake mailing list where it belongs.

-M=



