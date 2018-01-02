Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB11600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 12:05:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 04:05:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,496,1508828400"; 
   d="scan'208";a="6837776"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 02 Jan 2018 04:05:31 -0800
To: Jibin Xu <jibin.xu@windriver.com>, openembedded-core@lists.openembedded.org
References: <20171228022126.219745-1-jibin.xu@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b3ad73b2-4406-aa24-9bd1-073674627670@linux.intel.com>
Date: Tue, 2 Jan 2018 14:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171228022126.219745-1-jibin.xu@windriver.com>
Subject: Re: [PATCH] fontcache : fix build warning when using quemu usermode
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
X-List-Received-Date: Tue, 02 Jan 2018 12:05:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/28/2017 04:21 AM, Jibin Xu wrote:
> fontcache uses quemu usermode by default, but some architecture
> such as Intel skylake does not support qemu usermode, this can
> lead to a build warning as below:
> "WARNING: The postinstall intercept hook 'update_font_cache' failed".
> 
> Add a judgement of qemu usermode to fix the build warning.

You also need to fix this in pixbufcache.bbclass. Squash all changes 
into a single patch.

Alex

