Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Shgg0-00020d-1d for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 14:39:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LCT6qK022258
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:29:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22083-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:29:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LCSv9N022235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 13:28:58 +0100
Message-ID: <1340281739.1640.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 13:28:59 +0100
In-Reply-To: <1340176637-19586-1-git-send-email-xin.ouyang@windriver.com>
References: <1340176637-19586-1-git-send-email-xin.ouyang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] xinetd: Add default options.
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
X-List-Received-Date: Thu, 21 Jun 2012 12:39:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-20 at 15:17 +0800, xin.ouyang@windriver.com wrote:
> From: Xin Ouyang <Xin.Ouyang@windriver.com>
> 
> Currently, xinetd cannot start if no service enabled.
> 
>  # /etc/init.d/xinetd start
>  # ps aux | grep xinetd
>  # cat /var/log/syslog
>  xinetd[862]: 862 {init_services} no services. Exiting...
> 
> So add -stayalive option by default, as most distos do. 
> 
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
>  meta/recipes-extended/xinetd/xinetd/xinetd.default |   12 ++++++++++++
>  meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    3 +++
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.default

Merged to master, thanks.

Richard



