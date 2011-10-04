Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBCZL-0006c1-0c
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 23:30:31 +0200
Received: from mail78-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.22; Tue, 4 Oct 2011 21:24:56 +0000
Received: from mail78-tx2 (localhost.localdomain [127.0.0.1])	by
	mail78-tx2-R.bigfish.com (Postfix) with ESMTP id AECD1FF8236	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 21:24:55 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail78-tx2 (localhost.localdomain [127.0.0.1]) by mail78-tx2
	(MessageSwitch) id 1317763425117522_1870;
	Tue,  4 Oct 2011 21:23:45 +0000 (UTC)
Received: from TX2EHSMHS014.bigfish.com (unknown [10.9.14.254])	by
	mail78-tx2.bigfish.com (Postfix) with ESMTP id 6CD7E18901DE	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 21:22:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS014.bigfish.com
	(10.9.99.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 4 Oct 2011 21:22:40 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0323.007; Tue, 4 Oct 2011 16:22:40 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 01/16] libnl2: Fix a race on
	route/pktloc_syntax.h
Thread-Index: AQHMgfvW/hu8MqwjX0mrk0jH9xTsV5VrTmKAgAG42oA=
Date: Tue, 4 Oct 2011 21:22:39 +0000
Message-ID: <CAEsOVNd+vvNsbk4Zaopiq3u1KgKqjrSLTRq1Q_Lzi+sKOaMRhg@mail.gmail.com>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
	<20110930172628.GE7364@jama.jama.net>
	<CAEsOVNdMVdbMaM-E0X2T4+v-Y_TbpiFMdcV+Lu3s7gX4dHLPHA@mail.gmail.com>
	<20111003190425.GS7364@jama.jama.net>
In-Reply-To: <20111003190425.GS7364@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
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
X-List-Received-Date: Tue, 04 Oct 2011 21:30:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A8E9AC0D997AC34BB43DCCB44EBCD0FE@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 2:04 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>> Sorry, I'm not sure I follow. Are you referring to all the other stuff
>> in the old openembedded? I'm not following this package particularly
>> closely.
>
> just see diff oe-core/meta/recipes*/libnl* and meta-openembedded/meta-oe/=
recipes*/libnl*
> and it will be clearer

I can do this but besides build errors I have no way to really test this.

-M=



