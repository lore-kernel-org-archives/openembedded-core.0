Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E662E600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 05:17:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w155HjWF027696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Feb 2018 21:17:45 -0800 (PST)
Received: from localhost.localdomain (128.224.163.240) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 4 Feb 2018 21:17:24 -0800
To: Randy MacLeod <randy.macleod@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1517541572.git.liezhi.yang@windriver.com>
	<3e5edeaacf65212a1fce974e5eef6c4ac2e088e1.1517541572.git.liezhi.yang@windriver.com>
	<4ed18a6d-8741-295b-087b-8dd7f158f949@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <577fce6b-7be0-4e48-7697-f7d2837661c7@windriver.com>
Date: Mon, 5 Feb 2018 13:17:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <4ed18a6d-8741-295b-087b-8dd7f158f949@windriver.com>
Subject: Re: [PATCH 3/4] runqemu: check for qemuboot.conf and raise error
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
X-List-Received-Date: Mon, 05 Feb 2018 05:17:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 02/02/2018 10:49 PM, Randy MacLeod wrote:
> On 2018-02-01 10:23 PM, Robert Yang wrote:
>> [YOCTO #12503]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   scripts/runqemu | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 0ca62f4..d50c6d1 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -417,6 +417,9 @@ class BaseConfig(object):
>>           unknown_arg = ""
>>           for arg in sys.argv[1:]:
>> +            if arg.endswith('.qemuboot.conf'):
>> +                raise RunQemuError("qemuboot.conf is not supported any more, 
>> use qemuboot.json to instead of it")
>> +
> better wording:
>   qemuboot.conf format is no longer supported, use a qemuboot.json file instead.
> 

Thanks, updated in the repo.

// Robert

> 
> 
> ../Randy
> 
>>               if arg in self.fstypes + self.vmtypes:
>>                   self.check_arg_fstype(arg)
>>               elif arg == 'nographic':
>>
> 
> 

