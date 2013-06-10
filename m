Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 186B66A622
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:00:29 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so10775122obc.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=btrQnrSdaVxhNhxeUJLVyLUMXmYXb++0OS9UDEI7QFM=;
	b=L692CoR2ymzUudz7ayxDRQ3z3phD3v0cpUvpGvaojApUwmY7gGjsTTQwAXy3YZq9NN
	xHaIaBOaBoPTjeBBRrQ7axHHccFa0o63OqhNw0Q2BZtHebQbXitp/xnP1yLP1S+fvjt3
	VsselXKLEuRwTUR5f5Fg9FqJ1SWElS5/W+EvzEfLMqtRZxDqnRvEsVuuISuc/K/hFxvD
	FoCSGwgX6glTmfYqRba8NN+JFps7KIO+4BV05ScBqc+5MPED0d8cTVLmCeWT7tZcF6Za
	6nwAdLToSEOmdg+Fx1n64tjrRUMAW6nLtpJbV+r+2C3toUmf1AcdIYF1kl//JrD9yL0s
	w/Tg==
MIME-Version: 1.0
X-Received: by 10.60.134.236 with SMTP id pn12mr10037797oeb.4.1370898030068;
	Mon, 10 Jun 2013 14:00:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 14:00:30 -0700 (PDT)
In-Reply-To: <caed7f0fbb98ddfcb4af285909318efc22b90e3f.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
	<caed7f0fbb98ddfcb4af285909318efc22b90e3f.1370896985.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 18:00:30 -0300
X-Google-Sender-Auth: peVCgBIK4_Cm_0-z8xcV_Q7QysA
Message-ID: <CAP9ODKp7h6o+vBYpKxz41Sy1MUR9fsL4poM=M-qu6uZg-rFAHw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] license.bbclass: include all licenses in the manifest
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
X-List-Received-Date: Mon, 10 Jun 2013 21:00:29 -0000
Content-Type: multipart/alternative; boundary=047d7b471f6a1b104e04ded31218

--047d7b471f6a1b104e04ded31218
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> When we don't have a generic license file for the license in question, we
> can
> warn, but we should still include it in the manifest, otherwise the
> manifest
> doesn't reflect reality. Failing to include a license listed in the recipe
> in
> the manifest can't be allowed.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b471f6a1b104e04ded31218
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Christopher Larson &lt;<a href=3D"mailto:chris_larso=
n@mentor.com">chris_larson@mentor.com</a>&gt;<br>

<br>
When we don&#39;t have a generic license file for the license in question, =
we can<br>
warn, but we should still include it in the manifest, otherwise the manifes=
t<br>
doesn&#39;t reflect reality. Failing to include a license listed in the rec=
ipe in<br>
the manifest can&#39;t be allowed.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div>R=
eviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">=
otavio@ossystems.com.br</a>&gt;</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b471f6a1b104e04ded31218--
