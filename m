Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD7CD65C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:43:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2016 04:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="981068336"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2016 04:43:37 -0700
To: openembedded-core@lists.openembedded.org
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spPd9sX7DmuLtzOuYuQT+jRgZhze6hCiNWwbW2-U_MytA@mail.gmail.com>
	<CAJTo0LYtMSmqz-hr6zxfPDrv3x0kDDEO02ceH5zDU3o6H5iY1w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6b1040c9-6ca6-92e5-ac9d-c2a74d67db8f@linux.intel.com>
Date: Wed, 22 Jun 2016 14:43:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYtMSmqz-hr6zxfPDrv3x0kDDEO02ceH5zDU3o6H5iY1w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add qemuppc64 target
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
X-List-Received-Date: Wed, 22 Jun 2016 11:43:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/21/2016 07:03 PM, Burton, Ross wrote:
>     Can you also see if usermode qemu needs to be changed for ppc64 as well
>
> It needs enabling entirely - qemu-ppc64 doesn't exist currently so every
> build-time postinst fails.

There were reports that qemu-ppc64 does not work even when enabled:

https://lists.yoctoproject.org/pipermail/yocto/2016-April/029698.html

Alex


