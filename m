Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7782771F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 10:48:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 30 May 2016 03:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,389,1459839600"; d="scan'208";a="112797093"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 30 May 2016 03:48:30 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1464595294.git.Qi.Chen@windriver.com>
	<9697a509e56ad274d52f6d82866adfddd0a3d484.1464595294.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <574C1A78.3090706@linux.intel.com>
Date: Mon, 30 May 2016 13:48:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <9697a509e56ad274d52f6d82866adfddd0a3d484.1464595294.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] webkitgtk: disable gobject-introspection on mips64
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
X-List-Received-Date: Mon, 30 May 2016 10:48:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/30/2016 11:02 AM, Chen Qi wrote:
> Disable gobject-introspection on mips64 to avoid do_compile failure.
> +
> +# qemu: uncaught target signal 6 (Aborted) - core dumped

Please add the actual error before the above line:

| WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119: 
get_lock_object: Assertion `!"sizeof lock obj"' failed.

I just checked that updating libgpg-error to 1.22 does not help.

Alex

