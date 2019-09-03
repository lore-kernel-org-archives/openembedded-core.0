Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id BD4537F331
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:00:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Sep 2019 08:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; d="scan'208";a="182147571"
Received: from oakcakay-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.252.38.52])
	by fmsmga008.fm.intel.com with ESMTP; 03 Sep 2019 08:00:23 -0700
To: openembedded-core@lists.openembedded.org
References: <20190830010801.2496-1-maxime.roussinbelanger@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <25fa496f-ad5b-2943-7794-11e55656f37b@intel.com>
Date: Tue, 3 Sep 2019 16:00:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830010801.2496-1-maxime.roussinbelanger@gmail.com>
Subject: Re: [PATCH] meta: add missing descriptions and homepage in bsp
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
X-List-Received-Date: Tue, 03 Sep 2019 15:00:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 30/08/2019 02:08, Maxime Roussin-Bélanger wrote:
> +DESCRIPTION = "In recent linux kernels, the /proc/acpi/event interface has \
> +been deprecated. The same information (and more) is available via netlink \
> +(a way for the kernel to communicate with userspace that is usually used \
> +for networking) and the input layer (mouse, keyboard, power button, etc...). \
> +This version of acpid supports netlink and the input layer."

This is not a meaningful description of acpid.

> +DESCRIPTION = "The grub.cfg file contains Bash-like code and a list of installed \
> +kernels in an array ordered by sequence of installation. For example, if you \
> +have four installed kernels, the most recent kernel will be at index 0, the \
> +previous kernel will be at index 1, and the oldest kernel will be index 3."

This reads more as documentation than description.

Ross

