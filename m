Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T0zRu-0000bA-6o
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 20:33:10 +0200
Received: from mail168-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Mon, 13 Aug 2012 18:06:11 +0000
Received: from mail168-ch1 (localhost [127.0.0.1])	by
	mail168-ch1-R.bigfish.com (Postfix) with ESMTP id 72099320414	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 18:06:11 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I1521I1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail168-ch1 (localhost.localdomain [127.0.0.1]) by mail168-ch1
	(MessageSwitch) id 1344881169602129_3012;
	Mon, 13 Aug 2012 18:06:09 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.232])	by mail168-ch1.bigfish.com (Postfix) with ESMTP id
	8F48F4400AB	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 18:06:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 13 Aug 2012 18:06:08 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0298.005;
	Mon, 13 Aug 2012 13:06:08 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] owl-video_git.bb: fix compilation on Fedora
	13 machine
Thread-Index: AQHNdX/hm8306Ka8Iki8aVq7vcEToJdTV1oAgAUN/IA=
Date: Mon, 13 Aug 2012 18:06:07 +0000
Message-ID: <CAEsOVNfaNDfTMpPxn7F03QapmyD-TXzZzzL_MvgPaVdOcm7CHQ@mail.gmail.com>
References: <1343335023-28938-1-git-send-email-msm@freescale.com>
	<CAEsOVNe9eWTVy7k2u5yNRGRZz==jRTZ0=nZD+xtdOhS=hSn7rg@mail.gmail.com>
	<CAJTo0LZE-vT5bbr971-Ot7puBp1aXC5yO_XVN5AKVZLrC0A=_A@mail.gmail.com>
In-Reply-To: <CAJTo0LZE-vT5bbr971-Ot7puBp1aXC5yO_XVN5AKVZLrC0A=_A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] owl-video_git.bb: fix compilation on Fedora 13 machine
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
X-List-Received-Date: Mon, 13 Aug 2012 18:33:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3F4A5496CDBD2449BB107950EFE7A417@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2012 at 7:54 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> On 8 August 2012 17:07, McClintock Matthew-B29882 <B29882@freescale.com> =
wrote:
>> Any comments on this?
>
> owl-video isn't pulling in Xrandr directly, so something is wrong with
> the linker flags produced by GTK+.  I wonder if -Wl,--as-needed is
> breaking this...  Can you replicate and provide the full build log?

Err, I went back and now I can't even reproduce this issue... I guess
we can ignore it for the time being.

-M

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



