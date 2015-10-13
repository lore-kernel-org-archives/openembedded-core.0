Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id DB09F7701C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:42:21 +0000 (UTC)
Received: by qkas79 with SMTP id s79so14853457qka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 14:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PerWLUUoduV1ipzCOBQUeBHvd8YHXgl9NqpSx1v/fkE=;
	b=PG0WI8a10V+axI9NA1tonOAaoT8CI30zWZoSypckOtPoyBurDgplB4ahc56grT8tEu
	clVmo5AcXT/Q10ta5ooXTY2FMGXTCCZSsqYkPkL389wdIvuxgxyvOpZbeiRrrBoX6c5o
	F6qJCwYX0sJWbXcI6XXUoHMgmSPR7nrKfQceXIr/wQwAaX4qUifVcGZaMMZ4U1sKAC61
	wj4jyA1Qxg99pL7dlL3SWXLcGxWtuT7JR3RgqvuZROpFl9q5epFEpg7EZd9odjhYGcoC
	CSc5NqP4QVxx8aGy8q4rd3adKx2KUsm2q+XFGZT6xxqJlpJbETGRQ/Rg/2YNRT/3i/ao
	hrKw==
X-Gm-Message-State: ALoCoQnBwSgHPMzDRCmgY/+mfcS/Mnh93EySUug7aaqIqvnGaArP3NDGCOJuqI8Y5d9utytac39E
X-Received: by 10.55.192.13 with SMTP id o13mr42259205qki.83.1444772541870;
	Tue, 13 Oct 2015 14:42:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Tue, 13 Oct 2015 14:42:02 -0700 (PDT)
In-Reply-To: <CAP9ODKpN0kbRtm7pvrky5pwFZ_1YPoZ-fy=kt+4CPB+NUoyBKA@mail.gmail.com>
References: <CAP9ODKpN0kbRtm7pvrky5pwFZ_1YPoZ-fy=kt+4CPB+NUoyBKA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Oct 2015 22:42:02 +0100
Message-ID: <CAJTo0LbR=Fryhe-Jfgw9AW=ZjBTWE5gZQ2id3si55LpRZtmH-A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error due GTK+3 new rdepends on libgl
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
X-List-Received-Date: Tue, 13 Oct 2015 21:42:23 -0000
Content-Type: multipart/alternative; boundary=001a11479cfc23cc64052203526e

--001a11479cfc23cc64052203526e
Content-Type: text/plain; charset=UTF-8

On 13 October 2015 at 22:32, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> This includes a forced rdepends on libgl and I see no reason for this.
>

Mainly because gtk3-demo will link to libGL.so on startup.

It would be interesting to see what happens on platforms where libgl.so
isn't available if you remove the dependency.  If GTK+ handles that
gracefully then we can make the rdepends conditional on DISTRO_FEATURES.

Ross

--001a11479cfc23cc64052203526e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 October 2015 at 22:32, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":909" class=3D"a3s" style=3D"overflow:hidden">This includes a =
forced rdepends on libgl and I see no reason for this.</div></blockquote><d=
iv><br></div><div>Mainly because gtk3-demo will link to libGL.so on startup=
.</div><div><br></div><div>It would be interesting to see what happens on p=
latforms where libgl.so isn&#39;t available if you remove the dependency.=
=C2=A0 If GTK+ handles that gracefully then we can make the rdepends condit=
ional on DISTRO_FEATURES.</div><div><br></div><div>Ross</div></div></div></=
div>

--001a11479cfc23cc64052203526e--
