Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THfYN-0000Xz-Aq
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 20:44:48 +0200
Received: from mail151-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 18:31:50 +0000
Received: from mail151-tx2 (localhost [127.0.0.1])	by
	mail151-tx2-R.bigfish.com (Postfix) with ESMTP id 2F15834006E;
	Fri, 28 Sep 2012 18:31:50 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 8
X-BigFish: VS8(z3b49sz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail151-tx2 (localhost.localdomain [127.0.0.1]) by mail151-tx2
	(MessageSwitch) id 1348857108764805_5098;
	Fri, 28 Sep 2012 18:31:48 +0000 (UTC)
Received: from TX2EHSMHS028.bigfish.com (unknown [10.9.14.250])	by
	mail151-tx2.bigfish.com (Postfix) with ESMTP id B7F8D4E00F3;
	Fri, 28 Sep 2012 18:31:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS028.bigfish.com
	(10.9.99.128) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 18:31:43 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Fri, 28 Sep 2012 13:31:43 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] gcc-common.inc: Consider multilib when
	renaming libgcc for debian'ness
Thread-Index: AQHNm0ixt6PGGMlIukioOIB/2pPA0JecyAsAgANQTYA=
Date: Fri, 28 Sep 2012 18:31:43 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6B7819@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348525482-31986-1-git-send-email-raj.khem@gmail.com>
	<1348566154.8662.38.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A6A7611@039-SN1MPN1-001.039d.mgd.msft.net>
	<1348656910.8662.93.camel@ted>
In-Reply-To: <1348656910.8662.93.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Scott Garman <scott.a.garman@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-common.inc: Consider multilib when renaming libgcc for debian'ness
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
X-List-Received-Date: Fri, 28 Sep 2012 18:44:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A755DF5CD30440459817B8E15EDB7F51@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 5:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-09-25 at 18:07 +0000, McClintock Matthew-B29882 wrote:
>> This should probably go in denzil as well.
>
> Lets hold off that as I think we need to fix this in a better way at the
> core level...

This? Where there follow up fixes also?

-M

commit 42e8c8056719326b68b1602e0699eba00a924d2b
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Wed Sep 26 12:56:58 2012 +0100

    packagedata/multilib: Fix search patch for multilib builds

    The current multilib search path code for packagedata is flawed since i=
t
    doesn't correctly handle changes in the TARGET_VENDOR/TARGET_OS that
    multilib may make. This patch enhances the code to correctly build the
    search paths so multilib packagedata is found correctly.

    (From OE-Core rev: f50c5d36b2da9b36d56d95a7d89404509a1a3e9b)

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



