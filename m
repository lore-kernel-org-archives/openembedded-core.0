Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 4B54D6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 10:04:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 03:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,334,1517904000"; d="scan'208";a="43626718"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2018 03:04:44 -0700
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1521503987-70014-1-git-send-email-ee.peng.yeoh@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2bff16f4-31a7-2541-79e6-f9a73d1abd89@linux.intel.com>
Date: Tue, 20 Mar 2018 11:58:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521503987-70014-1-git-send-email-ee.peng.yeoh@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] oe-selftest: crosstap: add tests for crosstap script
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
X-List-Received-Date: Tue, 20 Mar 2018 10:04:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/20/2018 01:59 AM, Yeoh Ee Peng wrote:
> QA team were testing crosstap script  manually. Add automated
> tests and systemtap file to test that crosstap script will
> instructs SystemTap to print hello world in qemu. This test
> will first built core-image-minimal image with tools-profile
> & ssh-server-openssh features and build systemtap-native on
> the host machine. Finally this test will boot the image with qemu
> and then execute crosstap script to print hello world on qemu.

Can this be rewritten as a runtime test case to be used with testimage? 
It seems like the code duplicates much of what testimage.bbclass does, 
and we generally try to avoid adding test cases that build and boot 
images in oe-selftest, as it adds to already large running time for it. 
The acceptable exception is when an image needs a really custom 
configuration, but this is not the case here - you can take 
core-image-sato-sdk for example, which comes pre-packaged with 
tools-profile and ssh server.

Alex

