Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0iuo-0008TM-Sx for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 01:21:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1O0DHEk030975
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:13:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30295-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:13:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1O0D7dR030950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:13:09 GMT
Message-ID: <1330042388.25226.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 00:13:08 +0000
In-Reply-To: <CAP9ODKprbhrpzGo=_Qd+JBcvVkKWaS0=TgVM7XmApC2QPYG3fA@mail.gmail.com>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
	<5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
	<32a9dc576917167f6c2392c822abf54fba58eaf2.1330004039.git.richard.purdie@linuxfoundation.org>
	<CAP9ODKprbhrpzGo=_Qd+JBcvVkKWaS0=TgVM7XmApC2QPYG3fA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 04/16] libusb-compat: Address unpackaged files warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 24 Feb 2012 00:21:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 12:53 -0200, Otavio Salvador wrote:
> On Thu, Feb 23, 2012 at 11:38, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > WARNING: For recipe libusb-compat, the following files/directories were installed but not shipped in any package:
> > WARNING:   /lib/libusb.la
> 
> Why not drop it?

I want to be consistent. We currently package the .la files. We've also
recently witnessed what can happen when they're removed...

Cheers,

Richard




