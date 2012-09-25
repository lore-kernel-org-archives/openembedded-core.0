Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGZka-0000HY-4D
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 20:20:52 +0200
Received: from mail244-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE011.bigfish.com (10.7.40.61) with Microsoft SMTP Server id
	14.1.225.23; Tue, 25 Sep 2012 18:08:02 +0000
Received: from mail244-va3 (localhost [127.0.0.1])	by
	mail244-va3-R.bigfish.com (Postfix) with ESMTP id 2D29F6C018F;
	Tue, 25 Sep 2012 18:08:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 8
X-BigFish: VS8(z3b49sz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail244-va3 (localhost.localdomain [127.0.0.1]) by mail244-va3
	(MessageSwitch) id 1348596480608508_31232;
	Tue, 25 Sep 2012 18:08:00 +0000 (UTC)
Received: from VA3EHSMHS027.bigfish.com (unknown [10.7.14.243])	by
	mail244-va3.bigfish.com (Postfix) with ESMTP id 913BF700045;
	Tue, 25 Sep 2012 18:08:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS027.bigfish.com
	(10.7.99.37) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 25 Sep 2012 18:07:59 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Tue, 25 Sep 2012 13:07:59 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Scott Garman
	<scott.a.garman@intel.com>
Thread-Topic: [OE-core] [PATCH] gcc-common.inc: Consider multilib when
	renaming libgcc for debian'ness
Thread-Index: AQHNm0ixt6PGGMlIukioOIB/2pPA0A==
Date: Tue, 25 Sep 2012 18:07:59 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A7611@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348525482-31986-1-git-send-email-raj.khem@gmail.com>
	<1348566154.8662.38.camel@ted>
In-Reply-To: <1348566154.8662.38.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Tue, 25 Sep 2012 18:20:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8D4304BE0B76CF42A8542D41CA246151@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

This should probably go in denzil as well.

-M

On Tue, Sep 25, 2012 at 4:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-09-24 at 15:24 -0700, Khem Raj wrote:
>> When doing multilib builds rpm does not find libgcc1 for lib32
>> multilib because its not honoring the debian renaming scheme for
>> libgcc-multilib. Lets add MLPREFIX to fix it.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Merged to master, thanks.
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



