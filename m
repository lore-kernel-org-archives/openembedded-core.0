Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC8BC27C4F
	for <webhook@archiver.kernel.org>; Sat, 29 Jun 2024 16:12:31 +0000 (UTC)
Subject: Re: [AUH] bluez5: upgrading to 5.76 FAILED
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 29 Jun 2024 09:12:27 -0700
References: <010101901d23b565-1b4bf3ea-3f04-49f7-95ba-1887fdccc735-000000@us-west-2.amazonses.com>
In-Reply-To: <010101901d23b565-1b4bf3ea-3f04-49f7-95ba-1887fdccc735-000000@us-west-2.amazonses.com>
Message-ID: <32067.1719677547978950735@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mbknF1x6UWmE6kAcu8zr"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jun 2024 16:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201229

--mbknF1x6UWmE6kAcu8zr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm personally interested in this upgrade so took a shot at upgrading local=
ly.

The patch *0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch*=
 is very problematic, and the only issue on my end. It started breaking thi=
ngs in BlueZ 5.73. Some of the changes are now in upstream, and some have b=
een removed which creates conflicts. I wonder if this patch is even relevan=
t today? it's ~8 years old

After removing the patch, bluez5 builds fine on my end after upgrading via =
devtool.

I can submit a patch to this mailing list for review if it helps

--mbknF1x6UWmE6kAcu8zr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm personally interested in this upgrade so took a shot at upgrading local=
ly.<br /><br />The patch <strong>0001-Allow-using-obexd-without-systemd-in-=
the-user-sessio.patch</strong> is very problematic, and the only issue on m=
y end. It started breaking things in BlueZ 5.73. Some of the changes are no=
w in upstream, and some have been removed which creates conflicts. I wonder=
 if this patch is even relevant today? it's ~8 years old<br /><br />After r=
emoving the patch, bluez5 builds fine on my end after upgrading via devtool=
.<br /><br />I can submit a patch to this mailing list for review if it hel=
ps

--mbknF1x6UWmE6kAcu8zr--

