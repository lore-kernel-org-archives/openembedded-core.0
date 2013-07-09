Return-Path: <radu.moisan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 03F8E6AF6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 11:44:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2013 04:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1028,1363158000"; d="scan'208";a="367375863"
Received: from ubuntu.rb.intel.com (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2013 04:44:06 -0700
Message-ID: <51DBF7FC.7090208@intel.com>
Date: Tue, 09 Jul 2013 14:46:04 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1373278823.git.radu.moisan@intel.com>
	<6ed8bd57e597ae0c8fea947602b62fc6b3d818c9.1373278823.git.radu.moisan@intel.com>
	<51DB610A.40306@linux.intel.com>
In-Reply-To: <51DB610A.40306@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/9] iputils: Upgrade to v20121221
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
X-List-Received-Date: Tue, 09 Jul 2013 11:44:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 07/09/2013 04:02 AM, Saul Wold wrote:
> On 07/08/2013 03:21 AM, Radu Moisan wrote:
>> Removed obsolete patches
>> Header for arping changed. New author added.
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>   .../files/debian/add-icmp-return-codes.diff        |   43 
>> --------------------
>>   .../iputils/files/debian/fix-arping-timeouts.diff  |   26 ------------
>>   .../files/debian/fix-dead-host-ping-stats.diff     |   16 --------
>>   .../iputils/files/debian/targets.diff              |   14 +++----
>>   .../iputils/files/debian/use_gethostbyname2.diff   |   36 
>> ++++++++--------
>>   .../{iputils_s20101006.bb => iputils_s20121221.bb} |   12 ++----
>>   6 files changed, 29 insertions(+), 118 deletions(-)
>>   delete mode 100644 
>> meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
>>   delete mode 100644 
>> meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
>>   delete mode 100644 
>> meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
>>   rename meta/recipes-extended/iputils/{iputils_s20101006.bb => 
>> iputils_s20121221.bb} (82%)
>>
>
> This seems to fail for lib64 multilib build:

Ok, found the problem, with this version they've enabled capability 
support (with libcap) by default, so libcap must be added in DEPENDS, 
unless we want to patch it not to use capability support by default. (??)
Speaking of things enabled by default, they also enabled GNUTLS, that's 
why initially I submitted the patch with GNUTLS. Do we want to use 
default (upstream) configuration with gnutls?

Radu

