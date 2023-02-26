Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5FEC64EC7
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 03:25:52 +0000 (UTC)
Subject: Re: How to use linux-firmware to install single firmware package? #kirkstone
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 25 Feb 2023 19:25:45 -0800
References: <DS7PR20MB47096CDED0739FA3ED6EB027EBAE9@DS7PR20MB4709.namprd20.prod.outlook.com>
In-Reply-To: <DS7PR20MB47096CDED0739FA3ED6EB027EBAE9@DS7PR20MB4709.namprd20.prod.outlook.com>
Message-ID: <20767.1677381945442913809@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="En7BWxzcy0SRCLn9ppGZ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 03:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177724

--En7BWxzcy0SRCLn9ppGZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Same problem as above

https://lists.openembedded.org/g/openembedded-core/topic/94795411#172656

Maybe try MACHINE_ESSENTIAL_EXTRA_RDEPENDS with OE core master.

For me it only includes specified linux-firmware package.

I had a similar issue awhile back, but I think a solution landed in OE core=
 master.
Although from commit message seems unrelated. I believe this is what solved
the problem for me.

https://lists.openembedded.org/g/openembedded-core/message/173867

--En7BWxzcy0SRCLn9ppGZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Same problem as above<br /><br /><a href=3D"https://lists.openembedded.org/=
g/openembedded-core/topic/94795411#172656" target=3D"_blank" rel=3D"noopene=
r">https://lists.openembedded.org/g/openembedded-core/topic/94795411#172656=
</a><br /><br />Maybe try MACHINE_ESSENTIAL_EXTRA_RDEPENDS with OE core mas=
ter.<br /><br />For me it only includes specified linux-firmware package.<b=
r /><br />I had a similar issue awhile back, but I think a solution landed =
in OE core master.<br />Although from commit message seems unrelated. I bel=
ieve this is what solved<br />the problem for me.<br /><br /><a href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/173867" target=3D"_=
blank" rel=3D"noopener">https://lists.openembedded.org/g/openembedded-core/=
message/173867</a><br />

--En7BWxzcy0SRCLn9ppGZ--

