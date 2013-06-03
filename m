Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCD461EBD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 16:51:31 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id 16so7567963obc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2013 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=UI2D46nNL4laPdfWZLGD+jsrd0DZ0GKH3HCuJ7ioxUg=;
	b=l4uOTYlnyIKouxHc28tDHLW4zEzdW3MESLrV4DiA8YnzYjjHOc9hB0bSzVEcyB7QJF
	bnhtR2smfPFSwq9lwyjzqMyfqXeGud8qpEXopAvjdryjC9lPqHW0SoVt6o6qdZisYnJE
	XzW83zKkPyWdeA6ww4k51gIVI7Pv1hOwQ0Acexzw2AKH+T8ni4H3esqRrYdZVfMz0Ijt
	+02EUX78Ec1cCZVOS7GYuu1mExJMQ0X+eUCkQ3EKQGqAWblgU940XYk7u9MFmR+TndQc
	Tkc05n925gTIt5wjLrftjS8S5LVnHt1GwoFfDjpgXw7JoAGE3VxORoBJChka8cZaS+/y
	ESFA==
MIME-Version: 1.0
X-Received: by 10.182.247.100 with SMTP id yd4mr2851832obc.46.1370278291906;
	Mon, 03 Jun 2013 09:51:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 3 Jun 2013 09:51:31 -0700 (PDT)
In-Reply-To: <1370277617-26698-1-git-send-email-andy.voltz@timesys.com>
References: <1370277617-26698-1-git-send-email-andy.voltz@timesys.com>
Date: Mon, 3 Jun 2013 13:51:31 -0300
X-Google-Sender-Auth: BxBjWGQkvI-72G1-3jPpWhD4GQA
Message-ID: <CAP9ODKoGOA7CH22DAOfcSvGjQA7GzSSQChP2Y6Z5SA5jDcKNbQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andy Voltz <andy.voltz@timesys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa5.inc: add tune file for cortex-a5, based on a7
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
X-List-Received-Date: Mon, 03 Jun 2013 16:51:31 -0000
Content-Type: multipart/alternative; boundary=089e01537dc6d5777604de42c6f8

--089e01537dc6d5777604de42c6f8
Content-Type: text/plain; charset=ISO-8859-1

Hello,


On Mon, Jun 3, 2013 at 1:40 PM, Andy Voltz <andy.voltz@timesys.com> wrote:

> Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

For a background: Andy is adding support to Freescale Vybrid SoCs support
and this patch is need so we can add the board (and SoC) support in
meta-fsl-arm.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e01537dc6d5777604de42c6f8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div class=3D"gmail_extra"><br><br><div class=3D=
"gmail_quote">On Mon, Jun 3, 2013 at 1:40 PM, Andy Voltz <span dir=3D"ltr">=
&lt;<a href=3D"mailto:andy.voltz@timesys.com" target=3D"_blank">andy.voltz@=
timesys.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Andy Voltz &lt;<a href=3D"mai=
lto:andy.voltz@timesys.com">andy.voltz@timesys.com</a>&gt;<br></blockquote>=
<div>
<br></div><div style>Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:o=
tavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;</div><div style><br=
></div><div style>For a background: Andy is adding support to Freescale Vyb=
rid SoCs support and this patch is need so we can add the board (and SoC) s=
upport in meta-fsl-arm.</div>
</div><div><br></div><div style>Regards,</div><div><br></div>-- <br>Otavio =
Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Syste=
ms<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.=
ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.co=
m.br" target=3D"_blank">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e01537dc6d5777604de42c6f8--
