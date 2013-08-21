Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 97DD16B25A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 11:10:12 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf1so26175pab.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 04:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=IW7OflZKcl23zRjp0kTJ1zP250nK1Lz3zF1e7YJo+AY=;
	b=Ol9T3Q38wQm1c234vbH88DfcHqNwMJ+IZ+f/4j7BWyCyWAp8N3qSXBr3a5HL4++9vo
	ZP0YloXNbkfMaPYRXItaVGT9wxKkYSKHh304y0UPw8EAzfEm/yHokWsr2SPjzx6QkVq1
	65TCFHf2Zk960Rldh8Js4CBo/EOh/bGc9njEyDT5wk5Zv93+zuDkEstvg829pB0I14Cb
	6bljoaBpDc4JTfhaZDN92UKr+z2Ns3j961XSuEb4CAIVcq/X+vBNzDtiC91q+c19vQ2S
	uyuJZvo7SDqaNuA2RWpp66Yvn7S3ZXafB6e58km8s9z0sL851Nn/TDGoNZPq31n8mHR9
	pSiA==
X-Gm-Message-State: ALoCoQlDFxNIyaXELxub4EfXWq63LMDz342V7rQhdkW9gk08+8QeDL5mwPfFcqrVsTE4ABPkYBO9
MIME-Version: 1.0
X-Received: by 10.66.154.1 with SMTP id vk1mr9049028pab.85.1377083413304; Wed,
	21 Aug 2013 04:10:13 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 21 Aug 2013 04:10:13 -0700 (PDT)
In-Reply-To: <20130821110401.GG522@jama>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
	<CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
	<CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
	<CAOMwXhP6awmXzW2Sm0OMKyrWBFtQRje1CkL3yWtvzdU6fvd1bw@mail.gmail.com>
	<20130821110401.GG522@jama>
Date: Wed, 21 Aug 2013 12:10:13 +0100
X-Google-Sender-Auth: nX3kld0KZmNlNyWqDJsT81BCXJk
Message-ID: <CAOMwXhP+k2qnhPsAEYvppC3eTf7N0UUY7V0-KVNs+83u-XU2oA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Wed, 21 Aug 2013 11:10:12 -0000
Content-Type: multipart/alternative; boundary=047d7b6d908aad440a04e473373c

--047d7b6d908aad440a04e473373c
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Aug 21, 2013 at 11:31:53AM +0100, Laszlo Papp wrote:
> > That does not mean bitbake cannot generate tarball out of the git
> > repository. In fact, it is relatively simple. ;-)
>
> It does, all you need to do is enable BB_GENERATE_MIRROR_TARBALLS
>

I am not using mirrors. I am simply pushing the downloads folder, etc to
the git repository "git add". It is as simply as that without an explicit
mirror set up and its maintenance.

--047d7b6d908aad440a04e473373c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Aug 21, 2013 at 12:04 PM, Martin Jansa <span dir=
=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">ma=
rtin.jansa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><d=
iv class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Aug 21, 2013 at 11=
:31:53AM +0100, Laszlo Papp wrote:<br>&gt; That does not mean bitbake canno=
t generate tarball out of the git<br>

&gt; repository. In fact, it is relatively simple. ;-)<br>
<br>
</div>It does, all you need to do is enable BB_GENERATE_MIRROR_TARBALLS<br>=
</blockquote><div><br></div><div>I am not using mirrors. I am simply pushin=
g the downloads folder, etc to the git repository &quot;git add&quot;. It i=
s as simply as that without an explicit mirror set up and its maintenance.<=
/div>
</div></div></div>

--047d7b6d908aad440a04e473373c--
