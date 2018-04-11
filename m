Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DC93E60620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 10:09:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2018 03:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,435,1517904000"; d="scan'208";a="42462198"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 11 Apr 2018 03:09:37 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
	<20180410120747.41814-4-alexander.kanavin@linux.intel.com>
	<CAJ86T=WP5EU59ii41QBJgbnqdAjwTUsz=ZQRi6D_QbCUPXA-gg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <aeba1934-3675-2229-72c2-71bfa7a39b66@linux.intel.com>
Date: Wed, 11 Apr 2018 13:03:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WP5EU59ii41QBJgbnqdAjwTUsz=ZQRi6D_QbCUPXA-gg@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 4/5] libressl: add a recipe to support openssh
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
X-List-Received-Date: Wed, 11 Apr 2018 10:09:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/11/2018 11:38 AM, Andre McCurdy wrote:
> I played around with completely replacing openssl with libressl a year
> or so ago and it went fairly smoothly (at least as far as I tested).
> That was with libressl 2.4.2 and my recipe built with autotools rather
> than cmake though. Did you try to build with autotools? That still
> appears to be the option mentioned first in the libressl README.

That's not however the options I would take first, as the recipe 
maintainer :) Autotools is horrible in many ways; while cmake is not 
great, it's definitely less horrible.


Alex

