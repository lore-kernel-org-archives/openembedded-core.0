Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EE9D877F7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 13:17:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 May 2017 06:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,377,1491289200"; d="scan'208";a="1151249259"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 22 May 2017 06:17:54 -0700
To: Carol Zhu <carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
	<CAHiDW_GksyO+YLMzejrL+9=tgw4wdAPrRjHf32h321fi=_F2ag@mail.gmail.com>
	<9678201e-569c-33dc-4844-8f249fa28780@linux.intel.com>
	<AM5PR0401MB2674AE793FC63BFA09BF94ECE9F80@AM5PR0401MB2674.eurprd04.prod.outlook.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3d9bc00f-54bd-b725-abea-b5272ddc4b4e@linux.intel.com>
Date: Mon, 22 May 2017 16:15:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB2674AE793FC63BFA09BF94ECE9F80@AM5PR0401MB2674.eurprd04.prod.outlook.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/6] Add patches for gstreamer1.0-plugins-bad V1.10.4
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
X-List-Received-Date: Mon, 22 May 2017 13:18:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/22/2017 01:13 PM, Carol Zhu wrote:
> - 0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
>   Two enhancements for qmlglsrc:
>   1. Need set use-default-fbo to qquickwindow during set property to support change render target on the fly.
>   2. Calculate qmlglsrc refresh frame rate in qtglwindow.
>   It adds some common features for qmlglsrc to make app development much easier.
>
> - 0003-player-Add-configuration-for-enabling-accurate-seeks.patch
> - 0004-player-Add-get-track-number-media-info-API.patch
> - 0005-player-Add-overlayvideorenderer-video-sink.patch
> - 0006-gst-player-fix-gst-player-failed-to-load-external-su.patch
>   These are gstplayer related patches.
>   And by above gstplayer backport patches, we enhanced some API to make it much easier to use for users.
>   Without these API enhancements,  some features may not be realized (like accurate seek, video sink configuration) when using gstplayer API.
>   So it would be better if they can be picked.
>
> - 0007-glupload-fix-memory-leak-when-use-a-GVal.patch
>   This patch fixes a memory leak issue in glupload, which is common.

Can you please include these explanations into the commit messages, 
rebase the patches on top of the pyro branch, and send them again 
indicating in the subject that they are for pyro only?

Thanks,
Alex


