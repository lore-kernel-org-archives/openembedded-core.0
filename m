Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBDG0-0007sj-Pl for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:14:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94MFWij025740 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 23:15:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CZt98jJg0njJ
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 23:15:31 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94MFSju025736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 23:15:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 23:08:58 +0100
In-Reply-To: <1317756763-21114-1-git-send-email-raj.khem@gmail.com>
References: <1317756763-21114-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317766145.14671.119.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] runqemu-export-rootfs: Add HOW-TO for ubuntu 11.10 for rpcbind problem
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
X-List-Received-Date: Tue, 04 Oct 2011 22:14:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 12:32 -0700, Khem Raj wrote:
> The existing instruction to tackle
> RPC: Authentication error; why = Client credential too weak
> Are not applicable to ubuntu 11.10 especially
> 
> Therefore add the magic needed for ubuntu 11.10
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  scripts/runqemu-export-rootfs |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Merged to master, thanks.

Nice to have this fix documented :)

Cheers,

Richard



