Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 357086018C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:45:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 22 Apr 2016 05:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="950713621"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2016 05:45:39 -0700
To: openembedded-core@lists.openembedded.org
References: <1461328888-5911-1-git-send-email-Sujith_Haridasan@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <571A1D0B.7020406@linux.intel.com>
Date: Fri, 22 Apr 2016 15:46:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1461328888-5911-1-git-send-email-Sujith_Haridasan@mentor.com>
Subject: Re: [PATCH] webkitgtk: package debug files properly and move -g removal to staging
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
X-List-Received-Date: Fri, 22 Apr 2016 12:45:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/22/2016 03:41 PM, Sujith Haridasan wrote:

> +# Link fails due to memory exhaustion, so disable debug info to reduce the
> +# memory footprint
> +DEBUG_FLAGS_remove = "-g"
> +

Wait a moment, if you do this then the debug package will be totally 
useless, no?

>   FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug \
> +                    ${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"

What problem does this addition solve specifically?

Alex


