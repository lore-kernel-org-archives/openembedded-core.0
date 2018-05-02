Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD1774801
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 18:18:55 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h4-v6so22267299lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 11:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o6gMfM6xeeAWMNNlEhIwASqraoaXmS4mpaVZ1hHMFnE=;
	b=D94agP3CXlEccqZ1ZODHgKE1Agzc9H/PqiXFB4XPYcGkLQQK9O2T1qXRPsebxzBxe9
	ZlUoXBR5GL9AKS2g/XSIVj2V93526dqhyLQECHmx+arC4TzsRGLSXQvjkNDsOp0CVHrS
	n+jRTtCjM45Ksd+1++GCZwjvpbwlQHNI3UYPNxgc4/bDgc3mw2bWXtLlCLXw6vsjzuco
	x44G4RMri7zrKIH02Mv8wau294nFMKkk4gk16gjnz9KmQ4NO1LoUDL3szyDymHNlwX1N
	JcSEkMDNOt9TbbpYE7HgVmQp6r0qjfNueH+zfHtVzZTd77neJaxz1HV4NZQqbfDEIhga
	79+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o6gMfM6xeeAWMNNlEhIwASqraoaXmS4mpaVZ1hHMFnE=;
	b=KmX26qHpu69VPriL4nRiTQcmyGIeb38tsIHWhAAJQqC6fhVqD2/2ky0bQQfUw9mH6j
	F60gJFCReeo5EvWlvAxc7lUQETZCb8TbQjNRp6ZL3wV0vfRqv3RIpLixoJM1BZGBi/z/
	P6zMICrBhqIxLXRT1o2okDEaPqNh7ZshirRtBm/jC7M+h6bx7xFUvIh30cYEI4XLAFz+
	UiVa6+jaODwgSfP/E6YQKT2DcEoh4U+mST7zSyBbHBjSMkRjeq46VvpNoJUKPqOaIrBm
	vRCw3iuqygEzZ3B7EoP3zgADwU0Og8vBfrHHzX9FvwRawSN+ERLv9UKE5hOM+A1iP2/K
	XkzA==
X-Gm-Message-State: ALQs6tDoBn+Qa9+TqlcMnFXnHy4aE2f5RRKce79jl5U1HntYLD/lO2HD
	O2yT6O5EfQswbMpMaJUADiOXe8gSH+ZYwo1XYAY=
X-Google-Smtp-Source: AB8JxZq/6GYFLFhRuMB848oLQHznZpKK/Lmxw2Rqdy8FPxUtw+mroFkBpP9jRyAIYm/aEBpPkBMefutkfOzJFbLdwDg=
X-Received: by 2002:a2e:760a:: with SMTP id
	r10-v6mr13690450ljc.144.1525285135926; 
	Wed, 02 May 2018 11:18:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:6a0e:0:0:0:0:0 with HTTP;
	Wed, 2 May 2018 11:18:35 -0700 (PDT)
In-Reply-To: <CAFNP8OsxZhjztMnAxxqBoNKENaPYB+eYov5Lq-b5RPyXcYLrTQ@mail.gmail.com>
References: <9536e25b-bbf9-8c21-e44a-c96dd79a848c@digitalendoscopy.de>
	<83aa6f73-2835-4b53-621b-4b9fd3b66b15@digitalendoscopy.de>
	<CAPybu_1RMqH4q96Xm6ekNarz015++49Yu4sSP1SMcj1Yn3D-5A@mail.gmail.com>
	<7e87091c-4989-0383-8bf3-7b9acb805ef8@digitalendoscopy.de>
	<CAFNP8OsxZhjztMnAxxqBoNKENaPYB+eYov5Lq-b5RPyXcYLrTQ@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 2 May 2018 20:18:35 +0200
Message-ID: <CAPybu_0Qv34jbUdm6HQG_b6Oa9yOgnpkGcqoCkvTCB9fFwEqZw@mail.gmail.com>
To: Scott Rifenbark <srifenbark@gmail.com>
Cc: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Question about multi rootfs UIDs when using wic
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
X-List-Received-Date: Wed, 02 May 2018 18:18:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Scott

In this case I believe that it is a bug in wic, for no reason the user
id of bitbake should be leaked into the rootfs.

Regards

