Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB3C7845A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 15:12:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jan 2018 07:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,381,1511856000"; d="scan'208";a="21071489"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2018 07:12:48 -0800
To: Oleg Kokorin <ole2mail@mail.com>, openembedded-core@lists.openembedded.org
References: <1516374472-5682-1-git-send-email-ole2mail@mail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <826b2665-18cc-84ee-2b47-4c372e4cd055@linux.intel.com>
Date: Fri, 19 Jan 2018 17:06:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1516374472-5682-1-git-send-email-ole2mail@mail.com>
Subject: Re: [PATCH] [PATCH v3] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 15:12:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/19/2018 05:07 PM, Oleg Kokorin wrote:

> +Upstream-Status: Submitted to dizzy

Upstream here means the maintainers of mtd-utils. Have you shown the 
patch to them? What did they say?

Also, if you're seeing this with dizzy, this is a very old and no longer 
supported or maintained Yocto release. Does the problem occur with any 
of the recent ones? Or shall the patch only be applied to the dizzy branch?

> +mtd-utils: remove double hashtable iterator definition
> +
> +hashtable_iterator_key and hashtable_iterator_value redefinition inside
> +mkfs.ubifs/hashtable/hashtable_itr.h cause linker redefinition error

You need to include the error message here.


Alex

