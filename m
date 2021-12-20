Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EB9C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 09:12:45 +0000 (UTC)
Subject: Re: [meta][dunfell][PATCH] boost: Add a NULL check for the pointer
 which causes a crash
To: openembedded-core@lists.openembedded.org
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (103.85.11.130)
X-Originating-Platform: Linux Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 20 Dec 2021 01:12:44 -0800
References: 
 <CAMKF1sq2tnXmzSYGErx6XP_m=H-=f2ijwkgPYZPfCqeD8+AWTA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq2tnXmzSYGErx6XP_m=H-=f2ijwkgPYZPfCqeD8+AWTA@mail.gmail.com>
Message-ID: <6300.1639991564379207141@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="lWW7eCDX0K68OHhIhxJs"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 09:12:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159854

--lWW7eCDX0K68OHhIhxJs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Steve,

Earlier we have also thought the same things from the upstream issue commen=
t and we have tried another workaround mentioned on the ticket which is dis=
abled epoll.
We have tried it and it didn't work for the project. we still facing the is=
sue.

Then we tried the NULL check for the variable. Maybe it's not a proper fix =
(just a workaround to check the pointer before accessing), but there is not=
hing wrong with checking the null before accessing any variable.

Ranjitsinh

--lWW7eCDX0K68OHhIhxJs
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Steve,<br /><br />Earlier we have also thought the same things from the ups=
tream issue comment and we have tried another workaround mentioned on the t=
icket which is disabled epoll.<br />We have tried it and it didn't work for=
 the project. we still facing the issue.<br /><br />Then we tried the NULL =
check for the variable. Maybe it's not a proper fix (just a workaround to c=
heck the pointer before accessing), but there is nothing wrong with checkin=
g the null before accessing any variable.<br /><br />Ranjitsinh

--lWW7eCDX0K68OHhIhxJs--