On Wed, May 2, 2018 at 6:44 PM, Scott Rifenbark <srifenbark@gmail.com> wrote:
> Hi,
>
> I have a couple Wic-related areas in the Yocto documentation.  Wondering if
> this affects documentation.  I don't particularly have sections dedicated to
> using specific canned wic files such as the "directdisk-multi-rootfs" file.
> However, if there is some mentioning or changing of the docs to help avoid
> this I could see what I could do.
>
> The sections related to Wic are:
>
>    *
> https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#creating-partitioned-images-using-wic
>    *
> https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#ref-kickstart
>
> Thanks,
> Scott
>
> On Wed, May 2, 2018 at 9:31 AM, Volker Vogelhuber
> <v.vogelhuber@digitalendoscopy.de> wrote:
>>
>> Hi,
>>
>> I never got any response to my message (until now). So AFAIK I solved the
>> problem with the following patch:
>>
>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
>> index 84fe85d62b..66ab757aec 100644
>> --- a/scripts/lib/wic/partition.py
>> +++ b/scripts/lib/wic/partition.py
>> @@ -204,15 +204,10 @@ class Partition():
>>
>>          Currently handles ext2/3/4, btrfs and vfat.
>>          """
>> -        p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" %
>> native_sysroot)
>> -        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
>> -                                         "%s/../pseudo" %
>> get_bitbake_var("IMAGE_ROOTFS"))
>> -        p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
>> +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
>> +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" %
>> self.rootfs_dir
>> +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
>>          p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
>> -        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
>> -        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % p_localstatedir
>> -        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
>> -        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
>>          pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
>>
>>          rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
>>
>>
>>
>> On 02.05.2018 17:51, Ricardo Ribalda Delgado wrote:
>>>
>>> Hi
>>>
>>> I just got hit by this one. It is specially nasty because nfsroot
>>> fails to boot if the uids are wrong.
>>>
>>> What is the status on this?
>>>
>>> On Mon, Jan 22, 2018 at 11:39 AM, Volker Vogelhuber
>>> <v.vogelhuber@digitalendoscopy.de> wrote:
>>>>
>>>> I finally found out, what's the reason why the included recovery rootfs
>>>> has
>>>> the wrong UIDs, while the main image has the correct one. The reason
>>>> seems
>>>> to be the PSEUDO_LOCALSTATEDIR variable that is set to the state dir of
>>>> the
>>>> main image in both cases.
>>>> I debugged all the calls up to the environment setup in partition.py's
>>>> prepare_rootfs method where a check for an existing PSEUDO_LOCALSTATEDIR
>>>> environment variable is done. That seems to be the problem.
>>>> Instead of using the correct value passed to the prepare_rootfs method,
>>>> an
>>>> existing ENV value is used that points to the state dir of the main
>>>> image
>>>> instead of the recovery one's. I guess the reason is that in
>>>> bitbake.conf
>>>> the PSEUDO_LOCALSTATEDIR is set to the image currently build (which is
>>>> the
>>>> main image and not the recovery image only referenced by the main
>>>> image). So
>>>> because that environment variable is already set, the call to mkfs.ext4
>>>> for
>>>> the recovery image uses the wrong PSEUDO_LOCALSTATEDIR and does not
>>>> apply
>>>> the correct UID.
>>>>
>>>> Any ideas how to fix that? I tend to just remove the patch introduced by
>>>> Ed
>>>> Bartosh three years ago
>>>> (https://patchwork.openembedded.org/patch/90419/)
>>>> because I don't need a custom PSEUDO_PREFIX. But maybe not everyone
>>>> agrees.
>>>>
>>>> On 19.01.2018 17:00, Volker Vogelhuber wrote:
>>>>>
>>>>>
>>>>> I'm currently trying to create a multi RootFS WIC image as mentioned in
>>>>> directdisk-multi-rootfs.wks. For that I have two image recipes. One
>>>>> that
>>>>> is creating only an ext4 image (image-recovery), and the second that is
>>>>> also
>>>>> creating a WIC image (image-main). I used the IMAGE_FSTYPES variable
>>>>> for
>>>>> that. The WKS file for the second image is integrating the recovery
>>>>> image by
>>>>> specifying --rootfs-dir=image-recovery in it's part description.
>>>>>
>>>>> # primary / recovery image
>>>>> part / --source rootfs --rootfs-dir=image-main --exclude-path mnt/data/
>>>>> mnt/data2/ --fstype=ext4 --label primary_rootfs --align 1024 --size 700
>>>>> --overhead-factor=1.0
>>>>> part /recovery --source rootfs --rootfs-dir=image-recovery
>>>>> --fstype=ext4
>>>>> --label recovery_rootfs --align 1024 --size 640 --overhead-factor=1.0
>>>>>
>>>>> The UIDs of the second rootfs (image-main) are correctly set to 0
>>>>> within
>>>>> the file system when calling mkfs.ext4 during prepare_rootfs_ext. For
>>>>> the
>>>>> recovery rootfs the UID is always set to my own (host) one which is of
>>>>> course not valid for the image where that UID does not exist.
>>>>> I tried calling the mkfs.ext4 command myself from a terminal and for
>>>>> whatever reason an image created out of the rootfs folder of the second
>>>>> image (image-main) recipe is deployed with the correct UID 0, while the
>>>>> rootfs folder of the first image (image-recovery) recipe always uses
>>>>> the UID
>>>>> of the source folder/files.
>>>>>
>>>>> I search the code of e2fsprogs for the line that sets the UID and added
>>>>> a
>>>>> printf in set_inode_extra. There I can see clearly that the source UID
>>>>> for
>>>>> the file is 0 for the rootfs of the image-main rootfs folder while it
>>>>> is
>>>>> 10000 (my own UID) for the image-recovery. I wonder how the UID of the
>>>>> image-main rootfs folder can be zero when I don't call any command with
>>>>> root
>>>>> permissions. I searched for a preparation step where the UIDs are
>>>>> managed in
>>>>> the scripts folder of Yocto, but didn't found any hint for the whole
>>>>> behavior. So while it is good that the rootfs partition of the main
>>>>> rootfs
>>>>> has the UID set correctly to zero, I can't understand why it happens.
>>>>> On the
>>>>> other side I can understand why the UID of the recovery rootfs is set
>>>>> to my
>>>>> own one, but it stops me from booting that rootfs because the UIDs of
>>>>> the
>>>>> files and folders are set to a user that does not exist on the target
>>>>> system.
>>>>>
>>>>> Can someone please explain to me, how that UID handling is meant to be
>>>>> done?
>>>>
>>>>
>>>>
>>>> --
>>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>



-- 
Ricardo Ribalda

