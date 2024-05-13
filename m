Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6132C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 10:05:18 +0000 (UTC)
Subject: Re: [PATCH] buildhistory: Fix do_package race issues
To: openembedded-core@lists.openembedded.org
From: pmi183@gmail.com
X-Originating-Location: Rinchoa, Lisbon, PT (78.137.195.161)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 May 2024 03:05:09 -0700
References: <CANNYZj-3wQKzHGNhe0zTqxaVaxROUHcmMajgnMvNzrkXf9T+2Q@mail.gmail.com>
In-Reply-To: <CANNYZj-3wQKzHGNhe0zTqxaVaxROUHcmMajgnMvNzrkXf9T+2Q@mail.gmail.com>
Message-ID: <25272.1715594709758853517@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="iKhK6b7IvaSsncjvnYx3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 10:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199228

--iKhK6b7IvaSsncjvnYx3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

If you execute:
rm -rf tmp/ && bitbake base-passwd -c cleansstate && bitbake base-passwd

Check the log.do_package of the recipe all you will see the error there and=
 if you check `buildhistory/packages/` you wont find `files-in-package.txt`=
 for this package for example.

Thank you,
Pedro

--iKhK6b7IvaSsncjvnYx3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />If you execute:<br /><span><span class=3D"ui-provider a b c =
d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" d=
ir=3D"ltr">rm -rf tmp/ &amp;&amp; bitbake base-passwd -c cleansstate &amp;&=
amp; bitbake base-passwd<br /><br /></span></span>Check the log.do_package =
of the recipe all you will see the error there and if you check `buildhisto=
ry/packages/` you wont find `files-in-package.txt` for this package for exa=
mple.<br /><br />Thank you,<br />Pedro

--iKhK6b7IvaSsncjvnYx3--

