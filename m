Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id C11DE60079
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 12:30:29 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id 1so115442980qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 04:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M2qoPPnXKMQJ97q06rkNzJCAtCbbBDRECzg6ZNNQZGc=;
	b=YBebqnMI+xHwq87WN4vqy886OUHBUQnAWjRC4OkU1O4lFg4poJk4ngWjSP0qVG+9F6
	JZDlVnm8xnFe1sXq8nTAaK3V5nXePqUFzqdZZTLxQe98/3nd021R/KpqnOGs/Issv4d/
	n2eAxfhHrtiADTGJw/yqNOrcuP55cFU43WHjHuYiQCN4R3r2mwtrG929xhjtrsKNRSvv
	O5kom8Ap0AuG/gniskMMRwVf77d9Yn7VI4WCMbV1CNZLpac13fzthZMmcBXlxTzZTVMk
	IKzj2EMkYvxBd/g7k/FNTfQnwbXTi2FIbFFd+MJ5FM5I+v6W8qKf5nRZG5CVjy2lMsPG
	/haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M2qoPPnXKMQJ97q06rkNzJCAtCbbBDRECzg6ZNNQZGc=;
	b=GbPbxtkocIsqpaYvvwS0uYTU/DWwLCh7iaQ5lRl/M6ozZiRLzIIvRM8Ll9icOvliLa
	mj4kc46iQMH26azZ2sqG73JEYHpBaM9nsN+tNI24JXkXARwtXxF7XpUtZ+JRsoz8bMl9
	XZ7FiZ7tZNHdB62ijg+Sc2kPPEiOcVNOCKNMQhjSZW1BNmeuhCjy+TQmxFp/hZnpLNEI
	YcDG1IlE6fiTQHDdCmPnMUWFHzZpcucqEpPXa9qJX1yCzF15ZUeogr+OISvXfYQI7AEV
	A3rGefERK48eeBE8lIMA7gltLqVBT/OeCLlHPAUkBx8h+oZQU19f9KMz8rMpg+YI/UQ+
	xBbw==
X-Gm-Message-State: AMke39m/DuMyC1Igr8JsL/FkY17EiuSxFD8pkQs/We0UP/q6RKBeuPtdd1ieImy6Fp81jqKdxTg8jcr6tIJFQRET
X-Received: by 10.237.43.69 with SMTP id p63mr13512904qtd.68.1489062630383;
	Thu, 09 Mar 2017 04:30:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 9 Mar 2017 04:30:09 -0800 (PST)
In-Reply-To: <CAJ86T=XEAnT+ZR4b2GLE_V+vQjRoXuv7Tn0_sQ5Cv14B4PoN2Q@mail.gmail.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=XEAnT+ZR4b2GLE_V+vQjRoXuv7Tn0_sQ5Cv14B4PoN2Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Mar 2017 12:30:09 +0000
Message-ID: <CAJTo0LZmvMdvOG-YTzmHyTv+C3nONTBxbZaqJGpxUkjkPOncdQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Thu, 09 Mar 2017 12:30:30 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc4221a43054a4b69f7

--94eb2c124cc4221a43054a4b69f7
Content-Type: text/plain; charset=UTF-8

On 8 March 2017 at 20:54, Andre McCurdy <armccurdy@gmail.com> wrote:

> So if I want to select the gitupstream variant, what should I set
> PREFERRED_VERSION to?
>

My testing recipe is fontconfig, so I have this in my local.conf:

PREFERRED_VERSION_fontconfig = "2.12.1+git%"

Yes, you need to keep the versions in track with the version bumps.

I'll sent a v2 with the other fixes in shortly.

Ross

--94eb2c124cc4221a43054a4b69f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2017 at 20:54, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D"gmail-:2se" class=3D"gmail-a3s gm=
ail-aXjCH gmail-m15aafb34f4ab80b5">So if I want to select the gitupstream v=
ariant, what should I set<br>
PREFERRED_VERSION to?<br>
<div></div></div></blockquote></div><br>My testing recipe is fontconfig, so=
 I have this in my local.conf:</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra"><div class=3D"gmail_extra">PREFERRED_VERSION_fontc=
onfig =3D &quot;2.12.1+git%&quot;</div><div><br></div><div>Yes, you need to=
 keep the versions in track with the version bumps.</div><div><br></div><di=
v>I&#39;ll sent a v2 with the other fixes in shortly.</div><div><br></div><=
div>Ross</div></div></div>

--94eb2c124cc4221a43054a4b69f7--
