Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1eBp-0008Om-2z for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 16:03:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDpLBr001734
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:51:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00388-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:51:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDpFI0001728
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:51:15 +0100
Message-ID: <1345038674.538.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 14:51:14 +0100
In-Reply-To: <1344984262-31589-1-git-send-email-andy.ross@windriver.com>
References: <1344984262-31589-1-git-send-email-andy.ross@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] task-core-lsb: Don't pull in eglibc-pic via RDEPENDS
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
X-List-Received-Date: Wed, 15 Aug 2012 14:03:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-14 at 15:44 -0700, Andy Ross wrote:
> The task-core-lsb-runtime-add subpackage includes eglibc-pic as an
> RDEPEND.  That's incorrect, eglibc-pic is nothing but 22MB of static
> libraries and should never appear as a runtime dependency.
> 
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>  meta/recipes-extended/tasks/task-core-lsb.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
> index 553b89e..be9eac2 100644
> --- a/meta/recipes-extended/tasks/task-core-lsb.bb
> +++ b/meta/recipes-extended/tasks/task-core-lsb.bb
> @@ -194,7 +194,6 @@ RDEPENDS_task-core-lsb-runtime-add = "\
>      eglibc-localedata-posix \
>      eglibc-extra-nss \
>      eglibc-pcprofile \
> -    eglibc-pic \
>      eglibc-utils \
>  "

Are files in that package required in order to pass LSB tests?

I'm fine with removing it if it isn't required but I would like that
confirmation before we merge this.

Cheers,

Richard



