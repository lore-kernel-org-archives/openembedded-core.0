Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22056E73176
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:48:58 +0000 (UTC)
Subject: Re: [PATCH v6 2/4] cvelistv5: add a new recipe
To: openembedded-core@lists.openembedded.org
From: "vboudevin" <valentin.boudevin@gmail.com>
X-Originating-Location: Laval, Quebec, CA (208.88.110.46)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 02 Feb 2026 05:48:51 -0800
References: <188AFCD98EA3E578.3200434@lists.openembedded.org> <20260129211012.623827-1-valentin.boudevin@gmail.com> <20260129211012.623827-3-valentin.boudevin@gmail.com> <49de779cc2db0ef5c2bade9c8b07e076dedc340f.camel@linuxfoundation.org>
In-Reply-To: <49de779cc2db0ef5c2bade9c8b07e076dedc340f.camel@linuxfoundation.org>
Message-ID: <442096.1770040131832557569@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ab7x3StbmUkO7IxvbjfA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230352

--ab7x3StbmUkO7IxvbjfA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I wanted to indicate that the recipe is not meant to be used with a fixed c=
ommit with a deterministic approach.

Having ${AUTOREV} by default can lead to many offline issues.

I guess the correct implementation would be to specify, in the documentatio=
n, the need for "SRCREV:pn-cvelistv5-native =3D "${AUTOREV}"" to stay up-to=
-date with CVE data, and also add this information in a comment inside the =
recipe.

Thank you for your feedback

--ab7x3StbmUkO7IxvbjfA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I wanted to indicate that the recipe is not meant to be used with a fi=
xed commit with a deterministic approach.&nbsp;<br />&nbsp;<br />Having ${A=
UTOREV} by default can lead to many offline issues.<br />&nbsp;<br />I gues=
s the correct implementation would be to specify, in the documentation, the=
 need for "SRCREV:pn-cvelistv5-native =3D "${AUTOREV}"" to stay up-to-date =
with CVE data, and also add this information in a comment inside the recipe=
.&nbsp;<br />&nbsp;<br />Thank you for your feedback</div>

--ab7x3StbmUkO7IxvbjfA--

