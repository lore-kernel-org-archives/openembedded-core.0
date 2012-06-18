Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SgbS6-0002iv-Qz for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 14:53:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5ICgPfq005141
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 13:42:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04750-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 13:42:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5ICgIqZ005135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 13:42:19 +0100
Message-ID: <1340023339.8481.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jun 2012 13:42:19 +0100
In-Reply-To: <1339870099-24648-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120508180256.GB3138@jama.jama.net>
	<1339870099-24648-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] recipes: replace CONFLICTS with RCONFLICTS_${PN}
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
X-List-Received-Date: Mon, 18 Jun 2012 12:53:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-06-16 at 20:08 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    4 ++--
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 ++--
>  .../xorg-proto/compositeproto_0.4.2.bb             |    4 ++--
>  .../xorg-proto/damageproto_1.2.1.bb                |    4 ++--
>  meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb |    4 ++--
>  .../xorg-proto/randrproto_1.3.2.bb                 |    4 ++--
>  .../xorg-proto/recordproto_1.14.2.bb               |    4 ++--
>  .../xorg-proto/renderproto_0.11.1.bb               |    4 ++--
>  .../xorg-proto/resourceproto_1.2.0.bb              |    4 ++--
>  .../xorg-proto/xf86dgaproto_2.1.bb                 |    4 ++--
>  .../xorg-proto/xf86vidmodeproto_2.3.1.bb           |    4 ++--
>  .../matchbox-desktop-sato_git.bb                   |    4 ++--
>  meta/recipes-support/db/db_5.3.15.bb               |    4 ++--
>  13 files changed, 26 insertions(+), 26 deletions(-)

Merged to master along with 2/2, thanks.

Richard



