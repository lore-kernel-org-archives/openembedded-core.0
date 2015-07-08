Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 76EA175D64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 21:50:59 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so173654680qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 14:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vKyMA0SFewNHKCY0BK/Sl4PUOnqZsTUmetelQctXTEo=;
	b=j/s+/LIGxq6u97qXihlsMwTtYuA/0rVjhhf+Noyuwtz1AGSoD199nN7f4+EPwauFKH
	hwOULgtgYQZt4q5ZDGkMqIdZylDJkRGtHOnUy6NjTIjezYU3VXSXMccveeZmTYmMJvZi
	ub6tUz1SzIggO0bTVnUSywmpMXsTQSNj6XxWufGugl2eRS81Eg61Ntnzs4Bi5aKKUekb
	Jiygbspo6FOXqZ/K1X4DRhbPqbUWv6S/IYlJgJ00l2yqT4oZTGuoxmHUSlKt6QDC0+lg
	vpx1xACJF+nVQa4DL3SOXI7BXkVyURcxjVWqEWyGhY6noR2s3kqhGM3mY18oLa8kNPoD
	4F7g==
X-Gm-Message-State: ALoCoQnq2aO3mp+uLoGem8R7kY1sCQfrzlO0i6Jn00LIJq9q2OpvKEhbGKQRw2VrJ3B/XJNjYkWG
X-Received: by 10.55.18.197 with SMTP id 66mr19925483qks.13.1436392259199;
	Wed, 08 Jul 2015 14:50:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 8 Jul 2015 14:50:39 -0700 (PDT)
In-Reply-To: <CA+chaQeyW6RBbZdq=p3nAHVtzQUud0dHFJn+OSZ09=vRA3aWdw@mail.gmail.com>
References: <1436385751-17757-1-git-send-email-ross.burton@intel.com>
	<CA+chaQeyW6RBbZdq=p3nAHVtzQUud0dHFJn+OSZ09=vRA3aWdw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jul 2015 22:50:39 +0100
Message-ID: <CAJTo0LZjBAHXe+ntUZcUQ0ZvtxotPJiidV4TctnWmuJxVH=4qA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnome-icon-theme: inherit allarch
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
X-List-Received-Date: Wed, 08 Jul 2015 21:50:59 -0000
Content-Type: multipart/alternative; boundary=001a11474faa5e3bd6051a642269

--001a11474faa5e3bd6051a642269
Content-Type: text/plain; charset=UTF-8

On 8 July 2015 at 22:15, Martin Jansa <martin.jansa@gmail.com> wrote:

> How can it be allarch when it depends on TUNE_PKGARCH glib-2.0?
>

Spurious dependency, locally removed.  Will send a V2.

Ross

--001a11474faa5e3bd6051a642269
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 July 2015 at 22:15, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">How can i=
t be allarch when it depends on TUNE_PKGARCH glib-2.0?</div></blockquote><d=
iv><br></div><div>Spurious dependency, locally removed.=C2=A0 Will send a V=
2.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11474faa5e3bd6051a642269--
