Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B21216C397
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 20:10:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00EK9a6S008727
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 14 Jan 2020 12:09:57 -0800
Received: from [128.224.56.225] (128.224.56.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 14 Jan 2020 12:09:39 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>, Oleg Polyakov
	<Oleg.Polyakov@windriver.com>
References: <20200114193010.92629-1-Oleg.Polyakov@windriver.com>
	<13AD08C4-930D-479F-81E7-3B6405C3BD94@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e0a7cf43-7d0b-5318-22de-9009d702061f@windriver.com>
Date: Tue, 14 Jan 2020 15:09:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <13AD08C4-930D-479F-81E7-3B6405C3BD94@gmail.com>
X-Originating-IP: [128.224.56.225]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] vim: update from 8.1.1518 to 8.2.0110
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
X-List-Received-Date: Tue, 14 Jan 2020 20:10:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-CA

On 1/14/20 2:39 PM, Alexander Kanavin wrote:
> Can you update to just 8.2 please? 0110 is an arbitrary commit as vimupstream adds a version tag for each of the commits.

Hi Alex,

Oleg is getting started using Yocto so I'll reply on his behalf since
I asked him to update vim as his first commit.

I'm not sure what you mean by 8.2. Are you talking about calling the recipe:
    vim_8.2.bb
instead of vim_8.2.0110.bb?

Vim tags on a daily or more frequent basis. Are you saying that we 
should keep the
same SRCREV for 8.2.0110 but use a different name?

I looked at:
    git log v8.2.0000..v8.2.0118
and all the commits seem to fix bugs so I prefer to take this tested 
v8.2.0110
update and update vim every month or two so that we get the latest fixes.

../Randy


>
> Alex
>
>> On 14 Jan 2020, at 20.30, Oleg Polyakov <Oleg.Polyakov@windriver.com> wrote:
>>
>> vim-tiny: update from 8.1.1518 to 8.2.0110
>> The date in the license was updated to 2020 and
>> a trailing space was removed from one line.
>>
>> Signed-off-by: Oleg Polyakov <Oleg.Polyakov@windriver.com>
>> ---
>> .../vim/{vim-tiny_8.1.1518.bb => vim-tiny_8.2.0110.bb}        | 0
>> meta/recipes-support/vim/vim.inc                              | 4 ++--
>> meta/recipes-support/vim/{vim_8.1.1518.bb => vim_8.2.0110.bb} | 0
>> 3 files changed, 2 insertions(+), 2 deletions(-)
>> rename meta/recipes-support/vim/{vim-tiny_8.1.1518.bb => vim-tiny_8.2.0110.bb} (100%)
>> rename meta/recipes-support/vim/{vim_8.1.1518.bb => vim_8.2.0110.bb} (100%)
>>
>> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1518.bb b/meta/recipes-support/vim/vim-tiny_8.2.0110.bb
>> similarity index 100%
>> rename from meta/recipes-support/vim/vim-tiny_8.1.1518.bb
>> rename to meta/recipes-support/vim/vim-tiny_8.2.0110.bb
>> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
>> index 5a1bea6985..ec7ad443a4 100644
>> --- a/meta/recipes-support/vim/vim.inc
>> +++ b/meta/recipes-support/vim/vim.inc
>> @@ -5,14 +5,14 @@ DEPENDS = "ncurses gettext-native"
>> # vimdiff doesn't like busybox diff
>> RSUGGESTS_${PN} = "diffutils"
>> LICENSE = "vim"
>> -LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
>> +LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=909f1394892b7e0f9c2a95306c0c552b"
>>
>> SRC_URI = "git://github.com/vim/vim.git \
>>             file://disable_acl_header_check.patch \
>>             file://vim-add-knob-whether-elf.h-are-checked.patch \
>>             file://0001-src-Makefile-improve-reproducibility.patch \
>> "
>> -SRCREV = "202d982b36d87cf91d992bd7e30d3223bdc72cd9"
>> +SRCREV = "e05a89ac6399a8c7d164c99fdab6841d999a9128"
>>
>> # Do not consider .z in x.y.z, as that is updated with every commit
>> UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
>> diff --git a/meta/recipes-support/vim/vim_8.1.1518.bb b/meta/recipes-support/vim/vim_8.2.0110.bb
>> similarity index 100%
>> rename from meta/recipes-support/vim/vim_8.1.1518.bb
>> rename to meta/recipes-support/vim/vim_8.2.0110.bb
>> -- 
>> 2.23.0
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
# Randy MacLeod
# Wind River Linux


