Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C2D2877C1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:35:11 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 30 Mar 2017 02:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,246,1486454400"; d="scan'208";a="80913482"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 30 Mar 2017 02:35:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170329231606.22118-1-pkj@axis.com>
	<cf44bdfa-67df-f382-f497-7362b9b584f3@linux.intel.com>
	<1490866274.13980.344.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6b2d10e4-4b2d-f30f-69ae-d69d9f140f71@linux.intel.com>
Date: Thu, 30 Mar 2017 12:34:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490866274.13980.344.camel@linuxfoundation.org>
Subject: Re: [PATCH] update_gio_module_cache: Do not chown a non-existing file
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
X-List-Received-Date: Thu, 30 Mar 2017 09:35:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2017 12:31 PM, Richard Purdie wrote:
>>> Only change the ownership of ${libdir}/gio/modules/giomodule.cache
>>> if
>>> it exists.
>> Why do we need to change the owndership in the first place?
>
> The qemu call in the line above is made under PSEUDO_UNLOAD, see the
> original patch from Chris.

With this change, if the qemu call fails (which it is allowed to), will 
the entire script fail, and be deferred to first boot as it should?

Alex


