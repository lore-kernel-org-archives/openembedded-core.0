Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 047E5718ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 01:02:05 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id vb8so720728obc.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 17:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=steYrqmD9yKnleGhS8RK3DzX2uTVFx3/8ULiQCH0LiY=;
	b=zZpGPF8Ouk/wEj8drEnUBGGlg8yS64OsUZzfL3H5U7PvFnKWBW0m5umkf1fk5QSoCX
	SYG3H1fsrtff2IxeusJrPinLKFzpdFyVoUwVponLLTU5QXCA9mtFtUp6e/4coyawagsJ
	iK1aavXi8Ot/YU4PRGCq/+efmVl4H+8AcaUY6UTnCcJjWhuwf7buiRzlUuTPHXV3BNXW
	VR4M2Hc0Kc2uqgAbYycGlmTWuUf7+sPKvVMvTl+ZYA1emnecBhNT4Oy3YMKYeRMppR3z
	bs1parwQ20w8eaGzPI7OiC9zxnVAe+qIyqzpYK7IVGXy5XJDGjxWCpy+cYabuA2IziE4
	uVZw==
X-Received: by 10.60.50.97 with SMTP id b1mr21290765oeo.1.1416186125868; Sun,
	16 Nov 2014 17:02:05 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.76.82.35 with HTTP; Sun, 16 Nov 2014 17:01:45 -0800 (PST)
In-Reply-To: <54692143.7040107@michaeljones.de>
References: <54692143.7040107@michaeljones.de>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 16 Nov 2014 18:01:45 -0700
X-Google-Sender-Auth: YBbXtlzUBc1JGKZYlXaRhrrBMic
Message-ID: <CABcZANm9YOkYaMqPrnJJzeZNSv+sYJMNeGWu9=crGvLuxb1fWw@mail.gmail.com>
To: Michael <dev@michaeljones.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: read-only-rootfs support for systemd
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
X-List-Received-Date: Mon, 17 Nov 2014 01:02:15 -0000
Content-Type: multipart/alternative; boundary=001a11c1ce14f7e783050803861a

--001a11c1ce14f7e783050803861a
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 16, 2014 at 3:12 PM, Michael <dev@michaeljones.de> wrote:

> I noticed that support for "read-only-rootfs" in IMAGE_FEATURES is
> currently limited to using sysvinit.
>

This is not the case in dizzy or master. It works with both.

Are there any efforts already underway to add support for read-only-rootfs
> for systemd?  Aren't there already OpenEmbedded users out there generating
> read-only root filesystems with systemd, or is this somehow obscure?  Is
> anyone aware of technical landmines toward pursuing this that I should be
> aware of?
>
> Also, I would like this restriction to have been mentioned in the Yocto
> Project Development Manual where the feature is mentioned.  How/where does
> one make a suggestion for an improvement in this documentation?
>

As mentioned above, it's not a limitation anymore, so that suggestion
shouldn't be needed.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c1ce14f7e783050803861a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Nov 16, 2014 at 3:12 PM, Michael <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:dev@michaeljones.de" target=3D"_blank">dev@michaeljones.de</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":xl" class=3D"a3s"=
 style=3D"overflow:hidden">I noticed that support for &quot;read-only-rootf=
s&quot; in IMAGE_FEATURES is currently limited to using sysvinit.<br></div>=
</blockquote><div><br></div><div>This is not the case in dizzy or master. I=
t works with both.<br><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
xl" class=3D"a3s" style=3D"overflow:hidden">
Are there any efforts already underway to add support for read-only-rootfs =
for systemd?=C2=A0 Aren&#39;t there already OpenEmbedded users out there ge=
nerating read-only root filesystems with systemd, or is this somehow obscur=
e?=C2=A0 Is anyone aware of technical landmines toward pursuing this that I=
 should be aware of?<br>
<br>
Also, I would like this restriction to have been mentioned in the Yocto Pro=
ject Development Manual where the feature is mentioned.=C2=A0 How/where doe=
s one make a suggestion for an improvement in this documentation?<br></div>=
</blockquote><div><br></div><div>As mentioned above, it&#39;s not a limitat=
ion anymore, so that suggestion shouldn&#39;t be needed.<br></div></div>-- =
<br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth=
 dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsl=
ib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c1ce14f7e783050803861a--
