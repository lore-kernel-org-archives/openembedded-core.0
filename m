Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 137BC61883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 10:52:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7KAqAkN013121
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:52:10 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 03:52:08 -0700
Message-ID: <52134A57.8090208@windriver.com>
Date: Tue, 20 Aug 2013 18:52:07 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1376637245.git.jackie.huang@windriver.com>
	<520DE692.6060804@windriver.com>
In-Reply-To: <520DE692.6060804@windriver.com>
Subject: Re: [PATCH 0/1] texinfo: handle correctly @enumerate specification greater than 10
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
X-List-Received-Date: Tue, 20 Aug 2013 10:52:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Added signed-off in the patch:

The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:

   meta-skeleton: Add busybox config fragment example (2013-08-13 
23:03:44 +0100)

are available in the git repository at:
   git://git.pokylinux.org/poky-contrib jhuang0/d_texinfo_mpatrol_0820_0
 
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_texinfo_mpatrol_0820_0

Jackie Huang (1):
   texinfo: handle correctly @enumerate specification greater than 10

  .../texinfo-5.1/enumerate_greater_than_ten.patch   |   53 
++++++++++++++++++++
  meta/recipes-extended/texinfo/texinfo_5.1.bb       |    1 +
  2 files changed, 54 insertions(+), 0 deletions(-)
  create mode 100644 
meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch

Thanks,
Jackie

On 8/16/2013 4:45 PM, jhuang0 wrote:
>
>
> On 8/16/2013 3:16 PM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> The following changes since commit
>> 57662d4f813d5795cac1529633db80a09efdb089:
>>
>>    meta-skeleton: Add busybox config fragment example (2013-08-13
>> 23:03:44 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib jhuang0/d_texinfo_mpatrol_0816_1
>>
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_texinfo_mpatrol_0816_1
>>
>
> Sorry that the removing of a trailing white space in the patch would
> cause patching fail, plase use the updated one:
>
> The following changes since commit
> 57662d4f813d5795cac1529633db80a09efdb089:
>
>    meta-skeleton: Add busybox config fragment example (2013-08-13
> 23:03:44 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jhuang0/d_texinfo_mpatrol_0816_2
>
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_texinfo_mpatrol_0816_2
>
>
> Jackie Huang (1):
>    texinfo: handle correctly @enumerate specification greater than 10
>
>   .../texinfo-5.1/enumerate_greater_than_ten.patch   |   51
> ++++++++++++++++++++
>   meta/recipes-extended/texinfo/texinfo_5.1.bb       |    1 +
>   2 files changed, 52 insertions(+), 0 deletions(-)
>   create mode 100644
> meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch
>
> --
> 1.7.4.1
>
> Thanks,
> Jackie
>
>>
>> Jackie Huang (1):
>>    texinfo: handle correctly @enumerate specification greater than 10
>>
>>   .../texinfo-5.1/enumerate_greater_than_ten.patch   |   51
>> ++++++++++++++++++++
>>   meta/recipes-extended/texinfo/texinfo_5.1.bb       |    1 +
>>   2 files changed, 52 insertions(+), 0 deletions(-)
>>   create mode 100644
>> meta/recipes-extended/texinfo/texinfo-5.1/enumerate_greater_than_ten.patch
>>
>>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

