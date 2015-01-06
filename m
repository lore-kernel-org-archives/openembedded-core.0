Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id B011972825
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 13:09:11 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id i50so3524160qgf.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 05:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=InTn8gc8qjuPCnrUEKbzeh5A+/4RD2KjGKdFfRRQR2s=;
	b=J3lslHi4SwEmKgJNFiWL1UZyFCTnUDKLDJvJbUB4f/hKqD+/QG0NX4TxQzzhUz256e
	3OG1NnbhmATOgZ4OqIZQz4sGd7vl+LBKSE9bYRbU56tyixkxcbm1SmVvs75PJSliIecU
	JKv59gbsnXildhicSPvKwYSSkqHUQhXBIhFY65TdQoyu/sZLJJI6rDhmjR0pIxS1lz0r
	woxXUTP/pDe2KMTrTFYxoZvHZKv35EjC8eCM73nTJ2pNB1KNeLuPzwOjYXxWertkixjB
	QlL6ES+/L6cpGRrKGU7x9DGyQpou4JIWjO/Mfyhd8HbKTjtvLk0zPszwriDGQC+4z2Gb
	DhBA==
X-Gm-Message-State: ALoCoQm5FxviirPqZci3Vp6T99oQYTfzPirmTOlp+DgMPyxdXZGR4HHCtYhQp5kvrkx3lBKKzJuE
X-Received: by 10.140.39.167 with SMTP id v36mr76512201qgv.77.1420549751381;
	Tue, 06 Jan 2015 05:09:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 6 Jan 2015 05:08:50 -0800 (PST)
In-Reply-To: <CADyYWL=ao0mzuh9Q3s2wLRLtVhNpYGfpV9awmXmaD4gagM8wgQ@mail.gmail.com>
References: <1420541668-16699-1-git-send-email-sujith.h@gmail.com>
	<CAJTo0LYHY_MtYU7WPgdoaZwaLOtcZ9uo-209aZwnd4Uv0kLjeg@mail.gmail.com>
	<CADyYWL=ao0mzuh9Q3s2wLRLtVhNpYGfpV9awmXmaD4gagM8wgQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jan 2015 13:08:50 +0000
Message-ID: <CAJTo0LYpN0M2XVaiiY1R5DrNDw2gtPZrsrdH7PoZdT-FN20NNQ@mail.gmail.com>
To: sujith h <sujith.h@gmail.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xf86-config: Loading glx module
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
X-List-Received-Date: Tue, 06 Jan 2015 13:09:19 -0000
Content-Type: multipart/alternative; boundary=001a11c12dd25136cd050bfb838f

--001a11c12dd25136cd050bfb838f
Content-Type: text/plain; charset=UTF-8

On 6 January 2015 at 12:51, sujith h <sujith.h@gmail.com> wrote:

> saying: "could not initialize glx" . Hence I made a change in the recipe
> and added IMAGE_INSTALL_append = " xserver-xorg-extension-glx" and it
> worked fine. Hence I thought of adding this change. Let me know if there is
> any issues/concern.
>
>>
Actually installing the GLX module in the image is a prerequisite to
loading the module...  you don't need to modify the xorg.conf - as I said
the GLX module (along with several other modules) are loaded automatically
*if present*.

Ross

--001a11c12dd25136cd050bfb838f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2015 at 12:51, sujith h <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div>saying: &quot;could not initia=
lize glx&quot; . Hence I made a change in the recipe and added IMAGE_INSTAL=
L_append =3D &quot; xserver-xorg-extension-glx&quot; and it worked fine. He=
nce I thought of adding this change. Let me know if there is any issues/con=
cern.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span><font =
color=3D"#888888"><div></div></font></span></div></div></div></blockquote><=
/blockquote></div><br>Actually installing the GLX module in the image is a =
prerequisite to loading the module... =C2=A0you don&#39;t need to modify th=
e xorg.conf - as I said the GLX module (along with several other modules) a=
re loaded automatically *if present*.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a11c12dd25136cd050bfb838f--
