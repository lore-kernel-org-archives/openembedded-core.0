Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZ4lz-0003TI-9H for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 19:04:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9HtLJ5003206
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 17:55:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02208-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2011 17:55:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9HtEkJ003195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 17:55:15 GMT
Message-ID: <1323453326.5309.190.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2011 17:55:26 +0000
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] ConnMan improvements and misc fixes
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
X-List-Received-Date: Fri, 09 Dec 2011 18:04:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 17:27 +0000, Otavio Salvador wrote:
> The following changes since commit 4a13766c7b223d82e8cf682db999a135d2b8412c:
> 
>   gtk.inc: ship gtk-demo to independent package (2011-12-08 16:58:41 +0000)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/oe-core master
>   https://github.com/OSSystems/oe-core/tree/HEAD
> 
> Otavio Salvador (5):
>   dosfstools: update native to 2.11
>   scripts/send-pull-request: allow sending of patches without a cover
>     letter
>   connman: drop git version
>   connman: move files from connman-0.75 to connman dir
>   connman: update to 0.78

I've merged these apart from the dosfstools change which I'm going to
let Saul test a bit further before it goes in.

Cheers,

Richard



