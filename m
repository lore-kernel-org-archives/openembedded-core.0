Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D20BA6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 13:36:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 05:35:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837608218"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 05:35:37 -0800
To: openembedded-core@lists.openembedded.org
References: <1449626605-10934-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0LZR3Jy8rvGQEsjGquZXKHpFnhSqWgHNh4k711xnLJqw2Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56682D97.1050101@linux.intel.com>
Date: Wed, 9 Dec 2015 15:33:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZR3Jy8rvGQEsjGquZXKHpFnhSqWgHNh4k711xnLJqw2Q@mail.gmail.com>
Subject: Re: [PATCH] openssl: fix for CVE-2015-1794
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
X-List-Received-Date: Wed, 09 Dec 2015 13:36:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2015 01:52 PM, Burton, Ross wrote:

> This patch needs to have your (or whoever actually did the work)
> signed-off-by inside the patch, alongside the Upstream-Status.

Also, it's been fixed in openssl 1.0.2e with a bunch of other CVEs - 
I'll send an update for that shortly.

Generally, for oe-core master we always prefer an update to latest 
upstream instead of adding backported patches.

Alex

