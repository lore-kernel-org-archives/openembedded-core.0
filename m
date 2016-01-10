Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 74370731DB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 20:26:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jan 2016 12:26:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,549,1444719600"; d="scan'208";a="631257734"
Received: from mariacha-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.41])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2016 12:26:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 11 Jan 2016 09:26:39 +1300
Message-ID: <3794662.0pqDkncOgQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1452277369.7598.136.camel@linuxfoundation.org>
References: <1452277369.7598.136.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pixz: Add 1.0.6
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
X-List-Received-Date: Sun, 10 Jan 2016 20:26:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 08 Jan 2016 18:22:49 Richard Purdie wrote:
> xz gives better compression results than bzip/gz but is often slower.
> Using parallel compression mitigates this somewhat and is particularly
> useful for the SDK.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/recipes-support/pixz/pixz_1.0.6.bb
> b/meta/recipes-support/pixz/pixz_1.0.6.bb new file mode 100644
> index 0000000..e6e4ac2
> --- /dev/null
> +++ b/meta/recipes-support/pixz/pixz_1.0.6.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Parallel, indexed xz compressor"
> +
> +DEPENDS = "xz libarchive"
> +
> +SRC_URI =
> "https://github.com/vasi/pixz/releases/download/v${PV}/${BPN}-${PV}.tar.xz"

Can we rely on this never changing? I thought we'd experienced problems with 
github's release tarballs being generated on the fly in the past...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

