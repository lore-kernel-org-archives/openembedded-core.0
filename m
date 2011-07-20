Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjY4L-00079R-7y for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 16:48:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEi789023629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:44:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22766-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:44:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6KEi11M023623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:44:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7f38271cfc3e635e36fcd75ad79558266fd18326.1311151283.git.lei.mei@intel.com>
References: <cover.1311151283.git.lei.mei@intel.com>
	<7f38271cfc3e635e36fcd75ad79558266fd18326.1311151283.git.lei.mei@intel.com>
Date: Wed, 20 Jul 2011 15:43:58 +0100
Message-ID: <1311173038.2344.50.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
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
X-List-Received-Date: Wed, 20 Jul 2011 14:48:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-20 at 16:48 +0800, Mei Lei wrote:
> Signed-off-by: Mei Lei <lei.mei@intel.com>
> ---
>  meta/recipes-extended/lsb/lsbsetup_1.0.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-extended/lsb/lsbsetup_1.0.bb b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
> index 4295805..03f8012 100644
> --- a/meta/recipes-extended/lsb/lsbsetup_1.0.bb
> +++ b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
> @@ -14,7 +14,7 @@ do_install() {
>      install -d ${D}/usr/bin
>      install -d ${D}/${sysconfdir}
>      install -m 0755 ${S}/LSB_Setup.sh ${D}/usr/bin
> -    install -d  ${D}/usr/lib/lsb
> +    install -d  ${D}/${libdir}/lsb
>      ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
>      ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
>      ln -sf ${sbindir}/sendmail ${D}/${libdir}/sendmail

Merged to master, thanks.

Richard



