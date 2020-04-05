Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.14559.1586080615177753118
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 02:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gbLw2cxM;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id q5so9329413lfb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nGE6TwkNFEUxfF+H1u+8Y9peqHp2JhDkk9aD30S7T+Y=;
        b=gbLw2cxMEAdlStIjcr+N7ZO9YcfIhN0Akxgv20xahWVtqSJV605b0XGlu01AIBNrFx
         sD8Llo6oz83PH4z1QHtoAdmVqevbhMNymR1hoEFBHv8WS9bsK0O4seDeWznUZ6pN21Lk
         HJKJ10wtayhST2BZmyf0Kv0Y7a2oRQDpbKD1jK+y4WmQVZALSNv0OJO79ePr7g/Y/ik4
         O6jwM2fhi+43Qj7EL7qlubG3gZlq8agyz7kEDlizEcuca3ODAvQ4MrisIAKh3Pu1a91P
         bh0/Kwjt9HUe9Uz4cZVawzgJe04n/q3gQn32GSlw5DIwbGSMZj1HzNcDYYAJ4UoEN11I
         0qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGE6TwkNFEUxfF+H1u+8Y9peqHp2JhDkk9aD30S7T+Y=;
        b=KDU6ahesHv+y1/zdBLvqXxMAz0rXdfiFwjAInt9zbwFOYFZPqj0CrWKcwukBd6i/ku
         Yr96Iiczt0j5tRKjZQW82tBK5qgL7SP0HVn5cgDpZyMHRnEQgtH5RcB8UCQb71iWaXcn
         0wInYf3FiP3F2d08rQ0RZLOl9w8WpWEnlsggGsezJZQUWo/Q1cVxVoge2v7s7dx+watt
         qcb4102UsoSSU1i38kFEsPOn660v/DaSS3E5w2gI5ajJ+Y5RCNfeaw/XePNvLq8BFME/
         EOfApyD7/MTQrm824YtbtQZwrzGXG5BBRIYMBiSlDU4GhRRUHGLufM/QmLhtXYVgNpPB
         PfWA==
X-Gm-Message-State: AGi0PuYsbfEKLcpB8bHB55mgOk5zqOSvN6HgKrahq7N4sUksL51dgK6j
	VBBOGMgxfIR+rgbhc2KY52sJj3q7agMGYn3KSxI=
X-Google-Smtp-Source: APiQypLl5/Eo1Z3X4zOsZtSoSRKByxxHoqaL1iqq1DuLzWlsbdg9njiMkMWWxshvy2yvo8l/ocmHmDTgsl8EcHdYPTE=
X-Received: by 2002:ac2:5622:: with SMTP id b2mr10515992lff.128.1586080613145;
 Sun, 05 Apr 2020 02:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
 <1602DB74B6717A3F.2403@lists.openembedded.org>
In-Reply-To: <1602DB74B6717A3F.2403@lists.openembedded.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sun, 5 Apr 2020 11:56:36 +0200
Message-ID: <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

I have tried with master  (0c91fcba446418ad1f71d3df9aa3b186bbd353c7) +
my two patches.
Then I have used crops/poky:fedora-30

and: oe-selftest  --run-tests wic.Wic.test_exclude_path oe-selftest
--run-tests wic.Wic.test_include_path wic.Wic.test_exclude_path

With an OK result :(
[pokyuser@fac53302a692 build]$ oe-selftest  --run-tests
wic.Wic.test_exclude_path oe-selftest  --run-tests
wic.Wic.test_include_path
2020-04-05 07:40:50,186 - oe-selftest - INFO - Adding layer libraries:
2020-04-05 07:40:50,186 - oe-selftest - INFO - /workdir/meta/lib
2020-04-05 07:40:50,186 - oe-selftest - INFO - /workdir/meta-selftest/lib
2020-04-05 07:40:50,187 - oe-selftest - INFO - Running bitbake -e to
test the configuration is valid/parsable
2020-04-05 07:40:52,149 - oe-selftest - INFO - Adding: "include
selftest.inc" in /workdir/build/conf/local.conf
2020-04-05 07:40:52,150 - oe-selftest - INFO - Adding: "include
bblayers.inc" in bblayers.conf
2020-04-05 07:40:52,150 - oe-selftest - INFO - test_include_path (wic.Wic)
2020-04-05 09:04:12,656 - oe-selftest - INFO - Keepalive message
2020-04-05 09:29:51,214 - oe-selftest - INFO -  ... ok
2020-04-05 09:29:51,230 - oe-selftest - INFO -
----------------------------------------------------------------------
2020-04-05 09:29:51,230 - oe-selftest - INFO - Ran 1 test in 6539.080s
2020-04-05 09:29:51,231 - oe-selftest - INFO - OK
2020-04-05 09:29:52,869 - oe-selftest - INFO - RESULTS:
2020-04-05 09:29:52,870 - oe-selftest - INFO - RESULTS -
wic.Wic.test_include_path: PASSED (6539.07s)
2020-04-05 09:29:52,874 - oe-selftest - INFO - SUMMARY:
2020-04-05 09:29:52,875 - oe-selftest - INFO - oe-selftest () - Ran 1
test in 6540.086s
2020-04-05 09:29:52,875 - oe-selftest - INFO - oe-selftest - OK - All
required tests passed (successes=1, skipped=0, failures=0, errors=0)

I will start a test with mater-next + my two patches. Hopefuly I can
replicate the bug.

It is a bit weird that only crashes on fedora and not on the other distros :S


Thanks again

On Sun, Apr 5, 2020 at 9:21 AM Ricardo Ribalda via
lists.openembedded.org
<ricardo.ribalda=gmail.com@lists.openembedded.org> wrote:
>
> Hi Richard
>
> It looks pretty much related to my patch. Will try to replicate locally and fix it.
>
> Thanks!
>
> On Sun, 5 Apr 2020, 09:01 Richard Purdie, <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Wed, 2020-03-04 at 15:49 +0100, Ricardo Ribalda Delgado wrote:
>> > When parameters include_path or exclude_path are passed to the rootfs
>> > plugin, it will copy the partition content into a folder and make all
>> > the modifications there.
>> >
>> > This is done using copyhardlinktree(), which does not take into
>> > consideration the content of the pseudo folder, which contains the
>> > information about the right permissions and ownership of the folders.
>> >
>> > This results in a rootfs owned by the user that is running the wic
>> > command (usually UID 1000), which makes some rootfs unbootable.
>> >
>> > To fix this we copy the content of the pseudo folders to the new
>> > folder
>> > and modify the pseudo database using the "pseudo -B" command.
>> >
>> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
>> > ---
>> >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
>> >  1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> I added these two changes to -next but we're seeing a test failure on
>> Fedora, twice now:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/834
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/831
>>
>> I suspect its related to these patches but haven't confirmed that as
>> yet...
>>
>> Cheers,
>>
>> Richard
>>
>>
> 



-- 
Ricardo Ribalda
