Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB8773E11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 08:33:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7M8XaiL018823
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Aug 2015 01:33:36 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 22 Aug 2015 01:33:35 -0700
Message-ID: <55D833DD.4070400@windriver.com>
Date: Sat, 22 Aug 2015 16:33:33 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <alexander.kanavin@linux.intel.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
	<74b4262e5df004800e56b273e7d7a3d64d7af9b3.1440145857.git.liezhi.yang@windriver.com>
	<CAHiDW_HqD908Y_F7i6kFNrLhD4UohnUp1FSMtF-aVnCoW=A7TQ@mail.gmail.com>
	<55D70349.7080003@windriver.com>
	<58077.10.252.47.114.1440163323.squirrel@linux.intel.com>
In-Reply-To: <58077.10.252.47.114.1440163323.squirrel@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] btrfs-tools: 4.1.1 -> 4.1.2
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
X-List-Received-Date: Sat, 22 Aug 2015 08:33:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2015 09:22 PM, alexander.kanavin@linux.intel.com wrote:
>>> Is there no PV change here?
>>
>> Thanks, I updated in the repo.
>> -PV = "4.1.1+git${SRCPV}"
>> +PV = "4.1.2+git${SRCPV}"
>
> You can also rename the recipe to btrfs-tools_4.1.2.bb and remove the PV
> altogether. The above form is only needed if you're taking something from
> git that is not a pristine tagged release (i.e. when it is a tagged
> commit+additional commits).

Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/PU
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (4):
   gnupg: 2.1.6 -> 2.1.7
   gnu-efi: 3.0.2 -> 3.0.3
   btrfs-tools: 4.1.1 -> 4.1.2
   oprofile: 1.0.0 -> 1.1.0

// Robert

>
> Alex
>
>

