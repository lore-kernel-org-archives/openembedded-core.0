Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 601F2782C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 17:40:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 19 Jul 2017 10:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="1197310188"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2017 10:40:03 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=UaW2W6h47H-yVw=8q1rk23ZTj1an220VKrGitOx5Y1dA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3e05e420-d979-3f24-8b72-b032d8ec1870@linux.intel.com>
Date: Wed, 19 Jul 2017 20:37:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UaW2W6h47H-yVw=8q1rk23ZTj1an220VKrGitOx5Y1dA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Add openssl 1.1
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
X-List-Received-Date: Wed, 19 Jul 2017 17:40:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/19/2017 07:55 PM, Andre McCurdy wrote:
>> Openssl 1.1 is an opt-out; it has the same recipe name as openssl 1.0 had, and so
>> all dependencies are compiled with it by default. If there's an API issue, please
>> fix it, or adjust the recipe to depend on 'openssl10' (which is a lesser solution,
>> and subject to openssl 1.0 eventually being removed from oe-core).
> 
> Are there any -native recipes which still need 1.0? Or could support
> for openssl10-native be dropped as part of this patch set?

There are also other layers out there which may need 1.0-native, and so 
this would cause unnecessary breakage. Let's just leave 1.0 alone and 
drop it altogether when time comes.

Alex

