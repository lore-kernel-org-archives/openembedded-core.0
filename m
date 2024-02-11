Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D360C4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 18:22:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.42403.1707675754965545521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 10:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wbh7gHIA;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33b18099411so1440794f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 10:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707675753; x=1708280553; darn=lists.openembedded.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7wjK1uRS5skvAt/9UThUbDI24ZPFbqvftUaZqosmzM=;
        b=Wbh7gHIA7hZdgIcNorvrs35n2c/EEZAcSkLE/ACuWtT8oHo5BsIJ8SHAIdFEnN/zA5
         bat0lCd6tv4l37wSejX3UYDsODsF1MX4fFe57I3lBoxiUAywzl288VYRafSgKa2051mU
         o/OEJmqB5AK/7r8JM59bvwrs/b/S4gIRAAdjCLWKYfVk1bxEw/d0ttzqLDuXNNstACW4
         aatJSKNlx5PxQw4pZvHPFO7A3BSutyozRSoFNye3Anjwa6/wCYUEXt+2W0giuqz3OUb6
         Js4xIGYIzE/pMOlSUDHQxPGiFrDuWFy10yDhTIhNnTQrAB6rQQkC1szPdY8cXiZzCazm
         xhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707675753; x=1708280553;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C7wjK1uRS5skvAt/9UThUbDI24ZPFbqvftUaZqosmzM=;
        b=W6FAnDY2X/Vy3iJawqnhq6bLYrY5PELwf9zqTFDEixfu+ddF7UEQA94zpMZsrAra9e
         ygn7GdoTe0s9msVIYnvyXAw8nRQFoHGvj6MNQvjL/KrOza0QtaUMmNLJBkTodV97tIks
         nwRXPbyrqCmG2NGAFg3JoCjJxLQaSxxIBrylP/XEBJjyVTA3wPyf+g5bwdBxa6E0T/d4
         FPGDdYtZ5waYvNrZ+kYW8fht5fF0A6sBxnqnAkdlHGRq8B5ZpA2g531qoa4kpVDT9SIn
         JSmswGvdJUK/YNwk0Y1mYeZ1LeJZzYgVn3fUlcgUv4kkXL3M3Va5i4b3crvKr6n/4/tr
         J9NA==
X-Gm-Message-State: AOJu0Yx+dxPwSl4PLIbGgxELuZAsSWVYx8XQUCrpvRHmPJuT8ViLZva6
	JPorX67mAUSc4yBBXa1mJWNV6+LInhbq44nH8FtGLFVpowMFc1yt
X-Google-Smtp-Source: AGHT+IGF2sOVcMY1wFN538zP+j0YsfOEnGR5NNsJZsWezRDdcmfF+l2iLLNkWcocIPlzUXWMsufFtw==
X-Received: by 2002:a5d:5229:0:b0:33a:edab:9e8e with SMTP id i9-20020a5d5229000000b0033aedab9e8emr3754099wra.33.1707675752770;
        Sun, 11 Feb 2024 10:22:32 -0800 (PST)
Received: from [10.139.5.196] ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id k14-20020a056000004e00b0033afc81fc00sm4743945wrx.41.2024.02.11.10.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 10:22:32 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------WmViho7psg9aiMjbE7MU3Lcg"
Message-ID: <33d0888f-281c-4bc1-8a03-3bc3fcd182d6@gmail.com>
Date: Sun, 11 Feb 2024 19:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] overlayfs-etc: take read-only-rootfs into account
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>
Cc: openembedded-core@lists.openembedded.org
References: <391a7b90f3cb6a7b276904b69a2251bf0d3849c9.1707376966.git.baruch@tkos.co.il>
 <5066577e-7447-4f4f-8212-7729a3ada8ba@gmail.com> <87cyt35dcy.fsf@tarshish>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <87cyt35dcy.fsf@tarshish>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 18:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195296

This is a multi-part message in MIME format.
--------------WmViho7psg9aiMjbE7MU3Lcg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.02.2024 14:23, Baruch Siach wrote:
> As I understand, the point of read-only-rootfs feature is to keep rootfs
> intact. Filesystems like squashfs or erofs don't support rw mount at
> all. How can we support this use case?

That's a really good question. I assume we need to differentiate here 
the ro rootfs just because it's set this way in fstab, or ro rootfs, 
which doesn't support writing at all. For the latter you still need all 
your directories already created in the image (squashfs, erofs) or you 
would mount it in some location on tmpfs. Point is, mount point has to 
exist. I suggest we follow the similar approach like in 
overlayfs.bbclass, i.e. we add a flag, which can be used to skip 
directory creation for this use case. Please use 'false' as a default, 
so existing users don't have to change anything when they upgrade their 
Yocto version.

