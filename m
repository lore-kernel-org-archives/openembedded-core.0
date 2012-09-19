Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TECT1-0005Nx-IW
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 07:04:55 +0200
Received: from mail92-ch1-R.bigfish.com (10.43.68.243) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.23; Wed, 19 Sep 2012 04:52:13 +0000
Received: from mail92-ch1 (localhost [127.0.0.1])	by mail92-ch1-R.bigfish.com
	(Postfix) with ESMTP id 5D4FE2001D0;
	Wed, 19 Sep 2012 04:52:13 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail92-ch1 (localhost.localdomain [127.0.0.1]) by mail92-ch1
	(MessageSwitch) id 1348030332522057_3946;
	Wed, 19 Sep 2012 04:52:12 +0000 (UTC)
Received: from CH1EHSMHS042.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.244])	by mail92-ch1.bigfish.com (Postfix) with ESMTP id
	7E03C4C0042;	Wed, 19 Sep 2012 04:52:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS042.bigfish.com
	(10.43.69.251) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 19 Sep 2012 04:52:12 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Tue, 18 Sep 2012 23:52:11 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] binutils.inc: binutils will build
	differently if this feature is enabled, so add a dependency
Thread-Index: AQHNliBJX7U7FO6/0EybakxbDjTNK5eRGLSA
Date: Wed, 19 Sep 2012 04:52:11 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68BC95@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<1348006091-14992-7-git-send-email-msm@freescale.com>
	<CAJTo0Lb+GUR=5CpEmPU=ifXR2wfj_8BDbhQ3-c_uVK6s99vajQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb+GUR=5CpEmPU=ifXR2wfj_8BDbhQ3-c_uVK6s99vajQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils.inc: binutils will build differently if this feature is enabled, so add a dependency
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
X-List-Received-Date: Wed, 19 Sep 2012 05:04:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <977ADFDCA6FFD148888BA24F95345043@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 11:35 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
> "this feature"?  Please use descriptive commit logs, so s/this
> feature/mulitarch/.

I will update this and send a v2, after I wait a bit for more comments.

-M

>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



