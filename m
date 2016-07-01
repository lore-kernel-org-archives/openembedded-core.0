Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4626012C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 20:43:20 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so25436183ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=vy85vY4T5FgFQ7ZsmZgYevBjoqcAMg0Y5Apz9Dr5H3o=;
	b=rvKcKZvpE78R4/ndq2DeJIaQGMHlX6nzpih97v558OA/X8QusyGedLAiYnniI04UFh
	QBSoC4QyQge2W5gLLnbk7i+uvbhOBkwJt9wpJKwUNWnxkkc7N85Hbqe1t6mh+UUQ0/Sv
	i/iv85UHBuk9LLv7nOJQskdZxsyhkX9ZLOGizjZiXYQG9lXDPxSVODBGGAVSTbbclsPE
	xNETvw7Kkq0SefVg/h72/YK9Ky0h5zKfncRcghDLrXDsdnDdc647IJB0bX0g1EdyR3zb
	QBBgGpzyMiicVnwGxwK+G5CKwMS1OR1gYH4vaOgHTULBWwaTkKMLgZm0dv1h8+w9jZtf
	GCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=vy85vY4T5FgFQ7ZsmZgYevBjoqcAMg0Y5Apz9Dr5H3o=;
	b=IXZjidSTVmyofXW3zLkoM12skQ/eOG1HYNAfpOaDAAypyaa4qTdzUbt1jYnf4qWZsq
	gFNzc3JCzePZ12gcgoWnLJEkTEIgQBNlzVJ9NCpQAzEVX4e1Z0H8NYelIrVPT8cOidYC
	A+GjbGH68Lq2D3qdiq5d/lZ/FUYYQOODc1b4YVRyK5v1tx21BJQG9leoxo+9PU0T/UUK
	V/+QQwEz/tiXdEV4X1CQSgNXtB3WSPqyI0gWn3UkbbgGP6lkJlkzv+FRljeBvTsuSIK3
	r8N1pqfA1Kx6JMfdJr40C2gOLRG11MX+ncYrVOPhXVSYBr6GrNv0igR/rxjCetgIadRq
	AoKg==
X-Gm-Message-State: ALyK8tIenHcgCgKPTZguQCKnBPixNKzfwryjct5DJ45jeaEsVYgkiA5pS3O4tYtiEVlgINlLmZxhDfA0DGaeDA==
X-Received: by 10.36.43.216 with SMTP id h207mr177059ita.66.1467405800774;
	Fri, 01 Jul 2016 13:43:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.19.70 with HTTP; Fri, 1 Jul 2016 13:43:01 -0700 (PDT)
In-Reply-To: <1467405590-12602-1-git-send-email-kergoth@gmail.com>
References: <1467405590-12602-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 1 Jul 2016 13:43:01 -0700
X-Google-Sender-Auth: SzqLUdVUlNqMG1PN7kMHxIFr6kg
Message-ID: <CABcZAN=wa8OVmvKSAoLb=Gk+UjiAQd9aUYJWwAkXM6UpSXCU=Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2] buildstats-summary: round the floating point percentage
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
X-List-Received-Date: Fri, 01 Jul 2016 20:43:21 -0000
Content-Type: multipart/alternative; boundary=001a114748a27f2208053699098e

--001a114748a27f2208053699098e
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 1:39 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This was rounded in python 2, but python 3 changed the default behavior of
> /.
> We could switch to the same behavior as previous by switching to // rather
> than /, but there's value in keeping at least one decimal point, to avoid
> the
> misleading case where it says 0% but the reuse is non-zero.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

v2 changes: fixed to correctly do the rounding as part of the string
formatting.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114748a27f2208053699098e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 1, 2016 at 1:39 PM, Christopher Larson <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":a6" class=
=3D"a3s aXjCH m155a8309fa19cc81">From: Christopher Larson &lt;<a href=3D"ma=
ilto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
This was rounded in python 2, but python 3 changed the default behavior of =
/.<br>
We could switch to the same behavior as previous by switching to // rather<=
br>
than /, but there&#39;s value in keeping at least one decimal point, to avo=
id the<br>
misleading case where it says 0% but the reuse is non-zero.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>v2 change=
s: fixed to correctly do the rounding as part of the string formatting.<br>=
-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics</div></div>
</div></div>

--001a114748a27f2208053699098e--