>> With this patch overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_preinit
>> fails:
>>
>> 2024-02-08 21:12:40,616 - oe-selftest - INFO - Traceback (most recent call
>> last):
>>    File
>> "/home/uvv/projects/upstream/poky/meta/lib/oeqa/core/decorator/__init__.py",
>> line 35, in wrapped_f
>>      return func(*args, **kwargs)
>>    File
>> "/home/uvv/projects/upstream/poky/meta/lib/oeqa/selftest/cases/overlayfs.py",
>> line 370, in test_sbin_init_preinit
>>      self.run_sbin_init(False)
>>    File
>> "/home/uvv/projects/upstream/poky/meta/lib/oeqa/selftest/cases/overlayfs.py",
>> line 399, in run_sbin_init
>>      self.assertTrue("/data" in output, msg=output)
>> AssertionError: False is not true : /dev/sda2 on / type ext4 (ro,relatime)
> Where is this /dev/sda2 coming from? I have also seen it in my
> /etc/fstab once I enabled the overlayfs-etc feature. I see no mention of
> sda2 in meta/lib/oeqa/selftest/cases/overlayfs.py.

The test actually expects sda3 as overlay partition. The partitions are 
created by means of wic, the configuration is in 
https://git.openembedded.org/openembedded-core/tree/meta-selftest/wic/overlayfs_etc.wks.in 
, and pulled in by WKS_FILE in meta/lib/oeqa/selftest/cases/overlayfs.py.

Perhaps we could extend test coverage for your use case by parametrizing 
wks.in file further and placing rootfs on squashfs partition? I haven't 
checked TBH whether wic supports it :)
>> The test is not really explicit, but it looks like overlay is not mounted. We
>> could also add a generic test to search for "PREINIT" done/failed.
> How can I run this test?

Use this command:
oe-selftest -r overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_preinit

Check also this link https://wiki.yoctoproject.org/wiki/Oe-selftest and 
prepare your environment first


Cheers,
Slava

>
> Thanks,
> baruch

--------------WmViho7psg9aiMjbE7MU3Lcg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11.02.2024 14:23, Baruch Siach
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87cyt35dcy.fsf@tarshish">
      <pre class="moz-quote-pre" wrap="">As I understand, the point of read-only-rootfs feature is to keep rootfs
intact. Filesystems like squashfs or erofs don't support rw mount at
all. How can we support this use case?</pre>
    </blockquote>
    <br>
    That's a really good question. I assume we need to differentiate
    here the ro rootfs just because it's set this way in fstab, or ro
    rootfs, which doesn't support writing at all. For the latter you
    still need all your directories already created in the image
    (squashfs, erofs) or you would mount it in some location on tmpfs.
    Point is, mount point has to exist. I suggest we follow the similar
    approach like in overlayfs.bbclass, i.e. we add a flag, which can be
    used to skip directory creation for this use case. Please use
    'false' as a default, so existing users don't have to change
    anything when they upgrade their Yocto version.<br>
    <br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:87cyt35dcy.fsf@tarshish">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">With this patch overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_preinit
fails:

2024-02-08 21:12:40,616 - oe-selftest - INFO - Traceback (most recent call
last):
  File
"/home/uvv/projects/upstream/poky/meta/lib/oeqa/core/decorator/__init__.py",
line 35, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/uvv/projects/upstream/poky/meta/lib/oeqa/selftest/cases/overlayfs.py",
line 370, in test_sbin_init_preinit
    self.run_sbin_init(False)
  File
"/home/uvv/projects/upstream/poky/meta/lib/oeqa/selftest/cases/overlayfs.py",
line 399, in run_sbin_init
    self.assertTrue("/data" in output, msg=output)
AssertionError: False is not true : /dev/sda2 on / type ext4 (ro,relatime)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Where is this /dev/sda2 coming from? I have also seen it in my
/etc/fstab once I enabled the overlayfs-etc feature. I see no mention of
sda2 in meta/lib/oeqa/selftest/cases/overlayfs.py.</pre>
    </blockquote>
    <br>
    The test actually expects sda3 as overlay partition. The partitions
    are created by means of wic, the configuration is in
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta-selftest/wic/overlayfs_etc.wks.in">https://git.openembedded.org/openembedded-core/tree/meta-selftest/wic/overlayfs_etc.wks.in</a>
    , and pulled in by WKS_FILE in
    meta/lib/oeqa/selftest/cases/overlayfs.py.<br>
    <br>
    Perhaps we could extend test coverage for your use case by
    parametrizing wks.in file further and placing rootfs on squashfs
    partition? I haven't checked TBH whether wic supports it :)<br>
    <span style="white-space: pre-wrap">

</span>
    <blockquote type="cite" cite="mid:87cyt35dcy.fsf@tarshish">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The test is not really explicit, but it looks like overlay is not mounted. We
could also add a generic test to search for "PREINIT" done/failed.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How can I run this test?</pre>
    </blockquote>
    <br>
    Use this command:<br>
    oe-selftest -r
    overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_preinit<br>
    <br>
    Check also this link <a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Oe-selftest">https://wiki.yoctoproject.org/wiki/Oe-selftest</a>
    and prepare your environment first<br>
    <br>
    <br>
    Cheers,<br>
    Slava<br>
    <br>
    <blockquote type="cite" cite="mid:87cyt35dcy.fsf@tarshish">
      <pre class="moz-quote-pre" wrap="">

Thanks,
baruch
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------WmViho7psg9aiMjbE7MU3Lcg--

