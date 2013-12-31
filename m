Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 82A62611E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 17:57:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Dec 2013 09:57:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,581,1384329600"; d="scan'208";a="458298489"
Received: from unknown (HELO [10.255.12.47]) ([10.255.12.47])
	by fmsmga002.fm.intel.com with ESMTP; 31 Dec 2013 09:57:55 -0800
Message-ID: <52C305A3.6040603@linux.intel.com>
Date: Tue, 31 Dec 2013 09:57:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>, 
	Robert Yang <liezhi.yang@windriver.com>
References: <cover.1388424165.git.tom.zanussi@linux.intel.com>	<52C21E0F.7020400@windriver.com>
	<1388469272.3048.8.camel@empanada>
In-Reply-To: <1388469272.3048.8.camel@empanada>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1][dora] - Fix for Bug 5403
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
X-List-Received-Date: Tue, 31 Dec 2013 17:57:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/2013 09:54 PM, Tom Zanussi wrote:
> Hi Robert,
>
> Yes, I'm still testing the one for master - will post tomorrow.
>
Right, we should have the master patch backported into dora hopefully 
the changes will be the same.

Sau!

> Tom
>
>
> On Tue, 2013-12-31 at 09:29 +0800, Robert Yang wrote:
>> Hi Tom,
>>
>> Thanks, do we also need a patch for master ?
>>
>> // Robert
>>
>> On 12/31/2013 01:31 AM, Tom Zanussi wrote:
>>> This fixes a problem seen when accessing function params in systemtap
>>> on certain platforms, due to flaky debuginfo.
>>>
>>> Tested on the following machines with various systemtap scripts:
>>>
>>> qemuppc
>>> qemuarm
>>> qemux86
>>> qemux86-64
>>> crownbay
>>> nuc
>>>
>>> The following changes since commit 3cf2d232529c4fd6b58f87ddbf3df9d805e4180f:
>>>
>>>     libsoup-2.4: add intltool-native to DEPENDS (2013-12-20 09:29:05 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>     git://git.yoctoproject.org/poky-contrib.git tzanussi/systemtap-bug-5403-dora
>>>     http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/systemtap-bug-5403-dora
>>>
>>> Tom Zanussi (1):
>>>     systemtap: Add --enable-prologues to configuration
>>>
>>>    meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

