Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id CAE7760C85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 15:19:26 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a14so4923507pgb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 07:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=i+yo/pKYAvUa/uAxCpV0froPh3ylwSOIY8T2Uy199rA=;
	b=jzpCwSUXX6QyXSNvxh26EdOI3CXKu6Gz2PJmivxv2Eq8bjzFjPva5CuBsBATXV4zE0
	NIirI7OOoqFAIQVxItR529PyiuSvQlme0lt2Aps89hY/PDQiH749EGnbAnejWfjfhaoz
	ZRBip3Wa5xxLHeaulX/dgaFSZWIhkVVYqydwrpAPx9pkTLgqi0lqKIyhuw8+f7reevdQ
	TBNehdb7ocoJ+gGsZTYDtHfYdeNJtfQQxLDWS5Zk+RDgsuQZ7BebWS5ikf1f3JetYp/B
	GNu/LKBV598orllzhcN0gAvZASqbdVLIijitenw/DkwS6PN4GYLBaZp6tb3lCr4xP8VG
	Cd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=i+yo/pKYAvUa/uAxCpV0froPh3ylwSOIY8T2Uy199rA=;
	b=lH+i0Luc906PdA4+sOGs7L+ECQZKcOG7BzvCOrLJzMOlTj/AOTSItUtVwmmQ9GmM/U
	KVEZlB3R+06+7JZgFXWv1gCk65xMD7Go+srdmAqpxryFW3xFYjeQh2zMgJ2cJeuKPF+L
	m176OkDWbxbm6DSJVkLgWdsAK1OJmIvj4TkpPAQ0R0eVv5QYg6SchG1PAYev5/vLKkon
	xLXYp03vVBqWgKwU9q17T6Py5udELjlt0wIl84hvxu0/kiE1tUdZucB5lI/4EfrTZa+G
	AEf4y+UTTE4w+HljIcaUL+oGY9XSOM7ypkD7C9Wri76LNglwI29KRdaLIYftRNxkwUqK
	fj0w==
X-Gm-Message-State: APjAAAWpLbwgKLFPMQ0BOoMnpGiTXpOyZDHBfaO4oRiKIBAW72JmiNdN
	5wkWhrJw6U3o3XUXaAEJPgatKn6C
X-Google-Smtp-Source: APXvYqy2N0GJogQt/xpoifmRdhVSWIHq6Ke7CerFcLEkJl0Hfq3v3f28tq8/btrpbcOeAlJncTEUjw==
X-Received: by 2002:a63:214e:: with SMTP id s14mr52636029pgm.428.1582557567301;
	Mon, 24 Feb 2020 07:19:27 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:7dff:acc3:c23d:7c90?
	([2601:202:4180:a5c0:7dff:acc3:c23d:7c90])
	by smtp.gmail.com with ESMTPSA id
	x4sm13392686pff.143.2020.02.24.07.19.26
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Feb 2020 07:19:26 -0800 (PST)
To: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200224031226.6965-1-akuster808@gmail.com>
	<1f5759550013cdb49ebfb34194863af3d9dbcf6c.camel@linuxfoundation.org>
	<89e6bbf2-51ca-4dcf-46b3-e484d228f579@windriver.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bebdaf20-d6fe-4816-ab9f-154f32a8183f@gmail.com>
Date: Mon, 24 Feb 2020 07:19:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <89e6bbf2-51ca-4dcf-46b3-e484d228f579@windriver.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 15:19:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/24/20 3:13 AM, Robert Yang wrote:
>
> On 2/24/20 6:23 PM, Richard Purdie wrote:
>> On Sun, 2020-02-23 at 19:12 -0800, Armin Kuster wrote:
>>> Dropping patch 0001-misc-create_inode.c-set-dir-s-mode-
>>> correctly.patch as upstream has not been accepted for over 2 years
>>> and we should not carry it if upstream has not taking it after all
>>> that time.
>>
>> Looking at the patch, this worries me a lot. Why have upstream not
>> taken it? Did they say it was incorrect?
>
> I can't find any records about it, maybe I didn't send it because of
> some reason.
>
> We still need it. I refreshed the patch and sent to upstream.
>
> @Armin, The refreshed patch is in the attachment.

Will do. thanks for the feedback.

