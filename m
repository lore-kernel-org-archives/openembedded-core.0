Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RsdqK-00072k-4Y
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 18:19:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Feb 2012 09:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102025776"
Received: from unknown (HELO helios.localnet) ([10.252.122.196])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2012 09:11:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 01 Feb 2012 17:11:35 +0000
Message-ID: <1380758.2Kj9xNISbf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1328116152-4451-1-git-send-email-steve@sakoman.com>
References: <1328116152-4451-1-git-send-email-steve@sakoman.com>
MIME-Version: 1.0
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH] shadow-securetty: allow root logins on usb serial gadget device
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
X-List-Received-Date: Wed, 01 Feb 2012 17:19:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 01 February 2012 09:09:12 Steve Sakoman wrote:
>...
> --- a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
> +++ b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
> 
>  INHIBIT_DEFAULT_DEPS = "1"
> 
> +PR = "1"
> +

I think this needs to be PR = "r1"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


