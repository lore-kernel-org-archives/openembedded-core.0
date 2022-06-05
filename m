Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F852C43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 22:04:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.25272.1654466638903598252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 15:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.201, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpclient.apple (unknown [50.34.64.238])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id A153F1BF205;
	Sun,  5 Jun 2022 22:03:54 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [OE-core][dunfell][PATCH v2] curl: Add fix for CVE-2022-27781
 CVE-2022-27782
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: 
 <CAOSpxda4XY3qbJ_wncx3y5TN-5nAB4nKDcypbaCoNBFWzczhxQ@mail.gmail.com>
Date: Sun, 5 Jun 2022 15:03:51 -0700
Cc: Riyaz Ahmed Khan <rak3033@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Riyaz.Khan@kpit.com,
 Ranjitsinh.Rathod@kpit.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <920C95FC-9CE1-4EBF-B5F1-01ADAF651A1A@redrectangle.org>
References: <20220601090044.28212-1-rak3033@gmail.com>
 <CAOSpxda4XY3qbJ_wncx3y5TN-5nAB4nKDcypbaCoNBFWzczhxQ@mail.gmail.com>
To: Steve Sakoman <steve@sakoman.com>
X-Mailer: Apple Mail (2.3696.100.31)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 22:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166584


> On Jun 1, 2022, at 9:07 AM, Steve Sakoman <steve@sakoman.com> wrote:
>=20
> On Tue, May 31, 2022 at 11:01 PM Riyaz Ahmed Khan <rak3033@gmail.com> =
wrote:
>>=20
>> From: Riyaz Khan <Riyaz.Khan@kpit.com>
>>=20
>> Add patches for CVE issues: CVE-2022-27781 CVE-2022-27782
>>=20
>> CVE-2022-27781
>> Link: =
[https://github.com/curl/curl/commit/5c7da89d404bf59c8dd82a001119a16d18365=
917]
>=20
> Unfortunately, this is still failing:
>=20
> ERROR: curl-7.69.1-r0 do_patch: Applying patch 'CVE-2022-27781.patch'
> on target directory
> =
'/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/curl/7=
.69.1-r0/curl-7.69.1'
> Command Error: 'quilt --quiltrc
> =
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/curl/7.=
69.1-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0 Output:
> Applying patch CVE-2022-27781.patch
> patching file lib/vtls/nss.c
> Hunk #1 FAILED at 983.
> Hunk #2 succeeded at 986 (offset -32 lines).
> 1 out of 2 hunks FAILED -- rejects in file lib/vtls/nss.c
> Patch CVE-2022-27781.patch does not apply (enforce with -f)
> ERROR: Logfile of failure stored in:
> =
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/curl/7.=
69.1-r0/temp/log.do_patch.1303805
> ERROR: Task =
(/home/steve/builds/poky-contrib/meta/recipes-support/curl/curl_7.69.1.bb:=
do_patch)
> failed with exit code '1'
>=20
> Steve

I just sent a patch that should address these two CVEs. The patches did =
require some modification from the kirkstone patches to apply since the =
curl code has changed a bit.

For some reason these curl CVEs seem to stay reserved well after =
they=E2=80=99re published and fixed so they don=E2=80=99t show up in the =
CVE reports.

Thanks,
Robert=

