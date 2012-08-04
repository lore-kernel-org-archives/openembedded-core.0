Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SxYam-0008Bc-JK
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 09:16:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7474OuH004957
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 4 Aug 2012 00:04:24 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Sat, 4 Aug 2012 00:04:23 -0700
Message-ID: <501CC975.2030009@windriver.com>
Date: Sat, 4 Aug 2012 15:04:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343811985.git.liezhi.yang@windriver.com>
	<CAMKF1srwmN9_-p5ae6999wdZGfpfXLseCnwegnQxa7ckAVOcLw@mail.gmail.com>
In-Reply-To: <CAMKF1srwmN9_-p5ae6999wdZGfpfXLseCnwegnQxa7ckAVOcLw@mail.gmail.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] createrepo 0.4.11: create wrapper for python script
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
X-List-Received-Date: Sat, 04 Aug 2012 07:16:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/03/2012 07:10 PM, Khem Raj wrote:
> On Wed, Aug 1, 2012 at 2:14 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> This is used for fixing the rpm-createsolvedb.py error:
>>
>> 'import site' failed; use -v for traceback
>> Traceback (most recent call last):
>> File "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/scripts/rpm-createsolvedb.py", line 14, in
>> import sys, os
>> ImportError: No module named os
>>
>
> this series has problem I think now bitbake meta-toolchain fails for me
>
> run.populate_sdk_image.6792: line 610: rpm-createsolvedb.py: command not found
>
> did you try bitbake meta-toolchain target from scratch with this change ?
>

Hi Khem,

I'm sorry for this, this is because I hadn't fixed the depends of
populate_sdk_image, "bitbake createrepo-native" firstly can be a workaround,
I will send a official fix sooner.

// Robert

>
>
>> // Robert
>>
>> The following changes since commit 4f31d21bcb1c8c744e9abb33248715afe4a40af0:
>>
>>    lib/oe/lsb.py: Map unknown distributions to 'Unknown' (2012-07-31 08:02:11 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib robert/createrepo
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/createrepo
>>
>> Robert Yang (2):
>>    createrepo 0.4.11: add rpm-createsolvedb.py
>>    createrepo 0.4.11: create wrapper for python script
>>
>>   meta/classes/rootfs_rpm.bbclass                    |    2 +-
>>   .../createrepo/createrepo}/rpm-createsolvedb.py    |    0
>>   .../createrepo/createrepo_0.4.11.bb                |   17 ++++++++++++++++-
>>   3 files changed, 17 insertions(+), 2 deletions(-)
>>   rename {scripts => meta/recipes-support/createrepo/createrepo}/rpm-createsolvedb.py (100%)
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



