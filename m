Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaRcc-0001mm-SP for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:38:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCVJ4h008826
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:31:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07989-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:31:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCVA1a008814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:31:11 GMT
Message-ID: <1323779470.2731.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 12:31:10 +0000
In-Reply-To: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
References: <1323281084-30590-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][RFC] conf/machine/include/arm add extra MACHINEOVERRIDES like x86 does
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
X-List-Received-Date: Tue, 13 Dec 2011 12:38:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 19:04 +0100, Martin Jansa wrote:
> * motivated by this NAK
>   http://patchwork.openembedded.org/patch/15777/
>   and today's discussion on #yocto I hope it's worth it to send this RFC
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv4.inc  |    1 +
>  meta/conf/machine/include/arm/arch-armv5.inc  |    1 +
>  meta/conf/machine/include/arm/arch-armv6.inc  |    1 +
>  meta/conf/machine/include/arm/arch-armv7.inc  |    1 +
>  meta/conf/machine/include/arm/arch-armv7a.inc |    1 +
>  5 files changed, 5 insertions(+), 0 deletions(-)

Merged to master, thanks.

I assume you'll follow up and tweak the overrides in OE-Core to match
this?

Cheers,

Richard



