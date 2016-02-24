Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 02F7877168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 11:58:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 24 Feb 2016 03:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,493,1449561600"; d="scan'208";a="893570599"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 03:57:55 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<6ebf64ba55b2abcb17cfaf487d412a7072d9034b.1455107972.git.alexander.kanavin@linux.intel.com>
	<56BCDC10.8050901@gmail.com> <56C33375.4040200@linux.intel.com>
	<56C3465B.7020702@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56CD9A1F.2060101@linux.intel.com>
Date: Wed, 24 Feb 2016 13:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <56C3465B.7020702@gmail.com>
Subject: Re: [PATCH 6/7] webkitgtk: update to 2.10.7
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
X-List-Received-Date: Wed, 24 Feb 2016 11:58:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/2016 05:55 PM, akuster808 wrote:

>> Yes, which means that jethro (which has 2.8.5) needs the same update.
>
> there is a bug open for that 8877. there are a huge number of CVE's that
> need fixing.

I wrote a comment in that bug, but I think it bears repeating here:

Please read this, it's a bit long, but worth it:

https://blogs.gnome.org/mcatanzaro/2016/02/01/on-webkit-security-updates/

Summary: the upstream will not backport CVE fixes, and they will not be 
making point releases in old branches with any kind of lifecycle 
guarantee. Providing ongoing updates to the latest stable release of 
webkit is the only way to stay secure.

So I believe that you indeed have to update webkit to 2.10.7, or 
whatever is the latest stable release, and keep doing this for as long 
as a yocto release needs to be supported.

Regards,
Alex


