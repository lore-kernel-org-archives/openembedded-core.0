Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 137346A973
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 16:05:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Jun 2013 09:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,945,1363158000"; d="scan'208";a="359972869"
Received: from unknown (HELO [10.255.13.111]) ([10.255.13.111])
	by orsmga002.jf.intel.com with ESMTP; 26 Jun 2013 09:05:25 -0700
Message-ID: <51CB1145.4060009@linux.intel.com>
Date: Wed, 26 Jun 2013 09:05:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
	<51CA5F8E.9070504@windriver.com>
In-Reply-To: <51CA5F8E.9070504@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] make DESCRIPTION support newline
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
X-List-Received-Date: Wed, 26 Jun 2013 16:05:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2013 08:27 PM, Robert Yang wrote:
>
> Ping for this one.
>
Robert,

There were some comments on your patch set and I think an issue with the 
ipk one.

Sau!

> // Robert
>
> On 06/19/2013 05:00 PM, Robert Yang wrote:
>> The following changes since commit
>> 590010a6525b0e1bc1de73e794764e23404591df:
>>
>>    core-image-weston: add weston-examples to the image (2013-06-18
>> 17:33:17 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib robert/newline
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/newline
>>
>> Robert Yang (3):
>>    package_rpm.bbclass: make DESCRIPTION support newline
>>    package_ipk.bbclass: make DESCRIPTION support newline
>>    package_deb.bbclass: make DESCRIPTION support newline
>>
>>   meta/classes/package_deb.bbclass |    5 +++--
>>   meta/classes/package_ipk.bbclass |    5 +++--
>>   meta/classes/package_rpm.bbclass |   19 ++++++++++++++-----
>>   3 files changed, 20 insertions(+), 9 deletions(-)
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

