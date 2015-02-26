Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id F32CB73759
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 21:52:36 +0000 (UTC)
Received: by qcvs11 with SMTP id s11so10976929qcv.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 13:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/Lno4OkluBQnN78/k5Ys/RjfBX6xt5HDUsHlkvXFw2g=;
	b=FKdmFtyPtpDA2UAxS4qCXF712xgoWtTUclK8oLrJKVNNuFf3pKuIUQGDqudR9eZlQB
	fdE3aSRWisAiHvYrsHZcAhCLPDgrk0tME5OJ6RO6RheUxyXYqDrauSB2JwfWf5VtVNhi
	5/MwSlH05jWBR+vE52dBh0VW8keEV6zXHCt3oKL/t5wJ4tGvfQw2qSeEGbImFiHvmo8B
	brqZNPslNKkDUZ+0lA/Iae5dPDCLn+bDK4ChaQKbNu1Zdw8ZUNEyiDOZE/gRICM87rKw
	k4W4aKLKvLV/MyEW7BtSnge1gtjdZbVcCSkz5IaH90Dt7RPE/m8iWJUUKwnrBjSGh9aA
	hQxw==
X-Gm-Message-State: ALoCoQlA6qnGsMH7bunWbbNprKCe3FdETGH+B6XwlY/Ul1Ob0ETIWkxU2j6iAXP4f9TJKAEuBaMa
X-Received: by 10.140.29.138 with SMTP id b10mr21943662qgb.78.1424987557156;
	Thu, 26 Feb 2015 13:52:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Feb 2015 13:52:16 -0800 (PST)
In-Reply-To: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>
References: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Feb 2015 21:52:16 +0000
Message-ID: <CAJTo0La5_Wdf537Ct-ZkLqsx7=5KrYsCCpG9fH8g-hdWNjDQpw@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0*git: Update to build current AUTOREV from master branch.
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
X-List-Received-Date: Thu, 26 Feb 2015 21:52:37 -0000
Content-Type: multipart/alternative; boundary=001a113a75a22772f0051004c585

--001a113a75a22772f0051004c585
Content-Type: text/plain; charset=UTF-8

On 26 February 2015 at 17:57, Peter Urbanec <openembedded-devel@urbanec.net>
wrote:

> -SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
> +SRCREV ?= "${AUTOREV}"
>

I'd say that the git packages should track the tarball releases *and be
tested as such* so that they actually work out of the box and don't break
over time as upstream changes.

If someone wants to make a bleeding-edge build then it's a simple change to
set the SRCREV to AUTOREV at the distro level.

Ross

--001a113a75a22772f0051004c585
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2015 at 17:57, Peter Urbanec <span dir=3D"ltr">&lt;<a href=
=3D"mailto:openembedded-devel@urbanec.net" target=3D"_blank">openembedded-d=
evel@urbanec.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":20b" class=3D"a3s" style=3D"overflow:hidden">-SRCREV =3D &quot;12=
7202d6f65584891dabf92be031f0d170b0e7f1&quot;<br>
+SRCREV ?=3D &quot;${AUTOREV}&quot;</div></blockquote></div><br>I&#39;d say=
 that the git packages should track the tarball releases *and be tested as =
such* so that they actually work out of the box and don&#39;t break over ti=
me as upstream changes.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">If someone wants to make a bleeding-edge build then it&#3=
9;s a simple change to set the SRCREV to AUTOREV at the distro level.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a113a75a22772f0051004c585--
