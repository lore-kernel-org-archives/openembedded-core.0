Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id DEBE1605D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:46:08 +0000 (UTC)
Received: by qgx61 with SMTP id 61so27423090qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 14:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0Y9smQiSdarN7NmTzEM91swO+H9p0ZmnXuCFKB0jREQ=;
	b=Wa0JiS/Zejeo4XTxe9+NCfx4vW87vzUYVxyCZ5Pm07l4gBV6t9TmgtvwhLtgXrWi51
	GgkU48yCUjrFNqsh0SbMuKekMx1MNCNdozPU71/8191Di38Z8xrCi1g0+SM7Fw5KcB/j
	EgeK0iVJFd86Mfmt9SCRHpOWo6FaGik2dXcor1u+LjkKqEuTa1iZV4NRZyntKhb/ErVu
	IFwyoY4QdTu1onh3eKj/jQrgZnBxcxd1pELwuFpaExZq2YnfZHMbCjCdX5H7k0wv4JO8
	4CazUsYAyovzzRRJW0FYu714rcKGad9eU2gOImk3qRe/WU5CoF6fHjbumMStzT3hi0iu
	631Q==
X-Gm-Message-State: ALoCoQn0VtX4ToOLngAF3O6Wm0CTNJQRSjR1NooLPl+U199HrkABdOriwuX7gEcg5SkN3+Mpm4kT
X-Received: by 10.140.109.74 with SMTP id k68mr44148540qgf.77.1444772768488;
	Tue, 13 Oct 2015 14:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Tue, 13 Oct 2015 14:45:49 -0700 (PDT)
In-Reply-To: <CAP9ODKrks-DGP6mTJxMaVyY7-+Sit0_sBgndny3LouWjuG541A@mail.gmail.com>
References: <CAP9ODKpN0kbRtm7pvrky5pwFZ_1YPoZ-fy=kt+4CPB+NUoyBKA@mail.gmail.com>
	<CAJTo0LbR=Fryhe-Jfgw9AW=ZjBTWE5gZQ2id3si55LpRZtmH-A@mail.gmail.com>
	<CAP9ODKrks-DGP6mTJxMaVyY7-+Sit0_sBgndny3LouWjuG541A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Oct 2015 22:45:49 +0100
Message-ID: <CAJTo0Lb0ywf=HYYcT_f4+acaoELkpBxMqxKu0vk41qgKwx+VgQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error due GTK+3 new rdepends on libgl
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
X-List-Received-Date: Tue, 13 Oct 2015 21:46:09 -0000
Content-Type: multipart/alternative; boundary=001a1139af24a5fdca0522035f7c

--001a1139af24a5fdca0522035f7c
Content-Type: text/plain; charset=UTF-8

On 13 October 2015 at 22:44, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> I am handling it in my side, meta-fsl-arm, however I think gtk3-demo
> ought to link to the library when building, no?
>

No - this is covered in the thread about this recently by Jussi.

GTK+ 3 uses libepoxy to abstract the pain of using GL.  libepoxy dlopen()'s
libGL.  Thus, no automatic dependency.

Ross

--001a1139af24a5fdca0522035f7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 October 2015 at 22:44, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":8w2" class=3D"a3s" style=3D"overflow:hidden">I am handling it=
 in my side, meta-fsl-arm, however I think gtk3-demo<br>
ought to link to the library when building, no?</div></blockquote><div><br>=
</div><div>No - this is covered in the thread about this recently by Jussi.=
</div><div><br></div><div>GTK+ 3 uses libepoxy to abstract the pain of usin=
g GL. =C2=A0libepoxy dlopen()&#39;s libGL.=C2=A0 Thus, no automatic depende=
ncy.</div><div><br></div><div>Ross</div></div></div></div>

--001a1139af24a5fdca0522035f7c--
