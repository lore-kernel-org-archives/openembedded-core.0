Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRkFp-0003Vm-DC for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 15:15:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48D5AIp003086
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 14:05:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02831-04 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 14:05:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48D5129003071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 14:05:02 +0100
Message-ID: <1336482307.25084.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 May 2012 14:05:07 +0100
In-Reply-To: <ad81aeddba7ac9bbd855e92304dafab2a811b523.1336454749.git.dongxiao.xu@intel.com>
References: <cover.1336454749.git.dongxiao.xu@intel.com>
	<ad81aeddba7ac9bbd855e92304dafab2a811b523.1336454749.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] qt4: move functions from python to shell style
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
X-List-Received-Date: Tue, 08 May 2012 13:15:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-08 at 13:28 +0800, Dongxiao Xu wrote:
> In qt4's do_configure operation, it will refer to some variables that
> are derived from 'd', however these variable values may be not correct
> in multilib case since the extraction of these variables happens before
> the multilib handler.
> 
> The fix is to move these python style functions back to shell style.
> 
> This fixes [YOCTO #2355]
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  meta/recipes-qt/qt4/qt4-embedded.inc        |    2 +-
>  meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    5 ++-
>  meta/recipes-qt/qt4/qt4-x11-free.inc        |    2 +-
>  meta/recipes-qt/qt4/qt4.inc                 |    5 ++-
>  meta/recipes-qt/qt4/qt4_arch.inc            |   36 ++++++++++++---------------
>  5 files changed, 24 insertions(+), 26 deletions(-)

Merged to master with a fix to some of the whitespace, thanks.

Richard




