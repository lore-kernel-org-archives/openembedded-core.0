Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9LPy-0002e1-OC
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:33:10 +0200
Received: from mail78-am1-R.bigfish.com (10.3.201.243) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 18:12:27 +0000
Received: from mail78-am1 (localhost.localdomain [127.0.0.1])	by
	mail78-am1-R.bigfish.com (Postfix) with ESMTP id 0F6A9E7055E	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:12:27 +0000 (UTC)
X-SpamScore: -17
X-BigFish: VS-17(zz9371K936eK168aJ1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail78-am1 (localhost.localdomain [127.0.0.1]) by mail78-am1
	(MessageSwitch) id 1317319908534966_9185;
	Thu, 29 Sep 2011 18:11:48 +0000 (UTC)
Received: from AM1EHSMHS006.bigfish.com (unknown [10.3.201.241])	by
	mail78-am1.bigfish.com (Postfix) with ESMTP id 9AD2B700292	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:10:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS006.bigfish.com
	(10.3.207.106) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 18:10:56 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Thu, 29 Sep 2011 13:10:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 12/16] Fix flac build on e500mc cores
Thread-Index: AQHMftMh9VbthPPEZUOZW0DjTM8KeQ==
Date: Thu, 29 Sep 2011 18:10:54 +0000
Message-ID: <CAEsOVNeCOnucpJEcdwGxdGMcF7uaH45wKMk-TG2+GbJFs3DaEg@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-12-git-send-email-msm@freescale.com>
	<1317311572.12332.101.camel@ted>
In-Reply-To: <1317311572.12332.101.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 12/16] Fix flac build on e500mc cores
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
X-List-Received-Date: Thu, 29 Sep 2011 18:33:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E4939F44622D0E47AF9D0B7C5BD41191@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 10:52 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-09-28 at 23:21 -0500, Matthew McClintock wrote:
>> This core does not have altivec, so we disable it in the build,
>> also reestablish the config option to enable/disable building
>> with altivec
>>
>> If SPE is not detected we always build with altivec which is wrong. This
>> will check to make sure altivec is enabled and pass build options
>> through accordingly
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>> =A0.../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch =A0 | =A0 =A04 +++-
>> =A0meta/recipes-multimedia/flac/flac_1.2.1.bb =A0 =A0 =A0 =A0 | =A0 =A05=
 ++++-
>> =A02 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-=
SPE.patch b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.=
patch
>> index 658e190..5ca8b35 100644
>> --- a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.pat=
ch
>> +++ b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.pat=
ch
>> @@ -39,15 +39,17 @@ diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/M=
akefile.am
>
> No patch header...

This is patching a patch with a patch header. Do I need to make any
further documentation?

-M=



