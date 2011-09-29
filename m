Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9LTg-0002jw-SB
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:37:00 +0200
Received: from mail64-db3-R.bigfish.com (10.3.81.253) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 18:31:32 +0000
Received: from mail64-db3 (localhost.localdomain [127.0.0.1])	by
	mail64-db3-R.bigfish.com (Postfix) with ESMTP id CC3266B04A2	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:31:32 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz9371K1454K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail64-db3 (localhost.localdomain [127.0.0.1]) by mail64-db3
	(MessageSwitch) id 1317321055272308_27874;
	Thu, 29 Sep 2011 18:30:55 +0000 (UTC)
Received: from DB3EHSMHS008.bigfish.com (unknown [10.3.81.251])	by
	mail64-db3.bigfish.com (Postfix) with ESMTP id 3D06C7C8050	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:30:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS008.bigfish.com
	(10.3.87.108) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 18:30:54 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Thu, 29 Sep 2011 13:30:52 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 02/16] bitbake pseudo wrapper: Don't base
	success on bitbake return code
Thread-Index: AQHMftJFHZc6be+MakSzrfBWySsSNpVlAO+AgAAA+IA=
Date: Thu, 29 Sep 2011 18:30:51 +0000
Message-ID: <CAEsOVNfcxMKQpq32PnJTa1-VWWyso=G4g98dNEZs_-0wAKfpGQ@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-2-git-send-email-msm@freescale.com>
	<1317284813.12332.76.camel@ted>
	<CAEsOVNdPjWvgaCL0EYUqh1XOriYMstGz3iLMG3Mamwd4sW9QQA@mail.gmail.com>
	<1317320829.12332.107.camel@ted>
In-Reply-To: <1317320829.12332.107.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH 02/16] bitbake pseudo wrapper: Don't base success on bitbake return code
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
X-List-Received-Date: Thu, 29 Sep 2011 18:37:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0F3CE3ABC1C3F84E88AEE1BD965802CA@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 1:27 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> NOTE: Tasks Summary: Attempted 133 tasks of which 0 didn't need to be
>> rerun and 0 failed.
>
> Can you file an enhancement bug to list the number of errors and
> warnings shown in the summary please? :)

http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1540

> We need to make it more obvious how many warnings/errors are occurring
> since errors change the exit code.

Feel free to drop this patch for now, since it appears not to be an
immediate issue.

-M=



