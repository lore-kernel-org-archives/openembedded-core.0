Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id E3FAE6C1C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 20:01:35 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id f9so2039076uaj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 13:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7KtDOs1foqI8Ep8M+Gg2gTJPX/XgobaZOuJGS/SDOvU=;
	b=Y+pGnGwiBAX08GVr/a5Dev7hIs7pOZvZKVRFiZxNjfm3jz7Zw9FyuvRa1teU9LPys0
	3WKrkczR+AZEbnlHZEZEGVh/qhinkLpWnlg741om34LXXaQ1jiypgintcYEtYT0w+voq
	k/GkouEEyaK+LmqIOth/uq+zpGn+KknlXsGrh0l/1JgcT7a8wXc08PiYt3C722b8QFcE
	6uFjrCXGRMV8g0JRRT3p22RObo10DEnh+zvCt36/O3H8Yq14rzr2OllU1bi8WO+kAyBP
	9rnz0PAzr4KTi1vT4WBuZDxBpAspAXnaoEvj8lgTgCseVvxJLhamFejSgtzUYCnfwITp
	OVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7KtDOs1foqI8Ep8M+Gg2gTJPX/XgobaZOuJGS/SDOvU=;
	b=eXYAuqkhxjPUuBudDYSfM19aGIH+Jb4HJekNKjP9KtS9n1n4UJ4HRE5/TGjXsPnbaz
	VARTz6uPNOt362fYWHDQ2G6ohFL3+Hx1uAuvM37nCjBcIAZlwZwawyWzHCSP9C+kMU3h
	CNDcDvcaMoVTxtUoXqyhfL0ZalyYPPrtSJPBj/YSnjhVZuDjk8lXkYk1Wo38X3NFxveL
	Mm5F/sqzMBvv+bBlfRBi2OIGXClQvtQSlEFHuBX5Cz0HaQsX98iPWv9G9bcZEMW+YLoh
	aa5U0RNPDJVnUDlUS2tjs6McU60OAChtnfvFeULpuhVnT1YCRitPgbYDRQ2JWZyVGZYT
	OBQg==
X-Gm-Message-State: APjAAAVI1LBu+MLNY0XmCKxlxAkVfeImDJ3MMze0yV3/fxUMifrAvVMN
	Ngg1Vk8w+ChgyuC+VLoZSAJZnSJQsmV2l+cbWC3GIVse
X-Google-Smtp-Source: APXvYqxRtVF0583wlTPBultDxFdyS1TKYgsHdXFNm5slf5ehcEFzR6auOE6yNTlIFcZF6wxRB5ZhliF0rSaSHFDL8BY=
X-Received: by 2002:ab0:30ae:: with SMTP id b14mr2308854uam.22.1565726496722; 
	Tue, 13 Aug 2019 13:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190813195239.30048-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190813195239.30048-1-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Aug 2019 22:01:25 +0200
Message-ID: <CANNYZj8iGTPsJ9jJL70o9xfs2JKAikWrxtbmoBB_xQ-ZLMkzqw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xrandr: update to 1.5.1
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
X-List-Received-Date: Tue, 13 Aug 2019 20:01:36 -0000
Content-Type: multipart/alternative; boundary="000000000000a712de0590051be3"

--000000000000a712de0590051be3
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Aug 2019 at 21:53, Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> SRC_URI was moved from xorg-app-common.inc, since it has hardcoded file
> extension (tar.bz2), but upstream stopped publishing tar.bz2 archives
> for newer versions of the packages.
>

Should this be rather fixed in the common include though? I took a brief
look here:
https://www.x.org/releases/individual/app/
and it seems like we can switch to xz for everything or almost everything
without much pain.

Alex

Alex

--000000000000a712de0590051be3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 13 Aug 2019 at 21:53, Oleksandr Kravchuk &lt;<a href=3D"mail=
to:open.source@oleksandr-kravchuk.com">open.source@oleksandr-kravchuk.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">SR=
C_URI was moved from xorg-app-common.inc, since it has hardcoded file<br>
extension (tar.bz2), but upstream stopped publishing tar.bz2 archives<br>
for newer versions of the packages.<br></blockquote><div><br></div><div>Sho=
uld this be rather fixed in the common include though? I took a brief look =
here:</div><div><a href=3D"https://www.x.org/releases/individual/app/">http=
s://www.x.org/releases/individual/app/</a></div><div>and it seems like we c=
an switch to xz for everything or almost everything without much pain.</div=
><div><br></div><div>Alex<br></div><div><br></div><div>Alex<br></div></div>=
</div>

--000000000000a712de0590051be3--
