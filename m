Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id C27F26E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 23:41:45 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so3522544igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=iyySRfCJ0WOXN03SuLMZ01hPvwR7zV+/BAEcjdfcP7E=;
	b=i/XPNyDlKdlL94CcwoOdsqkcEW2gi+PeexPpNKM/J+j1L2D6g6S+SBtvI5wPsyNEP3
	0Jc/CKP9jvGLNCyhtpsDiQOEFFYNnB27O1n7eOTRSBs0qKAkyEW+sUJ9jFvTvKTkptou
	SmKqI7xaCSc4N+gHZ2wZfO2RihlfCXXP+00w20y2mZKeLDBYZ0AFn7hvBF4+r+GSVPaf
	Q/EUu8JTjYhrwC36pjo0IhsQapMtyGKsPmFBl8ht8S58YfRqnPgUgCjd875cI8wR1fsy
	hpefUrjY2rCKqKjMMdq8lQS1hfA6V4X91w7+25fSHvg0d4b0eyQQP8Uzv0ZutR49agpe
	evmA==
X-Received: by 10.50.103.66 with SMTP id fu2mr247543igb.0.1442274105456; Mon,
	14 Sep 2015 16:41:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Mon, 14 Sep 2015 16:41:26 -0700 (PDT)
In-Reply-To: <1442266696-6751-1-git-send-email-kergoth@gmail.com>
References: <1442266696-6751-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 14 Sep 2015 16:41:26 -0700
X-Google-Sender-Auth: _3JmBoX8PUGoDSc3CFz_8hhh06U
Message-ID: <CABcZANmRBjAg_T_W_ZKdoEmCGjmffmfvKqSr3O_FGos-jKSe5Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] image.bbclass: add do_rootfs vardeps for IMAGE_{CMD, TYPEDEP}_*
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
X-List-Received-Date: Mon, 14 Sep 2015 23:41:49 -0000
Content-Type: multipart/alternative; boundary=047d7b16360bb98c1e051fbd9baf

--047d7b16360bb98c1e051fbd9baf
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 14, 2015 at 2:38 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> We want do_rootfs to rerun if the image commands or dependencies change
> for any of
> our configured fstypes (IMGE_FSTYPES).
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Hold off on accepting this, need to account compression types and
COMPRESS_CMD. Expect a v2.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b16360bb98c1e051fbd9baf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Sep 14, 2015 at 2:38 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":tm" class=
=3D"a3s" style=3D"overflow:hidden">From: Christopher Larson &lt;<a href=3D"=
mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
We want do_rootfs to rerun if the image commands or dependencies change for=
 any of<br>
our configured fstypes (IMGE_FSTYPES).<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>Hold off =
on accepting this, need to account compression types and COMPRESS_CMD. Expe=
ct a v2.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphi=
cs</div></div>
</div></div>

--047d7b16360bb98c1e051fbd9baf--
