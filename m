Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF09F60247
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 10:33:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02AAWjLb006862
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 10 Mar 2020 03:32:55 -0700
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 10 Mar 2020 03:32:34 -0700
To: akuster808 <akuster808@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20200224031226.6965-1-akuster808@gmail.com>
	<1f5759550013cdb49ebfb34194863af3d9dbcf6c.camel@linuxfoundation.org>
	<89e6bbf2-51ca-4dcf-46b3-e484d228f579@windriver.com>
	<bebdaf20-d6fe-4816-ab9f-154f32a8183f@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <258aff3b-11f8-dae7-0b2f-6ac15145dd90@windriver.com>
Date: Tue, 10 Mar 2020 18:31:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bebdaf20-d6fe-4816-ab9f-154f32a8183f@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] e2fsprogs: update to 1.45.5
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
X-List-Received-Date: Tue, 10 Mar 2020 10:33:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Armin,

On 2/24/20 11:19 PM, akuster808 wrote:
> 
> 
> On 2/24/20 3:13 AM, Robert Yang wrote:
>>
>> On 2/24/20 6:23 PM, Richard Purdie wrote:
>>> On Sun, 2020-02-23 at 19:12 -0800, Armin Kuster wrote:
>>>> Dropping patch 0001-misc-create_inode.c-set-dir-s-mode-
>>>> correctly.patch as upstream has not been accepted for over 2 years
>>>> and we should not carry it if upstream has not taking it after all
>>>> that time.
>>>
>>> Looking at the patch, this worries me a lot. Why have upstream not
>>> taken it? Did they say it was incorrect?
>>
>> I can't find any records about it, maybe I didn't send it because of
>> some reason.
>>
>> We still need it. I refreshed the patch and sent to upstream.
>>
>> @Armin, The refreshed patch is in the attachment.
> 
> Will do. thanks for the feedback.

Seems that e2fsprogs didn't update to 1.45.5. After I sent the patch to
upstream, they fixed the issue in another way:

https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=f106b01c98d7abc12af39aad4024f17ffa14dc06

If you upgrade it to 1.45.5, you can use the upstream patch
to replace the current one, but if you don't upgrade it,
I'm leaning to keep the current patch since some context are different.

// Robert

> 
> - armin
>>
>> // Robert
>>
>>>
>>> We wrote the original code to handle offline root here so its entirely
>>> possible this is a value issue and we'll break filesystems if we don't
>>> have that patch :(
>>>
>>> I can't take a change like this without more info, CVE or not.
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>> Includes: CVE-2019-5188
>>>>
>>>> see http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.5
>>>> for more information.
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>    ...ate_inode.c-set-dir-s-mode-correctly.patch | 41 ---------------
>>>> ----
>>>>    ...2fsprogs_1.45.4.bb => e2fsprogs_1.45.5.bb} |  3 +-
>>>>    2 files changed, 1 insertion(+), 43 deletions(-)
>>>>    delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-
>>>> misc-create_inode.c-set-dir-s-mode-correctly.patch
>>>>    rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.4.bb =>
>>>> e2fsprogs_1.45.5.bb} (97%)
>>>>
>>>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-
>>>> create_inode.c-set-dir-s-mode-correctly.patch b/meta/recipes-
>>>> devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-
>>>> correctly.patch
>>>> deleted file mode 100644
>>>> index fc4a5409860..00000000000
>>>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-
>>>> create_inode.c-set-dir-s-mode-correctly.patch
>>>> +++ /dev/null
>>>> @@ -1,41 +0,0 @@
>>>> -From f6d188580c2c9599319076fee22f2424652c711c Mon Sep 17 00:00:00
>>>> 2001
>>>> -From: Robert Yang <liezhi.yang@windriver.com>
>>>> -Date: Wed, 13 Sep 2017 19:55:35 -0700
>>>> -Subject: [PATCH] misc/create_inode.c: set dir's mode correctly
>>>> -
>>>> -The dir's mode has been set by ext2fs_mkdir() with umask, so
>>>> -reset it to the source's mode in set_inode_extra().
>>>> -
>>>> -Fixed when source dir's mode is 521, but tarball would be 721, this
>>>> was
>>>> -incorrect.
>>>> -
>>>> -Upstream-Status: Submitted
>>>> -
>>>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ----
>>>> - misc/create_inode.c | 9 ++++++++-
>>>> - 1 file changed, 8 insertions(+), 1 deletion(-)
>>>> -
>>>> -diff --git a/misc/create_inode.c b/misc/create_inode.c
>>>> -index 8ce3faf..50fbaa8 100644
>>>> ---- a/misc/create_inode.c
>>>> -+++ b/misc/create_inode.c
>>>> -@@ -116,7 +116,14 @@ static errcode_t set_inode_extra(ext2_filsys
>>>> fs, ext2_ino_t ino,
>>>> -
>>>> -     inode.i_uid = st->st_uid;
>>>> -     inode.i_gid = st->st_gid;
>>>> --    inode.i_mode |= st->st_mode;
>>>> -+    /*
>>>> -+     * The dir's mode has been set by ext2fs_mkdir() with umask, so
>>>> -+     * reset it to the source's mode
>>>> -+     */
>>>> -+    if S_ISDIR(st->st_mode)
>>>> -+        inode.i_mode = LINUX_S_IFDIR | st->st_mode;
>>>> -+    else
>>>> -+        inode.i_mode |= st->st_mode;
>>>> -     inode.i_atime = st->st_atime;
>>>> -     inode.i_mtime = st->st_mtime;
>>>> -     inode.i_ctime = st->st_ctime;
>>>> ---
>>>> -2.10.2
>>>> -
>>>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>>>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>>>> similarity index 97%
>>>> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>>>> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>>>> index 6e69eea21c3..7cd42b8137a 100644
>>>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>>>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>>>> @@ -4,7 +4,6 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>>>>               file://run-ptest \
>>>>               file://ptest.patch \
>>>>               file://mkdir_p.patch \
>>>> -           file://0001-misc-create_inode.c-set-dir-s-mode-
>>>> correctly.patch \
>>>>               file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
>>>>               file://0001-intl-do-not-try-to-use-gettext-defines-that-
>>>> no-longe.patch \
>>>>               "
>>>> @@ -13,7 +12,7 @@ SRC_URI_append_class-native = "
>>>> file://e2fsprogs-fix-missing-check-for-permissio
>>>>                                    file://quiet-debugfs.patch \
>>>>    "
>>>>    -SRCREV = "984ff8d6a0a1d5dc300505f67b38ed5047d51dac"
>>>> +SRCREV = "c2b1ec5fbc99ab8a2b71dae45d486b3ea004f618"
>>>>    UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>>>>      EXTRA_OECONF += "--libdir=${base_libdir}
>>>> --sbindir=${base_sbindir} \
>>>> -- 
>>>> 2.17.1
>>>>
>>>
>>>
> 
> 

