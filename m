Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 541716FF56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 10:19:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jun 2016 03:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,444,1459839600"; d="scan'208";a="824753774"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2016 03:19:07 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1465465368-26196-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJTo0LZMjyZMqvC5wvJ95-i05N5pFtYZ82mrggCYJ7q_MtOnNA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a6e0aa09-06cd-7ae2-a96b-16ae839cebcc@linux.intel.com>
Date: Thu, 9 Jun 2016 13:19:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZMjyZMqvC5wvJ95-i05N5pFtYZ82mrggCYJ7q_MtOnNA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bash-completion: fix upstream version check
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
X-List-Received-Date: Thu, 09 Jun 2016 10:19:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2016 01:15 PM, Burton, Ross wrote:
>     @@ -12,6 +12,7 @@
>     SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
>      SRC_URI[md5sum] = "4e2a9f11a4042a38ee79ddcd048e8b9e"
>      SRC_URI[sha256sum] =
>     "2b606804a7d5f823380a882e0f7b6c8a37b0e768e72c3d4107c51fbe8a46ae4f"
>      UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
>     +UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
>
>
> If canonical upstream is github, should we change the SRC_URI to
> download the releases from there too instead of Debian?

Yes; I'll handle that in a separate commit together with a version 
update. I didn't realize I just assigned myself to maintain this :D

Alex


