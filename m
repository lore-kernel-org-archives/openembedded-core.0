Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D7C8960557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 22:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9SMLkbT014765; Tue, 28 Oct 2014 22:21:46 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YBQ3GxzssvTz; Tue, 28 Oct 2014 22:21:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9SMLhHv014762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 28 Oct 2014 22:21:44 GMT
Message-ID: <1414534938.7967.176.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Oct 2014 22:22:18 +0000
In-Reply-To: <A5FC7B4F-F911-4DFA-8F66-C006740DC0F4@dominion.thruhere.net>
References: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
	<18631FB3-E9CA-4DD0-BF5A-DB114D3B7422@dominion.thruhere.net>
	<CAJTo0Lam=wC-MBny66h-jC0ieb9tp9nTJUWEQ+KXvLDEqbk23Q@mail.gmail.com>
	<473E6E55-239E-4EC8-813C-8494BEF78CED@dominion.thruhere.net>
	<CAJTo0LY5A00MG1hmFL7Smo1sdHnGdfqpun4+kbhDRZ3iAQ2NDw@mail.gmail.com>
	<A5FC7B4F-F911-4DFA-8F66-C006740DC0F4@dominion.thruhere.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base bbclass: add support for tar.lz
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Oct 2014 22:22:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-10-28 at 10:36 +0100, Koen Kooi wrote:
> > Op 27 okt. 2014, om 14:15 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
> > 
> > 
> > On 27 October 2014 13:06, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Ah, two different problems :/
> > 
> > The problem that lzip-native isn't in oe-core is only a problem when there's a .lz SRC_URI in oe-core, but the false-positives are a problem now.
> 
> Apart from this dependency problem, bitbake has a problem as well. Does anyone know why bitbake does:
> 
> 	compressiontool --stdout file.tar.compressed | tar x
> 
> instead of:
> 
> 	tar xf file.tar.compressed 

The unpack code is rather old, its age being around a decade. A decade
ago, tar without inbuilt decompression support was not uncommon. The
code has remained unchanged...

zlib was added, I know that most tar has bzip2 now. I'm not 100% sure
which formats we could rely on being in tar though. It would also be
interesting to know which performs better on a multicore system.

Cheers,

Richard


