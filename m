Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C05C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 08:54:55 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.61500.1679993687483477470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 01:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EAlirO0I;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id y35so9185137ljq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679993686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ATMfnICsPOQ6RhwIXc4qSd15TJK26AQbAsaDBthxW8=;
        b=EAlirO0I8IrP3pWjv1tZr4Re16jBhiBywMw7T9t6opdCoIO7KpJOptR3dL+UBEX5DY
         zx0h6HShdLFOwvzvf5JnpG+AUN4PeeYepkHmQRiPIRu0BDOEsFbeo+Zhn5e8mvy28cw8
         3nAxfrOZYVA5pwzIK6PHTxHJHzWe241yzRtlVYPCHaN/G/nTIOdBij0NyS6V/bb5wQyi
         Qd/rYUmAjDELBBFrLOFLt4AgQ2J5Yn04wjKZh9Do6hpX0e4DeZvA1jCuLGSUgf9UevrO
         u9t7rOtNsINKu6ZnCEDAzLyTtwGgRod6M8chFCEyvvKLWVK2h56KoA8nzrPZHEmQ1tBP
         7Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679993686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ATMfnICsPOQ6RhwIXc4qSd15TJK26AQbAsaDBthxW8=;
        b=aIXDfy55FUpe3da5UOr/+3VjW6zVnF+6NGuuSZiHO9JjUzascD12H52gdG/C7gtkPa
         kBmXtMP7b2mldWF0vvx2elmhyIeN/5oIFy7vnfkRtXummEwQAhIgIep5YF60ZBhTCgw1
         xHcywokSdZLCzElMXynqbNQKHLkB3Ms6bvpxvs8/OC8itMf1m0qdVcg+ExkPdt3n8h9X
         S0gogNN7AQZBbnQmcjTsZvKCkvi+cBePRZkN77QDPYL14c6TmlTu4afVs76ngUldWb2N
         Y6SEJKxBZThUE9j5MqZs7SGd5+ydes7EwChooYj1s65zTP2wz1Ztey9RvmiOACTMBRoq
         tOig==
X-Gm-Message-State: AAQBX9eq6VXQ4y8QNOR6tm4mFIoKiHJgWHa2INjrYoSCyB7sqyDGih+n
	PvtDLOP7w7oQ8PDnrXv4nZohbSWeUpL1t2yCL3I=
X-Google-Smtp-Source: AKy350bxpzPIAvrIruuW6GNchREyXRaqYXJqA+0PpccmKxOlCVywllUqDB0v0bILaAlq3WusoSdmj1C4N5x8jXWUdLA=
X-Received: by 2002:a2e:8882:0:b0:295:945d:b381 with SMTP id
 k2-20020a2e8882000000b00295945db381mr4481567lji.7.1679993685413; Tue, 28 Mar
 2023 01:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
In-Reply-To: <CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 10:54:34 +0200
Message-ID: <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for devtool failed
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 08:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179214

oe-selftest is executed on the autobuilder all the time, so if it
fails this way we'd know.

Can you try making a pristine build from scratch and run oe-selftest
in it? You should set up sstate cache outside of the build directory,
so that selftest would reuse it.

Alex

On Tue, 28 Mar 2023 at 09:28, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Hello,
>
> in the course of building tests around this patch: https://patchwork.yoctoproject.org/project/oe-core/patch/855931994ea68c0691d0a67ce2ccad947e77229f.1679904677.git.frederic.martinsons@gmail.com/
>
> I tried to run oe-selftest with the current poky master (e3afe166940686b05626c3298bc4369296b7d8a3) and I didn't manage to have the test_devtool_modify and test_devtool_modify_git worked.
>
> First, I was not aware of oe-selftest to be impacted by my previous build , I had issues some devtool but even if there was no more active devtool, the tests failed with the following
> error:
>
> ERROR: Found duplicated BBFILE_COLLECTIONS 'workspacelayer', check bblayers.conf or layer.conf to fix it.
> Found duplicated BBFILE_COLLECTIONS 'workspacelayer', check bblayers.conf or layer.conf to fix it.
> Traceback (most recent call last):
>   File "/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/scripts/lib/devtool/__init__.py", line 109, in setup_tinfoil
>     tinfoil.prepare(config_only)
>   File "/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/bitbake/lib/bb/tinfoil.py", line 417, in prepare
>     self.run_actions(config_params)
>   File "/var/lib/jenkins/YOCTO_POKY_MASTER_TEST/poky/bitbake/lib/bb/tinfoil.py", line 432, in run_actions
>     raise TinfoilUIException(ret)
> bb.tinfoil.TinfoilUIException: 1
>
>
> After removing my $BDIR/workspace , the test got further but ends in strange failure (for test_devtool_modify):
>
> NOTE: recipe shadow-native-4.13-r0: task do_install: Failed
> ERROR: Task (virtual:native:/tmp/devtoolqa_7buhvon/core-copy/meta/recipes-extended/shadow/shadow_4.13.bb:do_install) failed with exit code '1'
> NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot: Succeeded
> NOTE: recipe file-native-5.44-r0: task do_populate_sysroot: Succeeded
> NOTE: recipe gmp-native-6.2.1-r0: task do_compile: Succeeded
> NOTE: recipe pkgconfig-native-0.29.2+gitAUTOINC+d97db4fae4-r0: task do_configure: Succeeded
> NOTE: recipe cross-localedef-native-2.37-r0: task do_configure: Succeeded
> NOTE: recipe libunistring-native-1.1-r0: task do_configure: Succeeded
> NOTE: recipe bison-native-3.8.2-r0: task do_configure: Succeeded
> NOTE: recipe linux-yocto-6.1.20+gitAUTOINC+a8881762b5_423e199669-r0: task do_fetch: Succeeded
> NOTE: Tasks Summary: Attempted 799 tasks of which 99 didn't need to be rerun and 1 failed.
>
> Summary: 1 task failed:
>   virtual:native:/tmp/devtoolqa_7buhvon/core-copy/meta/recipes-extended/shadow/shadow_4.13.bb:do_install
> Summary: There was 1 WARNING message.
> Summary: There was 1 ERROR message, returning a non-zero exit code.
> ----------------------------------------------------------------------
> 2023-03-28 07:16:21,876 - oe-selftest - INFO - Ran 1 test in 911.101s
> 2023-03-28 07:16:21,876 - oe-selftest - INFO - FAILED
> 2023-03-28 07:16:21,877 - oe-selftest - INFO -  (failures=1)
> 2023-03-28 07:16:29,802 - oe-selftest - INFO - RESULTS:
> 2023-03-28 07:16:29,803 - oe-selftest - INFO - RESULTS - devtool.DevtoolModifyTests.test_devtool_modify: FAILED (905.11s)
> 2023-03-28 07:16:29,808 - oe-selftest - INFO - SUMMARY:
> 2023-03-28 07:16:29,808 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 911.105s
> 2023-03-28 07:16:29,808 - oe-selftest - INFO - oe-selftest - FAIL - Required tests failed (successes=0, skipped=0, failures=1, errors=0)
>
> Does this ring a bell to someone ? How can I manage to make these tests succeed ?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179206): https://lists.openembedded.org/g/openembedded-core/message/179206
> Mute This Topic: https://lists.openembedded.org/mt/97900549/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

