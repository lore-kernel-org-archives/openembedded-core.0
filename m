Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DE2F260110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 17:21:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2016 09:21:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="894668893"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.118])
	([10.219.16.118])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2016 09:21:48 -0800
To: akuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<56CF2B81.4080500@mvista.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <56CF384F.2040708@linux.intel.com>
Date: Thu, 25 Feb 2016 11:22:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56CF2B81.4080500@mvista.com>
Subject: Re: [PATCH 0/3] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Thu, 25 Feb 2016 17:21:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/25/2016 10:27 AM, akuster wrote:
>   So my questions in the bugs go unanswered. If you don't ever intend on
> responding just say so, I do appreciate honestly. I then know where I stand.
>
> - armin

Sorry, for not answered the bug earlier, to be honest I hadn't seen your 
comment earlier.

I just replied to the bug.

Mariano

>
> On 02/24/2016 07:27 AM, mariano.lopez@linux.intel.com wrote:
>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>
>> This series add the cve-check-tool recipe, a tool used to identify
>> potentially vulnerable software through version matching. It will
>> check if a vulnerability has been addressed by a patch.
>>
>> Also add the new cve-check class that will add a task for all recipes
>> to check for CVEs using cve-check-tool. This tool can be used by recipe,
>> image (will generate an image report in deploy dir), and with "world"
>> and "universe"
>>
>> To run it just inherit the class and enter:
>>
>> bitbake -c cve_check <recipe>
>>
>> The following changes since commit 23056103c949b498c23b47579e8dd57ce78e6ed9:
>>
>>    uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib mariano/bug7515
>>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug7515
>>
>> Mariano Lopez (3):
>>    cve-check-tool: Add recipe
>>    cve-check-tool patch to allow select dir for the db
>>    cve-check.bbclass: Add class
>>
>>   meta/classes/cve-check.bbclass                     | 229 +++++++++++++++++++++
>>   .../change_logic_cve_get_file_parent.patch         |  45 ++++
>>   .../cve-check-tool/cve-check-tool_5.6.bb           |  61 ++++++
>>   3 files changed, 335 insertions(+)
>>   create mode 100644 meta/classes/cve-check.bbclass
>>   create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch
>>   create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb
>>

-- 
Mariano Lopez

