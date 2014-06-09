Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAD065D63
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 10:44:57 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jun 2014 03:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1001,1392192000"; d="scan'208";a="443259964"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 09 Jun 2014 03:44:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Yao Xinpan <yaoxp@cn.fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Mon, 09 Jun 2014 11:44:55 +0100
Message-ID: <1499388.mvWjClFzB5@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.5-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1402122422-4056-1-git-send-email-yaoxp@cn.fujitsu.com>
References: <1402122422-4056-1-git-send-email-yaoxp@cn.fujitsu.com>
MIME-Version: 1.0
Subject: Re: [PATCH] openssl: upgrade from 1.0.1g to 1.0.1h
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
X-List-Received-Date: Mon, 09 Jun 2014 10:44:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi there,

On Saturday 07 June 2014 14:27:02 Yao Xinpan wrote:
> The following bugs had been fixed in 1.0.1h:
> CVE-2014-0224, CVE-2014-0221, CVE-2014-3470
> CVE-2014-0198, CVE-2010-5298.
> 
> Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../0001-add-functions-into-openssl.ld.patch       |  35 ++
>  .../openssl/openssl/openssl-CVE-2010-5298.patch    |  24 --
>  .../openssl/openssl-CVE-2014-0198-fix.patch        |  23 --
>  .../openssl/openssl/openssl-fix-doc.patch          | 401
> --------------------- .../{openssl_1.0.1g.bb => openssl_1.0.1h.bb}       | 
>  8 +-
>  5 files changed, 38 insertions(+), 453 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/0001-add-functions-into-openssl.l
> d.patch delete mode 100644
> meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch
> delete mode 100644
> meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch
> delete mode 100644
> meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch rename
> meta/recipes-connectivity/openssl/{openssl_1.0.1g.bb => openssl_1.0.1h.bb}
> (86%)
> 
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/0001-add-functions-into-openssl
> .ld.patch
> b/meta/recipes-connectivity/openssl/openssl/0001-add-functions-into-openssl
> .ld.patch new file mode 100644
> index 0000000..2bd261d
> --- /dev/null
> +++
> b/meta/recipes-connectivity/openssl/openssl/0001-add-functions-into-openssl
> .ld.patch @@ -0,0 +1,35 @@
> +From 7d41b2ae4dff7a4caffb06e0d6dd533f77be8437 Mon Sep 17 00:00:00 2001
> +From: Yao Xinpan <yaoxp@cn.fujitsu.com>
> +Date: Sat, 7 Jun 2014 04:59:23 +0900
> +Subject: [PATCH] add functions into openssl.ld
> +
> +add ssl_init_wbio_buffer ssl3_setup_buffers dtls1_process_heartbeat and
> +tls1_process_heartbeat into openssl.ld

So it turns out I've been working on this as well; however the preferred fix 
discussed upstream for the heartbeat_test failure (that the above patch 
attempts to fix) instead links heartbeat_test against the static version of the 
library. Also, patches included in recipes need to have signed-off-by and 
Upstream-Status.

Since this is a critical fix I'll be sending out my version shortly, however I 
will include your names in the commit message.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

