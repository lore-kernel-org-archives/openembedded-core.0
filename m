Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3478871ACF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:24:12 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP; 20 Oct 2016 02:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,518,1473145200"; d="scan'208";a="22012164"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 20 Oct 2016 02:24:03 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<611275eed029517e303645fb2cd5dd2c32c03d75.1476888929.git.alexander.kanavin@linux.intel.com>
	<CAMKF1sqLMT=-2Cj+0haPGc+rPv7ZCMCjhBXzy8t+2W1F67t-rQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4850c20a-7659-ddde-160c-1752c4511f73@linux.intel.com>
Date: Thu, 20 Oct 2016 12:21:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqLMT=-2Cj+0haPGc+rPv7ZCMCjhBXzy8t+2W1F67t-rQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/19] epiphany: update to 3.22.1
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
X-List-Received-Date: Thu, 20 Oct 2016 09:24:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2016 06:31 AM, Khem Raj wrote:

>> -EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
>> +EXTRA_OECONF += " --with-distributor-name=${DISTRO}"
>
> why is nss not disabled explicitly anymore ?

Sorry, forgot to add this to the commit log - they dropped nss support 
altogether in this version.

Alex


