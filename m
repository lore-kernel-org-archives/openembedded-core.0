Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RAnWB-0006rH-S3
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 20:45:36 +0200
Received: from mail29-tx2-R.bigfish.com (10.9.14.251) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Oct 2011 18:40:02 +0000
Received: from mail29-tx2 (localhost.localdomain [127.0.0.1])	by
	mail29-tx2-R.bigfish.com (Postfix) with ESMTP id 637C11A100C5	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 18:40:02 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail29-tx2 (localhost.localdomain [127.0.0.1]) by mail29-tx2
	(MessageSwitch) id 1317667202322342_27993;
	Mon,  3 Oct 2011 18:40:02 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.248])	by
	mail29-tx2.bigfish.com (Postfix) with ESMTP id 45046A98046	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2011 18:40:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 3 Oct 2011 18:39:53 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Mon, 3 Oct 2011 13:39:53 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 01/16] libnl2: Fix a race on
	route/pktloc_syntax.h
Thread-Index: AQHMgfvW/hu8MqwjX0mrk0jH9xTsVw==
Date: Mon, 3 Oct 2011 18:39:52 +0000
Message-ID: <CAEsOVNdMVdbMaM-E0X2T4+v-Y_TbpiFMdcV+Lu3s7gX4dHLPHA@mail.gmail.com>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
	<20110930172628.GE7364@jama.jama.net>
In-Reply-To: <20110930172628.GE7364@jama.jama.net>
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
X-List-Received-Date: Mon, 03 Oct 2011 18:45:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <978707A922964C499420F2524111C644@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 12:26 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Sep 30, 2011 at 12:21:23PM -0500, Matthew McClintock wrote:
>> From: Tom Rini <tom_rini@mentor.com>
>>
>> At issue is that route/pktloc.c (not generated) depends on
>> route/pktloc_syntax.h (generated).
>
> On Fri, Sep 30, 2011 at 9:13 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>
> and when you're at it, please also add packaging changes from meta-oe,
> so we can remove libnl from meta-oe and keep only libnl1 there.

Sorry, I'm not sure I follow. Are you referring to all the other stuff
in the old openembedded? I'm not following this package particularly
closely.

* 9fef5f0 Add 'ucred' structure declaration in netlink headers for the inte=
grity
* f9e4241 libnl-1.1: rename to libnl1 and build only static lib
* 4ccaf2c libnl_git: remove fix-pktloc-dep-race.patch from this version
* 91e03b2 libnl: add libnl.inc and use INC_PR
* 4702231 libnl: don't use /usr/include/libnl2 anymore
* 5ef679a libnl: rename libnl2 to libnl as used in openembedded-core

-M=



