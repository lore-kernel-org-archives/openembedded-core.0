Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFB2607BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 10:38:17 +0000 (UTC)
Received: by qctt3 with SMTP id t3so4586145qct.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 03:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IgI72Yec0O0o6nW3c4PHeffxoWLat1lSIcdAEG+ziv4=;
	b=asgLi5HSoXewX6xSlMh70OXfb2TlY/vbh/0KP00xdiwI4U4+y+zmObiMmZwbmZXzMz
	prlgxNiikmnKop4CHFBkC+f+C4wYsSzu+3PkvQ6QIUy8rn8U7UOI0MABVnxC9gYs37nG
	rJ+CgpI/8rxlY+M9eAvHoDA8jBSIHeN+mVpnvDpUdft46dfzRJ/e97Acs6qWzZUKk4q6
	cnQ/ski/c5qACEnBJLHxZ+cWjyl+unlr7fgFgagpLulL+8QTbRh0gHgbjmHasnbNB657
	ySRwEzfHew3dJlHaEJZ5elmbUGV+J4dhJJTs8ffTcSqc1kjz+8tTqBVCh1DPtmJF2Sfn
	fQ/w==
X-Gm-Message-State: ALoCoQlAzX5vFgzauGPBGzRNu/XWdcFeqKTYbyIfMduXf0HNSxcsrSISBX4ipQjNHNNneFyqsi2v
X-Received: by 10.140.238.143 with SMTP id j137mr7838130qhc.52.1432031898495; 
	Tue, 19 May 2015 03:38:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 03:37:55 -0700 (PDT)
In-Reply-To: <DC98E333-F523-4FD6-AC3F-71CDB54F3739@gmail.com>
References: <1431343607-2820-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0Lb8ZD_X-X5mxF9XQ5TROUJh1hYQYQV5xwn1WuZmzTSwMg@mail.gmail.com>
	<CAP9ODKp0AL6Lf0_+dyC2UUuXNuNQnhi-h5WfAw=i5jyK4KVV3w@mail.gmail.com>
	<DC98E333-F523-4FD6-AC3F-71CDB54F3739@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 11:37:55 +0100
Message-ID: <CAJTo0Lbi0idSKQLTcbO2Tj1GhbA1nEOGOSbbKOit9uJo9zghYg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Move EGL requirement for Wayland
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
X-List-Received-Date: Tue, 19 May 2015 10:38:18 -0000
Content-Type: multipart/alternative; boundary=001a1135acbe9e004005166ce8f0

--001a1135acbe9e004005166ce8f0
Content-Type: text/plain; charset=UTF-8

On 19 May 2015 at 02:45, Khem Raj <raj.khem@gmail.com> wrote:

> > I did this initially and ended with the patch I sent. The reason is
> > because the EGL is Wayland specific so I see no reason to split it.
>
> egl is not wayland specific, unless you are using it in different context


In the context of this configure script it is.

Ross

--001a1135acbe9e004005166ce8f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2015 at 02:45, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; I did this initi=
ally and ended with the patch I sent. The reason is<br>
&gt; because the EGL is Wayland specific so I see no reason to split it.<br=
>
<br>
</span>egl is not wayland specific, unless you are using it in different co=
ntext</blockquote><div><br></div><div>In the context of this configure scri=
pt it is.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1135acbe9e004005166ce8f0--
