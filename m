Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F299065CB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 20:16:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 10 Mar 2016 12:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,317,1455004800"; d="scan'208";a="667243812"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.118])
	([10.219.16.118])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2016 12:16:01 -0800
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1457432801-8798-1-git-send-email-mariano.lopez@linux.intel.com>
	<1457557766.3642.11.camel@linux.intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <56E1D62E.8030504@linux.intel.com>
Date: Thu, 10 Mar 2016 14:16:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1457557766.3642.11.camel@linux.intel.com>
Subject: Re: [PATCH] dhcp: CVE-2015-8605
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
X-List-Received-Date: Thu, 10 Mar 2016 20:16:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/09/2016 03:09 PM, Joshua G Lock wrote:
> Hi Mariano,
>
> Thanks for the patch.
>
> On Tue, 2016-03-08 at 10:26 +0000, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> ISC DHCP allows remote attackers to cause a denial of
>> service (application crash) via an invalid length field
>> in a UDP IPv4 packet.
>>
>> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>> ---
>>   .../dhcp/dhcp/CVE-2015-8605.patch                  |  99
>> ++++++++++++++++
>>   .../dhcp/dhcp/CVE-2015-8605_1.patch                | 131
>> +++++++++++++++++++++
>>   meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb       |   2 +
>>   3 files changed, 232 insertions(+)
>>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-
>> 8605.patch
>>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-
>> 8605_1.patch
>>
>> diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
>> b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
>> new file mode 100644
>> index 0000000..923d5d5
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
>> @@ -0,0 +1,99 @@
>> +Solves CVE-2015-8605 that caused DoS when an invalid lenght field in
> lenght -> length
>
>> IPv4 UDP
>> +was recived by the server.
>> +
>> +Upstream-Status: Backport
> Can you include some more information about the backport, i.e. the
> version the patch was backported from, in the Upstream-Status: field so
> that it's easier to determine why this patch isn't required in jethro
> and master?

This patch is needed for master and jethro. I've already sent the patch 
for them. For fido is slight different because it needed 2 patches 
instead of one, nevertheless, I will add this information to the patch.

Mariano

