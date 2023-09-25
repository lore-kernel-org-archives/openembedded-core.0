Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084D1CD4853
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:17:55 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.68705.1695665867898662615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FwNE5U0P;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dc9c2b2b79so3219007fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695665867; x=1696270667; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4m9bE3zxTC0VxYsPlGdgikpyK3isD1oUrqzrOmUlIeU=;
        b=FwNE5U0P0wz5/lLaxq5oJTkQ4alMmmcheAIB8ndwevMY0GibSNdznLl/2OSgjR5hgH
         YDcaj7sjBd4eUXhMhrnGqaYduitBofpN3Q5Q7lDwfgZWVT+XcPF2+XMHWL9l+k+CP/+c
         gGufT1MGmeCeZChWzhjo/GeUJ6wRNLI97Ogshf+yCXycu4zgQyDAzT0wmKpZU5PmxwPo
         5ojnWDJczDC4D1n5uFcU4c7s+9WsuGSrhrvgxl8OQAFWi6bhN3li+8uAfqD8XZHhmxAM
         mwNUSD8meOYl3sWMi8YhWFCGHLXgjEtWjtTnEZqHiavrN8r77+IFqAjCPEAxOeOr7bZ7
         gxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665867; x=1696270667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4m9bE3zxTC0VxYsPlGdgikpyK3isD1oUrqzrOmUlIeU=;
        b=PkCZm8guUUJvD/QKqnVm8fX0QmDUUW02goNSk7koNQdon24WhntYr4NlOOTgqKKdL7
         QRbn0MQveGmqWcgV35XaPwKTBehM8hTDbx1Sac8awnwjwT+ZtMm6d/9cEfv14bOAu0ae
         KFUbqXRl0nOuBwz5Wv5FX4yC+mw9L+T5OgyGB5KCAIQeMXJXobd63+KYhsF3rkmPWSMA
         dDC0EAUVc3Aeio3FMedTuikn6emPlIm2V/+1Uh7SN8U7QWH2B9STNSY95MPZgxZF24vW
         LDoNv5ua/+fg8GR8+zWofrOFqXax0J9x/kyDGlMfCZGSzDpap+tC6Ot1dar8oJNXCwMg
         /A5w==
X-Gm-Message-State: AOJu0YzXVG1Exv3aao7OzIN8ESpAGjDwmImbPitv4WfeSG69pEGMhOuR
	IUhrlI4XJOc+TX0qrNSeQ3auQ3rVjL0dirEzmjg=
X-Google-Smtp-Source: AGHT+IHBt6uRZEohTWSwhbeZCuSWzxKhaFlrGQpIswf6nvm20n8dG2I8aXNnXMu1AnYuxeqhsN3cpcDJnemNCJZhhJU=
X-Received: by 2002:a05:6870:f689:b0:1b5:688b:5c24 with SMTP id
 el9-20020a056870f68900b001b5688b5c24mr7326361oab.32.1695665867034; Mon, 25
 Sep 2023 11:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <ab29cb4d-eb1f-d132-6818-9a09bea0d98b@amd.com>
In-Reply-To: <ab29cb4d-eb1f-d132-6818-9a09bea0d98b@amd.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 11:17:21 -0700
Message-ID: <CAMKF1spNh0=tz4rQVGfb_E8Eh3kR01KeDxYbrsM-QoYdDjzy9w@mail.gmail.com>
Subject: Re: [OE-core] beaglebone-yocto testimage ping timeout issue
To: sandeep.gundlupet-raju@amd.com
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>, 
	"steve@sakoman.com" <steve@sakoman.com>, mikko.rapeli@linaro.org, 
	"mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>, Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188209

core-image-minimal does not have ssh server in image so maybe start
with core-image-base or something or add
IMAGE_FEATURES +=3D "ssh-server-openssh package-management hwcodecs" to loc=
al.conf

you might need to prepare the target testing setup

especially TEST_TARGET_IP and TEST_SERVER_IP and TEST_TARGET
see - https://github.com/YoeDistro/yoe-distro/blob/master/conf/projects/vis=
ionfive2/config.conf#L18-L20

