Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EDB0F6E671
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 10:31:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 03:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,386,1503385200"; d="scan'208";a="1231278989"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2017 03:31:07 -0700
To: Tim Orling <timothy.t.orling@linux.intel.com>,
	Pascal Bach <pascal.bach@siemens.com>
References: <1507893281-22628-1-git-send-email-pascal.bach@siemens.com>
	<3800C28F-F649-4710-9B5B-B38E3E63CB53@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b6d180ee-6674-5010-dc21-54f88f016d80@linux.intel.com>
Date: Mon, 16 Oct 2017 13:27:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <3800C28F-F649-4710-9B5B-B38E3E63CB53@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bmap-tools: add missing runtime dependencies
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
X-List-Received-Date: Mon, 16 Oct 2017 10:31:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/14/2017 09:11 AM, Tim Orling wrote:
> 
>> On Oct 13, 2017, at 4:14 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
>>
>> When running bmap on a target device the added dependncies are required.
>>
>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> ---
>> meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 12 +++++++++++-
>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
>> index 7454f9d..348c9e8 100644
>> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
>> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
>> @@ -14,7 +14,17 @@ SRCREV = "9dad724104df265442226972a1e310813f9ffcba"
>>
>> S = "${WORKDIR}/git"
>>
>> -RDEPENDS_${PN} = "python-core python-compression python-mmap"
>> +RDEPENDS_${PN} = "\
>> +    python-core \
>> +    python-compression \
>> +    python-argparse \
>> +    python-shell \
>> +    python-fcntl \
>> +    python-threading \
>> +    python-xml \
>> +    python-subprocess \
>> +    python-mmap \
>> +    “
>>
> 
> These should all be the python3- version or ${PYTHON_PN}- (e.g. python3-core) should they not? Or is that an artifact of how the python module splitting is happening in oe-core?

That is correct. This was forgotten when the recipe was moved to python3:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb?id=04ef46e2b2b753321408db02a2df3753b85ac0dd

Pascal, can you modify everything to python3-*, check that it still 
works, and resend the patch please?

Alex

