Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE7C373180
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:01:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:01:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="1107650008"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2017 01:01:15 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<e1b1c67d691fd317bf6c11d570ef5d261029f38b.1486997986.git.alexander.kanavin@linux.intel.com>
	<20170215081731.lf5vtdcbong4xsyq@ad.chargestorm.se>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fd9dca04-e3ef-077f-e67d-3b3bedbe7dc4@linux.intel.com>
Date: Wed, 15 Feb 2017 11:01:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170215081731.lf5vtdcbong4xsyq@ad.chargestorm.se>
Subject: Re: [PATCH 22/36] package.bbclass: add support for pkg_postinst_ontarget()
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
X-List-Received-Date: Wed, 15 Feb 2017 09:01:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2017 10:17 AM, Anders Darander wrote:
> How will this be handled when using ro-rootfs?

Same as it's handled now: by halting bitbake. See the email I just wrote 
to the oe-arch list for details.

> We don't need to make it easier to write on-first-boot only post_install
> scripts, rather, the goal has to be to be able to run all post_install
> scripts during rootfs creation...

This is not always possible. Some things do have to run on target: 
because qemu emulation doesn't work for the target machine on the build 
host, or because the post_install has to interact with target hardware.

Alex

