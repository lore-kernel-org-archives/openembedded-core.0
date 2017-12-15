Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF9678678
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 15:03:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Dec 2017 07:03:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,405,1508828400"; 
   d="scan'208";a="2990770"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 15 Dec 2017 07:03:58 -0800
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
	<9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=Xk+1sKXvfq3EfEwOuwfuPDeW72G0GSdQtqgTKieLH3JQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <167226ae-4cce-f05e-21e1-092bcaddb827@linux.intel.com>
Date: Fri, 15 Dec 2017 17:04:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xk+1sKXvfq3EfEwOuwfuPDeW72G0GSdQtqgTKieLH3JQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Fri, 15 Dec 2017 15:03:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/07/2017 09:27 PM, Andre McCurdy wrote:
> On Fri, Nov 17, 2017 at 4:02 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> +
>> +MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
> 
> SITEINFO_ENDIANNESS returns the endianness of the target, not the
> host. Perhaps this is just a confusingly named variable though? (it
> doesn't make much sense to expect the user to tell the build system
> what endianness it's running on, the build system should be able to
> determine that on it's own).
> 
>> +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
> 
> This won't work for all targets (e.g. PowerPC is big endian but
> doesn't include "bigendian" in TUNE_FEATURES). To determine the
> endianness of the target, use SITEINFO_ENDIANNESS instead.
> 


I have reviewed the source code of meson for uses of the endian 
parameter and couldn't find any whatsoever. Its presence in config file 
is however enforced. I'll set both of these to 'bogus-endian' and see if 
that makes any difference.


Alex

