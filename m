Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBaQj-0004Vo-IY
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 00:59:13 +0200
Received: from mail74-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE008.bigfish.com (10.43.70.58) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 22:53:37 +0000
Received: from mail74-ch1 (localhost.localdomain [127.0.0.1])	by
	mail74-ch1-R.bigfish.com (Postfix) with ESMTP id D6C6B1AA84C3	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 22:53:37 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail74-ch1 (localhost.localdomain [127.0.0.1]) by mail74-ch1
	(MessageSwitch) id 1317855170355445_27101;
	Wed,  5 Oct 2011 22:52:50 +0000 (UTC)
Received: from CH1EHSMHS026.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.248])	by mail74-ch1.bigfish.com (Postfix) with ESMTP id
	A63F2CF814B for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 22:52:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS026.bigfish.com
	(10.43.70.26) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 22:52:16 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 17:52:15 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/6] Add new IMAGE_CLASSES variable for
	classes for image generation
Thread-Index: AQHMg7FtYqexAWTY0EGfrD7QF392mg==
Date: Wed, 5 Oct 2011 22:52:15 +0000
Message-ID: <CAEsOVNeNerChRP+bA8D354J2M+og5TPkWO9e_83rNLLbRZS4Jw@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-3-git-send-email-msm@freescale.com>
In-Reply-To: <1317765787-19127-3-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 3/6] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Wed, 05 Oct 2011 22:59:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C690FAEB1A8C9D4F9E8B32846F4C14A7@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2011 at 5:03 PM, Matthew McClintock <msm@freescale.com> wrot=
e:
> -inherit image_types
> +IMAGE_CLASESS ??=3D ""
> +inherit image_types ${IMAGE_CLASSES}

So this does not work properly, I thought I tested it but... need to
do something like this:

IMAGE_CLASSES =3D "image_types"
inherit ${IMAGE_CLASSES}

then let the user added via

IMAGE_CLASESS +=3D "image_types_uboot"

then there will always be something that is expanded to avoid this issue:

ERROR: Could not inherit file classes/$IMAGE_CLASSES.bbclass
                           | ETA:  --:--:--
ERROR: Command execution failed: Exited with 1

or

ERROR: Could not inherit file classes/.bbclass
             | ETA:  --:--:--
ERROR: Command execution failed: Exited with 1

-M=