On Mon, Sep 25, 2023 at 10:23=E2=80=AFAM Sandeep Gundlupet Raju via
lists.openembedded.org
<sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org> wrote:
>
> Hi All,
>
> I'm running testimage for arm32(beaglebone-yocto, zynq-generic and
> microblaze targets) using master and I see ping timeout issue as shown
> below but I don't see this issue with ARM64 targets or qemuarm. Any help
> would be much appreciated.
>
> /scratch1/sandeepg/yocto/yp-master/build-ci-master  $ time
> MACHINE=3Dbeaglebone-yocto bitbake core-image-minimal -c testimage
> Loading cache: 100%
> |########################################################################=
###########################################################################=
############################|
> Time: 0:00:00
> Loaded 1812 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.6.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "arm-poky-linux-gnueabi"
> MACHINE              =3D "beaglebone-yocto"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D
> "4.2+snapshot-8815eefb0d6218661794a58008e1144a77d3394f"
> TUNE_FEATURES        =3D "arm vfp cortexa8 neon callconvention-hard"
> TARGET_FPU           =3D "hard"
> meta
> meta-poky
> meta-yocto-bsp       =3D "master:8815eefb0d6218661794a58008e1144a77d3394f=
"
>
> Initialising tasks: 100%
> |########################################################################=
###########################################################################=
#######################|
> Time: 0:00:00
> Sstate summary: Wanted 3 Local 0 Mirrors 0 Missed 3 Current 261 (0%
> match, 98% complete)
> NOTE: Executing Tasks
> QMP Available for connection at
> /scratch1/sandeepg/yocto/yp-master/build-ci-master/tmp/.pb069a_h
> QMP connected to QEMU at 09/25/23 11:06:10 and took 0.53 seconds
> QMP released QEMU at 09/25/23 11:06:10 and took 0.04 seconds from connect
> Test requires apt to be installed
> Traceback (most recent call last):
>    File
> "/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/lib/oeqa/runtime/ca=
ses/ping.py",
> line 25, in test_ping
>      output +=3D proc.communicate()[0].decode('utf-8')
>    File "/usr/lib/python3.10/subprocess.py", line 1141, in communicate
>      stdout =3D self.stdout.read()
>    File
> "/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/lib/oeqa/core/decor=
ator/oetimeout.py",
> line 18, in _timeoutHandler
>      raise OEQATimeoutError("Timed out after %s "
> oeqa.core.exception.OEQATimeoutError: Timed out after 30 seconds of
> execution
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>    File
> "/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/lib/oeqa/core/decor=
ator/__init__.py",
> line 35, in wrapped_f
>      return func(*args, **kwargs)
>    File
> "/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/lib/oeqa/runtime/ca=
ses/ping.py",
> line 32, in test_ping
>      self.fail("Ping timeout error for address %s, count %s, output: %s"
> % (self.target.ip, count, output))
> AssertionError: Ping timeout error for address 192.168.7.2, count 0,
> output: PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
>  From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable
>
> --- 192.168.7.2 ping statistics ---
> 1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
>
> PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
>  From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable
>
> --- 192.168.7.2 ping statistics ---
> 1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
>
> PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
>  From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable
>
> --- 192.168.7.2 ping statistics ---
> 1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
>
> PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
>  From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable
>
> --- 192.168.7.2 ping statistics ---
> 1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
>
> PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
>  From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable
>
> --- 192.168.7.2 ping statistics ---
> 1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
>
> PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
>  From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable
>
> --- 192.168.7.2 ping statistics ---
> 1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
>
> PING 192.168.7.2 (192.168.7.2) 56(84) bytes of data.
>  From 192.168.7.1 icmp_seq=3D1 Destination Host Unreachable
>
> --- 192.168.7.2 ping statistics ---
> 1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
>
> Test requires openssh-sshd, or dropbear to be installed
> Test requires autoconf to be installed
> Test requires gtk+3 to be installed
> Test requires autoconf to be installed
> Test requires connman to be installed
> Test case connman.ConnmanTest.test_connmand_running depends on
> connman.ConnmanTest.test_connmand_help but it didn't pass/run.
> Test case date.DateTest.test_date depends on ssh.SSHTest.test_ssh but it
> didn't pass/run.
> Test case df.DfTest.test_df depends on ssh.SSHTest.test_ssh but it
> didn't pass/run.
> Test case dnf.DnfBasicTest.test_dnf_help depends on ssh.SSHTest.test_ssh
> but it didn't pass/run.
> Test case dnf.DnfBasicTest.test_dnf_history depends on
> dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
> Test case dnf.DnfBasicTest.test_dnf_info depends on
> dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
> Test case dnf.DnfBasicTest.test_dnf_search depends on
> dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
> Test case dnf.DnfBasicTest.test_dnf_version depends on
> dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
> Test case dnf.DnfRepoTest.test_dnf_makecache depends on
> dnf.DnfBasicTest.test_dnf_help but it didn't pass/run.
> Test case dnf.DnfRepoTest.test_dnf_exclude depends on
> dnf.DnfRepoTest.test_dnf_makecache but it didn't pass/run.
> Test case dnf.DnfRepoTest.test_dnf_install depends on
> dnf.DnfRepoTest.test_dnf_makecache but it didn't pass/run.
> Test case dnf.DnfRepoTest.test_dnf_install_dependency depends on
> dnf.DnfRepoTest.test_dnf_install but it didn't pass/run.
> Test case dnf.DnfRepoTest.test_dnf_install_from_disk depends on
> dnf.DnfRepoTest.test_dnf_install_dependency but it didn't pass/run.
> Test case dnf.DnfRepoTest.test_dnf_install_from_http depends on
> dnf.DnfRepoTest.test_dnf_install_from_disk but it didn't pass/run.
> Test case dnf.DnfRepoTest.test_dnf_installroot depends on
> dnf.DnfRepoTest.test_dnf_makecache but it didn't pass/run.
>
> .....
>
> core-image-minimal () - Ran 71 tests in 55.191s
> core-image-minimal - FAIL - Required tests failed (successes=3D0,
> skipped=3D70, failures=3D1, errors=3D0)
> ERROR: core-image-minimal-1.0-r0 do_testimage: core-image-minimal -
> FAILED - also check the logs in
> /scratch1/sandeepg/yocto/yp-master/build-ci-master/tmp/log
> ERROR: Logfile of failure stored in:
> /scratch1/sandeepg/yocto/yp-master/build-ci-master/tmp/work/beaglebone_yo=
cto-poky-linux-gnueabi/core-image-minimal/1.0/temp/log.do_testimage.1057886
> ERROR: Task
> (/scratch1/sandeepg/yocto/yp-master/sources/poky/meta/recipes-core/images=
/core-image-minimal.bb:do_testimage)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 892 tasks of which 881 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
> /scratch1/sandeepg/yocto/yp-master/sources/poky/meta/recipes-core/images/=
core-image-minimal.bb:do_testimage
> Summary: There was 1 WARNING message.
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>
> real    1m53.486s
> user    0m0.355s
> sys    0m0.073s
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188199): https://lists.openembedded.org/g/openembedde=
d-core/message/188199
> Mute This Topic: https://lists.openembedded.org/mt/101578999/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

