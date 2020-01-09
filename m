Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8137FE95
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 13:36:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jan 2020 05:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,413,1571727600"; d="scan'208";a="234975870"
Received: from lipu-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.168])
	by orsmga002.jf.intel.com with ESMTP; 09 Jan 2020 05:36:47 -0800
To: openembedded-core@lists.openembedded.org
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
	<CAO5Uq5SE6S+f6Xfctp-CGHd7+4j3J66YnxzL7J+QepbV-EKLdQ@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c6225d2a-6f86-0c23-004b-3920432f2ae4@intel.com>
Date: Thu, 9 Jan 2020 13:36:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5SE6S+f6Xfctp-CGHd7+4j3J66YnxzL7J+QepbV-EKLdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] manpages.bbclass: Fix rootfs host corruption
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
X-List-Received-Date: Thu, 09 Jan 2020 13:36:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/01/2020 02:30, Alex Kiernan wrote:
> On Thu, Dec 19, 2019 at 10:17 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>>
>> When running mandb we end up with files owned by the build user, correct
>> this. Also pick up non-default locales and relocate their index.db files
>> to /var/cache.
>>
>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> ---
> 
> Ping?

I never saw this on the list can you repost please?

Ross

