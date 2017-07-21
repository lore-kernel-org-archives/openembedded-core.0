Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF7E783F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 11:55:54 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 04:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,389,1496127600"; d="scan'208";a="110442283"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 21 Jul 2017 04:55:55 -0700
To: Carlos Alberto Lopez Perez <clopez@igalia.com>,
	openembedded-core@lists.openembedded.org
References: <20170713124954.9373-1-clopez@igalia.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <497f01dc-9051-a824-5e66-cea9e2970ab2@linux.intel.com>
Date: Fri, 21 Jul 2017 14:53:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713124954.9373-1-clopez@igalia.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH] webkitgtk: Upgrade to 2.16.5
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
X-List-Received-Date: Fri, 21 Jul 2017 11:55:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/13/2017 03:49 PM, Carlos Alberto Lopez Perez wrote:
> Adjust some dependencies: libgcrypt is now required (instead of gnutls)
> and the following build deps where missing: gettext-native, glib-2.0
> and glib-2.0-native.
> 
> Also the CMake argument ENABLE_CREDENTIAL_STORAGE has been renamed to
> USE_LIBSECRET.
> 
> This new upstream release (2.16.4 actually) includes security fixes for
> CVE: CVE-2017-2538

Carlos, may I ask that you submit the 'Pending' patches in webkit recipe 
upstream? I have no experience working with them, so maybe it's faster 
and easier that way.

We're trying to reduce the amount of such patches in oe-core in general.

Thanks,
Alex

