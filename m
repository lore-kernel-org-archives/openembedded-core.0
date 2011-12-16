Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbaW6-0002LB-A7 for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 17:20:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGDCkF019506
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:13:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18830-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:13:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGD44m019500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:13:05 GMT
Message-ID: <1324051986.4568.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2011 16:13:06 +0000
In-Reply-To: <1323963338-21505-1-git-send-email-Bernhard.Guillon@hale.at>
References: <1323963338-21505-1-git-send-email-Bernhard.Guillon@hale.at>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] update-rc.d.bbclass: override UPDATERCD for nativesdk
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
X-List-Received-Date: Fri, 16 Dec 2011 16:20:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-15 at 16:35 +0100, Bernhard Guillon wrote:
> Override UPDATERCD for nativesdk.
> Without, update-rc.d is installed to /usr/sbin/update-rc.d
> with meta-toolchain if nativesdk recipe inherits update-rc.d. An
> example recipe for this is dbus.
> 
> Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>
> ---
>  meta/classes/update-rc.d.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



