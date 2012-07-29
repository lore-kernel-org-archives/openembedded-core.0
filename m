Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SvPpt-0001oG-Kw for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 11:30:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9JJOp026836;
	Sun, 29 Jul 2012 10:19:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18628-08; Sun, 29 Jul 2012 10:19:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6T9J2Zu026825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 29 Jul 2012 10:19:06 +0100
Message-ID: <1343553543.16998.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 29 Jul 2012 10:19:03 +0100
In-Reply-To: <1343467905-10228-1-git-send-email-Song.Li@windriver.com>
References: <1343467905-10228-1-git-send-email-Song.Li@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH V2] guile:meta/Makefile change install-data-hook to install-exec-hook
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
X-List-Received-Date: Sun, 29 Jul 2012 09:30:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-07-28 at 17:31 +0800, Song.Li@windriver.com wrote:
> From: "Song.Li" <Song.Li@windriver.com>
> 
> In guile meta/Makefile, what install-data-hook do
> must be run after install-binSCRIPTS.so it's a exec hook, not a data hook.
> If keep these exec-hook in data-hook,when we run make with multi-jobbing ,
> install-data-hook and install-binSCRIPTS will be separately
> processed in different thread, no any dependence.
> that will cause error sometimes.
> 
> [YOCTO #2796]
> 
> Signed-off-by: Song.Li <Song.Li@windriver.com>
> ---
>  ...all-data-hook-to-install-exec-hook-in-gui.patch |   39 ++++++++++++++++++++
>  meta/recipes-devtools/guile/guile_2.0.5.bb         |    3 +-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch

Merged to master, thanks.

Richard



