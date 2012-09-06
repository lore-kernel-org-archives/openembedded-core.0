Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T9fFJ-0006ML-Bx
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 18:48:01 +0200
Received: from mail161-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Thu, 6 Sep 2012 16:20:33 +0000
Received: from mail161-va3 (localhost [127.0.0.1])	by
	mail161-va3-R.bigfish.com (Postfix) with ESMTP id 57EC92A00B9;
	Thu,  6 Sep 2012 16:20:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail161-va3 (localhost.localdomain [127.0.0.1]) by mail161-va3
	(MessageSwitch) id 1346948431926521_31501;
	Thu,  6 Sep 2012 16:20:31 +0000 (UTC)
Received: from VA3EHSMHS025.bigfish.com (unknown [10.7.14.242])	by
	mail161-va3.bigfish.com (Postfix) with ESMTP id DC032C0046;
	Thu,  6 Sep 2012 16:20:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS025.bigfish.com
	(10.7.99.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 6 Sep 2012 16:20:31 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.37]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Thu, 6 Sep 2012 11:20:31 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] qmake: add linux-qnuspe to the list of
	supported targets
Thread-Index: AQHNjBDtjqz7/kGWZka3Y8UQXI0Iypd90qYA
Date: Thu, 6 Sep 2012 16:20:30 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A656EAB@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1346785794-18278-1-git-send-email-msm@freescale.com>
	<2905564.VViGOl5k8s@helios>
In-Reply-To: <2905564.VViGOl5k8s@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qmake: add linux-qnuspe to the list of supported targets
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
X-List-Received-Date: Thu, 06 Sep 2012 16:48:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1A21A5C4525D2343905A6EF2DE16816C@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 6, 2012 at 4:20 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 04 September 2012 14:09:54 Matthew McClintock wrote:
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  meta/classes/qmake_base.bbclass |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/qmake_base.bbclass
>> b/meta/classes/qmake_base.bbclass index d1008b6..f972b27 100644
>> --- a/meta/classes/qmake_base.bbclass
>> +++ b/meta/classes/qmake_base.bbclass
>> @@ -48,7 +48,7 @@ addtask generate_qt_config_file after do_patch before
>> do_configure
>>
>>  qmake_base_do_configure() {
>>       case ${QMAKESPEC} in
>> -     *linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uc=
libceabi
>> -oe-g++)
>> +     *linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uc=
libceab
>> i-oe-g++|*linux-gnuspe-oe-g++) ;;
>>       *-oe-g++)
>>               die Unsupported target ${TARGET_OS} for oe-g++ qmake spec
>
> Oops, I missed this and created my own equivalent fix based on the file f=
rom OE-
> Classic. The good news is it has been merged now though, and should suppo=
rt
> uClibc builds as well.

I saw that, your patch looked more complete so I did not say anything ;)

-M

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



