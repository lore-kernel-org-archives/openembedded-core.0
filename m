Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F76671CB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 09:33:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 02:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="964284677"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 May 2017 02:33:01 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503133152.26294.48746@do.openembedded.org>
	<2897866.bodmxEm400@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <24ebf3f4-9855-8aea-7019-3951973d37e1@linux.intel.com>
Date: Thu, 4 May 2017 12:33:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <2897866.bodmxEm400@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJlcmF0aW9uLWZvbnRzOiB1cGRhdGUgdG8gMi4uLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Thu, 04 May 2017 09:33:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2017 12:43 AM, Paul Eggleton wrote:
> On Thursday, 4 May 2017 1:31:52 AM NZST Patchwork wrote:
>> * Issue             Series sent to the wrong mailing list
> [test_target_mailing_list]
>>   Suggested fix    Send the series again to the correct mailing list (ML)
>>   Suggested ML     poky@yoctoproject.org [http://git.yoctoproject.org/cgit/
> cgit.cgi/poky/]
>
> Leo - looks like this is another false positive.

Actually, no - one of the patches accidentally included a file from 
meta-poky. Still, could be reported better:

1) Should refer to a specific patch where the issue is
2) Should, if possible, refer to specific files in the patch that are 
causing the problem.
3) The problem is not the wrong mailing list, the problem is that the 
patch should be splitted up and sent to several lists :)

In general, why run these checks after the patches have been already 
posted for review? That is adding unnecessary friction. Why not have 
them as a git hook, that is run locally when making the commit?


Alex


