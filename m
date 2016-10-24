Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 85A4A7197A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 11:27:14 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 24 Oct 2016 04:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,541,1473145200"; d="scan'208";a="22956617"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2016 04:27:15 -0700
To: openembedded-core@lists.openembedded.org
References: <1477175949-6903-1-git-send-email-schnitzeltony@googlemail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <61359ca1-a5a2-14b0-a344-48388808ade6@linux.intel.com>
Date: Mon, 24 Oct 2016 14:25:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477175949-6903-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH 1/2] libsdl2: update to 2.0.5
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
X-List-Received-Date: Mon, 24 Oct 2016 11:27:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/23/2016 01:39 AM, Andreas Müller wrote:
> * video/wayland patch: similar was applied mainline

Be less terse please. A better way to explain why a patch was dropped is

"0001-src-video-make-it-compatible-with-wayland-1.10.patch is removed 
because the problem has been resolved upstream".

> * waylamd-protocols alignment was stolen from gtk+3

Again, be less terse, and more specific. If you refer to substitution of 
WAYLAND_PROTOCOLS_SYSROOT_DIR, then mention it explicitly:

"Add 
meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch 
so that WAYLAND_PROTOCOLS_SYSROOT_DIR is substituted in a way similar to 
gtk3".


Alex

