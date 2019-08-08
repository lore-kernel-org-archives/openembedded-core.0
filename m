Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 737E07F2AD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 15:44:35 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id g11so9761385uak.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VGrwVUqNkQ5QOJmVNmIJy4tksLUjNBXzBqxCVqlMA+o=;
	b=DYh+eJc4LmHo2hLJvgIelthSYpiZn+sWzsFYnZVBMYcOkUJnAfMRBhQijivV8aoG7R
	i6sg4nvA/dC3ZnK8XLphlhYSn/AfXYFG/kWTg6eLqvR/Ku2aPYJklvr16I5+LnwU6RU4
	DFsnaHsiZ/GmZYhP04b4DmctkUtVKq/FDJEqN+N22/IkgRL0wfdGnJKcDk5dEPKFmaUp
	0uLtYKEFTUeyAHV1Xzpkv3+67fzWeSwkcQYVhAwnuRRBD35/cV/sa3pGbMARPmd+aO9F
	SflXaLxR9dNFq/aj7d6brXwq3mg2MR317ho+b+2Qd5Rsn7RRCoqSdaCyl4Kl8QN5+bdq
	VXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VGrwVUqNkQ5QOJmVNmIJy4tksLUjNBXzBqxCVqlMA+o=;
	b=C7fEuV/RKiDTKPp8+enVsxlgSQhFQlJ/MTVbrsG1hxssxkJb7CBcb/OxYw+varh1nq
	aZBzOAPvLHvKim9CC1NLWBG1X58zSxb1Z5eQVIXJ5u2Rmb2bNfLMLtruQShF18GuZXCh
	XU4iAcHFMemNQdwYpBraBiEJdhSj8vdIQqNBdcshMzGEXr/Wz8xJ1kTU5UBVtrMX3KRg
	VkfqN0iNEUGEEYbHiHHsvF7s+WdwB+m7PY3N+lwjsQLoWaKzfh4PGODAYfEWG+a5lO+v
	f6uTQJ6IhVnL7S0lUThc7UQUI3tZTa13uCLr0XF2NmIjcfZJJQRMZrIDj8EhZksrDdgh
	xrLA==
X-Gm-Message-State: APjAAAV2PCTIPTLA581CVs0bvdPALx8ubyrIOgvYxj34G0Y757NgXiRI
	A1UXhFNd0MTASmw5BIVbJs0/2c7BTpt7j93jZlI=
X-Google-Smtp-Source: APXvYqzjy1KeNKxzQ9DYIVsU8uMF6+FxXprZAIyDEDDkTkPqhkOrWhnwywVLz879xUDMuWCvWLN/gmgbxVdiS7LVaNU=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr9127551uak.71.1565279076330;
	Thu, 08 Aug 2019 08:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
	<94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
In-Reply-To: <94b692a828bbf5230f56afbc401bf9d66660283b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Aug 2019 17:44:25 +0200
Message-ID: <CANNYZj-t2TSN4dMpfEgU_k_dDqHRLeqNSYWi-=uUK2BH09-tMA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Thu, 08 Aug 2019 15:44:35 -0000
Content-Type: multipart/alternative; boundary="00000000000051b45c058f9ceff4"

--00000000000051b45c058f9ceff4
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2019 at 00:08, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> You might want to have a look at
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/621
> and maybe other pieces of that build yet to finish, not sure...
>

I ran bitbake world to check for newly exposed missing dependencies, but
gcc-cross-canadian wasn't included in that. Will fix that too now.

Alex

--00000000000051b45c058f9ceff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 8 Aug 2019 at 00:08, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">You might want to have a loo=
k at <br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/56/build=
s/621" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/56/builds/621</a><br>
and maybe other pieces of that build yet to finish, not sure...<br></blockq=
uote><div><br></div><div>I ran bitbake world to check for newly exposed mis=
sing dependencies, but gcc-cross-canadian wasn&#39;t included in that. Will=
 fix that too now.</div><div><br></div><div>Alex<br></div></div></div>

--00000000000051b45c058f9ceff4--
