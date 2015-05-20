Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4433A601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:32:28 +0000 (UTC)
Received: by qgfa63 with SMTP id a63so3749145qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NRpS2y8QZoZNQpVhZVtMteRjyk0YpDdPWX+gzlV4B4Y=;
	b=c+DjvcR3nROrCpH9Kjcv3RQF6/rtDF1q2Yp2TId/0z4cQZ1YIwxK1bYLjZxrnW1Er6
	zSg3xob+N1MI073TYWDqtW/woVDwICGfmCOlMXD7UADhOwQfY9YpCdaidfVkzwTRiZ9/
	3ERe8bzmBlie3IdPhZY4F5SsxyPxvUivwS+zFiDOMtN9r15jmMMDAOHF8bdHBTzanFie
	9pM4nixLEP+jLZJkqIIfKDXRc5+wqQAXGXqjWTZih544Y6JBlhbc4dq4G4aH09LHzZhA
	5MB/OQIKedbN2ZQ80S/8yo/+boLf2XY8TLmOuUysuLEh8IIFMo2sF6+7HwNXGNUbKE9q
	kiiA==
X-Gm-Message-State: ALoCoQnNtycsXzLqms1E9qSRQK4Bq/p2FdZVxacP9jMUlknzIGf9y9BQ/UR8OziYFdDUWTqKnjP+
X-Received: by 10.55.43.130 with SMTP id r2mr62011024qkr.14.1432128749660;
	Wed, 20 May 2015 06:32:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 06:32:09 -0700 (PDT)
In-Reply-To: <555C8BAC.7090603@kernelconcepts.de>
References: <1432122583-24497-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAJTo0LbOKfUpUyor7AczZyffp7gQruYy3hYMqz+ewGxZzRc+mQ@mail.gmail.com>
	<555C896A.8020107@kernelconcepts.de>
	<CAP9ODKo7H5T3Thb+1SW9hGwkzxEbTzYJr2=fLraqje67ssHRpw@mail.gmail.com>
	<555C8BAC.7090603@kernelconcepts.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 14:32:09 +0100
Message-ID: <CAJTo0LYM_V=Ee5hzfhvK0OW224yZ7+TG+6iuQkk5WKxYHmJQeQ@mail.gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-engines: Allow gtk-engines package to be empty in order to make the -dev package installable.
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
X-List-Received-Date: Wed, 20 May 2015 13:32:31 -0000
Content-Type: multipart/alternative; boundary=001a1147afb0657ee605168375c3

--001a1147afb0657ee605168375c3
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 14:27, Florian Boor <florian.boor@kernelconcepts.de>
wrote:

> > No. You should rely on PR Service for this. Drop the PR bump as it is
> > pointless here.
>
> oh PR Service - if we can rely on it in this case I agree.


If you care about upgrade paths then the PR service is far more reliable
than explicit PR bumps.

Ross

--001a1147afb0657ee605168375c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 14:27, Florian Boor <span dir=3D"ltr">&lt;<a href=3D"mail=
to:florian.boor@kernelconcepts.de" target=3D"_blank">florian.boor@kernelcon=
cepts.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">&gt; No. You should rely on PR Service for this. Drop the PR bump =
as it is<br>
&gt; pointless here.<br>
<br>
</span>oh PR Service - if we can rely on it in this case I agree.</blockquo=
te></div><br>If you care about upgrade paths then the PR service is far mor=
e reliable than explicit PR bumps.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1147afb0657ee605168375c3--
