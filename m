Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TDQy6-0003Hr-O1
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 04:21:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8H299nx020063
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Sep 2012 19:09:09 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Sun, 16 Sep 2012 19:09:10 -0700
Message-ID: <50568644.2000508@windriver.com>
Date: Mon, 17 Sep 2012 10:09:08 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1347247613.git.liezhi.yang@windriver.com>
	<5050CBA0.5060409@linux.intel.com>
In-Reply-To: <5050CBA0.5060409@linux.intel.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1 V2] package_rpm.bbclass: fix the arch (replace "-" with "_")
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 02:21:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/13/2012 01:51 AM, Saul Wold wrote:
> On 09/10/2012 12:58 AM, Robert Yang wrote:
>> Changes of V2:
>> * Replace "-" with "_" for sat-solver_git.bb
>>
>> Test info:
>> MACHINE = beagleboard/mpc8315e-rdb/qemux86
>> PACKAGE_CLASSES = package_rpm
>>
>> $ bitbake core-image-minimal core-image-sato meta-toolchain \
>>     meta-toolchain-sdk adt-installer meta-ide-support
>>
>> $ bitbake package-index
>>
>> $ runqemu qemux86 (when MACHINE=qemux86)
>>
>> All of them are OK.
>>
>> Note:
>> The nativesdk's arch would be x86_64_nativesdk or i686_nativesdk (it was
>> x86_64 or i686 in the past) when use rpm.
>>
>> // Robert
>>
>>
>> The following changes since commit 5343cdb20ee56a8b507733c637dcc2466ae13288:
>>
>>    bitbake: fetch2: replace double slashes in paths in encodeurl() (2012-09-07
>> 14:50:04 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib robert/rpmarch
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpmarch
>>
>> Robert Yang (1):
>>    package_rpm.bbclass: fix the arch (replace "-" with "_")
>>
>>   meta/classes/package_rpm.bbclass                   | 10 +++++-----
>>   meta/recipes-extended/sat-solver/sat-solver_git.bb |  2 +-
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
> I think this needs rebasing, can you resend please.
>

Hi Saul,

It had been merged into master, do you mean rebase for other branch?

// Robert

> Sau!
>
>
>


