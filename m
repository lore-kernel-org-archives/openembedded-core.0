Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8E13678A97
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 19:06:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2018 11:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,432,1515484800"; d="scan'208";a="23434064"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 06 Mar 2018 11:06:08 -0800
To: Victor Kamensky <kamensky@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6da3d33d-8c32-a49d-0b61-70b360232f12@linux.intel.com>
Date: Tue, 6 Mar 2018 21:00:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
Subject: Re: [RFC PATCH 0/5] systemtap adding sysroot, cross compiling of user land related scripts
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
X-List-Received-Date: Tue, 06 Mar 2018 19:06:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/06/2018 07:50 PM, Victor Kamensky wrote:
> I am a fan of SystemTap and big fan of OE. Systemtap and OE use case I have
> on my mind is the following:

Hello Victor,

even though I'm listed as the maintainer of systemtap, I do not actually 
use it or know anything about it - my responsibility ends with keeping 
it up to date and fixing build errors. So I can't comment on the essence 
of these patches. I do suggest however that you first get as many 
patches as possible into the upstream, as carrying them in oe-core adds 
a significant maintenance burden.

Also, if it's possible to merge systemtap-utils into the main systemtap 
recipe (as a binary package), and merge together crosstap and crosstap2, 
please do that.

Alex

