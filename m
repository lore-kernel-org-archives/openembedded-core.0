Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81685C021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 07:47:58 +0000 (UTC)
Subject: Re: [PATCH] oeqa/selftest: add a newline in local.conf (newbuilddir)
To: openembedded-core@lists.openembedded.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Mac Safari 18.3
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 23:47:56 -0800
References: <CAMSfU+7QX_n6+-rYbm9eoLZYA5bbjr7PwAdK=+QkiP2NrX+FPQ@mail.gmail.com>
In-Reply-To: <CAMSfU+7QX_n6+-rYbm9eoLZYA5bbjr7PwAdK=+QkiP2NrX+FPQ@mail.gmail.com>
Message-ID: <12863.1740296876523244699@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9zXCWWqWkbdMyeucd73E"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 07:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211823

--9zXCWWqWkbdMyeucd73E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi

I will change the comment.

Regarding 'None'(NoneType) and ""(str) , =C2=A0I don't see any significant =
difference here but it can be changed.

I considered "f.write" and is simpler as you said but lower in "context.py"=
 is used subprocess to write SSTATE_DIR
and I thought of using the same to keep consistency.

I will wait a bit to see if someone else will comment something and I will =
submit v2.

Br
Christos

--9zXCWWqWkbdMyeucd73E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>hi</div>
<div>&nbsp;</div>
<div>I will change the comment.</div>
<div>&nbsp;</div>
<div>Regarding 'None'(NoneType) and ""(str) , &nbsp;I don't see any signifi=
cant difference here but it can be changed.&nbsp;</div>
<div>&nbsp;</div>
<div>I considered "f.write" and is simpler as you said but lower in "contex=
t.py" is used subprocess to write SSTATE_DIR</div>
<div>and I thought of using the same to keep consistency.</div>
<div>&nbsp;</div>
<div>I will wait a bit to see if someone else will comment something and I =
will submit v2.</div>
<div>&nbsp;</div>
<div>Br</div>
<div>Christos</div>

--9zXCWWqWkbdMyeucd73E--

