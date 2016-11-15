Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9BAF160938
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 14:06:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 15 Nov 2016 06:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,495,1473145200"; d="scan'208";a="901619545"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 15 Nov 2016 06:05:38 -0800
To: openembedded-core@lists.openembedded.org
References: <20161115134607.13337-1-thilo.cestonaro@ts.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3b93c932-029e-42c0-06ef-c9d623534a93@linux.intel.com>
Date: Tue, 15 Nov 2016 16:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161115134607.13337-1-thilo.cestonaro@ts.fujitsu.com>
Subject: Re: [PATCH] added recipe for libdbus-c++
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
X-List-Received-Date: Tue, 15 Nov 2016 14:06:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2016 03:46 PM, Thilo Cestonaro wrote:
> Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
> ---
>  .../fix-missing-unistd.h-include.patch             |  12 +
>  .../remove-CXX_FOR_BUILD-stuff.patch               | 257 +++++++++++++++++++++
>  meta/recipes-core/dbus/libdbus-c++_0.9.0.bb        |  24 ++

The whole thing should go to meta-openembedded (mailing list 
openembedded-devel). Patches are missing description of what they are 
for, and Upstream-Status, and Signed-off-by lines. Follow this please:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Alex


