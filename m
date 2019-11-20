Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6617F8A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 22:56:48 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id p18so356424uar.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gvh99+xu3NU01Iqbtx5EHjPL5MBvAdAwFHyiVSuehpM=;
	b=ExKK32bsjE3+qy/y4GhYufIAoAwtQeTDLFsg4A2ZNuwAhg7nTedmQbRJmPwjkS2YLt
	Ltcf3bKwpI7R+WJ0s5kkDEbcQfTyBSEQQBjKPnSo3i9DYNIg1lLnu2J3b82fCt/nq3vs
	XKnx2Q/zPmkHGNdbh9ojuUyPo8QS/KmblQN1cwIkVu+J6BCyjdHZe+feBaqgZWBP7gby
	aOG1AGC5DfMmSMK0POCVeCQ6HFOO9kb/ndEFE8iq0y0mGwWcJklZp7lwXK0/4qbUtj6V
	hZuISfcrj5WpyL4HIfIVUY7Th+SZDA3ucg0H/uc/O40HGzDet7J0fESLYH55T7/Pl7ZW
	YBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gvh99+xu3NU01Iqbtx5EHjPL5MBvAdAwFHyiVSuehpM=;
	b=T44Rk9YEPbWpkZENXTRbUfKb7ZW/Re1QUyeW79MDKGuSDPUmf+RJU04gI8KbS09Wak
	86M0V9QJ8jQ3p7KWzWnes3jjdCK0syI9LIrVpRawoC5fM28TouewW9Y4wKsen97blBbd
	Jhf6WxxyouAIYC9GvdZbp1f+8zj+v6vVc79yXxvqaefqGzYW1X/xw2CoC99/wrhdQkBj
	vs7b5kBLyKx8cbllZM/rT4BQHcDxhZkspiT2iU/FUI7/jhCGp+f44ZqY4DS6mIfeNN0u
	oDY4Q2r3o1q8Y7aFIsZ6A3IhQ0eGB1etBNZaz/klW68fQVG9oCdC7Y2pNnNq3fLwOu/e
	yJ0A==
X-Gm-Message-State: APjAAAUAnG/WofC5ysweEqUEhu+qG+yOmQutmPgEEmFzqUaVuDkDU/LH
	0vUHO3RlMGfl8tIkCs3rNXASqothkf7sXCYbHns=
X-Google-Smtp-Source: APXvYqy7N22VEwiXaho0AKpazPqlBvK8QiZpEcuKyEf4+VIcgzpGUu953g1EFL4XU38FATWc+/Trp+peQCpXLEDyC3s=
X-Received: by 2002:ab0:6545:: with SMTP id x5mr3586821uap.89.1574290609753;
	Wed, 20 Nov 2019 14:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
In-Reply-To: <20191120223207.6cuuklpgrzuhqug3@pbcl.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 23:56:38 +0100
Message-ID: <CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Wed, 20 Nov 2019 22:56:49 -0000
Content-Type: multipart/alternative; boundary="0000000000009154620597cf18a1"

--0000000000009154620597cf18a1
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 23:32, Phil Blundell <pb@pbcl.net> wrote:

> However, I think the point still stands that the commit message needs to
> provide a better description of why the package is being removed.  If you
> think it represents an ongoing maintenance headache that's already bad and
> only going to get worse, and this now outweighs its usefulness, let's just
> say that.  Not all old software is problematic, and not all problematic
> software is old; the fact that the last release was 20 years ago is an
> interesting fact but in isolation that doesn't represent a problem.
> Indeed, compared to some other packages in oe-core, eight patches in
> total over a 20-year period doesn't seem like that bad of an average.
>

Fair enough, I wrote a hasty commit message. Mistakes happen.

Can I say what my problem is? Here goes: so far, no one in this discussion
offered actual help with the actual issue. If you need this or that
functionality from Yocto, please try to place help ahead of complaints and
criticism.

Alex

--0000000000009154620597cf18a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 20 Nov 2019 at 23:32, Phil Blunde=
ll &lt;<a href=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt; wrote:<br></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>However, I think the point still stands that the commit message needs to<b=
r>
provide a better description of why the package is being removed.=C2=A0 If =
you<br>
think it represents an ongoing maintenance headache that&#39;s already bad =
and<br>
only going to get worse, and this now outweighs its usefulness, let&#39;s j=
ust<br>
say that.=C2=A0 Not all old software is problematic, and not all problemati=
c<br>
software is old; the fact that the last release was 20 years ago is an<br>
interesting fact but in isolation that doesn&#39;t represent a problem.<br>
Indeed, compared to some other packages in oe-core, eight patches in<br>
total over a 20-year period doesn&#39;t seem like that bad of an average.<b=
r></blockquote><div></div><div><div><br></div></div><div>Fair enough, I wro=
te a hasty commit message. Mistakes happen.<br></div><div><br></div><div> C=
an I say what my problem is? Here goes: so far, no one in this discussion o=
ffered actual help with the actual issue. If you need this or that function=
ality from Yocto, please try to place help ahead of complaints and criticis=
m.</div><div></div><div><br></div><div>Alex<br></div></div></div>

--0000000000009154620597cf18a1--
