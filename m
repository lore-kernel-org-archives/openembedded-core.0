Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE93112583F
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 15:02:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23837.1773241370551611097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 08:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OCQOepmv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7489E4E4261B
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 15:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44C7B60004;
	Wed, 11 Mar 2026 15:02:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F69D10369A2F;
	Wed, 11 Mar 2026 16:02:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773241361; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qzz8vFABE58RIieML5yqf55ncVINvfr6vgjxXMyEJ2c=;
	b=OCQOepmvkSjxjFqUM/K1GbptKiotqJ2WPnPergiKhaPshkHYIaHRXmHlAJQbYbOTIxLOzD
	fyswQNGAB+Ivgszi7nheUZanXkvtrGzfdFfd86soWPC76cbf+OY0TvgiysuH5EIMsn9mtI
	u0rBqIAljrhTudTVjApYOHXOGs43A7uta1rqfVopXqjZAt2cleSABYGcD8Lxdq1tnAfqil
	ofe4QSgP0K4OM7+ZOlXsh8XtIfHZVEKsmWdOIVLjMUFzqD3AXltG//+DV6t4KTb2eY0IIF
	oFvKJRPL9Wj60i12uOvtxfpjTuG4X/BOF9XCQkNQA797S/jT2p1dUdsmz7xCdQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 16:02:38 +0100
Message-Id: <DH01LLZRABRA.3OPRM8CVO91E2@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Zhang Peng" <peng.zhang1.cn@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v2] groff: upgrade 1.23.0 -> 1.24.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260309150842.3379241-1-peng.zhang1.cn@windriver.com>
 <DGZQ4TTU05M0.3UH0ADSIVMSTT@bootlin.com>
 <6745abda-97f9-4963-b671-6c2722bbae0b@windriver.com>
In-Reply-To: <6745abda-97f9-4963-b671-6c2722bbae0b@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 15:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232893

On Wed Mar 11, 2026 at 2:57 PM CET, Zhang Peng wrote:
>
> On 3/11/26 14:03, Mathieu Dubois-Briand wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Mon Mar 9, 2026 at 4:08 PM CET, Peng (Paul) (CN) via lists.openembedd=
ed.org Zhang wrote:
>>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>>
>>> Upgrade to latest revision of 1.24.0.
>>> - Drop patches included in this release.
>>> - Add patch to fix test-groff not found in cross-compilation.
>>> - Add patch to use SOURCE_DATE_EPOCH in gropdf for reproducible PDF gen=
eration.
>>> - COPYING, LICENSES: Refresh GPLv3 text.
>>>
>>> Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]
>>>
>>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> Hi,
>>
>> Thanks for the new version. It looks a bit better, reproducibility test
>> passed at least once, but we still have failures in some builds. It
>> seems to be a similar one:
>>
>> AssertionError: The following deb packages are different and not in excl=
usion list:
>> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ex=
tended/tmp/deploy/deb/./x86-64-v3/groff-doc_1.24.0-r0_amd64.deb
>> The following rpm packages are different and not in exclusion list:
>> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ex=
tended/tmp/deploy/rpm/./x86_64_v3/groff-doc-1.24.0-r0.x86_64_v3.rpm
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3554
>>
>> Diffoscope output:
>> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260310-jxtz43=
x1/packages/diff-html/
>
> HI, Mathieu
>
> It's very strange - I cannot reproduce this issue on my local Ubuntu=20
> 22.04 system. From the Yocto autobuilder system logs, I can't find any=20
> useful hints to analyze the failure.
> My suspicion is related to the host environment. The autobuilder uses=20
> Fedora 40 while I'm testing on Ubuntu, but I don't think this difference=
=20
> should cause the failure.
> Any help or insights on this would be greatly appreciated.
>

Hi Peng,

So on the autobuilder we are testing with multiple distributions. This
reproducibility issue did happen with multiple workers, with different
distributions.

One first note about the reproducibility test. As you might have seen,
we are comparing the output of two builds:
- The first build, left side of diffoscope, is made using the
  sstate-cache, so the document might have been built on any worker.
- The second build, right side of diffoscope is made without the
  sstate-cache: the pdf have been generated on the worker used for the
  build.

We had 3 test failures so far:
- One on fedora 40:
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3554
- One on alma 8:
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3553
- One on debian 12:
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3556

One interesting thing is, the output of both alma 8 and debian 12 looks
the same, if we compare the right side of the diffoscope output.

So, depending on something, probably the distribution, we have at least
3 different outputs:
- A first version (A), generated on an unknown distribution has reached the
  sstate-cache: this is the one we see on the diffoscope output on
  each builds.
- A second version (B), generated on Fedora 40 worker. Output differs
  with A on the ipk generation.
- A third version (C), generated either on alma 8 or Debian 12. Output
  differs with A on the deb generation.

So one idea might be to try to build the package in two different
dockers, one Fedora 40, one Debian 12. If you are a bit lucky, you might
get some different output.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


