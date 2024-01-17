Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43836C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 17:45:51 +0000 (UTC)
Subject: Re: [PATCH 2/2] openssl: Fix ptest dependencies on perl-module-* being ignored by COMPLEMENTARY_GLOB
To: openembedded-core@lists.openembedded.org
From: "Lyu, William" <william.lyu@windriver.com>
X-Originating-Location: Collingwood, Ontario, CA (174.92.25.101)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Jan 2024 09:45:48 -0800
References: <e792c37d-3bab-5951-9509-43e8f20ca327@windriver.com>
In-Reply-To: <e792c37d-3bab-5951-9509-43e8f20ca327@windriver.com>
Message-ID: <22006.1705513548126301816@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Mh8OaOr954ZydrOvJW5y"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 17:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193941

--Mh8OaOr954ZydrOvJW5y
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Qi, according to the comments in the perl_5.38.2.bb recipe, perl-modules re=
commends "all the other perl packages" which might include optional package=
s. I assume leaving optional packages as "runtime recommended" (RRECOMMENDS=
) - aka. soft dependencies - can reduce the possibility of conflicts. The f=
ollowing patch changed the package_manager to ignore RRECOMMENDS to avoid c=
onflict:

https://lists.openembedded.org/g/openembedded-core/message/167303

--Mh8OaOr954ZydrOvJW5y
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Qi, according to the comments in the perl_5.38.2.bb recipe, perl-modules re=
commends "all the other perl packages" which might include optional package=
s. I assume leaving optional packages as "runtime recommended" (RRECOMMENDS=
) - aka. soft dependencies - can reduce the possibility of conflicts. The f=
ollowing patch changed the package_manager to ignore RRECOMMENDS to avoid c=
onflict:<br /><br />https://lists.openembedded.org/g/openembedded-core/mess=
age/167303

--Mh8OaOr954ZydrOvJW5y--

