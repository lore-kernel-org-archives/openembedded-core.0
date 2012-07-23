Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1StFcR-0007j6-Vb for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 12:12:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6NA0bhI002981
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 11:00:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01834-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 11:00:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6NA0N77002975
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 11:00:28 +0100
Message-ID: <1343037628.21788.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 11:00:28 +0100
In-Reply-To: <5e873b2c99606b089ed82777f64049837a30beb0.1343032359.git.jackie.huang@windriver.com>
References: <cover.1343032359.git.jackie.huang@windriver.com>
	<5e873b2c99606b089ed82777f64049837a30beb0.1343032359.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] quota 4.00: add DEPENDS gettext-native
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
X-List-Received-Date: Mon, 23 Jul 2012 10:12:04 -0000
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
> 
> diff --git a/meta/recipes-extended/quota/quota_4.00.bb b/meta/recipes-extended/quota/quota_4.00.bb
> index 5fef9cb..25f6381 100644
> --- a/meta/recipes-extended/quota/quota_4.00.bb
> +++ b/meta/recipes-extended/quota/quota_4.00.bb
> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "eb2b045f58b98299edc568b8607b95b10735b4a131fa5196f41c89b51f
>  
>  S = "${WORKDIR}/quota-tools"
>  
> +DEPENDS = "gettext-native"
> +
>  inherit autotools
>  
>  EXTRA_OEMAKE += 'STRIP=""'

Shouldn't this be "inherit gettext" ?

Cheers,

Richard



