Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVD9Y-0005kv-6t
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 03:10:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAT23tVD011995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Nov 2011 18:03:55 -0800 (PST)
Received: from [128.224.162.191] (128.224.162.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 28 Nov 2011 18:03:55 -0800
Message-ID: <4ED43D8C.60107@windriver.com>
Date: Tue, 29 Nov 2011 10:03:56 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1322466046.git.wenzong.fan@windriver.com>
	<4ED3CB49.2060601@linux.intel.com>
In-Reply-To: <4ED3CB49.2060601@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] distro_tracking: update tracking fields for gettext and eds-tools
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
X-List-Received-Date: Tue, 29 Nov 2011 02:10:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2011 01:56 AM, Saul Wold wrote:
> On 11/27/2011 11:57 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> Update distro tracking fields for gettext and eds-tools.
>>
>> The eds-tools fails to build for now, so left its status as 'red'. A
>> defect #1786 has been filed for tracking this.
>>
>> The following changes since commit 
>> 4cd96710785eb05abeff1f281878655118d4a7dd:
>>    Richard Purdie (1):
>>          bitbake: Update users of getVar/setVar to use the data store 
>> functions directly
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib 
>> wenzong/distro_tracking_fields_update
>>    
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/distro_tracking_fields_update 
>>
>>
>> Wenzong Fan (1):
>>    distro_tracking: update tracking fields for gettext and eds-tools
>>
>>   .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++-----
>>   1 files changed, 6 insertions(+), 5 deletions(-)
>>
> This patch did not apply cleanly and seems to provide duplicate 
> entries, please rebase and resubmit.

Hi Saul,

I can't find any issue on the patch itself, but I'm not sure if the 
branch name cause any duplicate issues in your side. I have resubmitted 
it to a different branch, please refer to:

---------------------------------
The following changes since commit 4cd96710785eb05abeff1f281878655118d4a7dd:
   Richard Purdie (1):
         bitbake: Update users of getVar/setVar to use the data store 
functions directly

are available in the git repository at:

   git://git.pokylinux.org/poky-contrib wenzong/update_tracking_fields
   
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/update_tracking_fields

Wenzong Fan (1):
   distro_tracking: update tracking fields for gettext and eds-tools

  .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++-----
  1 files changed, 6 insertions(+), 5 deletions(-)
-------------------------------

Thanks
Wenzong

>
> Thanks
>     Sau!
>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>



