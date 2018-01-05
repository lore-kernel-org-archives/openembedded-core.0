Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 66F827864F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 18:20:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jan 2018 10:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,319,1511856000"; 
   d="scan'208";a="8391896"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 05 Jan 2018 10:20:59 -0800
To: Ovidiu Panait <ovidiu.panait@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180105173723.275865-1-ovidiu.panait@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d78802e1-2909-8df3-2961-713a8c91e26e@linux.intel.com>
Date: Fri, 5 Jan 2018 20:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180105173723.275865-1-ovidiu.panait@windriver.com>
Subject: Re: [PATCH] python: Fix CVE-2017-1000158
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
X-List-Received-Date: Fri, 05 Jan 2018 18:21:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/05/2018 07:37 PM, Ovidiu Panait wrote:
> CPython (aka Python) up to 2.7.13 is vulnerable to an integer overflow in
> the PyString_DecodeEscape function in stringobject.c, resulting in
> heap-based buffer overflow (and possible arbitrary code execution).

What about python 3.x that this patch also touches?

> Upstream patches:
> https://github.com/python/cpython/commit/c3c9db89273fabc62ea1b48389d9a3000c1c03ae
> https://github.com/python/cpython/commit/fd8614c5c5466a14a945db5b059c10c0fb8f76d9
> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2017-1000158

Can you update the recipes to 2.7.14 and 3.5.4 instead please?

Alex

