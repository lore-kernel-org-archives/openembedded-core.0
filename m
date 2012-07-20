Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SsFUS-0001YO-GE
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:51:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6KFeBNd010555
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Jul 2012 08:40:11 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 20 Jul 2012 08:40:11 -0700
Message-ID: <50097BC7.9020501@windriver.com>
Date: Fri, 20 Jul 2012 11:39:51 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
	<ADD6A3980E8C39419A432FF422031B4C0318C688@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0318C688@ORSMSX106.amr.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 0/3] linux-yocto: consolidated pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 15:51:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-20 11:34 AM, Kamble, Nitin A wrote:
>
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@windriver.com]
>> Sent: Friday, July 20, 2012 8:49 PM
>> To: richard.purdie@linuxfoundation.org
>> Cc: Wold, Saul; Zanussi, Tom; Kamble, Nitin A; andrea.adami@gmail.com;
>> rpjday@crashcourse.ca; openembedded-core@lists.openembedded.org
>> Subject: [PATCH 0/3] linux-yocto: consolidated pull
>>
>> Richard/Saul,
>>
>> I've got some -stable updates, -rt updates and other changes that are almost
>> done, but I wanted to get these smaller patches out of my queue first.
>>
>> We have some cleanup patches from Robert P. J. Day and a meta branch
>> update for EMGD, CONFIG_MTD_NAND_VERIFY_WRITE and kmemcheck.
>>
>> I've gone ahead and pushed the emgd update from Nitin, if it requires re-
>> work, we'll just add more commits to the branch.
>>
>> Tom/Nitin: speak up if there's a problem with this!
>>
> Bruce,
>     I notice that in the meta branch you also created patches for commits from the emgd-1.14 branch such as meta/cfg/kernel-cache/features/emgd/yocto-emgd-emgd-1.14-driver.patch. So emgd-1.14 support is available by 2 ways now. 1: By enabling these patches&  2: by merging the emgd-1.14 branch. For crownbay it is merging the emgd-1.14 branch, so these patches from meta directory can not be used.

.. and they aren't supposed to be used, are there any BSPs actively
including the emgd-1.14 feature ? I didn't see any, so I left the
patches in the feature description. If a BSP does a git merge of the
branch, it shouldn't include the feature, since as you mention, that
would push the patches again.

It's just providing options, since merging branches isn't always
possible.

>    I don't see any functional issue with this layout, but I am curious why these patches in meta branch when emgd-1.14 branch can be merged to get the same effect.

The kernel-cache should always have the raw patches that you find
on the branches. Some prefer the patches (and don't want to dump the
from the branches) and they document the commits on the branches.

I for one always use the merge, and prefer the branch only commits, but
my inbox is full from people requesting the raw patches over the years :)

Cheers,

Bruce

>
> Thanks,
> Nitin
>
>> Cheers,
>>
>> Bruce
>>
>> cc: Nitin A Kamble<nitin.a.kamble@intel.com>
>> cc: Tom Zanussi<tom.zanussi@intel.com>
>> cc: Andrea Adami<andrea.adami@gmail.com>
>> cc: Robert P. J. Day<rpjday@crashcourse.ca>
>>
>> The following changes since commit
>> 98a1fd1e734db50380a3a37d35767ccb4cc21f7c:
>>
>>    documentation: Config fragment sections updated (2012-07-20 12:32:54
>> +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib zedd/kernel
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (1):
>>    linux-yocto/3.4: emgd, mtd nand and kmemcheck fixes
>>
>> Robert P. J. Day (2):
>>    kernel-yocto.bbclass: Fix some obvious typoes in comments.
>>    kernel-yocto.bbclass: Delete superfluous creation of ${S}/.git
>>      directory
>>
>>   meta/classes/kernel-yocto.bbclass               |    8 ++++----
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
>>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> --
>> 1.7.5.4
>



