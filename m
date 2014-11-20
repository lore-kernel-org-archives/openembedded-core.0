Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 24DA265C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 20:32:51 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so2663680qge.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 12:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=58YBiAkiTv5Nw0h7AIzaEfUs0d6YMq86FqyTT1selnc=;
	b=OPxorpYva355cg2u0Z6iN+8EhR+QIeXB6tpgD9D+Equ8B1njSXeg2IOxhysA0Sxeu6
	1pPyDeQPY2zkrUzaY/MdKiLGkHJKQxdJJFzXUnHpkD4vsJ+78TfBiFKNiLnqzK3xqXIA
	KnOAhefef/fA+6h1g7mMrAzM8jREXrv40+4nquVClIMQAzvfiKw045u8rqCBGZen2cTK
	p3joE9Lu+uD1b5lkZL6hz6v6lVLFTio0p9cLJSNnn7U+a28slaUKWuAowyOmdTnIS651
	fcB8Hbk61RkZ/xeDjtDo9Sh9b8yoML30r3bp0VRwWVerr+4Rkjn46bFLDds96a6vfo/y
	aQog==
X-Gm-Message-State: ALoCoQnhhQBvySMhBNKs9VdHx1tYVbAfdcylDMHzOLlUrm/R7tdA5u1L4G903imOEabJUhJ5hdkH
X-Received: by 10.140.17.67 with SMTP id 61mr327434qgc.59.1416515572236; Thu,
	20 Nov 2014 12:32:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 20 Nov 2014 12:32:31 -0800 (PST)
In-Reply-To: <1416479292-27377-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1416479292-27377-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Nov 2014 20:32:31 +0000
Message-ID: <CAJTo0LYbV0T3fQC+gnnwns3Gmx3rdMtEvxt0pbDz3d2hVe8ybw@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] serf: fix 'ccache' builds
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
X-List-Received-Date: Thu, 20 Nov 2014 20:33:01 -0000
Content-Type: multipart/alternative; boundary=001a11c0fa28809d2a0508503b27

--001a11c0fa28809d2a0508503b27
Content-Type: text/plain; charset=UTF-8

On 20 November 2014 10:28, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
wrote:

>  meta/recipes-support/serf/serf_1.3.6.bb  |  8 +++-----
>

I've just pulled the 1.3.8 upgrade on this list into my master-under-test
branch, would you be able to replicate with that version and update the
patch?

Ross

--001a11c0fa28809d2a0508503b27
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 November 2014 10:28, Enrico Scholz <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz@sigm=
a-chemnitz.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":4zs" class=3D"a3s" style=3D"overflow:hidden">=C2=A0meta/recipes-supp=
ort/serf/<a href=3D"http://serf_1.3.6.bb" target=3D"_blank">serf_1.3.6.bb</=
a>=C2=A0 |=C2=A0 8 +++-----<br></div></blockquote></div><br>I&#39;ve just p=
ulled the 1.3.8 upgrade on this list into my master-under-test branch, woul=
d you be able to replicate with that version and update the patch?</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11c0fa28809d2a0508503b27--
