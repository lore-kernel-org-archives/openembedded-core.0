Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A8FC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 14:33:06 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.21294.1719844382586783029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 07:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+6PGLPT;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cd80e55efso5330332e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 07:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719844381; x=1720449181; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlWrMDTLu2z9uCMRJdUrIDKcqDsWtJVJ5zFgr3ZYvUI=;
        b=T+6PGLPTDDK7HhoFbbo9KXTq7JPM8/G4mRLYw2o15y1e1I9QNRK/3HR9WW5gXcCz6U
         Qw9JPX/SiiRuQzYZ0yqOOkZyy0cqOYsbwAn0vUkTNU4CR/CsxRdqrROX03m3OCXvfOUP
         ArwSOujEADAqd/FpUiv7P0bZJLVE53Hwb7xzbFg3GOUjECBgEYYxXtBNgcjur8rRfx3y
         KjqB02jdYAJZIGzke3++fFVPEjCjd0vibnVo6+HStxeuK1JP2AdjSp1+aubhVj2bZgqq
         gpL9yknVrbL1YdglPdFqghOnd2GD5wYtpWoyyKbYMXqtCgB2csEAcbvW26396oQ2IYDk
         OYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719844381; x=1720449181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlWrMDTLu2z9uCMRJdUrIDKcqDsWtJVJ5zFgr3ZYvUI=;
        b=JvIkhOQinJ7ItDyIUkuD1NSI3rx4c0SSx/3STXnDoUUcF8aNr0A+ypQq3xQOduYcS1
         7T0IEhVyQJthA1KCpZiZwVuIm8rAdIWdv5l01ixXDlEYl62d/BqCM43e+c9RG7FiUGFG
         IBB1gTwXga+HK1BfMz65j7tgYQvE2qmbdQ4r4da6H/X+XkMFgFP9rCOqTo1ean7vuS7d
         YVM8oswKtXfunRQRpz8CjeZ8Hi8nMB+udQax3/1Vq40sxHFiSlgk/8c3L8SBNFQcPzOB
         QhjgBIFMdNjVgAOEiCHJrC2iY5iQESxs6n8sVYcPIifL2ouFSWiabCWEf1XakLsIjy54
         14jg==
X-Gm-Message-State: AOJu0YxkECV+dmhCoMGO+vQvIfnwOYZbdZdzw/RHMXPnJh94ZAWXi8aJ
	grtMIHRfmJCcL1a2IG96nIvERTIfzF6xm33/pApRx02MOq/L+KHt+2WanU9SOyn6qAjURKreJ0N
	41w6k0/MbAxYQM67gojVQ847rgfo=
X-Google-Smtp-Source: AGHT+IEKQ61OCdbQdso6ig27nimXY0GbI+SYN050DRjHhSprDql3F/Z5eVNzSLydaZf8aAwHF5CbBQkZyknS3vCqk7U=
X-Received: by 2002:a05:6512:104f:b0:52c:deea:57cb with SMTP id
 2adb3069b0e04-52e8264acc1mr4705420e87.3.1719844380352; Mon, 01 Jul 2024
 07:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240627221804.599573-1-JPEWhacker@gmail.com> <bce5f93668412736c515e663d39c39696ccabf7b.camel@linuxfoundation.org>
In-Reply-To: <bce5f93668412736c515e663d39c39696ccabf7b.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 1 Jul 2024 08:32:46 -0600
Message-ID: <CAJdd5GZd-da8+K+b3_QJaAUijUCnkxFhxp3D6235BkkZmF1RNA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/2] Update to latest version of SPDX licenses
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 14:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201306

Ah, right, I should have known that would happen. I'll send the fix

On Mon, Jul 1, 2024 at 12:56=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2024-06-27 at 16:16 -0600, Joshua Watt via lists.openembedded.org=
 wrote:
> > Adds a script to read the released SPDX license JSON data, and uses it
> > to update the common license files
> >
> > Joshua Watt (2):
> >   scripts/pull-spdx-licenses.py: Add script
> >   licenses: Update to SPDX license version 3.24.0
>
> Thanks for doing this. It does seem to upset one of the selftests:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6871
>
> 2024-06-30 21:07:48,909 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 2024-06-30 21:07:48,966 - oe-selftest - INFO - FAIL: spdx.SPDXCheck.test_=
spdx_base_files (subunit.RemotedTestCase)
> 2024-06-30 21:07:48,966 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2024-06-30 21:07:48,980 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oe=
qa/selftest/cases/spdx.py", line 55, in test_spdx_base_files
>     self.check_recipe_spdx("packages", "base-files.spdx.json", "base-file=
s")
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oe=
qa/selftest/cases/spdx.py", line 52, in check_recipe_spdx
>     result =3D check_spdx_json(full_file_path)
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oe=
qa/selftest/cases/spdx.py", line 49, in check_spdx_json
>     result =3D runCmd("{} {} -i {}".format(python, validator, filename))
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oe=
qa/utils/commands.py", line 212, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command '/home/pokybuild/yocto-worker/oe-selftest-debian/=
build/build-st-296488/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.2=
/recipe-sysroot-native/usr/bin/nativepython3 /home/pokybuild/yocto-worker/o=
e-selftest-debian/build/build-st-296488/tmp/work/x86_64-linux/python3-spdx-=
tools-native/0.8.2/recipe-sysroot-native/usr/bin/pyspdxtools -i /home/pokyb=
uild/yocto-worker/oe-selftest-debian/build/build-st-296488/tmp/deploy/spdx/=
2.2/qemux86_64/packages/base-files.spdx.json' returned non-zero exit status=
 1:
> ERROR:root:There have been issues while parsing the provided document:
> Error while parsing Document: ['Error while parsing version 3.24.0: 3.24.=
0 is not a valid version string']
>
> It is coming from here:
>
> https://github.com/spdx/tools-python/blob/main/src/spdx_tools/spdx/model/=
version.py
>
> in spdx-tools :/.
>
> Cheers,
>
> Richard

