Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 19BB766069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 08:51:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 May 2014 01:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1057,1389772800"; d="scan'208";a="432456020"
Received: from mrdissan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.179])
	by azsmga001.ch.intel.com with ESMTP; 15 May 2014 01:51:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: rongqing.li@windriver.com
Date: Thu, 15 May 2014 09:51:31 +0100
Message-ID: <1850820.V8BJsiNnsd@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.3-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <cover.1400118419.git.rongqing.li@windriver.com>
References: <cover.1400118419.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12] forward 12 CVE patches for ffmpeg
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
X-List-Received-Date: Thu, 15 May 2014 08:51:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roy,

On Thursday 15 May 2014 10:03:50 rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> The following changes since commit 58417093d7ce83c8a2f683a356fddc23aaee5e8e:
> 
>   wic: Extend indirect string connection to support image names and rootfs
> (2014-05-13 19:35:06 +0100)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib roy/ffmpeg-1
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-1
> 
> Yue Tao (12):
>   Security Advisory - ffmpeg - CVE-2014-2263
>   Security Advisory - ffmpeg - CVE-2013-0865
>   Security Advisory - ffmpeg - CVE-2014-2099
>   Security Advisory - ffmpeg - CVE-2013-0868
>   Security Advisory - ffmpeg - CVE-2013-0845
>   Security Advisory - ffmpeg - CVE-2013-0852
>   Security Advisory - ffmpeg - CVE-2013-0858
>   Security Advisory - ffmpeg - CVE-2013-0851
>   Security Advisory - ffmpeg - CVE-2013-0854
>   Security Advisory - ffmpeg - CVE-2013-0856
>   Security Advisory - ffmpeg - CVE-2013-0850
>   Security Advisory - ffmpeg - CVE-2013-0849

Note that whilst we should apply these patches, they won't actually have any 
effect on unmodified builds because we do not use gst-ffmpeg's internal copy of 
ffmpeg, we use libav instead. So if any of these fixes apply to libav (or if 
there are equivalent fixes) we will need to apply them to libav.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

