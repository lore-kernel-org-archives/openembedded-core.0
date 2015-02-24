Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3A59A71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 16:05:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 24 Feb 2015 07:57:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,639,1418112000"; d="scan'208";a="690072902"
Received: from unknown (HELO [10.219.4.146]) ([10.219.4.146])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2015 08:05:20 -0800
Message-ID: <54ECA145.1010206@linux.intel.com>
Date: Tue, 24 Feb 2015 10:05:25 -0600
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Beth Flanagan <elizabeth.flanagan@intel.com>
References: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
	<2739283.cBzxHPFgeW@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2739283.cBzxHPFgeW@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] license_class: Added support for LICENSE_PRIORITY in manifest creation
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
X-List-Received-Date: Tue, 24 Feb 2015 16:05:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Here is the contrib branch that contains the changes, some rebase is needed.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=alimon/license

Kind regards,
     alimon

On 24/02/15 10:00, Paul Eggleton wrote:
> Hi Beth,
>
> I know you're looking at rewriting some of license.bbclass in python - FYI
> here's an as-yet unmerged patchset from Aníbal that may contain some of that
> already:
>
> On Wednesday 29 October 2014 12:34:12 Aníbal Limón wrote:
>> Now you can specify LICENSE_PRIOTIY that enables the distro to set the
>> license preferences for manifest creation.
>>
>> The major change is when you have OR'ed LICENSE only one is choose according
>> LICENSE_PRIORITY preferences if LICENSE_PRIORITY isn't specified the left
>> one is choosen.
>>
>> The test was done building qemux86/core-image-sato with and without these
>> set of patches and then run diff recursive under common-licenses created
>> directory.
>>
>> You can find a tarball with common-license directories, resulted diff and
>> local.conf at:
>>
>> https://bugzilla.yoctoproject.org/attachment.cgi?id=2223
>>
>> Aníbal Limón (4):
>>    license_class: Reimplemented manifest creation in python
>>    license_class: Added support for INCOMPATIBLE_LICENSE into
>>      license_create_manifest
>>    license_class: Added LICENSE_PRIORITY support
>>    license_class: Fix remove + trim in license_create_manifest.
>>
>>   meta/classes/license.bbclass | 250
>> ++++++++++++++++++++++++++++--------------- meta/conf/documentation.conf |
>>   1 +
>>   2 files changed, 164 insertions(+), 87 deletions(-)
>
>


