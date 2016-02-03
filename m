Return-Path: <diego.sueiro@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0590677344
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 08:30:56 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id 78so8634513lfy.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 00:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UqA26YI98Rd7uaivIZD86OQUxIitQoF7nxjmkeShBu8=;
	b=us4I9f81QDIVAO93E7/868kAAt5HgD7Bt/o1+HBod4CbpSI65hhsjX4iTBK8xt2WWA
	KU7Wpm3o3i80C7aPmq7buFGykUQOsPrfCHyZvamR5txxgv24z96nVAAdI4ripcmpJNso
	G13dTCU8L/1aEXfefrVR4qGnX02tnmwZsos2J3E3CVpUO6cnGyA6Jsbh6WiELJwqt+CZ
	rdtsy/OBpltVDs6ySE0jq5eVg8TR2gdEeZGRHlGA8+eZOiWzG28bZ1I4V9OhuBBY6i2W
	srdmghBlTizsPwqXJn3sHPevOP05t6x5PluvRFpYYtsZ9Ygy3WnzjyySWAIwcWPA2mZ1
	+1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UqA26YI98Rd7uaivIZD86OQUxIitQoF7nxjmkeShBu8=;
	b=YVsBLPuzJG4mEmvZJ0/DWY5iEQlx2hKxKCnD7tatT5os2deG1m2tpMxlUrlxVg7uLL
	YLrgmmIs5vcyIqT+EBqviNduuLTIP0RcAmyJfnV4LTt6NpIS2y1KqQ618b8LnonGJd3O
	bxFMIT4ff73khikygYH1wqxlgkNpQ9h66+TtCnQLvM9NCN6A+d0m6seXwGORdoczAb+8
	tf1flPf3/ROAI+G9k7w+tAOTqhHjqrHNd/gDm3rMEESKJr129IOF+R94KkJ7lIf40NXs
	aZ5sSJtkGgDZ87tUB6dbWW2lpdAFa0Fki4o+VwVvxJ4k+O32oOCYVPEPkAsoflwAQfDp
	qqQA==
X-Gm-Message-State: AG10YOTIXl6Ge3IUwWZJEn+XddxdSEEG3HocgjWQ/u3mMmwM7VnDOkbH78hy1Yg+0wvefkNO+HQICPMKz1v5zA==
X-Received: by 10.25.138.2 with SMTP id m2mr133825lfd.59.1454488255868; Wed,
	03 Feb 2016 00:30:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.171.168 with HTTP; Wed, 3 Feb 2016 00:30:36 -0800 (PST)
In-Reply-To: <56B1140E.2070200@ni.com>
References: <CADkTA4PoDAgiJ2kdpT9HBnWLfGG-spLmSnF66BP33z520ig6wA@mail.gmail.com>
	<1450132548-31177-1-git-send-email-haris.okanovic@ni.com>
	<569EBB4B.7020606@gmail.com>
	<CAMCfZKFzUu7gRsgbw0rNBQZaRcLm7mbF=dZ9mvUx4DJfmSnynQ@mail.gmail.com>
	<56B1140E.2070200@ni.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 3 Feb 2016 08:30:36 +0000
Message-ID: <CAMCfZKGZuMevkX1VYWoLR3Vpui61Mif+Od0Anq4tWF55q1dOwg@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: Gratian Crisan <gratian.crisan@ni.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Wed, 03 Feb 2016 08:30:57 -0000
Content-Type: multipart/alternative; boundary=001a113ebb56d2364e052ad96fd6

--001a113ebb56d2364e052ad96fd6
Content-Type: text/plain; charset=UTF-8

Haris,

On 2 February 2016 at 20:39, Haris Okanovic <haris.okanovic@ni.com> wrote:

> Here's a simple recipe to make a debug version linux-yocto. It includes
> the real recipe then overrides KERNEL_PACKAGE_NAME and PROVIDES so that two
> sets of kernel* packages can co-exist in the feed. The other file is a
> kernel config snippet which enables some extra debug options.
>
> [linux-yocto-debug_3.19.bb]
> include linux-yocto_3.19.bb
> KERNEL_PACKAGE_NAME = "kernel-debug"
> PROVIDES = ""
> SRC_URI += "file://debug.cfg"
>
> [files/debug.cfg]
> CONFIG_DEBUG_INFO=y
> CONFIG_FRAME_POINTER=y
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_DEBUG_PREEMPT=y
> CONFIG_KGDB=y
> CONFIG_KGDB_KDB=y
> CONFIG_EARLY_PRINTK=y
>

Thanks for the info.

Nice job, hope that it can be up-streamed since this use case is quite
common in a product development life cycle.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a113ebb56d2364e052ad96fd6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Haris,</div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On 2 February 2016 at 20:39, Haris O=
kanovic <span dir=3D"ltr">&lt;<a href=3D"mailto:haris.okanovic@ni.com" targ=
et=3D"_blank">haris.okanovic@ni.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div id=3D":m3p" class=3D"a3s" style=3D"overflow:hidden">H=
ere&#39;s a simple recipe to make a debug version linux-yocto. It includes =
the real recipe then overrides KERNEL_PACKAGE_NAME and PROVIDES so that two=
 sets of kernel* packages can co-exist in the feed. The other file is a ker=
nel config snippet which enables some extra debug options.<br>
<br>
[<a href=3D"http://linux-yocto-debug_3.19.bb" rel=3D"noreferrer" target=3D"=
_blank">linux-yocto-debug_3.19.bb</a>]<br>
include <a href=3D"http://linux-yocto_3.19.bb" rel=3D"noreferrer" target=3D=
"_blank">linux-yocto_3.19.bb</a><br>
KERNEL_PACKAGE_NAME =3D &quot;kernel-debug&quot;<br>
PROVIDES =3D &quot;&quot;<br>
SRC_URI +=3D &quot;file://debug.cfg&quot;<br>
<br>
[files/debug.cfg]<br>
CONFIG_DEBUG_INFO=3Dy<br>
CONFIG_FRAME_POINTER=3Dy<br>
CONFIG_LOCKUP_DETECTOR=3Dy<br>
CONFIG_DEBUG_PREEMPT=3Dy<br>
CONFIG_KGDB=3Dy<br>
CONFIG_KGDB_KDB=3Dy<br>
CONFIG_EARLY_PRINTK=3Dy</div></blockquote></div><br>Thanks for the info.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Nice job=
, hope that it can be up-streamed since this use case is quite common in a =
product development life cycle.<br><br clear=3D"all"><div><div class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<=
br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http://www=
.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&a=
mp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarca=
dos.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div></div>
</div></div>

--001a113ebb56d2364e052ad96fd6--
