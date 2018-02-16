Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0FE6067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 13:29:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2018 05:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,519,1511856000"; d="scan'208";a="201664374"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 16 Feb 2018 05:29:44 -0800
To: Andrei Gherzan <andrei@gherzan.ro>,
	openembedded <openembedded-core@lists.openembedded.org>
References: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cc978b8d-afa0-5ea2-ba5d-9700bab26fdc@linux.intel.com>
Date: Fri, 16 Feb 2018 15:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
Subject: Re: Linux firmware for iwlwifi 8000c disappeared in pyro
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
X-List-Received-Date: Fri, 16 Feb 2018 13:29:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/16/2018 01:42 PM, Andrei Gherzan wrote:
> This happened because the removal of the 8000c-19 firmware patch in pyro 
> removes the package completely as well 
> (http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?h=pyro&id=3e4b382c0c687a76f824cd84b478c4f778e15e3e). 
> While the patch that ended up in master only removed that specific 
> firmware 
> (http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb?id=8d2e66817a6e5cea5a0146f2804e703402de44dc).
> 
> Any idea why this happened? Can we bring back the package in pyro as well?

This looks like a simple mistake. Prepare (and test :) a patch to 
correct it, and send it here with [pyro] prefix.

Alex

