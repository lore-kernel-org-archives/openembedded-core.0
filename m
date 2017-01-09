Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D46EB60119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 12:56:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jan 2017 04:56:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,339,1477983600"; d="scan'208";a="1091710569"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2017 04:56:13 -0800
To: openembedded-core@lists.openembedded.org, Lock <joshua.g.lock@intel.com>, 
	Joshua G <joshua.g.lock@intel.com>
References: <20170105163423.8776-1-joshua.g.lock@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <35878aed-24bd-6129-54bb-f1dd68bf09a8@linux.intel.com>
Date: Mon, 9 Jan 2017 14:56:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170105163423.8776-1-joshua.g.lock@intel.com>
Subject: Re: [PATCH] zlib: update SRC_URI to fix fetching
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
X-List-Received-Date: Mon, 09 Jan 2017 12:56:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2017 06:34 PM, Joshua Lock wrote:
> Upstream have removed the file from zlib.net as a new version has
> been released, switch to fetching from the official sourceforge
> mirror.
>
> [YOCTO #10879]

If a new version has been released, you should also update to that 
version. Also, does upstream version check (-c checkpkg) still work with 
the new SRC_URI?

Alex


