Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 63005601F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 13:31:03 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id c195so3105918itb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MJXn0Gn/e+Dn6t3fGYoRCvlnwBlbXdZXHYzNrRKBJy0=;
	b=Vljy0Rq+G+3kxB3R7mv93WbQHOfOs0dKCYSr/5fwff8/igcADUhReXU9aWZ8cM3eEL
	iF1psYYenGUiyjqsga+q4FD53g8pUgIwiGW+vT2rjkV8sszGy/vM7GZFP2gI3PxJwLue
	bHMn6h+HzXxDAaOH6dcyFU/6XyX3wiTQ1UAUYUlwe2wNLJwRyMettki4hqZGLk1oYt6t
	pm1sddxHt7LhvExr1J+xI8fz+PMcy+ueW7qS4knsyh/mwARInZ+hfCdwSiGuW+u6SM3A
	bgn167C6W/WEj95Aclu12tcu1jqXStxV8UwLQ/JCrowU21hWuVnnWTHf/2Ji2zrrpshm
	l4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MJXn0Gn/e+Dn6t3fGYoRCvlnwBlbXdZXHYzNrRKBJy0=;
	b=aYGML8l/0ChlD0nkYmx1Dw0UUn+kgRlvLp1veCAJeXMENs7EaaizHnD09fUABdiGeM
	wsdjNeD86ByI+QIj5A4yAGc1wEkuE9rBujyzHc9JEsTK9LsRqxb0xDKaHuPxD5HQsd37
	65Zd66Og2ojVOtGYrBOr1sEpwPxC7GGO/MXSB+mFDHmiKmY921DYr4L4wV54uUwXp2tr
	koEDOSlFGqo2r4vyr3Ne8+ZLcXTg85l2s3UaMuAMxhidzl3F7Ae8jH5RfT7Cy1hRT5S2
	mB68UxfHdTXW+TyvI4zbWnfm0hCoBkGLO6wUW/78UppAj+4iVNMNIDPzHdhnfnZeaER8
	d1/w==
X-Gm-Message-State: AHPjjUiQhKcC7KZujiM86N7xgXmolxvlYP6GUltrS38CuYe8m2hPw6aH
	jJEgjgsD2qPikhku7wEK2/nI6bj0T0ZSJTqhFJ4ivA==
X-Google-Smtp-Source: AOwi7QA9gYqKD/X7oEfvk3M5Rf7L+zpQViRMe8qjxAdSO8xMumMfZ+08yHM8ofAyhQevtX1V2B0kGkpA1Wved76Rt3Y=
X-Received: by 10.36.150.4 with SMTP id z4mr6068613itd.48.1506432665141; Tue,
	26 Sep 2017 06:31:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 26 Sep 2017 06:30:44 -0700 (PDT)
In-Reply-To: <20170925085929.16112-1-andreas.kling@gmail.com>
References: <20170925085929.16112-1-andreas.kling@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Sep 2017 14:30:44 +0100
Message-ID: <CAJTo0LaeRDZAXgpkaKZxiWLFg-ExGbFwNnDxw3viwPo0BeQNTw@mail.gmail.com>
To: andreas.kling@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: move pam files to own package
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
X-List-Received-Date: Tue, 26 Sep 2017 13:31:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ea98e2575b055a17afae"

--94eb2c07ea98e2575b055a17afae
Content-Type: text/plain; charset="UTF-8"

On 25 September 2017 at 09:59, <andreas.kling@gmail.com> wrote:

> From: Andy Kling <andreas.kling@peiker-cee.de>
>
>   move pam related files to already existing systemd-pam package.
>   add runtime dependencies to pam plugins introduced by file systemd-user.
>

This describes what the patch is doing but doesn't explain why.

Ross

--94eb2c07ea98e2575b055a17afae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 25 September 2017 at 09:59,  <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:andreas.kling@gmail.com" target=3D"_blank">andreas.kling@gmai=
l.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">From: Andy Kling &lt;<a href=3D"ma=
ilto:andreas.kling@peiker-cee.de">andreas.kling@peiker-cee.de</a>&gt;<br>
<br>
=C2=A0 move pam related files to already existing systemd-pam package.<br>
=C2=A0 add runtime dependencies to pam plugins introduced by file systemd-u=
ser.<br></blockquote><div><br></div><div>This describes what the patch is d=
oing but doesn&#39;t explain why.</div><div><br></div><div>Ross=C2=A0</div>=
</div></div></div>

--94eb2c07ea98e2575b055a17afae--
