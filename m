Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0C96A9C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:56:47 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id ef5so10863758obb.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=eqq0I7jt1dkmBAAOmmH9Nb+AaFXGEWRk46/WgqHWvn8=;
	b=USzDK/xgj12NInXUM5SqLvtNi33pZjxH076ZpcJPpGQJ+A5FgM0T/9jyyMMEYdY57b
	BSGh8fgHk7N+KC/9e9zieObMc7RLv+Lhn7RuK6KnPLItfGc9VuI4AWWT+DXsJ2QppZPo
	gc6yGidxkYOwwNkmhxfRszRrXWko9phHj2tp7vLcWCnZFlnsVOKfZ1Ko6cAh4H5kXlob
	RV1hKx7C0Co9VT+D42aAElS26MptJPOnLpaoh5w/w83iKIqP5ObfUtfRO5LaG18Kypgd
	MLgaeLSbA67huGBzkvDLFG7M18rBAGqh9jdddLfQxfj8Pao45Ey3v5j0YQNv6oNBCXJ6
	+sXw==
MIME-Version: 1.0
X-Received: by 10.182.135.161 with SMTP id pt1mr9619013obb.3.1370897808351;
	Mon, 10 Jun 2013 13:56:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 13:56:48 -0700 (PDT)
In-Reply-To: <4dcc39cc1fed7d398b97859ea281ab46e8ba8dbb.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
	<4dcc39cc1fed7d398b97859ea281ab46e8ba8dbb.1370896985.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 17:56:48 -0300
X-Google-Sender-Auth: rp8WGKFpDPUwtsfCL2ac49GLSvU
Message-ID: <CAP9ODKo_XEzjM8cKUNi-mJ2v8SnEfEnusAaWYi1==gNGWwuY=Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] packagegroup-core-tools-profile: don't exclude mips
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
X-List-Received-Date: Mon, 10 Jun 2013 20:56:48 -0000
Content-Type: multipart/alternative; boundary=089e013c6c3ee3eb3604ded30442

--089e013c6c3ee3eb3604ded30442
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Now that liburcu supports mips, this packagegroup can pull in lttng
> software
> on that architecture.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>


Your commit log say's nothing about babeltrace. I think it'd be good to add
it.

 --
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e013c6c3ee3eb3604ded30442
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Christopher Larson &lt;<a href=3D"mail=
to:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
Now that liburcu supports mips, this packagegroup can pull in lttng softwar=
e<br>
on that architecture.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</blockquote><div><br></div><div style=
>Your commit log say&#39;s nothing about babeltrace. I think it&#39;d be go=
od to add it.</div>
<div><br></div><div>=A0--=A0</div></div>Otavio Salvador =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.=
ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0=
 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http=
://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e013c6c3ee3eb3604ded30442--
