Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 422166AA18
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 18:40:28 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so9399211lab.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 10:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=oVp0Z82r0kXsmSctXtGGSyc2k6ePNV6rhtEcmqLyltw=;
	b=gPoylTeIs8qWO0UIl9MNKhByNbkOq3ycCJ1/JN8T/JaY1KuPbYDasfP2HmOGfV6xRM
	U/X8mE/6bySjpesfn5+IzUGy9FxRQEleoECku1MyFpybdGIcwqmP8zusgQ30kN3lTSc+
	or8iUCqpVUiq/zznlBHp9pmbr/9J7BBIeMCWiSvsGOtzxwTs2vkaJzO6pH6JbgMZoAIl
	SKBZFFlDUUSRvEkb36YUBtOa0ezKWeXL3xtAH9POK9j2fq1/iUKZOe077GF6vMeHqeWT
	4ty20GohmVIdAQwOV7Bb7EBwP1Rn8GZkzNtUDGtG8Pzf8/txQzZNW0ob3ncHKSevog6p
	T+6A==
X-Received: by 10.112.167.228 with SMTP id zr4mr446709lbb.56.1386096027036;
	Tue, 03 Dec 2013 10:40:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.176.201 with HTTP; Tue, 3 Dec 2013 10:40:06 -0800 (PST)
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 3 Dec 2013 11:40:06 -0700
Message-ID: <CABcZAN=RUKdQcxE=9aQoXcap2LYA9F5begiT5jD2-JFY-h-NYw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Random fixes from the Mentor Graphics push queue
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
X-List-Received-Date: Tue, 03 Dec 2013 18:40:29 -0000
Content-Type: multipart/alternative; boundary=001a11c2432a50f03704eca5a109

--001a11c2432a50f03704eca5a109
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 27, 2013 at 11:07 AM, Christopher Larson <kergoth@gmail.com>wrote:

> The following changes since commit
> f991d2d60b74f5ebd990f77aecd3324b1a4533e9:
>
>   libpng: set reasonable SUMMARY (2013-11-27 11:51:08 +0000)
>
> are available in the git repository at:
>
>   https://github.com/kergoth/oe-core.git random-fixes
>   https://github.com/kergoth/oe-core/tree/random-fixes
>
> Christopher Larson (7):
>   update-rc.d: process symlinks recursively
>   perf: remove /usr/local/include from default makefile includes
>   pulseaudio: fix RDEPENDS traversal for consolekit
>

Were there issues with these, or was it just that further testing was
necessary? I noticed this series was partially applied.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c2432a50f03704eca5a109
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Wed, Nov 27, 2013 at 11:07 A=
M, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail=
.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</span> wrote:<br><div cla=
ss=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":bo" style=3D"overflow:hidden">Th=
e following changes since commit f991d2d60b74f5ebd990f77aecd3324b1a4533e9:<=
br>

<br>
=C2=A0 libpng: set reasonable SUMMARY (2013-11-27 11:51:08 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 <a href=3D"https://github.com/kergoth/oe-core.git" target=3D"_blank"=
>https://github.com/kergoth/oe-core.git</a> random-fixes<br>
=C2=A0 <a href=3D"https://github.com/kergoth/oe-core/tree/random-fixes" tar=
get=3D"_blank">https://github.com/kergoth/oe-core/tree/random-fixes</a><br>
<br>
Christopher Larson (7):<br>
=C2=A0 update-rc.d: process symlinks recursively<br>
=C2=A0 perf: remove /usr/local/include from default makefile includes<br>=
=C2=A0 pulseaudio: fix RDEPENDS traversal for consolekit</div></blockquote>=
</div><br>Were there issues with these, or was it just that further testing=
 was necessary? I noticed this series was partially applied.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c2432a50f03704eca5a109--
