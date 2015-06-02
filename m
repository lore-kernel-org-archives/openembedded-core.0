Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 78D15756F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 16:37:50 +0000 (UTC)
Received: by qkx62 with SMTP id 62so103839304qkx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 09:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=b4TcHP3aUw2ndPA8IxsflFUrkfBn21O7Ln13DMnsEi8=;
	b=J7hLuzCjRaMJxcZACrDoUEhwtTLCIZIjvplndlBZdQvo7A4c2j5n02meWTlatK8Ijv
	zX1ZmKMLmrIFOFF3y1x+mz7DjdkfTPjGq3Ox8cN3EeunrKsAxPaUOZjR/VQEiCior4s+
	sJgYfL030ADN9RSDqeHRqhsijxQGzl4XROvNsiUgbCCZSrHhnIwMJzl8G7Hnw4e08p9g
	m/f6ihUFNY/Ms1EoQQS4k/VA5VMmEa1nJmVDdJec73otIk+wudwpRzGw1ltwNfscD0Cn
	b+SerciSDJvj0uVRY9E/GJCq3Q1ZYNfqOIhm14C52zo5JDDx1Sdva9/6/Fg5Xgu/uucw
	zSgA==
X-Gm-Message-State: ALoCoQmk0exNN0yHLk3tv4EYPXmT5N18+MujJ5Gn5BE4P+EdNxnZtfFFdOxWx3Brl0YLIMUuVlg2
X-Received: by 10.55.40.18 with SMTP id o18mr49916383qkh.58.1433263072047;
	Tue, 02 Jun 2015 09:37:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 09:37:31 -0700 (PDT)
In-Reply-To: <20150602163611.GI31081@xsjsorenbubuntu>
References: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
	<CAJTo0LYwXZ2KsGay0Q0sRKbUUZXdCendjTXkCYdH5ycdkAtSYA@mail.gmail.com>
	<20150602163611.GI31081@xsjsorenbubuntu>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 17:37:31 +0100
Message-ID: <CAJTo0LYCCueNBAiFMyYzJKauGyjtV9BLOzjUYRiLvLDJDLNwkg@mail.gmail.com>
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] dosfstools: Add recipe for v3.0.28
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
X-List-Received-Date: Tue, 02 Jun 2015 16:37:52 -0000
Content-Type: multipart/alternative; boundary=001a11440fb847815e05178b9045

--001a11440fb847815e05178b9045
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 June 2015 at 17:36, S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com> =
wrote:

> The MANDIR is automatically correct with the parameters passed, I
> believe.
>

The makefile says:

PREFIX =3D /usr/local
SBINDIR =3D $(PREFIX)/sbin
DOCDIR =3D $(PREFIX)/share/doc
MANDIR =3D $(PREFIX)/share/man

So we should probably pass the correct paths for DOCDIR and MANDIR to
handle the distribution changing those values.

Ross

--001a11440fb847815e05178b9045
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 June 2015 at 17:36, S=C3=B6ren Brinkmann <span dir=3D"ltr">&lt;<a href=
=3D"mailto:soren.brinkmann@xilinx.com" target=3D"_blank">soren.brinkmann@xi=
linx.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":1su" class=
=3D"" style=3D"overflow:hidden">The MANDIR is automatically correct with th=
e parameters passed, I<br>
believe.</div></blockquote></div><div class=3D"gmail_extra"><br></div>The m=
akefile says:</div><div class=3D"gmail_extra"><br><div class=3D"gmail_extra=
">PREFIX =3D /usr/local</div><div class=3D"gmail_extra">SBINDIR =3D $(PREFI=
X)/sbin</div><div class=3D"gmail_extra">DOCDIR =3D $(PREFIX)/share/doc</div=
><div class=3D"gmail_extra">MANDIR =3D $(PREFIX)/share/man</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">So we should probably=
 pass the correct paths for DOCDIR and MANDIR to handle the distribution ch=
anging those values.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div></div>

--001a11440fb847815e05178b9045--
