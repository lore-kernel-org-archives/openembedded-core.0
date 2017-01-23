Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E0BC0731DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:01:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 23 Jan 2017 06:01:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="1086281712"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2017 06:01:25 -0800
To: Patrick Ohly <patrick.ohly@intel.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
References: <1484935979-328-1-git-send-email-anibal.limon@linux.intel.com>
	<1484941467.20333.3.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8c0f5529-3dbb-1049-dc59-0cb368e04359@linux.intel.com>
Date: Mon, 23 Jan 2017 16:01:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1484941467.20333.3.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] qemu: Upgrade to 2.7.1
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
X-List-Received-Date: Mon, 23 Jan 2017 14:01:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2017 09:44 PM, Patrick Ohly wrote:

> In contrast to Alexander, I would also keep
> http://wiki.qemu-project.org/download/${BP}.tar.bz2 in qemu_2.7.1.bb
> with SRC_URI =+ because then there can be a qemu_git.bb with a different
> URL than the one above.

I would discourage creation of such separate _git recipes, unless there 
is a clear benefit to the whole of oe-core. They are almost always 
untested and neglected, and eventually removed because they're outdated 
and broken and no one cares.

Alex

