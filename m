Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33DAF60111
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 09:40:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2017 01:40:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="1079453920"
Received: from mjtierna-mobl4.ger.corp.intel.com (HELO [10.252.21.200])
	([10.252.21.200])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2017 01:40:12 -0800
User-Agent: Microsoft-MacOutlook/14.7.1.161129
Date: Thu, 05 Jan 2017 11:40:18 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <D493E01E.6E7A8%markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 8/8] oeqa.utils.metadata: add bitbake revision
	information
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1482930164-15721-9-git-send-email-markus.lehtonen@linux.intel.com>
	<de81809e-103a-4260-a198-a1897e2a9894@linux.intel.com>
In-Reply-To: <de81809e-103a-4260-a198-a1897e2a9894@linux.intel.com>
Mime-version: 1.0
Subject: Re: [PATCH 8/8] oeqa.utils.metadata: add bitbake revision information
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
X-List-Received-Date: Thu, 05 Jan 2017 09:40:30 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 04/01/2017, 17.45, "Mariano Lopez" <mariano.lopez@linux.intel.com>
wrote:
>On 28/12/16 07:02, Markus Lehtonen wrote:
>> [YOCTO #10590]
>>
>> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>> ---
>>  meta/lib/oeqa/utils/metadata.py | 32 +++++++++++++++++++-------------
>>  1 file changed, 19 insertions(+), 13 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/utils/metadata.py
>>b/meta/lib/oeqa/utils/metadata.py
>> index 6331c21..23449fc 100644
>> --- a/meta/lib/oeqa/utils/metadata.py
>> +++ b/meta/lib/oeqa/utils/metadata.py
>> @@ -10,6 +10,8 @@ from collections.abc import MutableMapping
>>  from xml.dom.minidom import parseString
>>  from xml.etree.ElementTree import Element, tostring
>>  
>> +from git import Repo, InvalidGitRepositoryError, NoSuchPathError
>> +
>
>It seems not every user running selftest appreciated the requirement of
>gitpython, so there was a patch to keep this dependency out. This will
>introduce the need of gitpython again.

Yes. I don't know why I moved this import to module level in the first
place. A corrected version of the patch in now found  in my
oe-core-contrib branch
(git://git.openembedded.org/openembedded-core-contrib marquiz/oeqa-metaxml)


Thanks,
  Markus



