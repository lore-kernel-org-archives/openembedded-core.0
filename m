Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A6DE974D40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 10:02:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 03:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,410,1517904000"; d="scan'208";a="40884073"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 05 Apr 2018 03:01:54 -0700
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1522888530-82278-1-git-send-email-ee.peng.yeoh@intel.com>
	<9DDD2658D1FE414E99172D2DB1E4D04335E0006E@PGSMSX109.gar.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c10d7df8-2f5e-b288-afc8-499f47f76724@linux.intel.com>
Date: Thu, 5 Apr 2018 12:55:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04335E0006E@PGSMSX109.gar.corp.intel.com>
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH] oe-selftest: qemutest: add tests for qemu boot and shutdown
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
X-List-Received-Date: Thu, 05 Apr 2018 10:02:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/05/2018 11:09 AM, Yeoh, Ee Peng wrote:
> I had developed this selftest testcase to test qemu can boot nfs &
> ext4 and finally shutdown for various qemu architecture.
> 
> Initially, I was thinking to develop this automated test as part of
> testimage but as this test involve shutting down qemu, testimage
> testcases executed after this will face lost connection to qemu.
> Furthermore, when I tried to add this test to selftest runqemu.py, I
> realized runqemu was dedicated for MACHINE=qemux86-64 and it was
> testing various live image (iso and hddimg) but live image was not
> supported by other qemu architecture. Therefore, this test was
> developed as independent selftest testcase.
> 
> Please let me know your inputs and feedback.
It's totally okay to have several test classes in a single .py file (see 
for example signing.py). I think this should go to runqemu.py, as 
otherwise there would be two different files doing roughly same thing 
and named very similarly (runqemu and qemutest?), which is confusing.

You can add comments to both classes to explain what they do and why, 
and how they are different. (generally, be generous with comments every 
time there is possibility for confusion, or the code does unusual things 
etc.)

Alex

