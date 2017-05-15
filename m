Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id BE56E72F60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:55:02 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id v27so77204976qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 07:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7YxQly+XFZZYhPd1yVCN7H7ZUNLYP2J10fuWoJfH3yM=;
	b=gd4tGlTRu9YRcZwtrrC0oY9a0xQUHhmt9eYd3Lmtg5k2E179woTpKUhTR7SPxol1gb
	rhPO8Eu+n+hx/8CHer9rZI3IWyMaqMApnDQTtgS62ekBquhdLwsOdTIpEllwhC6tJNe3
	E4jHuV+1dGLX5P12OvIk7Y6MntGIVoRqYzj4b28OVvlJFccAoAH+U7+PNEvjzWirAt1M
	wxYmVcC/Y5MrS8rEh+pk8OWFT4G30S2SgsGOmsmGuS+5KIU/VJhQamF+EPkzSjOy8pAR
	oeHsOqReDcvWlkiYMbDByD7Lh3ZoE3G6zNTh3aLStUuKMn3rXdPTEN3yniSwrizg2HMd
	foTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7YxQly+XFZZYhPd1yVCN7H7ZUNLYP2J10fuWoJfH3yM=;
	b=a79tbTO+GHkdkHbrcjsqQuuMcA4NAsw445vqtrCHhYaOqF1/zhRgY1P6TIgOFROqEZ
	kuN9yXi/xvwINtmQygqUYE+Saovmuf3uMCRQqAam+EuVQINX6zvAMUUx6SXElUZBVH9Y
	5QfoiHsDr9FIpxgT4Fzu8d77GYJ+fZEsfUQ54Sf/q1wmjAg1QjdyhS+juPhciEVs+SVr
	HIby7qpFPuRdjdFEjaUbsaQy+YvGlmPJjJOvvVjVcmbjQeCDkYJKkZ4+/CbHrYpoE5Lw
	hekoeM6acT9RXCvalHgUrnpm+XZqkJQTTzzk9BQtYwjEfkgiMuRTJ98TbYoSOqx4mwmC
	ztiA==
X-Gm-Message-State: AODbwcBz+/cTnxIthn0f7rxl860KnwQOzO0FmUJ8A/K4AGd4yF6A/RSi
	i3xTwzpXWzhFmjSX3VWLMK8BhpYb3WUl
X-Received: by 10.200.46.217 with SMTP id i25mr5606353qta.188.1494860103252;
	Mon, 15 May 2017 07:55:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 15 May 2017 07:54:42 -0700 (PDT)
In-Reply-To: <1494848069-15504-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1494848069-15504-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 May 2017 15:54:42 +0100
Message-ID: <CAJTo0LYVnaCBnaZz984T-26uvgeSN56LpqUBA6E9KbejaCJAHA@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libx11: 1.6.4 -> 1.6.5
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
X-List-Received-Date: Mon, 15 May 2017 14:55:03 -0000
Content-Type: multipart/alternative; boundary="001a1146b1287191bf054f913d8f"

--001a1146b1287191bf054f913d8f
Content-Type: text/plain; charset="UTF-8"

On 15 May 2017 at 12:34, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

>  meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb | 10 ----------
>  meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb | 10 ++++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
>

Can you upgrade and build-test libx11-diet at the same time please?

Ross

--001a1146b1287191bf054f913d8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 May 2017 at 12:34, zhengrq <span dir=3D"ltr">&lt;<a href=3D"mailto:zh=
engrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2te" clas=
s=3D"a3s aXjCH m15c0be4bfbc15cee">=C2=A0meta/recipes-graphics/xorg-<wbr>lib=
/<a href=3D"http://libx11_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank">li=
bx11_1.6.4.bb</a> | 10 ----------<br>
=C2=A0meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://libx11_1.6.5.bb=
" rel=3D"noreferrer" target=3D"_blank">libx11_1.6.5.bb</a> | 10 ++++++++++<=
br>
=C2=A02 files changed, 10 insertions(+), 10 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"htt=
p://libx11_1.6.4.bb" rel=3D"noreferrer" target=3D"_blank">libx11_1.6.4.bb</=
a><br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"htt=
p://libx11_1.6.5.bb" rel=3D"noreferrer" target=3D"_blank">libx11_1.6.5.bb</=
a></div></blockquote></div><br>Can you upgrade and build-test libx11-diet a=
t the same time please?</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1146b1287191bf054f913d8f--
