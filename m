Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 756F8731BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 06:24:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0G6ODLs003656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jan 2016 22:24:13 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jan 2016 22:24:13 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452823464.git.liezhi.yang@windriver.com>
	<2f2bda63c8a7f435e76c5d4ea1c5c529847f7f65.1452823464.git.liezhi.yang@windriver.com>
	<1452856537.28375.142.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5699E20B.8050405@windriver.com>
Date: Sat, 16 Jan 2016 14:24:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452856537.28375.142.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] e2fsprogs: 1.42.9 -> 1.43-WIP
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
X-List-Received-Date: Sat, 16 Jan 2016 06:24:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/15/2016 07:15 PM, Richard Purdie wrote:
> On Thu, 2016-01-14 at 18:05 -0800, Robert Yang wrote:
>> Upgrade to 1.43-WIP to make "mke2fs -d" support xattr, so that the
>> layer
>> which requires xattr such as meta-selinux can populate images easily.
>>
>> * Remove the following patches since they are alredy in the source.
>>    0001-e2fsprogs-fix-cross-compilation-problem.patch
>>    0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch
>>    0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
>>    0002-misc-create_inode.c-copy-files-recursively.patch
>>    0003-misc-create_inode.c-create-special-file.patch
>>    0004-misc-create_inode.c-create-symlink.patch
>>    0005-misc-create_inode.c-copy-regular-file.patch
>>    0006-misc-create_inode.c-create-directory.patch
>>    0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
>>    0008-mke2fs.c-add-an-option-d-root-directory.patch
>>    0009-misc-create_inode.c-handle-hardlinks.patch
>>    0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
>>    0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
>>    0012-Fix-musl-build-failures.patch
>>    CVE-2015-0247.patch
>>    copy-in-create-hardlinks-with-the-correct-directory-.patch
>>    fix-icache.patch
>>    misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
>>
>> * Remove cache_inode.patch since it is not needed any more
>>
>> * Updated mkdir.patch and ptest.patch
>>
>> * Add --enable-libblkid to EXTRA_OECONF since libblkid is not created
>> by
>>    default.
>>
>> * Time of core-image-sato-sdk do_rootfs:
>>    - Before upgrade
>>      real    3m18.508s
>>      user    7m42.088s
>>      sys     1m1.984s
>>
>>    - After upgrade
>>      real    3m21.552s
>>      user    7m38.496s
>>      sys     1m0.644s
>>
>>     The are nearly the same
>>
>> * The "fsck -fn" shows the image is OK, and also can boot.
>>
>> [YOCTO #8622]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> [...]
>
>> -SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
>> -SRC_URI[sha256sum] =
>> "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad1241d82f2d041f2802"
>> +SRCREV = "0f26747167cc9d82df849b0aad387bf824f04544"
>> +PV = "1.43-WIP+git${SRCPV}"
>
> What happens when 1.43 is released? 1.43 < 1.43-WIP so we'd have to
> bump PE.
>
> Can we just call this 1.42+1.43-git${SRCPV}?

Thanks, good idea, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/e2fsprogs
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/e2fsprogs

Robert Yang (1):
   e2fsprogs: 1.42.9 -> 1.43 (master)

* Changes:
   - Use PV = "1.42+1.43-git${SRCPV}"

Another thing is that, though we use "1.42+1.43-git${SRCPV}", the rpm name is
e2fsprogs-1.42+1.43+git0+0f26747167-r0.aarch64.rpm, note, no "-" in PV, the
same to ipk.

// Robert

>
> I agree with moving to this btw, I just don't like the idea of "WIP" in
> the version string and we need to keep upgrade paths in mind.
>
> Cheers,
>
> Richard
>

