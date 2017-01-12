Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F069271985
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:22:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jan 2017 06:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,349,1477983600"; d="scan'208";a="52460468"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jan 2017 06:22:34 -0800
To: "Burton, Ross" <ross.burton@intel.com>, =?UTF-8?Q?Andr=c3=a9_Draszik?=
	<git@andred.net>
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
	<1484211839.7594.16.camel@andred.net>
	<a2754fb6-0fda-fb36-eb3e-7f9ae50fd8b2@linux.intel.com>
	<1484229650.7594.26.camel@andred.net>
	<b391d833-f6fd-13d6-209e-03c3cf406248@linux.intel.com>
	<1484230587.7594.30.camel@andred.net>
	<CAJTo0LZk0A+un28Andm77ypitNKynUhgHXw2PF5c2dgHxbz3uw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2c9e6f87-d5dc-6a00-cd51-538182565468@linux.intel.com>
Date: Thu, 12 Jan 2017 16:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZk0A+un28Andm77ypitNKynUhgHXw2PF5c2dgHxbz3uw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 14:22:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2017 04:20 PM, Burton, Ross wrote:
>     Looks like it. I'd say you'd have two entries with the same contents
>     next to
>     each other in the array after applying the patch.
>
>
> How's that series to force the fuzz to 0 going, Alex?

It's blocked by https://bugzilla.yoctoproject.org/show_bug.cgi?id=8325#c4

You need to ask this question from Paul.

Alex

