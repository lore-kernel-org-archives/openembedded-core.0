Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9J2g-0007zo-Q1 for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 18:00:58 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TG1rCl006489 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 17:01:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 803wCbzXydeQ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 17:01:53 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TG1nk7006483
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 17:01:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 16:55:23 +0100
In-Reply-To: <1317270070-14250-16-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-16-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317311730.12332.102.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 16/16] Add proper deps for nfs-utils, util-linux, and strace
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
X-List-Received-Date: Thu, 29 Sep 2011 16:00:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 23:21 -0500, Matthew McClintock wrote:
> These packages need these deps for the RPM generation stage:
> 
>  error: Failed dependencies:
> | 	/usr/bin/python is needed by nfs-utils-1.2.3-r2.ppce5500
> | 	/usr/bin/perl is needed by util-linux-2.19.1-r4.ppce5500
> | 	/usr/bin/perl is needed by strace-4.5.20-r2.ppce5500
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../nfs-utils/nfs-utils_1.2.3.bb                   |    2 +-
>  meta/recipes-core/util-linux/util-linux.inc        |    2 +-
>  meta/recipes-devtools/strace/strace_4.5.20.bb      |    2 ++
>  3 files changed, 4 insertions(+), 2 deletions(-)

I merged this and several other patches to master. The unmerged ones
should have feedback...

Cheers,

Richard



