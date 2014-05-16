Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 80F2865E87
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 11:09:03 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2014 04:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1066,1389772800"; d="scan'208";a="433008756"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.87])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2014 04:09:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Roy Li <rongqing.li@windriver.com>
Date: Fri, 16 May 2014 12:09 +0100
Message-ID: <6339757.ULFiZ01mb2@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.3-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <cover.1400201782.git.rongqing.li@windriver.com>
References: <cover.1400201782.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12 v2] ffmpeg: backport 12 CVE patches
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
X-List-Received-Date: Fri, 16 May 2014 11:09:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roy,

On Friday 16 May 2014 10:12:08 rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> Diff with V1: use ffmpeg as prefix of commit header
> 
> The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:
> 
>   gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib roy/ffmpeg-2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/ffmpeg-2
> 
> Yue Tao (12):
>   ffmpeg: fix for Security Advisory CVE-2014-2263
>   ffmpeg: fix for Security Advisory CVE-2013-0865
>   ffmpeg: fix for Security Advisory CVE-2014-2099
>   ffmpeg: fix for Security Advisory CVE-2013-0868
>   ffmpeg: fix for Security Advisory CVE-2013-0845
>   ffmpeg: fix for Security Advisory CVE-2013-0852
>   ffmpeg: fix for Security Advisory CVE-2013-0858
>   ffmpeg: fix for Security Advisory CVE-2013-0851
>   ffmpeg: fix for Security Advisory CVE-2013-0854
>   ffmpeg: fix for Security Advisory CVE-2013-0856
>   ffmpeg: fix for Security Advisory CVE-2013-0850
>   ffmpeg: fix for Security Advisory CVE-2013-0849

This should really be "gst-ffmpeg:" rather than just "ffmpeg:" since that's the 
recipe being modified.

Also, I'm not sure if you got my message yesterday (since there was a problem 
with the email transmission) however I'll repeat it here just in case:

> Note that whilst we should apply these patches, they won't actually have any
> effect on unmodified builds because we do not use gst-ffmpeg's internal
> copy of ffmpeg, we use libav instead. So if any of these fixes apply to
> libav (or if there are equivalent fixes) we will need to apply them to
> libav.

Would you be able to take care of the corresponding patches to libav?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

