Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8321274197
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 12:41:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2016 04:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,415,1449561600"; d="scan'208";a="742409949"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Feb 2016 04:41:29 -0800
To: openembedded-core@lists.openembedded.org
References: <CADwFkYfpFmA_29cJqSJTD=9ZMkBCWVGbqQm9_-05inkLJEYkbg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56B88C43.8000602@linux.intel.com>
Date: Mon, 8 Feb 2016 14:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CADwFkYfpFmA_29cJqSJTD=9ZMkBCWVGbqQm9_-05inkLJEYkbg@mail.gmail.com>
Subject: Re: can't compile ffmpeg without x11
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
X-List-Received-Date: Mon, 08 Feb 2016 12:41:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2016 12:08 PM, Yi Qingliang wrote:
> HELLO!
>
> in ffmpeg.bb:
>
> DEPENDS = "alsa-lib zlib libogg yasm-native libxv"
> PACKAGECONFIG ??= "... ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'x11', '', d)}"
>
>
> the 'DEPENDS' says it need libxv which need x11, so the x11 detection
> in 'PACKAGECONFIG' will not work anymore.
>
> can I use ffmpeg without x11 ? (indeed, I want to use opencv)

Yes. From my investigation of upstream, libxv is a floating, 
non-configurable dependency of libavdevice.

I'll send a patch that adds libxv recipe dependency only when 
libavdevice is enabled.


Alex

