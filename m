Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQI7G-0005LL-8j for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 13:27:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFCLWNQ025130
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:21:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24447-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:21:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFCLMjF025101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 12:21:23 GMT
Message-ID: <1321359687.26881.175.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 12:21:27 +0000
In-Reply-To: <1321276012.29435.24.camel@phil-desktop>
References: <1321276012.29435.24.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libnss-mdns: avoid race condition in postinst
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
X-List-Received-Date: Tue, 15 Nov 2011 12:27:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 13:06 +0000, Phil Blundell wrote:
> Writing to "/tmp/nsswitch.conf" leads to a race condition if two
> copies of the postinst are running simultaneously.  Fix this by
> modifying /etc/nsswitch.conf in place using sed -i.  Also make the
> same change to the prerm for consistency although the race will not
> occur here in practice.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  .../libnss-mdns/libnss-mdns_0.10.bb                |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)

Merged to master, thanks.

Richard



