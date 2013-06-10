Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id BDE5762062
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:48:04 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id l20so6851205oag.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=7HOzOrtN6fqkZ9QGy8Pb3k+kzQ5utmGoY39HU+qLza0=;
	b=xinGsoBCsZSock0bX8WCJpUBZOTqbLfMuEfM2Y8i18opJNOs3ifwO/+gmRYDLSjfQ+
	TYhuek/Y7+oMWY1eV+sD3DOQqs/sxTM7gUJLwvBnCZlaGbA/7gwHAe6qkaid7PuGK+/K
	J7dSWLtAzDOHTXCPG4TB0AntZjikmaHKy+40H5hfDxec+t5XhrNMm7iUhHgO1wsUlrkD
	UzYyO9oBFM946BoVmkxB8BOwQbAMIY0vGGnl7/YDcEziME33Hbvyslk94geMYfLKra5H
	okpRgB17j2MxLsVMoxOQh9ComimrvurHrwM9SG283ubVacOLtIn832LyZHwCPFoyZUfj
	xdzg==
MIME-Version: 1.0
X-Received: by 10.182.79.106 with SMTP id i10mr10270697obx.59.1370908085463;
	Mon, 10 Jun 2013 16:48:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 16:48:05 -0700 (PDT)
In-Reply-To: <1103bc7c76faba1db73f4c4f4b8439aa03258c3d.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
	<1103bc7c76faba1db73f4c4f4b8439aa03258c3d.1370906102.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 20:48:05 -0300
X-Google-Sender-Auth: Sest4l2DnmWRROeBMDIc69nsrF4
Message-ID: <CAP9ODKqo2j8gjhKz2CNNa_2xkyt2WXjKBJQrv+Rz3PL=O8QdGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/4] packagegroup-core-tools-profile: don't exclude mips
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
X-List-Received-Date: Mon, 10 Jun 2013 23:48:05 -0000
Content-Type: multipart/alternative; boundary=047d7b2e3e107431b604ded569ea

--047d7b2e3e107431b604ded569ea
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 8:15 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Now that liburcu supports mips, this packagegroup can pull in lttng recipes
> (lttng-ust, lttng-tools, lttng-modules, babeltrace) on that architecture
> as it
> does for the others.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b2e3e107431b604ded569ea
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 8:15 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Christopher Larson &lt;<a href=3D"mail=
to:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
Now that liburcu supports mips, this packagegroup can pull in lttng recipes=
<br>
(lttng-ust, lttng-tools, lttng-modules, babeltrace) on that architecture as=
 it<br>
does for the others.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></div></div></blockquote><div><br>=
</div><div style>Reviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@=
ossystems.com.br">otavio@ossystems.com.br</a>&gt;</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b2e3e107431b604ded569ea--
