Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THcY4-00029d-HY
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 17:32:16 +0200
Received: from mail105-db3-R.bigfish.com (10.3.81.252) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 15:04:10 +0000
Received: from mail105-db3 (localhost [127.0.0.1])	by
	mail105-db3-R.bigfish.com (Postfix) with ESMTP id 2CF8B480143;
	Fri, 28 Sep 2012 15:04:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail105-db3 (localhost.localdomain [127.0.0.1]) by mail105-db3
	(MessageSwitch) id 1348844648895250_31412;
	Fri, 28 Sep 2012 15:04:08 +0000 (UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.252])	by
	mail105-db3.bigfish.com (Postfix) with ESMTP id D6647260206;
	Fri, 28 Sep 2012 15:04:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 15:04:07 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Fri, 28 Sep 2012 10:03:57 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2 10/10] libx11.inc: fix build issues for
	older CentOS distros
Thread-Index: AQHNnYj3GIeuzfB/Q02WY5KpmzNwgZef2coA
Date: Fri, 28 Sep 2012 15:03:56 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6B6E36@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
	<1348795994-21695-10-git-send-email-msm@freescale.com>
	<CAJTo0LYnnA868v3Dd5yDWn9wpXS3QsHLt0P8Ejj0BZiGmwd-RQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYnnA868v3Dd5yDWn9wpXS3QsHLt0P8Ejj0BZiGmwd-RQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 10/10] libx11.inc: fix build issues for older CentOS distros
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
X-List-Received-Date: Fri, 28 Sep 2012 15:32:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A6F40826591A984B898AD99854FF1118@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 9:52 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 28 September 2012 02:33, Matthew McClintock <msm@freescale.com> wrote:
>> Fixes these sorts of issues present on older gcc (CentOS 5.x in this cas=
e)
>>
>> | cc1: error: unrecognized command line option "-Werror=3Dimplicit"
>> | cc1: error: unrecognized command line option "-Werror=3Dnonnull"
>
> Took me a minute to realise why this happens.  This happens when
> cross-building because although configure is checking that the flags
> it uses are supported by the compiler, it's only doing that for the
> cross and not the host compiler.  Right?
>
> (upstream bug alert)

Yea,  I suppose the the host compiler should be checked by autotools
if it supports these warning flags.

-M=



