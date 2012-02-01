Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RscB0-00089r-W3 for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 16:32:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q11FOsKu023522
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Feb 2012 15:24:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23446-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2012 15:24:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q11FOl7g023516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Feb 2012 15:24:48 GMT
Message-ID: <1328109891.13744.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 01 Feb 2012 15:24:51 +0000
In-Reply-To: <1327737477-16477-1-git-send-email-andrea.adami@gmail.com>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
	<1327737477-16477-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] tzdata_2011n: provide pkg_postinst and timezone defaults
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
X-List-Received-Date: Wed, 01 Feb 2012 15:32:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-01-28 at 08:57 +0100, Andrea Adami wrote:
> * Introduce DEFAULT_TIMEZONE variable ('Universal', present in base package)
> * and add /etc/timezone during do_install.
> * While there, fix hardcoded references to $exec_prefix (/usr).
> * Add the pkg_postinst script (adapted from Gentoo).
> * Create /etc/localtime during postinst.
> * Bump PR
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/recipes-extended/tzdata/tzdata_2011n.bb |   62 ++++++++++++++++++++++++--
>  1 files changed, 58 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard



