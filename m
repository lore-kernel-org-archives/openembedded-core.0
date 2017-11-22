Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 102D178650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:13:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 08:13:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; 
   d="scan'208";a="8317669"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2017 08:13:05 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171122160414.14093-1-ross.burton@intel.com>
	<20171122160414.14093-2-ross.burton@intel.com>
	<a7fe2ae2-3c8c-44d9-64e9-e68d631a0934@linux.intel.com>
	<CAJTo0LbewO2gKUhVYteHWqHigNdUakSbTOcF0ESF4_6G7i9uoQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8cc4cf60-e69c-f4b9-544b-2fdfef3afdc8@linux.intel.com>
Date: Wed, 22 Nov 2017 18:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbewO2gKUhVYteHWqHigNdUakSbTOcF0ESF4_6G7i9uoQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] postinst: fix and simplify the postinst test recipe
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
X-List-Received-Date: Wed, 22 Nov 2017 16:13:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/22/2017 06:09 PM, Burton, Ross wrote:

>         +    if [ -n "$D" ]; then
>         +        echo "Delaying ${PN}-delayed-b until first boot"
>                    exit 1
>         -      fi
> 
> 
>     I still think this 'exit 1' madness should be fixed. But maybe some
>     other time.
> 
> 
> Yes, agreed totally.

In the meantime, I'll rebase my patchset that does it to these changes 
you made to the test :)

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/dnf-rpm4-postinst-fix&id=a7f61bc88e5dd1668e0f8adee8ed5e06d2b4989c

from

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/dnf-rpm4-postinst-fix


Alex

