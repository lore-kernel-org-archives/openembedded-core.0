Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2ED6B3A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 10:27:18 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w16so149866vbf.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 03:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xchO47V5Vd2isbAFVnllA4MuG3cB6jrsM1+jfySedGg=;
	b=gUibF/ZcrsAzJcYG6FnRpm3zv3pVc73SeSPmKtYMCl+95gEGaA9ZOpd100iViYoSGZ
	Dd/mZa27xj5U51zz9hG2IGcbcZAho1TgaAD6sbEiaGc9odiFiv9XiAtsg70Vvf0MAJ9o
	065z815nU/ge6rQPLH8R2TgGdHGarY6g9l+dFKoDaIIoRQYcoERX6hCRDQI640h0fgfm
	IH2TJ2x410LeWPxbqHuiS5JB0x6GxT7DIERhXVAZ+cJIsNTUClj//+LLgRl8zgu0Qnyr
	nJjs1jGP3jNaD3ic77iY38Td592hOuvZ7p+SQl0jAQA5uOk2RCz0gviSsN6LTmB+8I2x
	yBZA==
X-Gm-Message-State: ALoCoQmAhJUeY1fwDODQA2cYYt8GXMYFnU+ROZlc+8k1bh2AxfSldN0oKloFasNlt4W3nBnh2juc
X-Received: by 10.58.127.202 with SMTP id ni10mr373607veb.27.1377080838389;
	Wed, 21 Aug 2013 03:27:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 21 Aug 2013 03:26:58 -0700 (PDT)
In-Reply-To: <CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
	<CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Aug 2013 11:26:58 +0100
Message-ID: <CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Wed, 21 Aug 2013 10:27:18 -0000
Content-Type: multipart/alternative; boundary=047d7b5d870f33137004e4729e64

--047d7b5d870f33137004e4729e64
Content-Type: text/plain; charset=UTF-8

On 21 August 2013 11:24, Laszlo Papp <lpapp@kde.org> wrote:

> I am not saying to fix gtk-doc-stub only. I am saying fix the nastiness of
> using git repositories for released and supposedly stable versions. I do
> not see why tarball would not be enough for those to work off-hand? That
> should be the ideal architecture IMHO.
>

Two good reasons to allow git repositories as a source:

1) Many projects don't make tarball releases.
2) It's incredibly useful to be able to build from git snapshots for
development/testing purposes.

What you're asking for is the inability to use git repositories in SRC_URI,
which won't happen.

Ross

--047d7b5d870f33137004e4729e64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 August 2013 11:24, Laszlo Papp <span dir=3D"ltr">&lt=
;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</=
span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">

<div dir=3D"ltr">I am not saying to fix gtk-doc-stub only. I am saying fix =
the nastiness of using git repositories for released and supposedly stable =
versions. I do not see why tarball would not be enough for those to work of=
f-hand? That should be the ideal architecture IMHO.</div>

</blockquote><div>=C2=A0</div><div>Two good reasons to allow git repositori=
es as a source:</div><div><br></div><div>1) Many projects don&#39;t make ta=
rball releases.</div><div>2) It&#39;s incredibly useful to be able to build=
 from git snapshots for development/testing purposes.</div>

<div><br></div><div>What you&#39;re asking for is the inability to use git =
repositories in SRC_URI, which won&#39;t happen.</div><div><br></div><div>R=
oss</div></div></div></div>

--047d7b5d870f33137004e4729e64--
