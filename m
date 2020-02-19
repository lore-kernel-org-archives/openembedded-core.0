Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 41D1F614FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:41:08 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id w15so365924uap.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 07:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pembBalDkazzlHGt5JiGDbE4XBW1OlfSdAqqxJpQAkM=;
	b=XwEgyL7ySBY36pXZE6xUG0gtcN+al8qmBlLoBLJfDBYeG4yrBQ11FK0f/SqUC8W1XU
	n6R1sw4x1aMxRHuLOxWPrSTsZbkIRHSwk2eudD/wsqdTq1QZ+vDN2xKhMZME7mE79pfD
	PK0h8ja8eh/jgu3Axl4p0719r9MS+zdYgYqq6ehh5ZdOcrTW89MP0OoeBkHwLScZee8+
	uv5sEfdwTNhSf4Sr9/vVovygdGy88YjvCI6ZXlbulkUBRC32JTvrC6RBfCjYJmY1zOKN
	Bvz2EDSbi/pGRgR3zobd5xWCarJ2kerFlL31solYWZQvPYI7MIqO8p9qUWB1zDDe4YnY
	tPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pembBalDkazzlHGt5JiGDbE4XBW1OlfSdAqqxJpQAkM=;
	b=hweUnIqe6YHzMwPeVjw2rE8t/8IWb//coj+EQ1PM+au8I35y/KLMoJpa+UV2XqnYAI
	1I5QXwliozcooLa3rfn+/QDYK35mIo5pyk0s/aaQXp8eOidmdSEBqePmEFYSBO4vcFvi
	MtznR77MEiLudhvjSNo7iqUaybxuOvxgKCzwDThURWch2GvBAwwwboOZNgToP4qu/W9C
	SjBuEIjBStkhWcEG8PX3zW8SiTlElYzbkSmQgb6pIqUgKVXOQ6SGqN0Kh2vZDfZiTfMY
	kMzMDAkUICgJMG5B8VJpEM1TVZPmVxkmhV1fgWYkpsU+93tOl73W27S0LSCEGRpydtLs
	dnYQ==
X-Gm-Message-State: APjAAAXwv3FYlQnj56TJwBfyT6B5RkMSpJtsIpSVKmIc6cNVDxSCw4KC
	ZxXsaBT2RbhAV0dkov2Xma+c7TzKVBGDPUHGN7s56A==
X-Google-Smtp-Source: APXvYqyoRgCA58nqGqGTVIUV8yUF0+FuDkzUSZnqK3wprVt+02sY7mxgXdPMQAnB5/I4Rl3yiJqV8Nng1F/4ZTFZTPI=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr12514331uak.22.1582126869022; 
	Wed, 19 Feb 2020 07:41:09 -0800 (PST)
MIME-Version: 1.0
References: <20200219152355.123718-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200219152355.123718-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2020 16:41:32 +0100
Message-ID: <CANNYZj-VfzdUhLnTGy9y0FBFtuXVDkudk8S+YXQnrZbdYhFPnQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer: Fix reproducibility issue around libcap
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
X-List-Received-Date: Wed, 19 Feb 2020 15:41:08 -0000
Content-Type: multipart/alternative; boundary="000000000000048cbd059eef9ea7"

--000000000000048cbd059eef9ea7
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2020 at 16:24, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> +PACKAGECONFIG[setcap] = "-Dsetcap=enabled,-Dsetcap=disabled,libcap"
>

I think this should also depend on whatever native recipe provides the
setcap binary, so we don't depend on host setcap at all?

Alex

--000000000000048cbd059eef9ea7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 19 Feb 2020 at 16:24, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);pad=
ding-left:1ex">+PACKAGECONFIG[setcap] =3D &quot;-Dsetcap=3Denabled,-Dsetcap=
=3Ddisabled,libcap&quot;<br></blockquote><div><br></div><div>I think this s=
hould also depend on whatever native recipe provides the setcap binary, so =
we don&#39;t depend on host setcap at all?</div><div><br></div><div>Alex=C2=
=A0</div></div></div>

--000000000000048cbd059eef9ea7--
