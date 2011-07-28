Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=AM1EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1QmTim-000833-67
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 18:46:04 +0200
Received: from mail90-am1-R.bigfish.com (10.3.201.242) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.22; Thu, 28 Jul 2011 16:26:44 +0000
Received: from mail90-am1 (localhost.localdomain [127.0.0.1])	by
	mail90-am1-R.bigfish.com (Postfix) with ESMTP id 55C9A18902F4;
	Thu, 28 Jul 2011 16:26:44 +0000 (UTC)
X-SpamScore: -20
X-BigFish: VS-20(zzbb2dK9371K148cM1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail90-am1 (localhost.localdomain [127.0.0.1]) by mail90-am1
	(MessageSwitch) id 131187038441884_18606;
	Thu, 28 Jul 2011 16:26:24 +0000 (UTC)
Received: from AM1EHSMHS014.bigfish.com (unknown [10.3.201.243])	by
	mail90-am1.bigfish.com (Postfix) with ESMTP id BE3E79A80BF;
	Thu, 28 Jul 2011 16:25:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS014.bigfish.com
	(10.3.207.152) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 28 Jul 2011 16:24:58 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.56]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0289.008; Thu, 28 Jul 2011 11:24:54 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [yocto] [OE-core] [PATCH] Switch to using perl-native for
	various packages instead of host perl
Thread-Index: AQHMS8leWmpqeI+5xkiGoGtDn+MuR5UBZ4mAgADaXwA=
Date: Thu, 28 Jul 2011 16:24:53 +0000
Message-ID: <CAEsOVNf1VK+YsHqVcyY5c9rpRbS27uiN2Gz4wGoeT2j9+YgOYw@mail.gmail.com>
References: <1311708150-24226-1-git-send-email-msm@freescale.com>
	<4E30D611.1050002@linux.intel.com>
In-Reply-To: <4E30D611.1050002@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [50.57.111.205]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Sat, 30 Jul 2011 10:58:52 +0200
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@openembedded.org" <openembedded-core@openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH] Switch to using perl-native for various packages instead of host perl
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
X-List-Received-Date: Thu, 28 Jul 2011 16:46:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C964FDDD0222D442AD4EAA68FBF0321F@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 10:22 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/26/2011 12:22 PM, Matthew McClintock wrote:
>>
>> Several builds are using perl on the host instead of perl built by
>> poky. This fixes the issue for several packages.
>>
> Matthew,
>
> Thanks for submitting this.
>
> A similar fix was recently rejected, as we are looking at a different way=
 to
> accomplish this.
>
> See
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-July/006439.h=
tml

Why do we let the host perl in the path for target installs at all? Is
there some precedence for what can be used from the host machine and
what can not?

-M=



