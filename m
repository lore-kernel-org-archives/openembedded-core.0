Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF9EB78312
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 09:20:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 01:20:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,506,1508828400"; 
   d="scan'208";a="7957549"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 04 Jan 2018 01:20:48 -0800
To: Cal Sullivan <california.l.sullivan@intel.com>,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20171221124500.29810-1-alexander.kanavin@linux.intel.com>
	<9db5a39d-2057-01b7-67a3-09845a119fea@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <25dc03f3-8f01-9da5-cfcf-2f02fcee4c97@linux.intel.com>
Date: Thu, 4 Jan 2018 11:20:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <9db5a39d-2057-01b7-67a3-09845a119fea@intel.com>
Subject: Re: [PATCHv2 1/3] runtime/cases/ptest.py: do not require ptest-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Thu, 04 Jan 2018 09:20:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/03/2018 10:42 PM, Cal Sullivan wrote:
> Looks like it doesn't skip the test correctly:
>> +        status, output = self.target.run('which ptest-runner', 0)
>> +        if len(output) == 0:
>> +            self.skipTest("No -ptest packages are installed in the image")
>> +

Looks like there are no less than three versions of 'which' (busybox, 
debianutils, gnu), and one of them is noisy when the argument is not 
found. I'll fix and resend the patchset.

Alex

