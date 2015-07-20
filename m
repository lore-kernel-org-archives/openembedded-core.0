Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 998487616D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 20:51:31 +0000 (UTC)
Received: by qgeu79 with SMTP id u79so22971032qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 13:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uU4bUBuEk1H6gvOFYoegfnxC9T9YFVEN17tQrXxIU7U=;
	b=js/0EK0z31tBdKZS6csdMD+nzw8FknuyFrmFmByXU9ioy3iI/iePKfsmRY//shz5rN
	M7vosaiFikPmkIdfhnUOrTIPiEBVsLlImTOEdMW3Yl69zVZ5V2FTVZBgR1yGLz3wRGwx
	tLYGc8EPl1qW2pl2yZjkbwSJmuYz031yUbikRamK9ri/AyLerXanabyNmSD25GeEH7Eq
	vzBqeVqhCGYwkG+wInoO7z6RKIp0IFgQcR7tjVPIaYebch5iTfA4dO2VeWixNdLNVtfa
	mtu9I1PLSCjBTBaWgUg6Y+Oe5jNLK+EGbB8q9rnI7sLM79JRAQDIwF0SdGWvrJWhaMV3
	M8Ew==
X-Gm-Message-State: ALoCoQmgFw/pKQnYQpDn34COUlfg254D8l2rGPtH29YVqFZfDJKFhry16KWK3HE/IQ1leEXM0mFP
X-Received: by 10.140.43.100 with SMTP id d91mr50167994qga.77.1437425491094;
	Mon, 20 Jul 2015 13:51:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 20 Jul 2015 13:51:11 -0700 (PDT)
In-Reply-To: <1436972295-5399-1-git-send-email-akuster808@gmail.com>
References: <1436972295-5399-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jul 2015 21:51:11 +0100
Message-ID: <CAJTo0LajMWm-iKEUCWiqQozLbvGEhWzdRqDh6O6vBa286U3C9w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+: fix compile error
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
X-List-Received-Date: Mon, 20 Jul 2015 20:51:32 -0000
Content-Type: multipart/alternative; boundary=001a113a989cc9d53c051b54b31e

--001a113a989cc9d53c051b54b31e
Content-Type: text/plain; charset=UTF-8

On 15 July 2015 at 15:58, Armin Kuster <akuster808@gmail.com> wrote:

> +PACKAGECONFIG[introspection] = "--enable-introspection=yes,
> --enable-introspection=no, libgirepository"
>

That's just not going to work out of the box, might as well just pass
--disable-introspection for now.  Unless you're trying to make meta-gir
work again..?

Ross

--001a113a989cc9d53c051b54b31e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 July 2015 at 15:58, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4or" class=3D"a3s=
" style=3D"overflow:hidden">+PACKAGECONFIG[introspection] =3D &quot;--enabl=
e-introspection=3Dyes, --enable-introspection=3Dno, libgirepository&quot;<b=
r></div></blockquote></div><br>That&#39;s just not going to work out of the=
 box, might as well just pass --disable-introspection for now.=C2=A0 Unless=
 you&#39;re trying to make meta-gir work again..?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a989cc9d53c051b54b31e--
