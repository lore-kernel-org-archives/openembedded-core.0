Return-Path: <vadym.yatsenko@cranepi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00968C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 10:20:07 +0000 (UTC)
Subject: Re: [PATCH 1/2] classes/package_rpm: disable uninstall scripts for upgrades
To: openembedded-core@lists.openembedded.org
From: vadym.yatsenko@cranepi.com
X-Originating-Location: Buxtehude, Lower Saxony, DE (79.197.247.152)
X-Originating-Platform: Linux Firefox 118
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 03:20:04 -0700
References: <80a2356434387648ef7903c88fbfa64edfeca880.1320839130.git.paul.eggleton@linux.intel.com>
In-Reply-To: <80a2356434387648ef7903c88fbfa64edfeca880.1320839130.git.paul.eggleton@linux.intel.com>
Message-ID: <27851.1698920404818040119@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XZagmQOJSLLQ5kq9WHE7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 10:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190074

--XZagmQOJSLLQ5kq9WHE7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I understand that this patch is pretty old.
But, we having issues because of it.

According to the description it is intended to fix some problems for RPM sy=
stems.
We are using DEB packages and this patch is preventing to update rc.d scrip=
ts if new version of the package has updates in it.
Particularly, the new script is intended to be run with a different boot pr=
iority: 'start' directive to update-rc.d.

The problem is that during upgrade an old symlinks to rc* directories are n=
ot removed because of this condition added by wrap_uninstall().
And as a result update-rc.d is failing to update init scripts in rc* folder=
s. Because old are existing.

--XZagmQOJSLLQ5kq9WHE7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I understand that this patch is pretty old.<br />But, we having issues beca=
use of it.<br /><br />According to the description it is intended to fix so=
me problems for RPM systems.<br />We are using DEB packages and this patch =
is preventing to update rc.d scripts if new version of the package has upda=
tes in it.<br />Particularly, the new script is intended to be run with a d=
ifferent boot priority: 'start' directive to update-rc.d.<br /><br />The pr=
oblem is that during upgrade an old symlinks to rc* directories are not rem=
oved because of this condition added by wrap_uninstall().<br />And as a res=
ult update-rc.d is failing to update init scripts in rc* folders. Because o=
ld are existing.

--XZagmQOJSLLQ5kq9WHE7--

