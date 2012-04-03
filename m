Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SF3cU-0007KP-CB for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 15:17:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q33D8luQ022257
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 14:08:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20808-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2012 14:08:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q33D8aCl022251
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 14:08:40 +0100
Message-ID: <1333458515.11559.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Apr 2012 14:08:35 +0100
In-Reply-To: <4ca2d5696ad0249c2524d5d99728647f0df6b92a.1333411736.git.lianhao.lu@intel.com>
References: <cover.1333411736.git.lianhao.lu@intel.com>
	<4ca2d5696ad0249c2524d5d99728647f0df6b92a.1333411736.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] eglibc: SDK_GLIBC_ADDONS for eglibc-nativesdk.
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
X-List-Received-Date: Tue, 03 Apr 2012 13:17:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-03 at 08:13 +0800, Lianhao Lu wrote:
> Use SDK_GLIBC_ADDONS for eglibc-nativesdk so that it is not
> dependant on the target eglibc's GLIBC_ADDONS settings.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/conf/machine-sdk/i586.conf         |    2 ++
>  meta/conf/machine-sdk/i686.conf         |    2 ++
>  meta/conf/machine-sdk/x86_64.conf       |    4 +++-
>  meta/recipes-core/eglibc/eglibc.inc     |    4 ++++
>  meta/recipes-core/eglibc/eglibc_2.13.bb |    5 ++---
>  meta/recipes-core/eglibc/eglibc_2.15.bb |    4 +---
>  6 files changed, 14 insertions(+), 7 deletions(-)

Merged to master, thanks.

Richard



