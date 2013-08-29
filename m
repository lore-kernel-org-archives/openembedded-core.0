Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 929186B96C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:01:22 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so1030713pab.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=EuwXBwbHmuww1wlT6Xy7ChhZUQgNBlT9fBm4SCu7O7U=;
	b=VCMxyrBES/BemmQBLx8ykNiKtSK6/xhecpBdN1+AvCeN7KVr9Aj/Rln6RoNn/4EDy7
	7Iw+1qUCnVOant5SxWCu0SImWVnOoUUOY/k1+3WPa+VIGj+KrGSMnmkUdELSmA9OBXcU
	IRpN3AZ+8iehHxG/kfxxymjzCYOAezluIVH2tneNvqwUkyPowZaAn4qAg9Krv+ZUVCIJ
	oPheXyS5BiZQSfO/lqjD/fknXISDp40TxufCLVvWiKChMUT0WwYk0Inv48bSBMt/xRKW
	P0N/sBSlzBPWmJ3r/7aE8tEVMpA1YtqdoMUK6RYu0/Bmitmj9YFr9Mc+rQrt92Yp4owa
	+pDw==
X-Gm-Message-State: ALoCoQl5uS9osfMB/WCp13AyJTQ8mRJd+L4rcC5DyxjHdqgl1tQ/zjZfYVYoHVKSc4b63XUwNrT4
MIME-Version: 1.0
X-Received: by 10.68.59.98 with SMTP id y2mr4132726pbq.135.1377788480635; Thu,
	29 Aug 2013 08:01:20 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Thu, 29 Aug 2013 08:01:20 -0700 (PDT)
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
Date: Thu, 29 Aug 2013 16:01:20 +0100
X-Google-Sender-Auth: BOpNK5R1pDWwLIE4spPHikCmUPc
Message-ID: <CAOMwXhNa+ZjLU_Wx=d3RsMHJm84=9gbH2jFSytd-gjwv1HUaBA@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2013 15:01:22 -0000
Content-Type: multipart/alternative; boundary=bcaec5304f81f6db1604e517604f

--bcaec5304f81f6db1604e517604f
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> It does, all you need to do is enable BB_GENERATE_MIRROR_TARBALLS
>

I need all the three lines or just the last?

 SOURCE_MIRROR_URL ?= "file://${DL_DIR}"
 INHERIT += "own-mirrors"
 BB_GENERATE_MIRROR_TARBALLS = "1"

--bcaec5304f81f6db1604e517604f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Aug 21, 2013 at 12:04 PM, Martin Jansa <span dir=
=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">ma=
rtin.jansa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><d=
iv class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im"><span style=3D"color:rgb(34,34,34)">It d=
oes, all you need to do is enable BB_GENERATE_MIRROR_TARBALLS</span></div>
</blockquote><div><br></div><div>I need all the three lines or just the las=
t?</div><div><br></div><div>=A0SOURCE_MIRROR_URL ?=3D &quot;file://${DL_DIR=
}&quot;</div><div>=A0INHERIT +=3D &quot;own-mirrors&quot;=A0</div><div>=A0B=
B_GENERATE_MIRROR_TARBALLS =3D &quot;1&quot;=A0</div>
</div></div></div>

--bcaec5304f81f6db1604e517604f--
