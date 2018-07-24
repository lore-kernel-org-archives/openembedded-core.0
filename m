Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 264117017B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 20:18:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6OKIRM2022338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2018 13:18:27 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 24 Jul 2018 13:18:27 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1532418493-21449-1-git-send-email-ovidiu.panait@windriver.com>
	<CAJTo0LaFai2biC-973Da-o7NMFwYkMWRTa4F5O+prseWFNwW4A@mail.gmail.com>
	<CANNYZj-FSOW33dXtdmo=467nktA_W8oXWknzUOURKWWb331tEQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <618229eb-0ae4-e749-23f5-0cb1c2f3ceac@windriver.com>
Date: Tue, 24 Jul 2018 16:18:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj-FSOW33dXtdmo=467nktA_W8oXWknzUOURKWWb331tEQ@mail.gmail.com>
X-Originating-IP: [172.25.44.2]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsof: Update SRC_URI
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
X-List-Received-Date: Tue, 24 Jul 2018 20:18:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/24/2018 04:37 AM, Alexander Kanavin wrote:
> Also, if an upgrade is undesirable for some reason, then such changes
> need UPSTREAM_CHECK_URI, or we'll be missing new upstream releases.
> 
> Alex
> 
> 2018-07-24 10:07 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
>> Well for master if there's a new version then a better fix would be to
>> upgrade, 

Yes, there's a 4.91 as of March and a github repo in the works
according to the members-only list archive:


On  Fri Jun 22 09:55:59 EDT 2018, Victor Abell wrote:

   I am slowly making progress for the release of lsof to GitHUB
   from its Purdue Research Foundation copyright.  I have finally
   reached a person who works on open source distribution issues.
   He and I have had several discussions about lsof and its copyright
   and he now understands what needs to be done.  He has formulated
   a request to the senior IP officer for the release and we are waiting
   the response.

so for oe-core-2.6, we should use 4.91.


>> but we do need to make sure the previous releases are using
>> mirrors.

I expect that Ovidiu just forgot the branch prefix in his subject line.
Do you want him to resend for 2.5 and 2.4 ?

../Randy



>>
>> On 24 July 2018 at 08:48, Ovidiu Panait <ovidiu.panait@windriver.com> wrote:
>>> lsof 4.89 archive has been moved to OLD directory and turned into tar.gz,
>>> so update SRC_URI and checksums.
>>>
>>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>>> ---
>>>   meta/recipes-extended/lsof/lsof_4.89.bb | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
>>> index 14546db23c..b58b8281f9 100644
>>> --- a/meta/recipes-extended/lsof/lsof_4.89.bb
>>> +++ b/meta/recipes-extended/lsof/lsof_4.89.bb
>>> @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
>>>   # https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems to be
>>>   # the most commonly used alternative.
>>>
>>> -SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
>>> +SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/lsof_${PV}.tar.gz \
>>>              file://lsof-remove-host-information.patch \
>>>             "
>>>
>>> -SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
>>> -SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
>>> +SRC_URI[md5sum] = "8afbaff3ee308edc130bdc5df0801c8f"
>>> +SRC_URI[sha256sum] = "5d08da7ebe049c9d9a6472d6afb81aa5af54c4733a3f8822cbc22b57867633c9"
>>>
>>>   LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
>>>
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
# Randy MacLeod
# Wind River Linux

