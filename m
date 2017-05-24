Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB1378072
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 16:26:00 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id t26so159844192qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rnusXntwkuz3ZfZP/GLn+XOEp7askVgqEVlogqOeOsk=;
	b=AUy2oIRz9eTFmXr82hROEPtP9tEbGPPM9gWXOWTX4eJqh4fheAs+E71gQcyx9N3xGi
	ulak/6DxQWIPiwPkvLejGQMzgegnhbJbwWYVU0HnbOogfpelZYp7IjFza/p6Zu7XBCO0
	3kLZEmFFfuvjKTY28DqHFd1jUfjcfFJv3NyOqnlfIPp7NPoN3FXzHK3N+0bIsQiM9+QV
	SFrJPCRiW/bvrJ+SuMS7NL7gNrBWgJisgsBNpwnZGsxWVdjhCZ3UjG+RTY2hQC3010XU
	/oq6shYMi2LgLsLZ0VQzmdtEH2I5Am5mhUqeaIUJ/bMDlVmQvvZ/ZLucOsm0Im9vGp3x
	MCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rnusXntwkuz3ZfZP/GLn+XOEp7askVgqEVlogqOeOsk=;
	b=ApNVKc5E3ZqHCFJNSgnrgGAq7BPyejpEdjzcvuwudhWKAv494PmVlw/Oj4xKRUfzKq
	4v9Rf1MToQrEg+zwrVabmkef1I209/uZbThy3KzeWJfHnJ0l5PT4lCqeHZgveJ9V4d8A
	YWUsphL6a0XKhW8EjJKQMDmoZu8dMY0MaUMZKxKG5fU/n1+mRKYlkQ4unnF8ijMIhMFL
	pCq+ooWqeCEUmS57ka+n0Wyt4vJBVRhLCtRcT11nc6BOBmKADX1AnubLQADMuYtbMXx5
	CvTbh93Ph6WZ7Dl0Gy4EyRE3857JAF/OS1aluvXPGMqMvuHMkHB/61dW884i4NHMnQZv
	OMXQ==
X-Gm-Message-State: AODbwcCGqfRr96RaWnsSx+oyySUhapaRE69X5B8W9kem4oWvnlb4zCnk
	smDL1jfrrlkWw6ipjwTjnsHCfGPDJFbE
X-Received: by 10.200.45.247 with SMTP id q52mr35579198qta.177.1495643161339; 
	Wed, 24 May 2017 09:26:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Wed, 24 May 2017 09:25:40 -0700 (PDT)
In-Reply-To: <20170524135232.GA13067@mcrowe.com>
References: <20170524132336.4259-1-mac@mcrowe.com>
	<CAJTo0LY85HYy_CdROAJMdPVXehNYMs=mDAsuT-RmLr-QK-Ezjg@mail.gmail.com>
	<20170524135232.GA13067@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 May 2017 17:25:40 +0100
Message-ID: <CAJTo0LZCojNChLhaBsAqNouue3JEX9b7gfF5AQOiyhTedW_ByQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>, "Purdie,
	Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Revert to inheriting from binconfig
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
X-List-Received-Date: Wed, 24 May 2017 16:26:06 -0000
Content-Type: multipart/alternative; boundary="001a1139cdf057c1b50550478f34"

--001a1139cdf057c1b50550478f34
Content-Type: text/plain; charset="UTF-8"

On 24 May 2017 at 14:52, Mike Crowe <mac@mcrowe.com> wrote:

> Oh, I thought that binconfig.bbclass swung through hoops in order to make
> the scripts work well enough. Is that not true?
>
> Many other recipes are still inheriting binconfig rather than
> binconfig-disabled: apr, curl, gnutls, libtasn1.
>

binconfig goes through hoops that are just not required with pkgconfig, and
the hoops are hacks which may not be reliable.  I can't remember the
details but I do remember that libgcrypt/gnupg was a worst offender here.

CCing Richard to see if he can remember why.

In the glorious future removing all binconfig scripts would be the ideal,
in my opinion.  Alternatively replacing them with glorified pkgconfig
wrappers.

Ross

--001a1139cdf057c1b50550478f34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 May 2017 at 14:52, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D"mailto=
:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1a6" class=3D"a3s aXjCH m15c3abb=
64b3fca77">Oh, I thought that binconfig.bbclass swung through hoops in orde=
r to make<br>
the scripts work well enough. Is that not true?<br>
<br>
Many other recipes are still inheriting binconfig rather than<br>
binconfig-disabled: apr, curl, gnutls, libtasn1.</div></blockquote></div><b=
r>binconfig goes through hoops that are just not required with pkgconfig, a=
nd the hoops are hacks which may not be reliable.=C2=A0 I can&#39;t remembe=
r the details but I do remember that libgcrypt/gnupg was a worst offender h=
ere.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">C=
Cing Richard to see if he can remember why.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">In the glorious future removing all b=
inconfig scripts would be the ideal, in my opinion.=C2=A0 Alternatively rep=
lacing them with glorified pkgconfig wrappers.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139cdf057c1b50550478f34--
