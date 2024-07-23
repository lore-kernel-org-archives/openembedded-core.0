Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4F4C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:38:42 +0000 (UTC)
Subject: Re: [scarthgap][master][PATCH] python3: provide /usr/bin/python as a symlink to python3
To: openembedded-core@lists.openembedded.org
From: "Konrad Weihmann" <kweihmann@outlook.com>
X-Originating-Location: Berlin, Land Berlin, DE (89.14.164.255)
X-Originating-Platform: Linux Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Jul 2024 06:38:38 -0700
References: <20240719164639.GN17572@denix.org>
In-Reply-To: <20240719164639.GN17572@denix.org>
Message-ID: <15389.1721741918254132393@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Ff2RngeZ8sjmyGgSwuCK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202364

--Ff2RngeZ8sjmyGgSwuCK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I also vote against it.

While I see the convenience in dropping a lot of patches the better approac=
h would be to add something like python-is-python3, for the ones that requi=
re it.
(meta-webkit does provide it already https://github.com/Igalia/meta-webkit/=
blob/main/recipes-devtools/python/python-is-python3_1.0.bb ).

Adding a link by the base package and recommending to the user to remove it=
 again, would create two very unwelcome situations.

a) it will clash at image assembly with an error message that will no easil=
y point to the python base package
b) create a need to run with a permanent remove operation on top of poky (c=
reating the need for new sstate cache artifacts)

What I could see is to move the symlink into an optional package, which cou=
ld be used by the few recipes that still use the "wrong" interpreter line v=
ia RDEPENDS, that would be the much cleaner solution here

--Ff2RngeZ8sjmyGgSwuCK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I also vote against it.</div>
<div><br />While I see the convenience in dropping a lot of patches the bet=
ter approach would be to add something like python-is-python3, for the ones=
 that require it.<br />(meta-webkit does provide it already <a href=3D"http=
s://github.com/Igalia/meta-webkit/blob/main/recipes-devtools/python/python-=
is-python3_1.0.bb" target=3D"_blank" rel=3D"noopener">https://github.com/Ig=
alia/meta-webkit/blob/main/recipes-devtools/python/python-is-python3_1.0.bb=
</a>).<br /><br />Adding a link by the base package and recommending to the=
 user to remove it again, would create two very unwelcome situations.<br />=
<br />a) it will clash at image assembly with an error message that will no=
 easily point to the python base package<br />b) create a need to run with =
a permanent remove operation on top of poky (creating the need for new ssta=
te cache artifacts)<br /><br />What I could see is to move the symlink into=
 an optional package, which could be used by the few recipes that still use=
 the "wrong" interpreter line via RDEPENDS, that would be the much cleaner =
solution here<br />&nbsp;</div>

--Ff2RngeZ8sjmyGgSwuCK--

