Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBnk7-0006Ii-Ca for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:16:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CE2Y5h020288
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 15:02:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19904-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 15:02:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CE2Pxk020282
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 15:02:26 +0100
Message-ID: <1347458547.11710.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 12 Sep 2012 15:02:27 +0100
In-Reply-To: <5e873b2c99606b089ed82777f64049837a30beb0.1343032359.git.jackie.huang@windriver.com>
References: <cover.1343032359.git.jackie.huang@windriver.com>
	<5e873b2c99606b089ed82777f64049837a30beb0.1343032359.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] quota 4.00: add DEPENDS gettext-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 14:16:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-23 at 16:38 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> do_install needs command 'msgfmt', it would fail if the command
> doesn't exist on the host, add DEPENDS gettext-native to fix this.
> 
> [YOCTO #2811]
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-extended/quota/quota_4.00.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Merged to master, thanks. Sorry for the delay on this on, the patch is
the correct fix in this case (just a little unusual).

Cheers,

Richard



