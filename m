Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
	[209.85.217.45])
	by mail.openembedded.org (Postfix) with ESMTP id C92EB6025F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 13:39:03 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id s18so596155vsa.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=faw6p16lRu0TCoQD43srMx9vo6a0Vb5EKG8xKWK6Qww=;
	b=VHj5hdm7FNn3GrWTz3pXVfmWaqFoWj2Iui9CcT5nn5SllZphAaZ+XCRJLBoSkuZ3Ng
	vdQ1oGZ1gKckfyeZn05o2LDsQRul42b0qtWP9Quu+e1OneehWHKgayAuH+PLy5evHQsW
	aQa5gOOiO+/ZQ/cydChjnG9p83LkOtQAMeiz0vsNEi7K1KRWBYflqaAPJack8oFhQtG9
	SVXtrU33xcfPD7NFQ7H8Ao2mI0tMomuBAZxNPhKly00I6r++s48FFseiDufD5CziUGOq
	+jYk0sR/Zxhz6ltM+8yqltzZHsy7ChwCmoPliUp/KUDvaBMY3eudhFHpwHIrbXWxWGV7
	em0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=faw6p16lRu0TCoQD43srMx9vo6a0Vb5EKG8xKWK6Qww=;
	b=Hd061//g4GLRL4ZHV72O6kVWC2Uuh72/JRtQTg46NDmLieUMkhZM2KYTMBWTgS/Mj+
	DZVLY4R/fqoGC1FGwcPjuG++J1DjGIXKMsNe2F+DjqltnX7UVPAh3fvWXaVYq1gPVYAm
	p92fyoBAZNKOCP9dtPlF69cELVDhDf9ahDhNVI58N1WS8HVbx0GHCdf9XX/E6UQpNMc4
	QwXlkt5EjJoEj7fOPRRGfOwAZuHRizIR4VzSFzFhUyF+SR0ngWZjBArIBNKqbeZ/yoRl
	mRBX/mmwBzO/e3Z5W++i0ef6rPfhZEu2Wey022+ZOo91lagmqlUoeJdQgCVFXhWLPAnC
	ZyPA==
X-Gm-Message-State: APjAAAXMK19s3jyVlJnI0S/1UrAo2sKyEIhtnxyDqKuZxbJpu0HCAGu1
	Al8FxulpeckWnCxEhgx/BNGiuUNGTaCVMQt1nx4Yhw==
X-Google-Smtp-Source: APXvYqytEvctx9q6U6T9tXrRDtvYbjllskCGxwUHgxuscFUkwR4OLE7mFUlN+pPRJ0X2qMeTSbIX45aJ2QXD18m/314=
X-Received: by 2002:a67:2c43:: with SMTP id s64mr3342051vss.94.1567345144364; 
	Sun, 01 Sep 2019 06:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190901093947.95524-1-alex.kanavin@gmail.com>
In-Reply-To: <20190901093947.95524-1-alex.kanavin@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 1 Sep 2019 15:38:53 +0200
Message-ID: <CANNYZj9jcU2puYGTCtn5nPkeWAwR0zLW76q+WCRpgz1nfOQtUQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] default-providers.inc: set mesa as the provider for native virtual/libgl
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
X-List-Received-Date: Sun, 01 Sep 2019 13:39:04 -0000
Content-Type: multipart/alternative; boundary="00000000000092014605917dfae3"

--00000000000092014605917dfae3
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Sep 2019 at 11:39, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> native libepoxy and libsdl2 require this to be set, when they
> have the respective opengl features enabled.
>

nativesdk needs the same fix, will resend.

Alex

--00000000000092014605917dfae3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 1 Sep 2019 at 11:39, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">native libepoxy and libsdl2 require this to be se=
t, when they<br>
have the respective opengl features enabled.<br></blockquote><div><br></div=
><div>nativesdk needs the same fix, will resend.</div><div><br></div><div>A=
lex<br></div></div></div>

--00000000000092014605917dfae3--
