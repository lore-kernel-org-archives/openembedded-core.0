Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 151EA76FF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 10:34:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Sep 2015 03:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,586,1437462000"; d="scan'208";a="797108513"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2015 03:34:46 -0700
Message-ID: <56052350.9070405@linux.intel.com>
Date: Fri, 25 Sep 2015 13:34:56 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <1443116526-16989-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAP71Wjz0zd_gTE8J82P0bvxvqSb_iH2CkK5jy=sGUGjKk_dGSQ@mail.gmail.com>
In-Reply-To: <CAP71Wjz0zd_gTE8J82P0bvxvqSb_iH2CkK5jy=sGUGjKk_dGSQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: change glimagesink rank to marginal
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
X-List-Received-Date: Fri, 25 Sep 2015 10:34:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2015 11:03 PM, Nicolas Dechesne wrote:

> fwiw... on my platforms (QCOM DragonBoard) I rely on glimagesink, and
> we have good OpenGL support.. but I understand that this isn't the
> norm for ARM, and more an exception.. I can manage that in my BSP
> layer, if that ever gets merged. Note we might want to wait for the
> upstream discussion to settle before merging.

If you explicitly specify glimagesink in your pipelines, then this patch 
will not affect you. But if you rely on gstreamer's autoplugging, then 
it's entirely coincidental that you're getting the sink you want; 
gstreamer makes no promises about what you end up with. It simply sorts 
sinks by their hardcoded rank, and picks the first one that initializes 
without error.

The upstream discussion has stalled two months ago. Meanwhile we have a 
real problem in qemu images: video playback does not work. If you can 
propose a better fix, you're very much welcome.


Regards,
Alex


