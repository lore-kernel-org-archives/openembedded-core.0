Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 546C276E04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 20:37:22 +0000 (UTC)
Received: by igxx6 with SMTP id x6so17342616igx.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ElPKb3x7F4ejS8jcKW2UOu+10lxxJhzR9saxhEWHBJE=;
	b=keESQm59jXis8LZFlYRRomnAGG6xowQayaKD8o5qUmnQLsGFVme36XVbAhSC2NEA0r
	x+ONiWJXrmG8CsLEgdQcC/hf3kzdw1BvMFX8xxUHSyQLz4P4vDTG/u2tV2AonimZ+vsQ
	FRtt19YSSn1XDcPvvp+aUF/HwwITpkapV9kqH1XvGCiK5UjsMq+tGmJ2C17q9vDPIdxo
	N+tDyxb4BLqF0AY5GDclPw1NMiXFWgHL93AdieJ4YKTDs9huSV9N8qi6OFiREM2gGb7l
	YQjAyiCNz0TWOqGb3IWKR9MmtIlr79FJXE9njz8/Ba8724012re4AT9AaVF8MIiyGDE3
	qpsg==
X-Received: by 10.50.88.33 with SMTP id bd1mr4760884igb.68.1443213442573; Fri,
	25 Sep 2015 13:37:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Fri, 25 Sep 2015 13:37:03 -0700 (PDT)
In-Reply-To: <232185c2493208aa41983f92c73024cb1ccdebb6.1443032533.git.chris_larson@mentor.com>
References: <cover.1443032533.git.chris_larson@mentor.com>
	<232185c2493208aa41983f92c73024cb1ccdebb6.1443032533.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 25 Sep 2015 13:37:03 -0700
X-Google-Sender-Auth: KAZT5CIslDUYywvoNyXb5ATZ36A
Message-ID: <CABcZAN=9g0jicSTp6XNbhU9TxcpHvg50mnJ2wvaN8XwFujSFFA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/3] oe.scriptutils: enable color in a more flexible way
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
X-List-Received-Date: Fri, 25 Sep 2015 20:37:24 -0000
Content-Type: multipart/alternative; boundary=089e013cbd1a94712b05209850d8

--089e013cbd1a94712b05209850d8
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2015 at 11:24 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Rather than recreating handlers and forcing them, iterate over the handlers
> and enable color on ones we can handle. This makes it easier to handle
> color
> properly when we introduce the bb.msg default log filters.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Hmm, might be worth making this even more generic and moving it to bb.msg.
If one was to run this against a logger which isn't configured to use
BBLogFormatter, this would do nothing. It should probably raise an
exception if that occurs, or automatically replace the stock formatter
instance with a BBLogFormatter instance using the same format string.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013cbd1a94712b05209850d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 23, 2015 at 11:24 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4iu" clas=
s=3D"a3s" style=3D"overflow:hidden">From: Christopher Larson &lt;<a href=3D=
"mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
Rather than recreating handlers and forcing them, iterate over the handlers=
<br>
and enable color on ones we can handle. This makes it easier to handle colo=
r<br>
properly when we introduce the bb.msg default log filters.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>Hmm, migh=
t be worth making this even more generic and moving it to bb.msg. If one wa=
s to run this against a logger which isn&#39;t configured to use BBLogForma=
tter, this would do nothing. It should probably raise an exception if that =
occurs, or automatically replace the stock formatter instance with a BBLogF=
ormatter instance using the same format string.<br>-- <br><div class=3D"gma=
il_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>=
Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--089e013cbd1a94712b05209850d8--
