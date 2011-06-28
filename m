Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qbb1y-0002l6-4Y for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 18:20:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SGHDDE026238
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 17:17:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26024-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 17:17:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SGH4Uv026228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 17:17:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=GQS+Rwv+srtcctpD3jDwu7RWv2Q@mail.gmail.com>
References: <BANLkTi=GQS+Rwv+srtcctpD3jDwu7RWv2Q@mail.gmail.com>
Date: Tue, 28 Jun 2011 17:16:49 +0100
Message-ID: <1309277809.20015.322.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFH] Native SDK wirdness
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
X-List-Received-Date: Tue, 28 Jun 2011 16:20:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 11:56 -0300, Otavio Salvador wrote:
> I am probably doing something stupid but I couldn't figure it myself
> so I am looking for some help here. Basically I need to prepare a SDK
> for usage by our team mates to develop to our embedded OS. In theory I
> got most of it already done but when I build the meta-toolchain recipe
> the built sdk tarball lacks GCC and like.
> 
> Any idea where I ought to look for a good example? Or any clue what I
> am doing wrong?

Could you share a list of files from your toolchain tarball please? It
certainly should contain a cross compiler...

Cheers,

Richard



