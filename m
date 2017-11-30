Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id B9892785A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 16:47:15 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id s197so3804147vkh.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u/28qFlMGE1IW2eDJyL+wUi0ms58r+lKfpsReztPntM=;
	b=q40Vd3ViD7PMKc22UryQOxZUB+/pSeSgmSF2e58ImSEKoYSgCcZJwkbei7wqjy6XzO
	orAKk5q6sifPKsOREONQtV4f0weyflkXREuWPcjAMuCR5jZrbo/5RWVg8p07Mk/mZx0U
	1eT5oKoMVzpucoEoPa/pXs13YqLKO2gatNjjEmwXVG0Pu2O4FFQnxJAHbD4JGE9tY20n
	Mv6vHkBbB707VN+SZRIqi7FXlB5bfQpsKOkJ/AqairzelLLkdTh+q/aN6dV26y6QxqB2
	bBawRvtQ4Ch3Ck/zAjXdECquEYOQQezlgoNjBGOHy4AFt5DLP/JQ5P+/MtKN8lfwLkrD
	GqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u/28qFlMGE1IW2eDJyL+wUi0ms58r+lKfpsReztPntM=;
	b=WjL2/XgixHklcu88uc/Kncq7zfYmmOmXvFt7t7SE8FFcXWbzp+VSzUCFN2nvMb/Yks
	rRokV0/buCA80lo2WzVMRgfqEgJXP/l/1FW32IclIpArCxbpDv+xQ4DHFJgKNqUOoVad
	6kFX1exZxGBCvsxuOWljqhVuB9bjVv3cYJsomb6eKZEzGZiWYiZgCtzSoLWq3WsHU5IC
	PowRy0La3uhjln0xiYkwGgWzwaummOSta5U2Gld20hkJgY7h1Mw2gjfnezXF1NlTYLim
	NyFPqOlT5HskIQchBXYXw8FuMIqtkDaDkM3gzFOTWrtO2gCZNABPYwHkvOzFM46zfrJX
	/Ssg==
X-Gm-Message-State: AKGB3mKc4170ntiqn2ji4sQS5wzAxrraLVDykwAc5VHFctIhHukqhCtu
	D2HnGldOlmPZD5cPe/pJ3uqZ4o0kpoSReywo1KQ=
X-Google-Smtp-Source: AGs4zMb5fvv1VY9HWgbYjSaZyr373FYMauQfs2EIifGULStcBuN347s9CXPr4qIvjyGzKoesByjytymRYP9YJWEO+Yk=
X-Received: by 10.31.41.138 with SMTP id p132mr2387774vkp.21.1512060436545;
	Thu, 30 Nov 2017 08:47:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.72.130 with HTTP; Thu, 30 Nov 2017 08:46:56 -0800 (PST)
In-Reply-To: <CAJTo0LYVTGCuJNAhC+WW8t62yMEp337Pibav0Em3ULtS61U=1Q@mail.gmail.com>
References: <cover.1477448814.git.hongxu.jia@windriver.com>
	<f1a7d03a68bf628db677027d48281c55f2b8dfba.1477448814.git.hongxu.jia@windriver.com>
	<CABcZANms469xJTfjSuRbmZpjJFBMKrsoJZ_zeHzSvgtjakPLcw@mail.gmail.com>
	<CAJTo0LYVTGCuJNAhC+WW8t62yMEp337Pibav0Em3ULtS61U=1Q@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 30 Nov 2017 09:46:56 -0700
Message-ID: <CABcZANkXy_6hrDtOdjStUSqLpZ78=GJN5qL9aGAtWUZzS5HXOA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fontcache: fix fonts postinst failed
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
X-List-Received-Date: Thu, 30 Nov 2017 16:47:15 -0000
Content-Type: multipart/alternative; boundary="001a113ef980330519055f3601e9"

--001a113ef980330519055f3601e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 9:03 AM, Burton, Ross <ross.burton@intel.com> wrote=
:

> Ah, that would be why I have this in a local branch:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/
> commit/?h=3Dross/allarch
>
> I rediscovered this on Friday...  personally I think my solution is bette=
r
> as it's global instead of needing to be worked around in each place where
> this can happen, but am open to debate on this.
>

Agreed, yours does seem cleaner, as long as there aren=E2=80=99t unintended
consequences. I can=E2=80=99t say I=E2=80=99m clear on the issues relating =
to allarch
sharing amongst multilib configurations.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113ef980330519055f3601e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 27, 2017 at 9:03 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
>Ah, that would be why I have this in a local branch:<div><br></div><div><a=
 href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=
=3Dross/allarch" target=3D"_blank">http://git.yoctoproject.org/<wbr>cgit/cg=
it.cgi/poky-contrib/<wbr>commit/?h=3Dross/allarch</a><br></div><div><br></d=
iv><div>I rediscovered this on Friday... =C2=A0personally I think my soluti=
on is better as it&#39;s global instead of needing to be worked around in e=
ach place where this can happen, but am open to debate on this.</div></div>=
</blockquote><div><br></div><div>Agreed, yours does seem cleaner, as long a=
s there aren=E2=80=99t unintended consequences. I can=E2=80=99t say I=E2=80=
=99m clear on the issues relating to allarch sharing amongst multilib confi=
gurations.</div></div>-- <br><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Lar=
son<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a113ef980330519055f3601e9--
