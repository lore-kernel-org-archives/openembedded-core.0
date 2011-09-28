Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1R8vYc-0007PF-HK
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 16:56:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p8SEotnA022681;
	Wed, 28 Sep 2011 15:50:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21840-08; Wed, 28 Sep 2011 15:50:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p8SEokNn022670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 28 Sep 2011 15:50:46 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 15:50:47 +0100
In-Reply-To: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317221447.12332.8.camel@ted>
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
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
X-List-Received-Date: Wed, 28 Sep 2011 14:56:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-09-18 at 02:18 +0400, Dmitry Eremin-Solenikov wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index bc1baa0..c577011 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -451,7 +451,7 @@ python populate_packages_prepend () {
>  	metapkg = "kernel-modules"
>  	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
>  	bb.data.setVar('FILES_' + metapkg, "", d)
> -	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
> +	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
>  	for l in module_deps.values():
>  		for i in l:
>  			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))

Merged to master, thanks.

Richard



