Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id C222B76F8A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 16:08:22 +0000 (UTC)
Received: by qgez77 with SMTP id z77so32493369qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 09:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v5D6gRpVkF+rbbWj61t/7fwkM6UZvYqpjSar/qI79wQ=;
	b=WH1oeXd+KgYhaOYnod6Rjyz+0lq5l5kvdAuNTFTsc12Kds1DjM4TbHGyjRBJPQ/kBG
	IJRcTI+k8nodK7R3T4FNuzT45Hd3275s+NyS0tfGwnWEuLIAfoWjdJrV2tENbrErN86l
	woGDZIOeTddCHYK1mRsi34Hi5hGquSBh4itbT4SLKPn3dgxyNhPyY1FX2I9s6L424u3l
	dx0PQRLSPD4eulGIt+DJHNhHFb/AUAjbGLk7RIKInh+D2z0iDHSMVvpqK1RwIMxldjSz
	nbRBOLcQQC6INp+ZHDe5BgLUH1XXy8kgWRlsuqQNx7ydCY/XV7bPuBibMtdwuFX1x0tK
	bhmA==
X-Gm-Message-State: ALoCoQk06DN1r+84RMULWiS8hajXh9A4BZj9PD9azYW3f45hk0IK2DiBSIfMGkhEhNhqUJd/7HY0
X-Received: by 10.140.109.54 with SMTP id k51mr7637240qgf.77.1441296502147;
	Thu, 03 Sep 2015 09:08:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 3 Sep 2015 09:08:02 -0700 (PDT)
In-Reply-To: <f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Sep 2015 17:08:02 +0100
Message-ID: <CAJTo0LYdE-XZkCASy9n3uuL_HrrFTZKC5a3aA0Mj4FU4kOPnew@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 16:08:26 -0000
Content-Type: multipart/alternative; boundary=001a1139a1fa06e690051ed9fe12

--001a1139a1fa06e690051ed9fe12
Content-Type: text/plain; charset=UTF-8

On 3 September 2015 at 16:34, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> It is not used by anything in oe-core and will be moved to meta-gnome
>

I've a feeling that there are some apps in core-image-sato that actually
like to have gnome-icon-theme installed (specifically I'm thinking
pcmanfm).  We should probably check that they work correctly without this
installed (or more likely, show more icons when it is installed) before
removing it.

Ross

--001a1139a1fa06e690051ed9fe12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 September 2015 at 16:34, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":1yq" class=3D"a3s" style=3D"overflow:hidden">It is not us=
ed by anything in oe-core and will be moved to meta-gnome<br></div></blockq=
uote><div><br></div><div>I&#39;ve a feeling that there are some apps in cor=
e-image-sato that actually like to have gnome-icon-theme installed (specifi=
cally I&#39;m thinking pcmanfm).=C2=A0 We should probably check that they w=
ork correctly without this installed (or more likely, show more icons when =
it is installed) before removing it.</div><div><br></div><div>Ross=C2=A0</d=
iv></div></div></div>

--001a1139a1fa06e690051ed9fe12--
