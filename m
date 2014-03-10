Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5D060EFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 14:13:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Mar 2014 07:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,624,1389772800"; d="scan'208";a="497045322"
Received: from unknown (HELO [10.255.12.212]) ([10.255.12.212])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2014 07:12:59 -0700
Message-ID: <531DC86B.7040008@linux.intel.com>
Date: Mon, 10 Mar 2014 07:12:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>	
	<1394423288-11049-4-git-send-email-sgw@linux.intel.com>
	<1394431792.7883.51.camel@ted>
In-Reply-To: <1394431792.7883.51.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] bind: Update to 9.9.5
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
X-List-Received-Date: Mon, 10 Mar 2014 14:13:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2014 11:09 PM, Richard Purdie wrote:
> On Sun, 2014-03-09 at 20:48 -0700, Saul Wold wrote:
>> Remove CVE patches that are in bind
>> Updated COPYRIGHT includes date changes the NetBSD Copyright
>> Modifies the Base BSD License to 3-Clause (removes advertising clause)w
>> Add patch to disable running tests on host
>> bind: Add python-core for dnssec
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> Judging from the autobuilder failures, this one could still use some
> work :/
>
That should have been addressed with the RDEPENDS_${PN} = "python-core" 
since the new dnssec-* scripts are python based.

Sau!

> Cheers,
>
> Richard
>
>
>

