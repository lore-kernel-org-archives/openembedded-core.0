Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA266AC36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:37:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 26 Mar 2015 07:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,472,1422950400"; d="scan'208";a="686041745"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.155])
	([10.219.4.155])
	by fmsmga001.fm.intel.com with ESMTP; 26 Mar 2015 07:37:35 -0700
Message-ID: <551419B7.3080201@linux.intel.com>
Date: Thu, 26 Mar 2015 08:37:43 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1427322405-34441-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LbsqWcoddvK+xs=u0QQ7rDsn7=9eh5j+o2=KtP-v2MUDw@mail.gmail.com>
In-Reply-To: <CAJTo0LbsqWcoddvK+xs=u0QQ7rDsn7=9eh5j+o2=KtP-v2MUDw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lzop: Fix build using x32 ABI
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
X-List-Received-Date: Thu, 26 Mar 2015 14:37:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 26/03/15 06:45, Burton, Ross wrote:
> On 25 March 2015 at 22:26, Aníbal Limón <anibal.limon@linux.intel.com>
> wrote:
>
>> +PR = "r1"
>>
> No need to add a PR.
Hi Ross,

I followed the documentation [1], if no increment PR is needed i think 
we need to clarity in the docs.

Sending v2...

[1] 
http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#using-a-quilt-workflow

   alimon
>
> Ross
>


