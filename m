Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7D83573243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 19:29:44 +0000 (UTC)
Received: by vkfp126 with SMTP id p126so35903053vkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=2iRfywhHlGR4fOSt4OzcKjhJilYwhBK2X4aKODkBCbY=;
	b=E7gbMOv5Gld5TFg2OR3ASz5DZTqN4lEOrzlxjrY9qnzyHA78w1w8HDaI/Y7ePWKMZT
	HejL6SwVxnGb9DaJ+fNwgUI6jiOsphx5rBpIV6VYlJW6qG3WXOo49hA+G01ED+zEffXu
	iq2fshMPE7tIZ4xDJE3+04XAAaKiUzJcsLUgKttUJ7EClPqlDAAecIsWYLb8seS8QjzZ
	iLZs4yhQwqh1C887dGTvLllqGsRjBXQS1eusa+49N1+t30ukZi/445KeNig+mPuMNDJA
	TuhDiL3/xF2+ziPbyQkITFpxtL9mtLjVzyvO3S+EnIBnn5YGd8nIoXbXWcId1nmjjpra
	aPPg==
X-Received: by 10.31.58.68 with SMTP id h65mr4048448vka.139.1442604584169;
	Fri, 18 Sep 2015 12:29:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Fri, 18 Sep 2015 12:29:24 -0700 (PDT)
In-Reply-To: <1442582049-12108-3-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
	<1442582049-12108-3-git-send-email-Martin.Jansa@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 18 Sep 2015 12:29:24 -0700
X-Google-Sender-Auth: rNn-8qIbREzSVlC4_93ql3yxHfs
Message-ID: <CABcZAN=0anqtWfbyzkGZs0UtPKhRKGt65=9XZFO-WUZN8AQEDw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] package.bbclass: add summary line to installed-vs-shipped QA check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 19:29:44 -0000
Content-Type: multipart/alternative; boundary=001a1143e6a2ca785d05200a8de9

--001a1143e6a2ca785d05200a8de9
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 6:14 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> * there is PN at the beginning, then possibly long list of files and
>   at the end we don't see which recipe has this issue, add another
>   line which says which PN and how many files
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>

Nice.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143e6a2ca785d05200a8de9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Sep 18, 2015 at 6:14 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":32m" c=
lass=3D"a3s" style=3D"overflow:hidden">* there is PN at the beginning, then=
 possibly long list of files and<br>
=C2=A0 at the end we don&#39;t see which recipe has this issue, add another=
<br>
=C2=A0 line which says which PN and how many files<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;</div></blockquote></div><br>Nice.<br>-- <br><=
div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br=
>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1143e6a2ca785d05200a8de9--
