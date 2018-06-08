Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CFCF860557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 09:48:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2018 02:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,490,1520924400"; d="scan'208";a="235474087"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2018 02:48:29 -0700
To: Andrej Valek <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20180607072501.27158-1-andrej.valek@siemens.com>
	<20180607073209.27240-1-andrej.valek@siemens.com>
	<59452b23-7470-588c-75fb-7445aaa13ba1@linux.intel.com>
	<e09f86d5-ef04-fa9c-8cbf-c0b0f4fa4172@siemens.com>
	<c407b9de-5921-0512-eeba-9ea6f9464386@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0edc5efa-5836-2b76-7af1-a4261a345e56@linux.intel.com>
Date: Fri, 8 Jun 2018 12:48:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <c407b9de-5921-0512-eeba-9ea6f9464386@siemens.com>
Subject: Re: [PATCH v2] feat(openssl-1.1): rework packaging
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
X-List-Received-Date: Fri, 08 Jun 2018 09:48:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/08/2018 10:48 AM, Andrej Valek wrote:
> after more testing, I think creating ${sysconfdir}/ssl links is highly
> recommended. ca-certificate updating script (+ many other tools) has
> hard-coded path to /etc/ssl. Debian has multiple links in /usr/lib/ssl/
> to /etc/ssl/.

Right. Can you explain this in a comment in the recipe itself, and make 
the change as a separate commit please?

> c_rehash was not working on target exactly as on native. (Same perl
> erros). So I have copied this stuff from 1.0.2, it is working on both
> platforms as well.

Can you however try to look deeper into why it fails on target? For the 
target, I would much rather use the upstream's version than our custom 
script, so we don't have to deal with bit-rot and extra maintenance. The 
custom script then would only have a limited, controlled purpose of 
running under bitbake.

Alex

