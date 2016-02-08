Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id C6EC36FF76
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 23:00:27 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hb3so66797341igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 15:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jjPCWHQROXJATklbpq51PVWj4g0q/ijJnQ3JAP/xVEg=;
	b=ilz7SiobmK3TLELDw9gXKYfic3XY/JRpG19IPlPb5Iq5iEeDq6nIHpBFd3uOnYB25d
	jdk1cZWljXN4rr2z+L5SKJ2OM3WSZvSa7gH+LYPM3pCJujq+3X0Hl59GQAmEJpzuQgi0
	dYHNF9XEmZGVitYlgova/iCq0SNHReb5MjH6GDsafncpJl0+rZXAK11Mb71ktpZqP5bm
	aOf+cXvEMtH9C3WU1RlLUTYxTJ0zlD65mDzcWwIK8RAKLW3zGBI18d2JAZs9lAbf+k06
	iekvDbtnzCJuyvUckX3v3c3s57ZlWPsNJvcRTEECjTleWEXenXuWTc9fkqztUlDuN2AX
	6c8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jjPCWHQROXJATklbpq51PVWj4g0q/ijJnQ3JAP/xVEg=;
	b=OQ0LLu34WQ/MhDzfo3G4kv5hG/49dp3t4qD6pSSKwqYV0kO2sdJ9OrKrZavPKQgUsq
	5pw7xo7OR4jqZkyQIo+OchDbZkGThDGv2HFGPdhIZvrkBmUkvZ0i/qutO/21rzntYWG0
	uMKowlJdPOju+UhCSgmTTpfcadU+yGmQmCikKqPTR+skhW5q258M+qxDzFDxKk7vfIx9
	zhxq1ecOySdcyw4abcvnsjP3qWZcLMI4MrYWfPkvnw9Ndh7wC0hfKL9qYTBQl9SJkuLx
	lGXeLvWRjBIcWwfyLgxKB/+d8+wvXHYhiF+Y7E3Il9j6TSpOCjCtvWgZaUmYrdh13V4N
	9xhQ==
X-Gm-Message-State: AG10YORQxD2Uzr+36Ie6GnR0l/ZbNc+JRpUHHEvrCGYB0pD0K7Y/vur8h8XFvJd4yjSbtGVbmglv2y4x732SYyyd
X-Received: by 10.50.160.7 with SMTP id xg7mr1304048igb.64.1454972427612; Mon,
	08 Feb 2016 15:00:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 8 Feb 2016 15:00:08 -0800 (PST)
In-Reply-To: <CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
	<CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
	<CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Feb 2016 23:00:08 +0000
Message-ID: <CAJTo0LayxZ-T_cw0H5ndoxHkUHXwcqRdfu7oYjUevX+QzR4CTw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: TARGET_CFLAGS for non-target builds
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
X-List-Received-Date: Mon, 08 Feb 2016 23:00:27 -0000
Content-Type: multipart/alternative; boundary=001a11339de8b4ccdb052b4a2a2a

--001a11339de8b4ccdb052b4a2a2a
Content-Type: text/plain; charset=UTF-8

On 8 February 2016 at 20:03, Andre McCurdy <armccurdy@gmail.com> wrote:

> Can you give an example? Looking at native.bbclass it seems to replace
> TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.
>

Sure, so in doing a native build TARGET_CFLAGS is used.  But as
security_flags.inc was using TARGET_CFLAGS_append, the end result was
BUILD_CFLAGS appended with the security flags.

Ross

--001a11339de8b4ccdb052b4a2a2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2016 at 20:03, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1jr" class=3D"a=
3s" style=3D"overflow:hidden">Can you give an example? Looking at native.bb=
class it seems to replace<br>
TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.</div></blockquote></div=
><br>Sure, so in doing a native build TARGET_CFLAGS is used.=C2=A0 But as s=
ecurity_flags.inc was using TARGET_CFLAGS_append, the end result was BUILD_=
CFLAGS appended with the security flags.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a11339de8b4ccdb052b4a2a2a--
