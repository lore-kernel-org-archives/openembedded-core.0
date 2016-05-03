Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id D596E65CB6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 15:02:33 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id k129so2543389iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=knBF/UCJg6+4O/ZCO4imlENzLPvuE0+gQu1jNYXtG7Y=;
	b=r3Cwaashgcd0tTaAJgQwmOQHFnD24Syj3qXUVJJSUYsX98pVpMDyq22Jv78h8Xn/fB
	90te05wkiK+sv2T7ObZz9qJEeegozxMb6Ypaqdh6gNhM02WffbfIXtJHXWYqBJw8YuJo
	tQjdNFZFHbLlZAdd2FTZq7UMeWwFS2t0q8W9h6fxMoGvuG6fcTZiOSI5liQS6B1AkJ6r
	xF5RQhIc2SSU4WdrnIUOf577A1Ces9Kh4CFxMl/qyr7Fcf7gK16C8lvkZEdC4vG9h/OL
	7VwQRQqoBBVQHGp2pc1ILXaU21X/LG8w0ITi7rOeG+FBZW7KYVXbwlHjDkBltQRqNKFJ
	Yp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=knBF/UCJg6+4O/ZCO4imlENzLPvuE0+gQu1jNYXtG7Y=;
	b=e2lRgHMpD5roP5uWy3DmPfm64mAQczdaXA6+DLC6aRaOWWyHUziC2aiskTpXpkrJ5r
	/eelbB8FKit0GHvRhtzm+pPeUHm58jLhJovnhh7cRNtKZwZJeMmBp58EpqiwBxmdpBxS
	xhJLmB6dBt8HAjXQ2nIX70InRK2aGmhDe3qmlkNYN15K21MV5Anz2uQ6OXX2Ysw1S9GF
	z8y7HZBzFHbgfZWZv5VMUZyhOTr+6cL0I6r4McIppyZ4RUpfQMxSGBHRxhqeIjHb6n6e
	lFAyT64LuNY6sv30+QbLAxXm9qSb6Vp5Opz1RASF4jqpPPHrCry8cmjn+xFrvWNQtHXj
	GoaA==
X-Gm-Message-State: AOPr4FWpBfeD+IKN9pDuK+wHHtrqXbpWAWHlT71YlOvvQTp5n8GN9aVvDkihRGEe37vQhMdV8IDoPtXPwJ6TDw==
X-Received: by 10.107.2.70 with SMTP id 67mr4086343ioc.70.1462287753277; Tue,
	03 May 2016 08:02:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Tue, 3 May 2016 08:02:13 -0700 (PDT)
In-Reply-To: <20160503072724.GA6303@linux.intel.com>
References: <1462233963-14800-1-git-send-email-kergoth@gmail.com>
	<20160503072724.GA6303@linux.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 3 May 2016 15:02:13 +0000
Message-ID: <CABcZANkug5g34XRuZ=wkKzP69KozpnC+4R0DuhCAvd6=kUSRzw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: add WIC_CREATE_EXTRA_ARGS
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
X-List-Received-Date: Tue, 03 May 2016 15:02:34 -0000
Content-Type: multipart/alternative; boundary=001a113968141a59900531f166c7

--001a113968141a59900531f166c7
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 7:27 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Hi Christopher,
>
> Thank you for the patch! I like the idea.
>
> Would you mind adding or modifying wic oe-selftest to cover this?
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>
> PS: You've mentioned --bmap as a possible use case scenario for this. I
> don't think this is the case as it's simpler to use wic.bmap image
> type to achieve this. It's implemented by this patchset:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120644.html
>

Ah! Thanks. Will do. Thanks for the feedback.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113968141a59900531f166c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 3, 2016 at 7:27 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9=
e" class=3D"a3s aXjCH">Hi Christopher,<br>
<br>
Thank you for the patch! I like the idea.<br>
<br>
Would you mind adding or modifying wic oe-selftest to cover this?<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br>
<br>
PS: You&#39;ve mentioned --bmap as a possible use case scenario for this. I=
<br>
don&#39;t think this is the case as it&#39;s simpler to use wic.bmap image<=
br>
type to achieve this. It&#39;s implemented by this patchset:<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2016-A=
pril/120644.html" rel=3D"noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/pipermail/openembedded-core/2016-April/120644.html</a></div></blo=
ckquote></div><br>Ah! Thanks. Will do. Thanks for the feedback.<br>-- <br><=
div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergot=
h at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mainta=
iner - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a113968141a59900531f166c7--
