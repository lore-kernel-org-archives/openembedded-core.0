Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id CCF1A6E2DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:24:20 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id i4so1038122oah.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zKW8oL2sk94CaCvtJ4exgOxikag/7AjcGlBu7s4+ZTI=;
	b=CfVW1GnmnmVP14DpCDhvCtWhJvQL1PW7D4CnCsOOpqYB69PTb8jJuD5vegB0Xuq9Np
	pBot1pZiLREaAJ2azbjQ8qVYN+uiTltfqjaAWvN+U64jIfPXOlqQLp0fOXkEYZN+OaAk
	R0FpdNg0RJvw9lqkNlT/V1Lw5XQeOj8sWdBlDGMdAPhU67xoiBJ23W/mtqvHBUqXO4+S
	NZu738iiQ+7i98P1PYUU9gQFRyh9xPWyfIVqFatJMuBI1twk87SuQo4CYZZTUDsO/2PY
	q6IcKERFuDq4Hu2qcwb6g69clj/uWE02vJhbketa2HRibC6xY1uSKmlzCHLD8mG5NRE+
	Q5Ng==
MIME-Version: 1.0
X-Received: by 10.182.144.136 with SMTP id sm8mr1059838obb.63.1389785061649;
	Wed, 15 Jan 2014 03:24:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:24:21 -0800 (PST)
In-Reply-To: <1389780670-29935-1-git-send-email-schnitzeltony@googlemail.com>
References: <1389780670-29935-1-git-send-email-schnitzeltony@googlemail.com>
Date: Wed, 15 Jan 2014 09:24:21 -0200
X-Google-Sender-Auth: lOQKozf_-3_hTtY1NiFVxwFqEQg
Message-ID: <CAP9ODKoB5+v2S53SNtqQzzeJT5R5AyTxw1skAgWCJnjrVxBngA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: cleanup mesa depends
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
X-List-Received-Date: Wed, 15 Jan 2014 11:24:21 -0000
Content-Type: multipart/alternative; boundary=089e0149cd5ee9f3d704f0008cb5

--089e0149cd5ee9f3d704f0008cb5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2014 at 8:11 AM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> * do not depend by default
> * depend on virtual/mesa instead of mesa
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0149cd5ee9f3d704f0008cb5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 15, 2014 at 8:11 AM, Andreas M=FCller <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schn=
itzeltony@googlemail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">* do not depend by default<br>
* depend on virtual/mesa instead of mesa<br>
<br>
Signed-off-by: Andreas M=FCller &lt;<a href=3D"mailto:schnitzeltony@googlem=
ail.com">schnitzeltony@googlemail.com</a>&gt;<br></blockquote><div><br></di=
v><div>Reviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br">otavio@ossystems.com.br</a>&gt;</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
<span>Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D=
"gc-number-5" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 (347=
) 903-9750</span></span><br>
</div></div>

--089e0149cd5ee9f3d704f0008cb5--
