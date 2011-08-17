Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qth2K-0008J7-CR for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 16:24:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEJRkK007719
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:19:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06235-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:19:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7HEJBTC007713
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 15:19:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <eebe3f4875011ab7d8f449fb7bec6991a56c1f27.1313563238.git.anders@chargestorm.se>
References: <cover.1313563238.git.anders@chargestorm.se>
	<eebe3f4875011ab7d8f449fb7bec6991a56c1f27.1313563238.git.anders@chargestorm.se>
Date: Wed, 17 Aug 2011 15:19:03 +0100
Message-ID: <1313590743.13995.41.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 4/5] ofono: conditionally enable bluetooth
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
X-List-Received-Date: Wed, 17 Aug 2011 14:24:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-17 at 08:41 +0200, Anders Darander wrote:
> Use DISTRO_FEATURE to conditionally depend on bluez4, as well as enabling bluetooth.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/recipes-connectivity/ofono/ofono.inc     |    2 +-
>  meta/recipes-connectivity/ofono/ofono_0.50.bb |    1 +
>  meta/recipes-connectivity/ofono/ofono_git.bb  |    4 ++++
>  3 files changed, 6 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



