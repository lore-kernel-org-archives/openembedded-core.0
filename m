Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S3VM6-0008Lo-BB
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 17:29:18 +0100
Received: from mail43-db3-R.bigfish.com (10.3.81.243) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 2 Mar 2012 16:05:44 +0000
Received: from mail43-db3 (localhost [127.0.0.1])	by mail43-db3-R.bigfish.com
	(Postfix) with ESMTP id 85CB0E046D;
	Fri,  2 Mar 2012 16:05:44 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzzz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail43-db3 (localhost.localdomain [127.0.0.1]) by mail43-db3
	(MessageSwitch) id 1330704343224609_31528;
	Fri,  2 Mar 2012 16:05:43 +0000 (UTC)
Received: from DB3EHSMHS016.bigfish.com (unknown [10.3.81.235])	by
	mail43-db3.bigfish.com (Postfix) with ESMTP id 32951C0049;
	Fri,  2 Mar 2012 16:05:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS016.bigfish.com
	(10.3.87.116) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 2 Mar 2012 16:05:41 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Fri, 2 Mar 2012 10:05:39 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Eibach, Dirk" <Eibach@gdsys.de>
Thread-Topic: Build for powerpc spe broken
Thread-Index: Acz4V8dvGE2kPzXtTAeK/7rTL2tQTgAaMT4A
Date: Fri, 2 Mar 2012 16:05:39 +0000
Message-ID: <CAEsOVNeLGkbq9P+qiKW0PtxJUBJtjbk0YJbdWzjoNEb9bVyvfQ@mail.gmail.com>
References: <48D3D52125C49B43AE880038E2E5314BB5BFA1@SRV101.gdsys.de>
In-Reply-To: <48D3D52125C49B43AE880038E2E5314BB5BFA1@SRV101.gdsys.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build for powerpc spe broken
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
X-List-Received-Date: Fri, 02 Mar 2012 16:29:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B0B03FB8B68FA54ABC18E4779F9C283C@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 2, 2012 at 2:35 AM, Eibach, Dirk <Eibach@gdsys.de> wrote:
>
> Commits
> 12f0a0d3e1afe90633c8b95d36670ab0f156e912
> 785962440131f993b912d26cba39dc7ffc91aad4
> 01fd9be5db633d881c789c5b119f794a3f1000da
>
> break building for powerpc spe, it seems a powerpc-nf toolchain is
> built.
>
> Patch "[PATCH 3/4] arch-powerpc.inc: use default value of TUNE_PKGARCH"
> was not pulled and I don't see a replacement for it yet. Matthew, do you
> have something in your queue?

I did not think this would break anything - can you share what's going
on? I'm on vacation now and can't test the replacement for 3/4 yet -
but I will look at this as soon as Tuesday.

-M=



