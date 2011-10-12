Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=TX2EHSOBE010.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RE8Si-0000jq-Ho
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 01:43:48 +0200
Received: from mail97-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.22; Wed, 12 Oct 2011 23:38:04 +0000
Received: from mail97-tx2 (localhost.localdomain [127.0.0.1])	by
	mail97-tx2-R.bigfish.com (Postfix) with ESMTP id 8ABD5548422	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 23:38:04 +0000 (UTC)
X-SpamScore: -5
X-BigFish: VS-5(zzdf9Mzz1202hzzz2dh2a8h668h839h8e2h8e3h66h)
X-Spam-TCS-SCL: 5:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail97-tx2 (localhost.localdomain [127.0.0.1]) by mail97-tx2
	(MessageSwitch) id 1318462660760730_21699;
	Wed, 12 Oct 2011 23:37:40 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.252])	by
	mail97-tx2.bigfish.com (Postfix) with ESMTP id A9D45BB8054	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 23:37:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 12 Oct 2011 23:37:40 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.225]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Wed, 12 Oct 2011 18:37:40 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: GIT_CORE_CONFIG needed? set by default?
Thread-Index: AQHMiTfuKwcPbUFgs0mvoRrRZAdt1g==
Date: Wed, 12 Oct 2011 23:37:40 +0000
Message-ID: <CAEsOVNcAkQ_XtFWFWKmguXsLUqDQOMTSmZ+wwf+1vMH9bwCo7A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: GIT_CORE_CONFIG needed? set by default?
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
X-List-Received-Date: Wed, 12 Oct 2011 23:43:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8D549A3C91C57544AB8B5F9B7CB37CD2@freescale.net>
Content-Transfer-Encoding: quoted-printable

All,

I was having more issues with git over our proxy (again) and realized
we were not setting GIT_CORE_CONFIG. This enables creation of the
gitconfig file - otherwise it's not created. I'm not entirely sure if
it falls back to the users gitconfig or not - point is I was thinking
we should have this set by default so the gitconfig is created for the
git related fetching and we can count on a consistent environment when
it comes to debugging (we don't want to get messages with git failures
only to find out the user has some weird foo in their own gitconfig).

Comments?

-M=



