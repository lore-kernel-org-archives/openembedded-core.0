Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 44DB96F6C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 11:36:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s37BabEE010226; Mon, 7 Apr 2014 12:36:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sg9raeHE7_l5; Mon,  7 Apr 2014 12:36:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s37BaXwj010173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 7 Apr 2014 12:36:34 +0100
Message-ID: <1396870587.24597.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <ming.liu@windriver.com>
Date: Mon, 07 Apr 2014 12:36:27 +0100
In-Reply-To: <1396870039-26834-3-git-send-email-ming.liu@windriver.com>
References: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
	<1396870039-26834-3-git-send-email-ming.liu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] binconfig.bbclass: fix multilib file conflicts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Apr 2014 11:36:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-04-07 at 19:27 +0800, Ming Liu wrote:
> In most cases binconfig files conflict among multilib packages, to avoid
> that, use update-alternatives link *-config from real path with a
> PACKAGE_ARCH suffix.
> 
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/classes/binconfig.bbclass | 65 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 56 insertions(+), 9 deletions(-)

This isn't going in, its complex and supports a minority use case.
binconfig should be dying out, not being extended and shored up like
this.

I'd also add this patch is buggy, its pure luck that update-alternatives
is available at rootfs generation time since its not in a visible
dependency.

So going forward I'd like to see patches which simply delete binconfig
scripts. Where there isn't a .pc alternative we should be adding them
and pushing them upstream.

Cheers,

Richard




