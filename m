Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41])
	by mail.openembedded.org (Postfix) with ESMTP id 64E1B6150B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 14:12:06 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id a2so5738164vso.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rw3ixdDPiGRaAE7HlMqE70rIRhL/yzJTT5faro5ufHY=;
	b=gM+6+3F5Gvc7CvvIIFoGeQSaRXZQrOcJKbhuoZKCRc3us84mY0jh1OiwVs9qi8xDAD
	yAPJrDlH1/zcnb+myqI1cbu9R9hmuLSiH9qisk2VKEvPtPY6RQUVm1AT36+kuntRV30Y
	w+DAKB3TvM26GDAcPCuR2Mt+7lIBkPnD+pRtVYGDPZwNNrDJZ4Wqhr7TptgnuWA6QScG
	lj7g4r3Ll/KiHzimltZjl8cd4CVLJupUY9ynsFJ2C90m2EH53p7SeaHYp97+kzJrMAoS
	GWN8jbR2JdmndLG3eU4Y4fZa6WvLhhwoYDscxmYv/OqXnnfVYm184UhF+tl6Pt/NrWqW
	4tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rw3ixdDPiGRaAE7HlMqE70rIRhL/yzJTT5faro5ufHY=;
	b=eEYZpSDzUZ1GP6YSxY0Y327E4kKLQO6S1QX6PK3s+7lGMtPst7ThCC1bDY7i/POLe+
	RE1nll9UgZvuFNMwCLmjnArz8t4M2zmLe13j1PczIIA7BqKz4cfL//CD4tZD2G1JArSk
	jkx9IeubJ1qUYcRFSD7KC+Ie8x7DzeeLQIo0MY9ogKO0dMPKS2o8ZCPon34MLY5HZYM8
	smB/STN7tsIBGbhs2+rUe6GcTNwpjfEbvc8k3f0LtxcN5UPtw+E9df24E9Z0FS9RDYM4
	McRunjjT9czhfxtKlFfxLQcB8OV87yZczVH193UNHdvsaSWwsqA8vgzINVWch4mO0HkS
	3B2A==
X-Gm-Message-State: APjAAAUoggX7QCr+mJx1K82D5sJ3d7L7pwGjRCdW8EkYEh3LoOqDSQ7S
	xHaCruqcNMiAn89Hzis6aSnZaA1a2eUEkg1IdLRfWQ==
X-Google-Smtp-Source: APXvYqwOX93u3YNsrLm7VrAKB1hQPBdnhWihOb3ZDw/+r3xodgipQK0sTtlPZAnTz7Q/T+pNcc6rxla4Gcze9S9ZCBc=
X-Received: by 2002:a67:7987:: with SMTP id u129mr27371247vsc.83.1582553527133;
	Mon, 24 Feb 2020 06:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
	<20200224104635.GA27036@localhost> <20200224140801.GC27036@localhost>
In-Reply-To: <20200224140801.GC27036@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Feb 2020 15:12:26 +0100
Message-ID: <CANNYZj9SzHQ6gA9W=0vs=VYtVq8uRq=4S0F9zLyEDSq2Nt-beQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Mon, 24 Feb 2020 14:12:06 -0000
Content-Type: multipart/alternative; boundary="000000000000d2aa59059f52f45d"

--000000000000d2aa59059f52f45d
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2020 at 15:08, Adrian Bunk <bunk@stusta.de> wrote:

> Alexander, wayland support in webkitgtk requires mesa built with x11
> support (otherwise gl.pc is not available).


Can you provide links where this happens please? Specifically, where mesa
makes that decision, and where webkit asks for that file?
So it's easier for me to look into it.

Alex

--000000000000d2aa59059f52f45d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 24 Feb 2020 at 15:08, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border=
-left-color:rgb(204,204,204);padding-left:1ex">Alexander, wayland support i=
n webkitgtk requires mesa built with x11 <br>
support (otherwise gl.pc is not available).</blockquote><div><br></div><div=
>Can you provide links where this happens please? Specifically, where mesa =
makes that decision, and where webkit asks for that file?</div><div>So it&#=
39;s easier for me to look into it.</div><div><br></div><div>Alex=C2=A0</di=
v></div></div>

--000000000000d2aa59059f52f45d--
