Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id C4E5C605F1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 16:15:11 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so18846007igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BLSrIOqUqnE3XBUO4taien+wAG8SzHHj6t+oM9nJXxs=;
	b=Wm2AjSfCCWyWYFvvowM+P6PvHFsSwS46uizuJRrmF0aNMD5ADgFt5ogvvWma+VLHYi
	A9JbyY8CyyDwXfNqo0FbqAavitHMw0IFqlIU5b28KpAKoduRyYK3j148ndJ3NINjcOr2
	RIwPJQ9Le8wuscewZ8Vtx5ltoQsh3vaM8GBfe1iw61WCwIcI7uFD73Puwf57khGmkoqm
	iznfUIqLjiKr4qvY/w1/FqesrZnK6g6jhLblmTCj2GDNLqe5QrS0NbkuC8G3aA5h+ozM
	gidKvg7HnpVuRktnwriFlkUwHcb7EtayUs7VvurkK190qe8lRQIVPiGpD5Lh6zprFis2
	fb9Q==
X-Received: by 10.50.111.233 with SMTP id il9mr5734199igb.13.1428768912469;
	Sat, 11 Apr 2015 09:15:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Sat, 11 Apr 2015 09:14:42 -0700 (PDT)
In-Reply-To: <CA+chaQdK9RAWt_Gcv0QSRL913bDkFN1y22pAe8dVNu-V9jhWbA@mail.gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
	<9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
	<c8117308ef5d12d8bdeb088d2bea4dff4bb686ff.1428714999.git.raj.khem@gmail.com>
	<CA+chaQe1WeSN3pCy3=jzb8x3PZmJ_LdDMtkkzxCrVE9ibZJnOQ@mail.gmail.com>
	<CAMKF1sqtJ2H0KAOHkz=qYczFOb2_AUX3eb5EQWSiR2HsZPXCxg@mail.gmail.com>
	<CA+chaQdK9RAWt_Gcv0QSRL913bDkFN1y22pAe8dVNu-V9jhWbA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Apr 2015 09:14:42 -0700
Message-ID: <CAMKF1sq57xpsqnBE+VPWjTSCEbf8c5n7tpsPSkDmQnHYqiD2mw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <khem_raj@cable.comcast.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/17] e2fsprogs: Delete identical binaries and create symlinks instead
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
X-List-Received-Date: Sat, 11 Apr 2015 16:15:12 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Apr 11, 2015 at 8:28 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> does it cover e2label as well
>
> yes it does
>

OK thx

> On Sat, Apr 11, 2015 at 5:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Saturday, April 11, 2015, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>> There is configure option for this, see my pending e2fsprogs patch from
>>> Friday.
>>>
>> Saw it now. Looks good  does it cover e2label as well
>>>
>>>
>>> On Sat, Apr 11, 2015 at 3:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> Here is what build history tells now
>>>>
>>>> e2fsprogs-tune2fs:
>>>>
>>>> -PKGSIZE = 144336
>>>> +PKGSIZE = 72175
>>>>
>>>> e2fsprogs-e2fsck:
>>>>
>>>> -PKGSIZE = 1345500
>>>> +PKGSIZE = 269124
>>>>
>>>> e2fsprogs-mke2fs:
>>>>
>>>> -PKGSIZE = 551316
>>>> +PKGSIZE = 111036
>>>>
>>>> Change-Id: I0902484ad506d892292c4bea6789467179b5ea8d
>>>> Signed-off-by: Khem Raj <khem_raj@cable.comcast.com>
>>>> ---
>>>>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>>> index 66065bc..e6ff5f9 100644
>>>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>>> @@ -43,6 +43,9 @@ do_install () {
>>>>         rm -f ${D}${base_sbindir}/blkid
>>>>         rm -f ${D}${base_sbindir}/fsck
>>>>         rm -f ${D}${base_sbindir}/findfs
>>>> +       rm -f ${D}${base_sbindir}/mkfs.ext*
>>>> +       rm -f ${D}${base_sbindir}/fsck.ext*
>>>> +       rm -f ${D}${base_sbindir}/e2label
>>>>
>>>>         # e2initrd_helper and the pkgconfig files belong in libdir
>>>>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>>>> @@ -50,6 +53,11 @@ do_install () {
>>>>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
>>>>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
>>>>         fi
>>>> +       for ext in ext2 ext3 ext4 ext4dev; do
>>>> +               ln -sf mke2fs ${D}${base_sbindir}/mkfs.${ext}
>>>> +               ln -sf e2fsck ${D}${base_sbindir}/fsck.${ext}
>>>> +       done
>>>> +       ln -sf tune2fs ${D}${base_sbindir}/e2label
>>>>
>>>>         oe_multilib_header ext2fs/ext2_types.h
>>>>         install -d ${D}${base_bindir}
>>>> --
>>>> 2.1.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>
>
>

