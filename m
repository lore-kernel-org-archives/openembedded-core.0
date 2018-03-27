Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DB5CA60290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 10:38:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2018 03:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,367,1517904000"; d="scan'208";a="45643781"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2018 03:38:04 -0700
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1522114620-28569-1-git-send-email-ee.peng.yeoh@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2840c7d5-baaf-5519-bf29-bf6048c8578d@linux.intel.com>
Date: Tue, 27 Mar 2018 13:31:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522114620-28569-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 10:38:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/27/2018 04:37 AM, Yeoh Ee Peng wrote:
> QA team were testing crosstap script manually. Add automated
> tests and systemtap file to test that crosstap script will
> instructs SystemTap to print hello world in qemu. This test
> will first built core-image-minimal image with tools-profile
> & ssh-server-openssh features and build systemtap-native on
> the host machine. Finally this test will boot the image with qemu
> and then execute crosstap script to print hello world on qemu.

Thanks, this looks much nicer now, doesn't it? :) I have no further 
comments, this is fine.

Alex

