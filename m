Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F217660125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:03:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 09:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="533131167"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2015 09:03:07 -0700
Message-ID: <55BA4AF9.4030503@linux.intel.com>
Date: Thu, 30 Jul 2015 19:04:09 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<85e7e6014242705a3e1e06ec5862358e95641a3a.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143353.GG2457@jama>
	<CAJTo0LZm7K35eEU5Sp9bnSQwKj4XRMR6_qC9BMCdcM3N-zrrmQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZm7K35eEU5Sp9bnSQwKj4XRMR6_qC9BMCdcM3N-zrrmQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/26] nss: reorder SRC_URI lines to fix upstream version check
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
X-List-Received-Date: Thu, 30 Jul 2015 16:03:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2015 06:04 PM, Burton, Ross wrote:

>     Why don't you move this to .inc file and replace "3_17_3_RTM" with some
>     variable set in .bb, it would be easier to read than this reorder and
>     require .inc later..
>
>
> Joe sent a patch earlier to remove the inc file entirely, so please
> rebase on top of that (it's in ross/mut).

Done; after rebasing the patch disappeared altogether :)


Alex

