Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC6E65E7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 13:51:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2014 06:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,857,1389772800"; d="scan'208";a="520157292"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.76])
	([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2014 06:51:36 -0700
Message-ID: <534BE7EE.7030205@intel.com>
Date: Mon, 14 Apr 2014 16:51:42 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1397474305-5411-1-git-send-email-valentin.popa@intel.com>
	<CAP9ODKrQtq54jVX4T0Eo1PM425HinNP45YCAsLVb9Q7NsgHCVA@mail.gmail.com>
In-Reply-To: <CAP9ODKrQtq54jVX4T0Eo1PM425HinNP45YCAsLVb9Q7NsgHCVA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] mesa: double check for eglplatform.h
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
X-List-Received-Date: Mon, 14 Apr 2014 13:51:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/2014 04:48 PM, Otavio Salvador wrote:
> Hello Valentin,
>
> On Mon, Apr 14, 2014 at 8:18 AM, Valentin Popa <valentin.popa@intel.com> wrote:
>> Even if 'egl' is in PACKAGECONFIG, mesa egl support
>> can be disabled explicitly (using a .bbappend, for example).
>> This patch adds another check for the existence
>> of eglplatform.h before 'sed' can alter it.
> This is lacking the signed-off-by.
>
> The patch seems fine but I cannot test it at this moment.
>
>
I'll send a V2. Thanks!

