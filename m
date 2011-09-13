Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R3Vce-0001Ug-Na for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 18:14:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DGF3jG028159 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:15:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YrEI-XOOloGl
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:15:02 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DGEuSA028134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:14:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 17:08:45 +0100
In-Reply-To: <cover.1315914682.git.dongxiao.xu@intel.com>
References: <cover.1315914682.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1315930134.13526.0.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/2][PULL] multilib: fix multiple (r)provider issue when parsing
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
X-List-Received-Date: Tue, 13 Sep 2011 16:14:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 19:52 +0800, Dongxiao Xu wrote:
> Dongxiao Xu (2):
>   base.bbclass: do not expand PREFERRED_PROVIDER for kernel recipe
>   multilib: Remove recipe from multilib.conf that inherits allarch
> 
>  meta/classes/base.bbclass            |    4 +++-
>  meta/classes/multilib_global.bbclass |    4 ++++
>  meta/conf/multilib.conf              |    2 --
>  3 files changed, 7 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



