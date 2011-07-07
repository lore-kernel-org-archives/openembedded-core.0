Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qelca-0003yW-GU for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 12:15:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67ABrtN026773;
	Thu, 7 Jul 2011 11:11:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26468-07; Thu,  7 Jul 2011 11:11:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67ABl7R026767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 7 Jul 2011 11:11:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <977364608aaefbf5b73bdd6ef5c7c8b59d2f52b7.1309877488.git.anders@chargestorm.se>
References: <cover.1309877488.git.anders@chargestorm.se>
	<977364608aaefbf5b73bdd6ef5c7c8b59d2f52b7.1309877488.git.anders@chargestorm.se>
Date: Thu, 07 Jul 2011 11:11:11 +0100
Message-ID: <1310033471.20015.811.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH 1/1] module-base: remove KERNEL-SOURCE
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
X-List-Received-Date: Thu, 07 Jul 2011 10:15:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 16:55 +0200, Anders Darander wrote:
> kernel-source do not exist in STAGING_KERNEL_DIR any longer.
> Remove the exported KERNEL_SOURCE as the STAGING_KERNEL_DIR can
> be used in module recipes directly.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/classes/module-base.bbclass |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index a7cf233..1a39cc1 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -6,7 +6,6 @@ export OS = "${TARGET_OS}"
>  export CROSS_COMPILE = "${TARGET_PREFIX}"
>  
>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
> -export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"
>  KERNEL_OBJECT_SUFFIX = ".ko"
>  KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
>  KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"

Merged to master, thanks.

Richard



