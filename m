Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 352C4731C9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 11:45:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2016 04:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="703760129"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 16 May 2016 04:45:49 -0700
To: openembedded-core@lists.openembedded.org
References: <1463059013-4222-1-git-send-email-maxin.john@intel.com>
	<1463207000.9746.138.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5739B320.6010907@linux.intel.com>
Date: Mon, 16 May 2016 14:46:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1463207000.9746.138.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/3] ofono: update to 1.18
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
X-List-Received-Date: Mon, 16 May 2016 11:45:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2016 09:23 AM, Richard Purdie wrote:
> On Thu, 2016-05-12 at 16:16 +0300, Maxin B. John wrote:
>> 1.17 -> 1.18
>>
>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>
> This results in:
>
> http://errors.yoctoproject.org/Errors/Details/62886/
>
> which Alexander would probably be quite pleased about but isn't good
> for the autobuilder.

Maxin can cherry-pick one of my patches, or just postpone the version 
update until the py3 patchset is merged:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/deprecate-python2&id=6f7eac37a25f1ab55a28cac7b15674dcd6962404

Alex


