Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id C53FB601C7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:31:56 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id w69so1971982ilk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=VfkeAWGOzgZf2QycmyRU8g6ZZp8toF+hEGmGNFXTE+w=;
	b=eDkg6PEs8mYswedaGO2bxJymZdv1HelFAB9Ua6YHpfYrpfjjMldUKPzgwohicSLaS0
	gv29nizTxADhIfcZICNz/E9BYp5LGmXgaUwjrhnkEzlRROBsLeiLKa+HJXYB09f3cg1o
	KymYu0O4BmHsYXsRu1RmbGuYKicaVvp3Y5eoGsEfuEovjvYmQM9THcM7vKdzMAshpCyL
	Czk4aTkTyY3ZLzRxDdRU76hZGzytjTLCtJIG8wo5BuWTlBzKy0/PqcEoFfdhgVIl0Hqg
	fihOastl6b8pPlLSrD6aldl1hGilaPTH1yGzdO7QxK1ie+NzllCB5CXG6QAQZRox3QKN
	d3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=VfkeAWGOzgZf2QycmyRU8g6ZZp8toF+hEGmGNFXTE+w=;
	b=Kf77PvEL09AEByII4WXF8JkBwfnVtipFiQ6tdHmAophdtt0CqoB0o8PRfmvy0iLtU2
	X3vShsURHRpLMk+e4TrikL7eA20ql1meSfT6ygN6SDT12CSMnB3SGS08az2pbgOlkCOn
	kYxfaP9jFyyD1vOFnqcYUlOIL3Bs7U+947HOlFxm7/7mfmxnFvNGXu+707Hw9Hw6QOYk
	pfB7pQAccUAMsPoO9XxD7Xf2mk/UUU9b/HdtMateAI0L7u93XHMLLg89Mi/mzZZI64bX
	fipRgelHtqnHW/pGlRpwD46vM8czg+YJw4xOG6OKztuNBSwYVarB3VssKK3xaizcsNRW
	rPMg==
X-Gm-Message-State: ANhLgQ0K5c/DGmoIn9hYcVnlqfQRxna9bCFo4AcuiX0YBiKrnzgmBE8F
	p3P3UfZrV117A6xLWimg4VSzCo0/uws=
X-Google-Smtp-Source: ADFU+vuHS+7CHvXeus7DTib369xZbYgMqQr1Qoey8/B84fwq0f8uf6g2ou1oVfBQmCyH79y8bmpWVQ==
X-Received: by 2002:a92:c8cc:: with SMTP id c12mr3113572ilq.6.1583332317152;
	Wed, 04 Mar 2020 06:31:57 -0800 (PST)
Received: from [10.30.196.58] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id z15sm2478890ioz.1.2020.03.04.06.31.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 06:31:56 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>,
	Paul Barker <pbarker@konsulko.com>
References: <20200304083438.1022216-1-ricardo@ribalda.com>
	<20200304083438.1022216-2-ricardo@ribalda.com>
	<20200304094250.3eda52e1@ub1910>
	<CAPybu_3Gno9FkfvKywooGQHh+5gQZL9iMq_MxnU93TX7Svh3aQ@mail.gmail.com>
	<20200304100855.637a61e1@ub1910>
	<CAPybu_1Wipne7Z0sdDTP25tjOy6nKM7tvV8D9HktkKx6sibv-w@mail.gmail.com>
	<CAPybu_1LkuwZMR6VK7qvfqd=3bQw3pi-+EhkmVw-s=ZRYw9Y-w@mail.gmail.com>
