Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C53436B06D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 17:09:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r17so9139229wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 09:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OGr2f48/+DDuOqgg8rNaGZlOeJqca8rpbxfBSFtT18E=;
	b=kTWTSGuVtQN6+GVnB/rVtUVp7UYjagkAucf9n5GqCd68Q8zyVHpQBpWf+9adGoBPtS
	oUYB4R0jHCFYRPq/LCotiDLsBK3B8EO+3pJ8en11xeDq2OKGxcPT5ew7fF1jrWz6E1p4
	FXLZc0lZ41WogG1X2VEp/OGLWdRPrtENCy9ikkYcYwVzGug8IFOKohsVvoDKy22qetgl
	jyX8myYYjz5mv5Wgkd4eUTLrMDDjjR0wkNzQNBrgHvnhnWYM+Zq/snXflCfjVbVpiCH2
	0NDh8RZrgF64EFJvYUJcjVmnhhjAX5S7xwNISQO7EwQCnmfMrpkwU5Q+Wc0eTHpaRRqh
	pGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OGr2f48/+DDuOqgg8rNaGZlOeJqca8rpbxfBSFtT18E=;
	b=TK53CysM4kRg5nNyP2+MQcqgEk8HEU1H2ESaWq2+1HTdBxxBrQ8Eai/my2DYyl3gd6
	PRq9OqCcW+l6AwIiRXJd8KP/BAL/1EHU2y//GXhlqKitjsr+sd7I4wasKUobuNZTiB16
	1ly/ZWaoX+v3NIniAlZ75DB9JYyOJeqLnIqDjHIpd8KLm7aR+lJJoa5hxHv3nTevxWJx
	904yPRlRyTkLtHcbPdydKe5dixjvS6wrhba78cUIQVDHcZPYZCnm+j3zIZmHYwHTajtv
	Du45Atzsh7K7831G3YaRNAU7eEqUcK0z82pOciLewBIXPcY5l7naOzyBMESelxFliqqF
	s5sw==
X-Gm-Message-State: AHQUAuZxRVndsaDPS4Ps2iVOsMw5UprU7Mzp0BTLiquIRbIutfF3qyyq
	NEnsGWPz1VywvmAK24GDnyYQnvX4D8EIQADKjB0=
X-Google-Smtp-Source: AHgI3IafrZHIFH/P4UbacqwZLtBCKOQ4q+/0rIBEZgw4zdAgWI+ZLogA/JvyJ4XUpmZYNLIrfaBzjkCAVyHW7ENDv9g=
X-Received: by 2002:a1c:9c15:: with SMTP id f21mr3203625wme.94.1549732199488; 
	Sat, 09 Feb 2019 09:09:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
	<20190209094419.GC2258@jama>
	<CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
	<20190209131942.GD2258@jama>
	<CANNYZj96zNL+=JFny8cb5i9P2+WesPVrE0O+UbxLVQt8+5ysXQ@mail.gmail.com>
In-Reply-To: <CANNYZj96zNL+=JFny8cb5i9P2+WesPVrE0O+UbxLVQt8+5ysXQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 9 Feb 2019 18:09:52 +0100
Message-ID: <CA+chaQfa59P4GF8prxAcu5vbnw6NirHumYhbEWPxtFPopTJQeA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Sat, 09 Feb 2019 17:10:00 -0000
Content-Type: multipart/alternative; boundary="0000000000003f628505817925cb"

--0000000000003f628505817925cb
Content-Type: text/plain; charset="UTF-8"

It was sent to upstream (somewhere) by the original author, I haven't found
it on gitlab, so I've asked original author in:
https://bugs.gentoo.org/571124#c5

Plain poky probably doesn't use gold, that's why you're not seeing it there.

On Sat, Feb 9, 2019 at 5:43 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sat, 9 Feb 2019 at 14:19, Martin Jansa <martin.jansa@gmail.com> wrote:
> > The fix from
> >
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/qemu&id=c29d4ccfe0a5f53c49883e55c2c2bb444997b1cf
> > is still applicable and fixes this.
>
> Somehow the issue does not show up in plain poky, but the fix seems
> right. Can you send it upstream via
> https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests
> please?
>
> Alex
>

--0000000000003f628505817925cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">It was sent to upstream (somewhere) by th=
e original author, I haven&#39;t found it on gitlab, so I&#39;ve asked orig=
inal author in:<div><a href=3D"https://bugs.gentoo.org/571124#c5">https://b=
ugs.gentoo.org/571124#c5</a><br></div><div><br></div><div>Plain poky probab=
ly doesn&#39;t use gold, that&#39;s why you&#39;re not seeing it there.</di=
v></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sat, Feb 9, 2019 at 5:43 PM Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 9 Feb 2019 at 14:=
19, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; The fix from<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/commi=
t/?h=3Djansa/qemu&amp;id=3Dc29d4ccfe0a5f53c49883e55c2c2bb444997b1cf" rel=3D=
"noreferrer" target=3D"_blank">http://git.openembedded.org/openembedded-cor=
e-contrib/commit/?h=3Djansa/qemu&amp;id=3Dc29d4ccfe0a5f53c49883e55c2c2bb444=
997b1cf</a><br>
&gt; is still applicable and fixes this.<br>
<br>
Somehow the issue does not show up in plain poky, but the fix seems<br>
right. Can you send it upstream via<br>
<a href=3D"https://gitlab.freedesktop.org/virgl/virglrenderer/merge_request=
s" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/virg=
l/virglrenderer/merge_requests</a><br>
please?<br>
<br>
Alex<br>
</blockquote></div>

--0000000000003f628505817925cb--
