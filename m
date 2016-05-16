Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED2A7731D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 11:58:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2016 04:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="955430433"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2016 04:58:57 -0700
To: openembedded-core@lists.openembedded.org
References: <1463059013-4222-1-git-send-email-maxin.john@intel.com>
	<1463207000.9746.138.camel@linuxfoundation.org>
	<5739B320.6010907@linux.intel.com>
	<20160516115415.GA21937@mbabyjoh-desk.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5739B634.3010603@linux.intel.com>
Date: Mon, 16 May 2016 14:59:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160516115415.GA21937@mbabyjoh-desk.ger.corp.intel.com>
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
X-List-Received-Date: Mon, 16 May 2016 11:58:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2016 02:54 PM, Maxin B. John wrote:

>> Maxin can cherry-pick one of my patches, or just postpone the version update
>> until the py3 patchset is merged:
>>
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/deprecate-python2&id=6f7eac37a25f1ab55a28cac7b15674dcd6962404
>
> I have tried this patch before sending the upgrades and had to abandon the
> attempt because of the newly introduced dependency on python3-pygobject.
>
> Guess the best way forward will be to wait till py3 patchset is merged :)

That's right; oe-core will move python-pygobject to python 3, all 
dependent oe-core recipes will be moved to use that, and original 
py2-based python-pygobject will be added to meta-oe to avoid breakage in 
3rd party layers (and it needs fixing because it installs same files in 
same locations as py3 based version).

The whole thing snowballs pretty quickly, and I'm not even attempting to 
move meta-oe to python 3.

Alex