- armin
>
> // Robert
>
>>
>> We wrote the original code to handle offline root here so its entirely
>> possible this is a value issue and we'll break filesystems if we don't
>> have that patch :(
>>
>> I can't take a change like this without more info, CVE or not.
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>>> Includes: CVE-2019-5188
>>>
>>> see http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.5
>>> for more information.
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>   ...ate_inode.c-set-dir-s-mode-correctly.patch | 41 ---------------
>>> ----
>>>   ...2fsprogs_1.45.4.bb => e2fsprogs_1.45.5.bb} |  3 +-
>>>   2 files changed, 1 insertion(+), 43 deletions(-)
>>>   delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-
>>> misc-create_inode.c-set-dir-s-mode-correctly.patch
>>>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.45.4.bb =>
>>> e2fsprogs_1.45.5.bb} (97%)
>>>
>>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-
>>> create_inode.c-set-dir-s-mode-correctly.patch b/meta/recipes-
>>> devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-set-dir-s-mode-
>>> correctly.patch
>>> deleted file mode 100644
>>> index fc4a5409860..00000000000
>>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-
>>> create_inode.c-set-dir-s-mode-correctly.patch
>>> +++ /dev/null
>>> @@ -1,41 +0,0 @@
>>> -From f6d188580c2c9599319076fee22f2424652c711c Mon Sep 17 00:00:00
>>> 2001
>>> -From: Robert Yang <liezhi.yang@windriver.com>
>>> -Date: Wed, 13 Sep 2017 19:55:35 -0700
>>> -Subject: [PATCH] misc/create_inode.c: set dir's mode correctly
>>> -
>>> -The dir's mode has been set by ext2fs_mkdir() with umask, so
>>> -reset it to the source's mode in set_inode_extra().
>>> -
>>> -Fixed when source dir's mode is 521, but tarball would be 721, this
>>> was
>>> -incorrect.
>>> -
>>> -Upstream-Status: Submitted
>>> -
>>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ----
>>> - misc/create_inode.c | 9 ++++++++-
>>> - 1 file changed, 8 insertions(+), 1 deletion(-)
>>> -
>>> -diff --git a/misc/create_inode.c b/misc/create_inode.c
>>> -index 8ce3faf..50fbaa8 100644
>>> ---- a/misc/create_inode.c
>>> -+++ b/misc/create_inode.c
>>> -@@ -116,7 +116,14 @@ static errcode_t set_inode_extra(ext2_filsys
>>> fs, ext2_ino_t ino,
>>> -
>>> -     inode.i_uid = st->st_uid;
>>> -     inode.i_gid = st->st_gid;
>>> --    inode.i_mode |= st->st_mode;
>>> -+    /*
>>> -+     * The dir's mode has been set by ext2fs_mkdir() with umask, so
>>> -+     * reset it to the source's mode
>>> -+     */
>>> -+    if S_ISDIR(st->st_mode)
>>> -+        inode.i_mode = LINUX_S_IFDIR | st->st_mode;
>>> -+    else
>>> -+        inode.i_mode |= st->st_mode;
>>> -     inode.i_atime = st->st_atime;
>>> -     inode.i_mtime = st->st_mtime;
>>> -     inode.i_ctime = st->st_ctime;
>>> ---
>>> -2.10.2
>>> -
>>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>>> similarity index 97%
>>> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>>> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>>> index 6e69eea21c3..7cd42b8137a 100644
>>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
>>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.5.bb
>>> @@ -4,7 +4,6 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>>>              file://run-ptest \
>>>              file://ptest.patch \
>>>              file://mkdir_p.patch \
>>> -           file://0001-misc-create_inode.c-set-dir-s-mode-
>>> correctly.patch \
>>>              file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
>>>              file://0001-intl-do-not-try-to-use-gettext-defines-that-
>>> no-longe.patch \
>>>              "
>>> @@ -13,7 +12,7 @@ SRC_URI_append_class-native = "
>>> file://e2fsprogs-fix-missing-check-for-permissio
>>>                                   file://quiet-debugfs.patch \
>>>   "
>>>   -SRCREV = "984ff8d6a0a1d5dc300505f67b38ed5047d51dac"
>>> +SRCREV = "c2b1ec5fbc99ab8a2b71dae45d486b3ea004f618"
>>>   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>>>     EXTRA_OECONF += "--libdir=${base_libdir}
>>> --sbindir=${base_sbindir} \
>>> -- 
>>> 2.17.1
>>>
>>
>>


