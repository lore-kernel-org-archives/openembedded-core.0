Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E5EF971C3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 13:15:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 May 2017 06:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,382,1491289200"; d="scan'208";a="265370140"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 23 May 2017 06:15:20 -0700
To: Yuqing Zhu <carol.zhu@nxp.com>, openembedded-core@lists.openembedded.org
References: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7485bf5f-1918-df9e-9180-845d65e17497@linux.intel.com>
Date: Tue, 23 May 2017 16:13:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
Subject: Re: [poky][PATCH v2 0/6] Add some gstreamer1.0-plugins-bad patches for pyro only
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
X-List-Received-Date: Tue, 23 May 2017 13:15:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2017 10:34 AM, Yuqing Zhu wrote:
> -Add some enhancements for qmlglsrc
>  Some common features for qmlglsrc are added to make app development much easier.
>
> -Add some enhancements for gstplayer
>  Some gstplayer API enhancements are added to make it much easier for users to use.
>  Without these API enhancements, some features may not be realized
>  (like accurate seek, video sink configuration) when using gstplayer API.
>  So it would be better if they can be picked.
>
> -Fix a memory leak issue in glupload, which is common

Please resend with [pyro] in the subject instead of [poky].


Alex


