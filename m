Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RDjU4-0004h5-SD
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 23:03:33 +0200
Received: from mail124-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.22; Tue, 11 Oct 2011 20:57:50 +0000
Received: from mail124-tx2 (localhost.localdomain [127.0.0.1])	by
	mail124-tx2-R.bigfish.com (Postfix) with ESMTP id 533EA10C03B3	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 20:57:50 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zzbb2dK9371K1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail124-tx2 (localhost.localdomain [127.0.0.1]) by mail124-tx2
	(MessageSwitch) id 1318366670215625_15554;
	Tue, 11 Oct 2011 20:57:50 +0000 (UTC)
Received: from TX2EHSMHS037.bigfish.com (unknown [10.9.14.254])	by
	mail124-tx2.bigfish.com (Postfix) with ESMTP id 2924CDC8052	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 20:57:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS037.bigfish.com
	(10.9.99.137) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 11 Oct 2011 20:57:48 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.225]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 11 Oct 2011 15:57:47 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 01/16] libnl2: Fix a race on
	route/pktloc_syntax.h
Thread-Index: AQHMiFcrsVKWork4+060O+9mkAZ8mpV38+MA
Date: Tue, 11 Oct 2011 20:57:47 +0000
Message-ID: <CAEsOVNfOgHFMzMcvXt+DhBY0xtwNWhi--vNNDeKXC=aRsLKtdw@mail.gmail.com>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
	<4E94AB7A.6050603@intel.com>
In-Reply-To: <4E94AB7A.6050603@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v3 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Tue, 11 Oct 2011 21:03:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <899292BF1DB1424D93B8C8848907A652@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 3:47 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 09/30/2011 10:21 AM, Matthew McClintock wrote:
>>
>> From: Tom Rini<tom_rini@mentor.com>
>>
>> At issue is that route/pktloc.c (not generated) depends on
>> route/pktloc_syntax.h (generated).
>>
>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>> ---
>> =A0.../libnl/fix-pktloc_syntax_h-race.patch =A0 =A0 =A0 =A0 =A0 | =A0 26
>> ++++++++++++++++++++
>
> I just noticed that this patch get put in the libnl directory, not the
> libnl-2.0 directory.
>
> Can you pull all the libnl changes together and resbumit this, also is th=
ere
> a reason you can not just update this to the latest libnl 3.2.1?

Are you referring to this: http://patches.openembedded.org/patch/12749/

> Cab you test that against the wpa-supplicant which seems to be libnl's so=
le
> dependee.

I can't - don't have a board with wireless - dont't have a wireless network=
...

-M=



