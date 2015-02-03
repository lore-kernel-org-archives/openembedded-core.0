Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id C4CD8605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 16:02:55 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so52870394qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 08:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pERakhjTs7dHPhC6i8mjc3pxtkbvFicQC0wZCJAEsWI=;
	b=TmpkshMB9mYq6neHNw7OzGrN86f70NQ3oa3X1lZDMMSocfY6tHyV9uo7wdmtMNz3qY
	CsWU/0mfcLlgZ6mAKwJmvkA636cCVpxk1+grgd1NAWS4KPvgf04ljD8luvD4S8t6GmBg
	HstaJo6dxdLCtTDcWbXcgrQaUERhImhz9sP9M4u5DQBLU9cbPqkvntpTmGf2QnTurj2j
	5EAzw4pj49YuN8VV3d4mm8+D5MiyClvU+NHpj5JUwtPkSXINr2ZaKFNe7eTJYge57jF3
	T29Fq5VvC3v0uOoTKumbwiQ3BY0HtNdWnG/5xqqxe7qDUBUk9tIbiT2J1RXFx/K5o0FW
	KIxQ==
X-Gm-Message-State: ALoCoQnX0sNZ7JUPteI7lBs0yml2Wd+SUPb7KolIf2fM+l4P2huz8RJ6Svx5VbV7Ren0xYVF4ucr
X-Received: by 10.224.24.132 with SMTP id v4mr54938283qab.17.1422979376617;
	Tue, 03 Feb 2015 08:02:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 3 Feb 2015 08:02:36 -0800 (PST)
In-Reply-To: <87oapbdctd.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150128134042.GI2477@jama>
	<87k306djs4.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
	<3296846.qcxKKmWIPr@peggleto-mobl5.ger.corp.intel.com>
	<87oapbdctd.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Feb 2015 16:02:36 +0000
Message-ID: <CAJTo0La=KuSp2anpGk3=6GPaq_ksWHY1NmOBi9VQ31K=uVjSVQ@mail.gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Tue, 03 Feb 2015 16:03:00 -0000
Content-Type: multipart/alternative; boundary=001a11c2b49e444076050e3134dd

--001a11c2b49e444076050e3134dd
Content-Type: text/plain; charset=UTF-8

On 3 February 2015 at 01:05, Richard Tollerton <rich.tollerton@ni.com>
wrote:

> Done (and sent), and my apologies, because this exercise has made clear
> that I was wrong in several of the details here: None of the three
> patches were committed; I was confusing one of them with 89a29a3a, which
> was from a separate email. The confusion originated in 89a29a3a having
> been committed after I had already withdrawn it, which I forgot about
> over the holidays.
>

That's probably my fault, sorry.  Thanks for following up and resolving
this properly.

Ross

--001a11c2b49e444076050e3134dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2015 at 01:05, Richard Tollerton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rich.tollerton@ni.com" target=3D"_blank">rich.tollerton@ni.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4lv" cl=
ass=3D"a3s" style=3D"overflow:hidden">Done (and sent), and my apologies, be=
cause this exercise has made clear<br>
that I was wrong in several of the details here: None of the three<br>
patches were committed; I was confusing one of them with 89a29a3a, which<br=
>
was from a separate email. The confusion originated in 89a29a3a having<br>
been committed after I had already withdrawn it, which I forgot about<br>
over the holidays.</div></blockquote><div><br></div><div>That&#39;s probabl=
y my fault, sorry.=C2=A0 Thanks for following up and resolving this properl=
y.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11c2b49e444076050e3134dd--
