Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaUgw-0007br-UW for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 16:54:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDFm0RE010757
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 15:48:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09849-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 15:47:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDFlsI2010751
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 15:47:55 GMT
Message-ID: <1323791273.25491.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 15:47:53 +0000
In-Reply-To: <ed69ab4404b203386817674220400f9ca3a27343.1323688579.git.xiaofeng.yan@windriver.com>
References: <cover.1323688579.git.xiaofeng.yan@windriver.com>
	<ed69ab4404b203386817674220400f9ca3a27343.1323688579.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/7] gtk: add demos to the configuation of gtk+
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
X-List-Received-Date: Tue, 13 Dec 2011 15:54:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-12 at 19:28 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Add demos for checking whether gtk+ run over directfb successfully or not.
> 
> [YOCTO #1674]
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+_2.24.8.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

This broke the builds:

http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/198/steps/shell_14/logs/stdio

:(

Cheers,

Richard



