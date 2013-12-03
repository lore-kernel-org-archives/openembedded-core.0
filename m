Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 901E56D292
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 04:02:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2013 19:58:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,815,1378882800"; d="scan'208";a="418355303"
Received: from unknown (HELO [10.255.15.171]) ([10.255.15.171])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2013 20:02:04 -0800
Message-ID: <529D57BB.4040605@linux.intel.com>
Date: Mon, 02 Dec 2013 20:02:03 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Nathan Rossi <nathan.rossi@xilinx.com>
References: <41a9a78e-e827-4551-88c6-78628b1e34da@DB8EHSMHS028.ehs.local>
	<529CE6D9.3090307@linux.intel.com>
	<42863352-0600-408a-b4f4-7469c21cff89@DB8EHSMHS026.ehs.local>
In-Reply-To: <42863352-0600-408a-b4f4-7469c21cff89@DB8EHSMHS026.ehs.local>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: attr_2.4.47 release tarball missing configure.ac
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
X-List-Received-Date: Tue, 03 Dec 2013 04:02:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2013 05:08 PM, Nathan Rossi wrote:
>> -----Original Message-----
>> From: Saul Wold [mailto:sgw@linux.intel.com]
>> Sent: Tuesday, December 03, 2013 6:00 AM
>> To: Nathan Rossi; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] attr: attr_2.4.47 release tarball missing
>> configure.ac
>>
>> On 11/25/2013 12:18 AM, Nathan Rossi wrote:
>>> The release tarball of attr 2.4.47 is missing the configure.ac file.
>>> This prevents the autotools bbclass from being able to regenerate the
>>> configure script which leads to other side affects. (e.g. using
>>> outdated config.sub)
>>>
>>> This patch adds the configure.ac file via a patch.
>>> (obtained via the source repository at the v2.4.47 tag)
>>>
>>> See the mailing list thread for additional information:
>>> http://lists.nongnu.org/archive/html/acl-devel/2013-05/msg00024.html
>>>
>>> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
>>> ---
>>>
>>> On an additional note, acl 2.2.52 is also affected by this issue.
>>> However it does not affect oe-core as acl has yet to be updated to this
>>> version and currently sits on the older 2.2.51 version.
>>>
>>> ---
>>>    meta/recipes-support/attr/attr_2.4.47.bb           |    3 +
>>>    .../attr/files/attr-Missing-configure.ac.patch     |   62
>> ++++++++++++++++++++
>>>    2 files changed, 65 insertions(+)
>>>    create mode 100644 meta/recipes-support/attr/files/attr-Missing-
>> configure.ac.patch
>>>
>>> diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-
>> support/attr/attr_2.4.47.bb
>>> index a1f2e05..ad40c9b 100644
>>> --- a/meta/recipes-support/attr/attr_2.4.47.bb
>>> +++ b/meta/recipes-support/attr/attr_2.4.47.bb
>>> @@ -1,5 +1,8 @@
>>>    require attr.inc
>>>
>>> +# configure.ac was missing from the release tarball. This should be
>> fixed in
>>> +# future releases of attr, remove this when updating the recipe.
>>> +SRC_URI_append += "file://attr-Missing-configure.ac.patch"
>>>
>>>    SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
>>>    SRC_URI[sha256sum] =
>> "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
>>> diff --git a/meta/recipes-support/attr/files/attr-Missing-
>> configure.ac.patch b/meta/recipes-support/attr/files/attr-Missing-
>> configure.ac.patch
>>> new file mode 100644
>>> index 0000000..5887ed5
>>> --- /dev/null
>>> +++ b/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch
>>> @@ -0,0 +1,62 @@
>>> +Subject: [PATCH] attr: Missing configure.ac
>>> +
>>> +Upstream-Status: Backport [Upstream released tarball missing this file]
>>
>> You need a Signed-off-by: tag in this patch also
>>
>
> Hi Saul,
>
> This patch has already been pushed onto the master branch. http://git.openembedded.org/openembedded-core/commit/?id=b28f12a272a9e2f0c3084a58b91605acb05f58f8
>
Yes, I noticed this after I sent the message!

> Would you like me to submit a follow up patch which adds just the signed-off-by line? Or would you prefer a V2 of this patch with the additional change?
>
Please send a patch to add the signed-off-by line to the patch, we try 
to keep track of who added the patches so we have the history.

Thanks
	Sau!


> Regards,
> Nathan
>
>
>
>

