Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 740887567D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 06:05:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S656xu014665
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 May 2015 23:05:07 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 27 May 2015 23:05:06 -0700
Message-ID: <5566B012.1040006@windriver.com>
Date: Thu, 28 May 2015 14:05:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1427186518.git.Qi.Chen@windriver.com>
	<5564081E.1050401@windriver.com>
	<2981463.2asXSZhTDk@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1soUQf-mTLfAMDDDh=_vMDss6qu5UVF9QUK=BDOSod7jKQ@mail.gmail.com>
In-Reply-To: <CAMKF1soUQf-mTLfAMDDDh=_vMDss6qu5UVF9QUK=BDOSod7jKQ@mail.gmail.com>
X-Originating-IP: [128.224.162.211]
Cc: Randy Witt <randy.e.witt@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Support persistent /var/log
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
X-List-Received-Date: Thu, 28 May 2015 06:05:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2015 12:55 PM, Khem Raj wrote:
> On Tue, May 26, 2015 at 2:15 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> Randy, Khem, Otavio - this area was the subject of a discussion involving you
>> around the 1.8 release, if you could review this set and comment that would be
>> great.
>
> Looked at it but it didnt sound like it considered read only rootfs case at all.


read-only rootfs and persistent /var/log are all custom configurations.
If a user wants a read-only rootfs but a persistent /var/log, he'll need 
to do more custom configurations like putting /var/ on a seperate 
partition or something else.

The purpose of this patch is to provide an easy way to user to keep 
their logs between reboots.

//Chen Qi

>> Thanks,
>> Paul
>>
>> On Tuesday 26 May 2015 13:43:58 ChenQi wrote:
>>> ping ....
>>>
>>> *ANY* comment would be welcome, really ...
>>>
>>> Thanks,
>>> Chen Qi
>>>
>>> On 03/24/2015 04:42 PM, Chen Qi wrote:
>>>> The following changes since commit
>> d3fcfe346b3472170641d9194243c4bbe06b8585:
>>>>     systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:13
>>>>     +0000)>
>>>> are available in the git repository at:
>>>>     git://git.openembedded.org/openembedded-core-contrib
>>>>     ChenQi/persistent-var-log
>>>>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h
>>>>     =ChenQi/persistent-var-log>
>>>> Chen Qi (4):
>>>>     bitbake.conf: add VOLATILE_LOG_DIR variable
>>>>     base-files: respect VOLATILE_LOG_DIR
>>>>     initscripts: support persistent /var/log
>>>>     package.bbclass: support persistent /var/log
>>>>
>>>>    meta/classes/package.bbclass                       |  2 +-
>>>>    meta/conf/bitbake.conf                             |  4 ++
>>>>    meta/files/fs-perms-persistent-log.txt             | 66
>>>>    ++++++++++++++++++++++
>>>>    meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
>>>>    .../initscripts/initscripts-1.0/volatiles          |  1 -
>>>>    meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
>>>>    6 files changed, 76 insertions(+), 4 deletions(-)
>>>>    create mode 100644 meta/files/fs-perms-persistent-log.txt
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>


