Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id CAFD076FC9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 19:22:14 +0000 (UTC)
Received: by qgt47 with SMTP id 47so158900394qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 12:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QELPYaP0wTbYPNRvN9z/SlJCm/IF7hL7RlkvYC7zJPo=;
	b=m5ZdMH0LGHbSf4+XAQTy2WQFojx5VQubhjrXSu6btfjwOSKHt8G151AzpNVkw1S1zF
	Loo/lHo4aNxTMg4qO9Yg5N8beDlmHbB5ZU6jICeO+PSHvrqSG6LbmyeaH0J3V8ljFnB9
	kfereBgua8NIGGGoP0UwCPoVRr2UHQNZbsxDTupKFf888v2a7poENcg4CrgGpp8fe14a
	JL07utom7g+4vXMw0SwF9qFBQdVu59qq3Kz1qqQcoouyFjUB86XgH9KLuVeuKqNAV9xb
	ehNg4RbVj7ey1Cb99xFctfO7Jc+EOb3ufNuQd6cOQjVqKQepCE9J6pxgD3wdk23tg5qL
	T7xQ==
X-Gm-Message-State: ALoCoQlX5UbgHaKm1q2rhORLMOPsRGW+i6QmwIOtblaAY08W3a2Z6ScQqFMWXJKwIVnq9ZCuxfMv
X-Received: by 10.140.235.147 with SMTP id g141mr41612768qhc.22.1444072933803; 
	Mon, 05 Oct 2015 12:22:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 5 Oct 2015 12:21:54 -0700 (PDT)
In-Reply-To: <560EA62E.5020901@opendreambox.org>
References: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
	<560EA62E.5020901@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Oct 2015 20:21:54 +0100
Message-ID: <CAJTo0La+5WeW-MQ+bzV-SeA+wY3TeCNb3V+FXweqGiDOjL4Hew@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: RDEPEND on libgl
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
X-List-Received-Date: Mon, 05 Oct 2015 19:22:15 -0000
Content-Type: multipart/alternative; boundary=001a11376e6e403b700521606e35

--001a11376e6e403b700521606e35
Content-Type: text/plain; charset=UTF-8

On 2 October 2015 at 16:43, Andreas Oberritter <obi@opendreambox.org> wrote:

> If epoxy behaves like other projects, then I'd try removing virtual/egl
> from
> DEPENDS and replacing the line above with this one:
>
> PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11
> virtual/gl, libgl"
>

The rdepends definitely need to be tied to the PACKAGECONFIG options,
libepoxy built without x11 won't be linking against GLX as libGL.so won't
exist.

Ross

--001a11376e6e403b700521606e35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 October 2015 at 16:43, Andreas Oberritter <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1dk" clas=
s=3D"a3s" style=3D"overflow:hidden">If epoxy behaves like other projects, t=
hen I&#39;d try removing virtual/egl from<br>
DEPENDS and replacing the line above with this one:<br>
<br>
PACKAGECONFIG[x11] =3D &quot;--enable-glx, --disable-glx, virtual/libx11 vi=
rtual/gl, libgl&quot;</div></blockquote></div><br>The rdepends definitely n=
eed to be tied to the PACKAGECONFIG options, libepoxy built without x11 won=
&#39;t be linking against GLX as libGL.so won&#39;t exist.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11376e6e403b700521606e35--