Message-ID: <872b6980-5810-7d8a-36b2-f53ae50df0a6@gmail.com>
Date: Wed, 4 Mar 2020 08:31:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPybu_1LkuwZMR6VK7qvfqd=3bQw3pi-+EhkmVw-s=ZRYw9Y-w@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] wic: Add --embed-rootfs argument
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
X-List-Received-Date: Wed, 04 Mar 2020 14:31:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/4/20 7:49 AM, Ricardo Ribalda Delgado wrote:
> Hi Paul
>
> On Wed, Mar 4, 2020 at 11:14 AM Ricardo Ribalda Delgado
> <ricardo@ribalda.com> wrote:
>> Hi Paul
>>
>> On Wed, Mar 4, 2020 at 11:09 AM Paul Barker <pbarker@konsulko.com> wrote:
>>> On Wed, 4 Mar 2020 10:56:20 +0100
>>> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>>>
>>>> Hi Paul
>>>>
>>>> Thanks for your reply
>>>>
>>>> On Wed, Mar 4, 2020 at 10:43 AM Paul Barker <pbarker@konsulko.com> wrote:
>>>>> On Wed,  4 Mar 2020 09:34:38 +0100
>>>>> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>>>>>
>>>>>> This option adds the content of a rootfs on a specific location on the
>>>>>> rootfs.
>>>>>>
>>>>>> It is very useful for making a partition that contains the rootfs for a
>>>>>> host and a target Eg:
>>>>>>
>>>>>> / -> Roofs for the host
>>>>>> /export/ -> Rootfs for the target (which will netboot)
>>>>>>
>>>>>> Although today we support making a partition for "/export" this might
>>>>>> not be compatible with some upgrade systems, or we might be limited by
>>>>>> the number of partitions.
>>>>>>
>>>>>> With this patch we can use something like:
>>>>>>
>>>>>> part / --source rootfs --embed-rootfs=target-image:/export
>>>>> I considered using a syntax like this for --include-path but I chose not to
>>>>> as it's not easy to choose a separator. ':' is a valid character in a
>>>>> directory name.
>>>> I think we have to live with not being able to copy files to a
>>>> directory with a colon :(
>>> I wouldn't like to place a limitation like that on users and I'd like to
>>> avoid the proliferation of similar arguments here.
>>>
>>> How about modifying '--include-path' to take two arguments, a source path and
>>> a destination prefix? The python argument parser should be able to handle
>>> this and you can build a list of tuples (source_path, dest_prefix) when
>>> parsing the arguments.
>>>
>>> The '--include-path' argument hasn't been part of a Yocto release yet it's
>>> just on the master branch so I think if we're going to fix it with a breaking
>>> change, now is definitely the time.
>> That sounds good to me. I do not mind having two arguments. for
>> embed-rootfs. and probably will look better on include-path
> How do you think that the parameters should look like:
>
> --embed-rootfs target-image /export target-image2 /export2
> --embed-rootfs (target-image, /export) (target-image2, /export2)
>   ??

FWIW, it should probably end up looking like this:

  --embed-rootfs target-image /export --embed-rootfs target-image2 /export2

The python argparse snippet you would use for this would be something like:

  parser.add_argument('--embed-rootfs', nargs=2, action='append', 
default=(), help='...')


>
> Shall I change it for include-path and embed-rootfs or you want to
> take care of include-path?
>
>>>>> My approach is to handle this in two steps:
>>>>>
>>>>> 1) Add a new task before do_image_wic which creates an 'embedded-rootfs'
>>>>>    directory and copies 'target-image' to 'embedded-rootfs/export'.
>>>>>
>>>>> 2) Use '--include-path=embedded-rootfs' in the wks file.
>>>>>
>>>> The biggest problem with that approach is permissions. We need files
>>>> with UID 0, siticky bits, etc. We lose the pseudo database if we
>>>> simply copy to a folder.
>>>>
>>>> Also, if we have a complex system with multiple partitions I prefer to
>>>> handle all in a single .wks file instead of a script + wks file
>>>>
>>>>>> on the .wks file.
>>>>>>
>>>>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
>>>>>> ---
>>>>>>   scripts/lib/wic/help.py                  |  7 +++++++
>>>>>>   scripts/lib/wic/ksparser.py              |  1 +
>>>>>>   scripts/lib/wic/partition.py             |  1 +
>>>>>>   scripts/lib/wic/plugins/source/rootfs.py | 20 +++++++++++++++++++-
>>>>>>   4 files changed, 28 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
>>>>>> index 4d342fcf05..67a33e6a65 100644
>>>>>> --- a/scripts/lib/wic/help.py
>>>>>> +++ b/scripts/lib/wic/help.py
>>>>>> @@ -979,6 +979,13 @@ DESCRIPTION
>>>>>>                            copies. This option only has an effect with the rootfs
>>>>>>                            source plugin.
>>>>>>
>>>>>> +         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
>>>>>> +                         the given path to the resulting image. The option
>>>>>> +                         contains two fields, the roofs and the path, separated
>>>>>> +                         by a colon. The rootfs follows the same logic as the
>>>>>> +                         rootfs-dir argument. This option only has an effect
>>>>>> +                         with the rootfs source plugin.
>>>>>> +
>>>>>>            --extra-space: This option is specific to wic. It adds extra
>>>>>>                           space after the space filled by the content
>>>>>>                           of the partition. The final size can go
>>>>>> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
>>>>>> index 650b976223..d422e2a6bb 100644
>>>>>> --- a/scripts/lib/wic/ksparser.py
>>>>>> +++ b/scripts/lib/wic/ksparser.py
>>>>>> @@ -138,6 +138,7 @@ class KickStart():
>>>>>>           part.add_argument('--align', type=int)
>>>>>>           part.add_argument('--exclude-path', nargs='+')
>>>>>>           part.add_argument('--include-path', nargs='+')
>>>>>> +        part.add_argument('--embed-rootfs', nargs='+')
>>>>>>           part.add_argument("--extra-space", type=sizetype)
>>>>>>           part.add_argument('--fsoptions', dest='fsopts')
>>>>>>           part.add_argument('--fstype', default='vfat',
>>>>>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
>>>>>> index 2d95f78439..13857df82f 100644
>>>>>> --- a/scripts/lib/wic/partition.py
>>>>>> +++ b/scripts/lib/wic/partition.py
>>>>>> @@ -31,6 +31,7 @@ class Partition():
>>>>>>           self.extra_space = args.extra_space
>>>>>>           self.exclude_path = args.exclude_path
>>>>>>           self.include_path = args.include_path
>>>>>> +        self.embed_rootfs = args.embed_rootfs
>>>>>>           self.fsopts = args.fsopts
>>>>>>           self.fstype = args.fstype
>>>>>>           self.label = args.label
>>>>>> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
>>>>>> index 40419a64b3..16359601dc 100644
>>>>>> --- a/scripts/lib/wic/plugins/source/rootfs.py
>>>>>> +++ b/scripts/lib/wic/plugins/source/rootfs.py
>>>>>> @@ -80,7 +80,7 @@ class RootfsPlugin(SourcePlugin):
>>>>>>
>>>>>>           new_rootfs = None
>>>>>>           # Handle excluded paths.
>>>>>> -        if part.exclude_path or part.include_path:
>>>>>> +        if part.exclude_path or part.include_path or part.embed_rootfs:
>>>>>>               # We need a new rootfs directory we can delete files from. Copy to
>>>>>>               # workdir.
>>>>>>               new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
>>>>>> @@ -100,6 +100,24 @@ class RootfsPlugin(SourcePlugin):
>>>>>>               for path in part.include_path or []:
>>>>>>                   copyhardlinktree(path, new_rootfs)
>>>>>>
>>>>>> +            for embed in part.embed_rootfs or []:
>>>>>> +                [embed_rootfs, path] = embed.split(":")
>>>>>> +                #we need to remove the initial / for os.path.join to work
>>>>>> +                if os.path.isabs(path):
>>>>>> +                    path = path[1:]
>>>>>> +                if embed_rootfs in krootfs_dir:
>>>>>> +                    embed_rootfs = krootfs_dir[embed_rootfs]
>>>>>> +                embed_rootfs = cls.__get_rootfs_dir(embed_rootfs)
>>>>>> +                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
>>>>>> +                tar_cmd = "%s tar cpf %s -C %s ." % (cls.__get_pseudo(native_sysroot,
>>>>>> +                                                     embed_rootfs), tar_file, embed_rootfs)
>>>>>> +                exec_native_cmd(tar_cmd, native_sysroot)
>>>>>> +                untar_cmd = "%s tar xf %s -C %s ." % (cls.__get_pseudo(native_sysroot, new_rootfs),
>>>>>> +                                                      tar_file, os.path.join(new_rootfs, path))
>>>>>> +                exec_native_cmd(untar_cmd, native_sysroot,
>>>>>> +                                cls.__get_pseudo(native_sysroot, new_rootfs))
>>>>>> +                os.remove(tar_file)
>>>>>> +
>>>>> Why are you using an intermediate tar file here?
>>>> For the permissions :(
>>> Your previous patch handled this using 'pseudo -B'. It would be good to be
>>> consistent if possible - either use an intermediate tar file in all cases if
>>> it's necessary or use 'pseudo -B' in all cases.
>> Unfortunately, you cannot use pseudo -B in this case.
>>
>> You use pseudo -B when you move one pseudo-aware partition to
>> somewhere else. But now we are merging two pseudo-aware partitions.
>>
>> Also I would not use the intermediate tar on the first place because
>> it is a waste of space + cpu resources.  Copyhardlink is the right
>> tool
>>
>>
>>> --
>>> Paul Barker
>>> Konsulko Group
>>
>>
>> --
>> Ricardo Ribalda
>
>

