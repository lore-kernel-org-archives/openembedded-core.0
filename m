Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3BD36F7B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 03:18:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2D3IZmJ020181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Mar 2014 20:18:35 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 12 Mar 2014 20:18:35 -0700
Message-ID: <53212382.8060202@windriver.com>
Date: Thu, 13 Mar 2014 11:18:26 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1394676641.git.hongxu.jia@windriver.com>
	<04B26531-AA3F-4E9E-8B0E-2B2EB7287AA4@gmail.com>
In-Reply-To: <04B26531-AA3F-4E9E-8B0E-2B2EB7287AA4@gmail.com>
Cc: msm@freescale.com, saul.wold@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1]eglibc: tweak glibc.fix_sqrt2.patch for eglibc-2.19
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
X-List-Received-Date: Thu, 13 Mar 2014 03:18:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2014 10:32 AM, Khem Raj wrote:
> On Mar 12, 2014, at 7:14 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
>> The following changes since commit 5f81d9d1fa537445d5da49e12de1e16300e94552:
>>
>>   bitbake: runqueue: Use SIGCHLD instead of polling waitpid (2014-03-10 11:10:02 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib hongxu/fix-eglibc
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-eglibc
> Does this patch do anything in addition to

Oh, It seems I am not updating to the latest version,
you have fixed this issue, so please drop the duplicated
one.

//Hongxu

> commit 6235cc3ccf98dce15ffe3313cf4e6cdf9c922bce
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Mon Mar 10 15:51:37 2014 +0000
>
>      eglibc: Fix build for FSL ppc/fpu
>      
>      The patch needs to adapt to upstream changes
>      should fix errors on e500mc+ based SOCs
>      
>      This should fix [YOCTO #5871]
>      
>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>      Signed-off-by: Saul Wold <sgw@linux.intel.com>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
>
>
>
>> Hongxu Jia (1):
>>   eglibc: tweak glibc.fix_sqrt2.patch for eglibc-2.19
>>
>> .../eglibc/eglibc-2.19/glibc.fix_sqrt2.patch       | 24 +++++++++++-----------
>> 1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> -- 
>> 1.8.1.2
>>


