Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 348F971C9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:49:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 23 Jan 2017 09:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,275,1477983600"; d="scan'208";a="1086359429"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2017 09:49:28 -0800
To: David Vincent <freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<4532053.H3eoubo94G@crde-port-20.cahors.local>
	<7663fdf5-3dce-1147-e3f5-5460986d72c2@linux.intel.com>
	<3671180.cChI1EznzE@crde-port-20.cahors.local>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <b8c86614-375b-cfca-8863-9ee9bb7d59d6@linux.intel.com>
Date: Mon, 23 Jan 2017 11:56:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <3671180.cChI1EznzE@crde-port-20.cahors.local>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2g6IE1ha2Ugc3NoZC1jb25maWcgYSBwYWNrYWdl?=
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
X-List-Received-Date: Mon, 23 Jan 2017 17:49:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/23/2017 10:39 AM, David Vincent wrote:
> On lundi 23 janvier 2017 10:08:04 CET Leonardo Sandoval wrote:
>> David, This is what I get from the command line
>>
>> oe-core$ git pw mbox 4904 | git apply --check
>> error: documentation/ref-manual/ref-variables.xml: No such file or directory
>>
>> Meaning that you have a patch on your series that is targeted for the
>> documentation folder, which is not part of the oe-core project. The
>> latter need to be sent to:
>>
>> documentation:
>>       Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
>>       Mailing list: yocto@yoctoproject.org
>>
> OK, my bad, I patched directly against my poky clone. I didn't know that
> documentation was handled elsewhere. So, I will resubmit it removing the
> latest patch.
>
> But since these patches are related, is there a specific procedure to follow ?
> I didn't found anything in the contribution guidelines on the wiki...
I do not think so. Go ahead and send to the patches to the correct ML 
and perhaps include a cover letter indicating the patch relationship.

> Sorry for the inconvenience,
no problem.

By the way, there is enhancement (to be included during 2.3) that will 
target this type of problem: patch sent to the wrong ML; once 
implemented, the fail report will be more specific.

> David
>


