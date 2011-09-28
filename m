Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1R8vYX-0007Mr-9X
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 16:56:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p8SEonbu022673;
	Wed, 28 Sep 2011 15:50:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22058-05; Wed, 28 Sep 2011 15:50:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p8SEohvB022666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 28 Sep 2011 15:50:43 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 15:50:44 +0100
In-Reply-To: <1316297897-698-5-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317221444.12332.6.camel@ted>
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 5/5] kernel.bbclass: remove unshipped files in do_install
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
X-List-Received-Date: Wed, 28 Sep 2011 14:56:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-09-18 at 02:18 +0400, Dmitry Eremin-Solenikov wrote:
> Drop two unsed files (modules.order and modules.builtin) in do_install
> to stop the "unshipped files" warning.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/classes/kernel.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 59d3b89..6b2e603 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -108,6 +108,8 @@ kernel_do_install() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>  		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
> +		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
> +		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>  	else
>  		bbnote "no modules to install"
>  	fi

Merged to master, thanks.

Richard



