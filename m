Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id A35B97C85D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 22:12:47 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id c25so850978vsp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0VLAT16MlZqGf66aKhu9pDyGOTfcrs811uDFbFzfeB4=;
	b=kKZbwbkOtmtb+SyFFOXXbsLZtaQlxH8X1Wx2klfwilCwRsWm0tl690KlDRANq8cHKV
	SvV2b5GSA8hgl8IueP14SzrKbb9OFffFVmb2mz+mENIj2wFaWdGG+WQK6DWXDrxdR1wr
	ZvCD+cY2FlfIKO2ZS/6gOzgyTcycuVNYC3h6+IjFkIo0mpdC2wdKMRoSY/qWLo4xhD3j
	dYb6xk7Tu9563L+nFaVwMgmjU1x5z7JckEbFtUvoJbfRzyzekK4fY8Z9PRnAww46NEZf
	iHeGUheG4P7Eyzyr6iyh2j/f0dbnKB581KqR2kFFaT3GvS/RyF1cxmMmpTr2TyU07k+Q
	Azfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0VLAT16MlZqGf66aKhu9pDyGOTfcrs811uDFbFzfeB4=;
	b=SVPp9Gpm/5uRYQbLy223vNeu/Lj1i4G8iHxmKe0MBmYop6Sx5JhkbEfCWsfN7ck/ta
	4/3H+IE6vtgoUYAKoYXp+wiQHvtEyHwDuORYMVr8uyUrfJlzxnqdd+1nmj6cONE0PO42
	tFgj4h4Q3oSBNguUZuRFkxQfwafLGKKdGtUHpWq7xWY6/0C9uarKTYyQSkHzDPq/MC7f
	XvkSV1ZO5zzEyqzh2axW8sgPIifaIF7M7uR+hbhjp1TbKvjpX+wzeGmzZkn/cyo2qhJE
	+5/9K1Xitenz5mdoqXNbAyPKhV9i+8l5tevPRs1L09bYX5YH+Ggvkuami6ykWwqF/SY+
	a3DQ==
X-Gm-Message-State: APjAAAUbPyXRylZQsYH9ndFtby9QGoEm+OIiYo+jxe5saB6iUF0CmiQb
	/xRN0In2+qQ/wt/WrAstYKACDXhzm/FXVYvfJ/aj/A==
X-Google-Smtp-Source: APXvYqwrRWlxW8Zltm2dBtMLGvow8bgtZ+7WS1Z/21SzFbRRAhXMSlm2HfLq6z41wMAat98ZBDrOBE4L7243O66aLik=
X-Received: by 2002:a67:e343:: with SMTP id s3mr3535629vsm.83.1574287968330;
	Wed, 20 Nov 2019 14:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
In-Reply-To: <20191120213844.ome6ota74rmgosy3@pbcl.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 23:12:37 +0100
Message-ID: <CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Nov 2019 22:12:47 -0000
Content-Type: multipart/alternative; boundary="0000000000002068fc0597ce7be7"

--0000000000002068fc0597ce7be7
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2019 at 22:38, Phil Blundell <pb@pbcl.net> wrote:

> If this is the actual reason for removing lrszsz, the commit message should
> say so.  As it stands, this patch provides no meaningful justification for
> why the package should be removed, it just contains a statement about the
> last release having been a long time ago (which may be true, but isn't
> obviously relevant) and some vague sneering about "proper networking"
> which doesn't seem to be helpful either.
>

The gettext problem is the immediate reason, but the broader reason is that
the code is not maintained, and we should try to avoid burdening the
project with unmaintained code. There's already 8 custom patches fixing
issues caused by lack of upstream maintenance, and the gettext certainly
won't be the last required fix. I have no interest in zmodem transfers,
thus I opted for recipe removal.

When the last release was is quite relevant from that perspective.

Alex

--0000000000002068fc0597ce7be7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 20 Nov 2019 at 22:38, Phil Blunde=
ll &lt;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
If this is the actual reason for removing lrszsz, the commit message should=
<br>
say so.=C2=A0 As it stands, this patch provides no meaningful justification=
 for<br>
why the package should be removed, it just contains a statement about the<b=
r>
last release having been a long time ago (which may be true, but isn&#39;t<=
br>
obviously relevant) and some vague sneering about &quot;proper networking&q=
uot;<br>
which doesn&#39;t seem to be helpful either.<br></blockquote><div><br></div=
><div>The gettext problem is the immediate reason, but the broader reason i=
s that the code is not maintained, and we should try to avoid burdening the=
 project with unmaintained code. There&#39;s already 8 custom patches fixin=
g issues caused by lack of upstream maintenance, and the gettext certainly =
won&#39;t be the last required fix. I have no interest in zmodem transfers,=
 thus I opted for recipe removal.<br></div><div><br></div><div>When the las=
t release was is quite relevant from that perspective.<br></div></div><div =
class=3D"gmail_quote"><br><div>Alex<br></div></div></div>

--0000000000002068fc0597ce7be7--
