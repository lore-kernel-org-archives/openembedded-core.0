Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9C7776F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 14:53:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 07:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,159,1486454400"; d="scan'208";a="834033900"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2017 07:53:42 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1f37f25a651a235703fc7b51d799ee2d329ac94b.1489144807.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYj=MbWW-VdQk5y7PmOy4wuwYspfLvXZai=-t3nAzc5vQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f71769b7-4dc4-bb4f-80a0-5c367e1d6153@linux.intel.com>
Date: Mon, 13 Mar 2017 16:52:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYj=MbWW-VdQk5y7PmOy4wuwYspfLvXZai=-t3nAzc5vQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/44] rootfs_rpm.bbclass: migrate image creation to dnf
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
X-List-Received-Date: Mon, 13 Mar 2017 14:53:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2017 04:25 PM, Burton, Ross wrote:

>
>     +        raise NotImplementedError("Adding remote dnf feeds not yet
>     supported.")
>
>
> I think this is a 2.4M4 blocker if the series merges into M3.

Yes. There is no runtime/selftest test for this, and I didn't want to 
implement things that are not enabled by default and cannot be 
automatically tested. I don't want to take the risk of unnoticed 
regressions in code that was tested only once when it was initially written.

Creating an image from signed rpms is currently not supported for the 
same reason (but signing rpms in the first place *is* supported, because 
it actually is tested in oe-selftest, and I can use that to verify that 
it works and keeps working).


Alex

