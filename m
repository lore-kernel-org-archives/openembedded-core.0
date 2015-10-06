Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8C85E758DB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 12:26:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 06 Oct 2015 05:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,643,1437462000"; d="scan'208";a="658813458"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 06 Oct 2015 05:26:52 -0700
Message-ID: <5613BE22.7020801@linux.intel.com>
Date: Tue, 06 Oct 2015 15:27:14 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	tomas@sleepfive.com, changhyeok.bae@gmail.com
Subject: gobject introspection to oe-core
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
X-List-Received-Date: Tue, 06 Oct 2015 12:26:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm looking into the possibility of adding gobject introspection support 
directly to oe-core for Yocto 2.1 release (Spring 2016). This work would 
of course be based on meta-gir, but with the mandatory goal of producing 
patches of sufficient quality that can be sent upstream.

I know the upstream tarball is a mess that mashes together several 
different things and was never designed for cross-compiling; and 
meta-gir is also difficult to understand: autotools-based build files 
are patched using undocumented patchfiles, then again patched from the 
recipe using sed, with no comments anywhere - all that needs to be sorted.

What's your take on this? Is it realistic? Would you be able to help out?

Regards,
Alexander

