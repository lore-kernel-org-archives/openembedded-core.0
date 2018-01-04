Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 01953785EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 12:35:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 04:35:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="8001269"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 04 Jan 2018 04:35:40 -0800
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
	<20171221130434.24427-3-alexander.kanavin@linux.intel.com>
	<1aa9a048-6797-333a-957a-9d28314a7143@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6b035e9d-568d-6ba5-44b6-504a57f0aa7f@linux.intel.com>
Date: Thu, 4 Jan 2018 14:35:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1aa9a048-6797-333a-957a-9d28314a7143@windriver.com>
Subject: Re: [PATCH 3/9] json-glib: convert to meson build
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
X-List-Received-Date: Thu, 04 Jan 2018 12:35:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/04/2018 10:40 AM, ChenQi wrote:
> I got the following do_compile failure when I was building json-glib for 
> qemux86-64.
> 
> 
> | FileNotFoundError: [Errno 2] No such file or directory: 
> '/buildarea2/chenqi/poky/build-systemd/tmp/work/core2-64-poky-linux/json-glib/1.2.8-r0/build/tmp-introspect27wkly7i/Json-1.0' 
> 

I just tried qemux86-64, it works for me. Is it something in your local 
setup? Can you take this branch and check it locally?

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/meson

Alex

