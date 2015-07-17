Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id DB64565CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 11:34:24 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so67615931qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 04:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZvABHCPwbZbNSooxXjHBKB4MhG4OVnP4f1lEmJi+xk4=;
	b=bDZZEFan9qBn5A2BmzK1Sv5tLcTtCeC9JtEY1gpqWaxKTutj6L0GH60U9/VNJghOBD
	G4B5RncZzhgW7KTMBkLEmOqzohDEs99pAyaZyA63TosLz7f5cLY/QDt0mToY/FU4Bqnb
	TeTIA2fbE/FtJ1Adob+dR9spMQczxGRnbmASgEJ3jF7PFWR90FrXp+00oLMzdSiZMY48
	9SZZCW3N8Soh9js5QXOtH3R8taJuioOOBMMS085PE61B/HBBGj3/flKsPUKIvA757EOs
	Y8rIe48q2Fmh4n0TG8DYAMuSVRrLoa5OmOjy46puav1eKoK7xT/BrQECwF2aaqfGh7j+
	c3mQ==
X-Gm-Message-State: ALoCoQnfhOKH+z3nCI6O40cQhJd4k0xuDeU+QMQxQLGBcVfXzjdOFLhswuP/Zn2iXwVXCRH0t7a3
X-Received: by 10.55.43.95 with SMTP id r92mr24129495qkh.67.1437132864792;
	Fri, 17 Jul 2015 04:34:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 17 Jul 2015 04:34:05 -0700 (PDT)
In-Reply-To: <a6959c48d7cb4873c2cf9523a287a7651f3aba3e.1437100265.git.liezhi.yang@windriver.com>
References: <cover.1437100265.git.liezhi.yang@windriver.com>
	<a6959c48d7cb4873c2cf9523a287a7651f3aba3e.1437100265.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jul 2015 12:34:05 +0100
Message-ID: <CAJTo0LaoFyzhgV6xh-p4muzY7JQxRzmyd5Yx7WZKdRrH-oOamA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] git: 2.4.4 -> 2.4.5
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
X-List-Received-Date: Fri, 17 Jul 2015 11:34:28 -0000
Content-Type: multipart/alternative; boundary=001a1147b8dce6c1f5051b1091ec

--001a1147b8dce6c1f5051b1091ec
Content-Type: text/plain; charset=UTF-8

On 17 July 2015 at 03:31, Robert Yang <liezhi.yang@windriver.com> wrote:

> * Use git repo rathar then tarball.
>

For this and the file upgrade, why?

Tarballs are easily cached, and can be checksummed.  What's the reason to
switch to a git clone?

Ross

--001a1147b8dce6c1f5051b1091ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2015 at 03:31, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":10o" cla=
ss=3D"a3s" style=3D"overflow:hidden">* Use git repo rathar then tarball.<br=
></div></blockquote></div><br>For this and the file upgrade, why?</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Tarballs are ea=
sily cached, and can be checksummed.=C2=A0 What&#39;s the reason to switch =
to a git clone?</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a1147b8dce6c1f5051b1091ec--
