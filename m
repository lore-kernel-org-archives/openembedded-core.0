Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id ADB5D72F63
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 12:56:00 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id u19so74454387qta.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JhQMQrfU68a8aGUU/1S335qP1G2wV0d/SRE5ZhJJNvs=;
	b=VGLC5c7wRxYuYORrN6N+1aXyjwlVGDWUpfklD7KTliXEKDvZLxbD4G8X1YDY/pqBsN
	7bfoSm2RVCgKUis7nXIWEn2d/oVE6zet2JWBLifsVJYPwWskk82msPoGUAXUtDsEPxwh
	/GZXYaPL20rUiGTSm6lzWcAhuV716jOwuaovdEE7NQ//llwwbGioNMWpIAQjtlxNato1
	3bXxEkOuKvs/MqzU6X0MIdJXDCnR+oO4WIlHrwixQ+ja7b2ilL44KtdECqXCu2pwHTij
	ynCPI0ZpGCmC26omOrA35eRS5C5qv/6HQlGSdMDE35GzHSzFWcmbntDcoTxV03os+CLa
	4uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JhQMQrfU68a8aGUU/1S335qP1G2wV0d/SRE5ZhJJNvs=;
	b=oaO62KNPfokjufNxiaatDg0VJD3KYXaoPvE03Xa2HffT1LJP1h9gYBMjuf+bHYsi1c
	xMQEy+wmjubZKBPoZrR/dmll9zCL+sRjq9E41ZHFWWCX+tMX9VLlGtJ4nUV5BlsZexfY
	KG63izr4yuxdlm7LSCmUxNHRYt/ZsfOD8AwRhForzMAXB7XuZvkSyAk+xBO1Bm0tzCnf
	kCWphPqvpVtiBsNCGRao/Kexcx3qoeMsjz81NdR9t4RjlFjrp82x2pcbnjd7NmegVUqG
	RgBJWgTuDJmhL0tcwp+KZJ1/AlR7Sg1X0esH1SkYmO4KuqOJWsvESSfgXqjWuH6YN+Gt
	r8Bg==
X-Gm-Message-State: AKS2vOzo8qylXA67zJpT5iwyIC8fryZ7VAZkT2JXQbZ6yfqxpXRm9P3n
	fbUEBHcPYhNvKLEFXt7R7c/O2fZNXNTK
X-Received: by 10.200.45.206 with SMTP id q14mr4398358qta.177.1497012961643;
	Fri, 09 Jun 2017 05:56:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 9 Jun 2017 05:55:41 -0700 (PDT)
In-Reply-To: <c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 13:55:41 +0100
Message-ID: <CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 09 Jun 2017 12:56:01 -0000
Content-Type: multipart/alternative; boundary="001a11379256cda2bc0551867d7a"

--001a11379256cda2bc0551867d7a
Content-Type: text/plain; charset="UTF-8"

On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:

> +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
>

These tend to go into security-flags.inc, not the recipe.

Ross

--001a11379256cda2bc0551867d7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2017 at 04:41, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":23f" class=3D"a3s aXjCH m1=
5c8af326bfa5d56">+SECURITY_CFLAGS =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot;=
<br></div></blockquote></div><br>These tend to go into security-flags.inc, =
not the recipe.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a11379256cda2bc0551867d7a--
