Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 19DA57F696
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 21:12:35 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id k11so257002ual.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jWHUwkOzfaiiBCX51CUeio/EU3zsoBh45S9BkJ7gRZU=;
	b=pcbFhIyRvHPqD65Wm9NGOaMlzmXRa9vf+O6GOLL01dJsdJ0Wi34uMTokD2soSlK24w
	erxm3iA8Pgs+QaQ0hp9Dd7EjvinQ2S52Lh+WoJzaAdxBl+neY9hBvU9u9BMgt5SGurnr
	XY85xIYkBof9udhFl8D/r/la3udlCZH/LfthucAW8qDshiFi5+QUR5+b6Ll76gXBzZhY
	glOduVaXVp3XPsSU+Ee4k6J7AYJiGU9/lFsbUpz1wXaym2ROMzgZG2UGHfTD2VWyp2DU
	OzATVPgjl5qzwyV7lSmlTLDDstTUxe1g8++NGNEkfNTb8DdjslLUCSb2aM02cNejnGA8
	5yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jWHUwkOzfaiiBCX51CUeio/EU3zsoBh45S9BkJ7gRZU=;
	b=q9A4zihFKYmQLGuOFuuVlrDfbDJzTPI+icQNMh/JxebPLZoMeFUpenog/36db8iCKJ
	IxylHTToY/mQ2t6ayp6AczG1qf0xdNW+oCuAIZF7rBNI6VXnyCdCamQoqhfR36Laj83T
	1BXvnU4hB+ghRClrv8eUYsS7BJzz1RLCjCOOmFYrACp/YVSh7wGFYScPIEvULJndmHd/
	YECJwG3XwToJTEKGc4fEaIn9aHl142liu/APg40xbpJ21Sr7VpLQRJLeyOGe9KbRfSZN
	l4dqjcH/WB8BjxEMYtMTo+t7FxrUiFfQMg3BDMAIBUVxaBjFUb2taMfmVzfn3tW+iyBS
	NpwQ==
X-Gm-Message-State: APjAAAUP/oHd/Nf7BbpU8n7DZfm0LTB2APjSbFbra/2OtPm7shdU0HYS
	PJjSnjqyL8AzdTlL3TVPW2pbNROtjA6HzWTQn/INkA==
X-Google-Smtp-Source: APXvYqyOT80ahZDdZKsFYmEZzYUZQd5uUPhFb7rJvzmg6nb6Af1aontH0YzoAPiIzeG2fQn+XucPKlv+628mXGJN2VY=
X-Received: by 2002:ab0:3399:: with SMTP id y25mr3375576uap.100.1574284356808; 
	Wed, 20 Nov 2019 13:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120201717.GA23850@localhost>
In-Reply-To: <20191120201717.GA23850@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 22:12:25 +0100
Message-ID: <CANNYZj99KZEZCHhOEQKBBguXC=mgXtb-rOAaMSX1K35ie03cSw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 20 Nov 2019 21:12:36 -0000
Content-Type: multipart/alternative; boundary="000000000000dcf2c90597cda340"

--000000000000dcf2c90597cda340
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 21:17, Adrian Bunk <bunk@stusta.de> wrote:

> > Do you want to maintain it?
>
> Did you already contact the maintainer whose name your patch removes
> from maintainers.inc?
>

Most entries in oe-core's maintainers.inc do not carry any real
responsibility or commitment; they're there mostly so that monthly emails
from auto upgrade helper end up with someone. Actual maintenance comes from
those who use and need the components.

I can certainly ask Anuj, but I bet he has no interest in lrzsz whatsoever.

Alex

--000000000000dcf2c90597cda340
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 20 Nov 2019 at 21:17, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">&gt; Do you want to maintain it?<br><br>
Did you already contact the maintainer whose name your patch removes <br>
from maintainers.inc?<br></blockquote><div><br></div><div>Most entries in o=
e-core&#39;s maintainers.inc do not carry any real responsibility or commit=
ment; they&#39;re there mostly so that monthly emails from auto upgrade hel=
per end up with someone. Actual maintenance comes from those who use and ne=
ed the components.</div><div><br></div><div>I can certainly ask Anuj, but I=
 bet he has no interest in lrzsz whatsoever.<br></div><div><br></div><div>A=
lex<br></div></div></div>

--000000000000dcf2c90597cda340--
