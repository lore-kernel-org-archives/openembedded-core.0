Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE41E7F127
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 20:37:09 +0000 (UTC)
Subject: Re: [kirkstone 02/20] cups: fix CVE-2023-32360
To: openembedded-core@lists.openembedded.org
From: "Claus Stovgaard" <claus.stovgaard@gmail.com>
X-Originating-Location: Roskilde, Zealand, DK (87.52.106.165)
X-Originating-Platform: Linux Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 26 Sep 2023 13:37:06 -0700
References: <b04f40d7afba07ff602bffffc9a517ccfdd44850.1695248921.git.steve@sakoman.com>
In-Reply-To: <b04f40d7afba07ff602bffffc9a517ccfdd44850.1695248921.git.steve@sakoman.com>
Message-ID: <15368.1695760626090857562@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="jJZtqBYa8kGFOnDlv5UA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 20:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188263

--jJZtqBYa8kGFOnDlv5UA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve and oe-core

Just noticed issues with cups, and can see the problem in this patch.

++ AuthType Defaul
should have been
++ AuthType Default

We are missing a "t" in the end.

Will send a patch - but I might first have time later this week, and it don=
't know if it is needed for 4.0.13

Regards
Claus

--jJZtqBYa8kGFOnDlv5UA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve and oe-core<br /><br />Just noticed issues with cups, and can see =
the problem in this patch.<br /><br /><span style=3D"white-space-collapse: =
preserve;">++ AuthType Defaul<br /></span>should have been<br /><span style=
=3D"white-space-collapse: preserve;">++ AuthType Default<br /></span><br />=
We are missing a "t" in the end.<br /><br />Will send a patch - but I might=
 first have time later this week, and it don't know if it is needed for 4.0=
.13<br /><br />Regards<br />Claus

--jJZtqBYa8kGFOnDlv5UA--

