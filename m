Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 382657199F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 07:17:58 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v9I7HupM017092
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 18 Oct 2017 09:17:56 +0200
Received: from [139.16.9.3] ([139.16.9.3])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v9I7HttO012297;
	Wed, 18 Oct 2017 09:17:55 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Tim Orling <timothy.t.orling@linux.intel.com>
References: <1507893281-22628-1-git-send-email-pascal.bach@siemens.com>
	<3800C28F-F649-4710-9B5B-B38E3E63CB53@linux.intel.com>
	<b6d180ee-6674-5010-dc21-54f88f016d80@linux.intel.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <9fc90bb8-6a8c-def4-3811-c8d2ad797352@siemens.com>
Date: Wed, 18 Oct 2017 09:17:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <b6d180ee-6674-5010-dc21-54f88f016d80@linux.intel.com>
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
X-List-Received-Date: Wed, 18 Oct 2017 07:17:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 16.10.2017 12:27, Alexander Kanavin wrote:
> On 10/14/2017 09:11 AM, Tim Orling wrote:
>>
>>> On Oct 13, 2017, at 4:14 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
>>>
>>> When running bmap on a target device the added dependncies are required.
>>>
>>> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>>> ---
>>> meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 12 +++++++++++-
>>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
>>> index 7454f9d..348c9e8 100644
>>> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
>>> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
>>> @@ -14,7 +14,17 @@ SRCREV = "9dad724104df265442226972a1e310813f9ffcba"
>>>
>>> S = "${WORKDIR}/git"
>>>
>>> -RDEPENDS_${PN} = "python-core python-compression python-mmap"
>>> +RDEPENDS_${PN} = "\
>>> +    python-core \
>>> +    python-compression \
>>> +    python-argparse \
>>> +    python-shell \
>>> +    python-fcntl \
>>> +    python-threading \
>>> +    python-xml \
>>> +    python-subprocess \
>>> +    python-mmap \
>>> +    “
>>>
>>
>> These should all be the python3- version or ${PYTHON_PN}- (e.g. python3-core) should they not? Or is that an artifact of how the python module splitting is happening in oe-core?
>
> That is correct. This was forgotten when the recipe was moved to python3:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb?id=04ef46e2b2b753321408db02a2df3753b85ac0dd
>
> Pascal, can you modify everything to python3-*, check that it still works, and resend the patch please?

I will do that and send a new patch.


