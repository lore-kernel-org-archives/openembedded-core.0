Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id DF02F6A963
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:51:59 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id eh20so10515939obb.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ILYrPxkTBAsOS/65KqlOYQLr6zRNdBHFGI81EXQ/dJQ=;
	b=gIeKLl+qyBoJ5b6gftUJBzICKkl9hsZmAIMLET/fcIoKm2dDB+TnA0yAxUtO8YIMrQ
	ZvuUYWrOnPe+Mo4NQuhLMkDByq/Db3IXFNXhakWFuqVGxl5q9QDRLApZiPPTkVtuacxU
	EZujuYE832S2IsSiHrgoZ6eTZwg0yVTlxarUPEqAGRiAk6GIa0Y1lKaL3LfaxxA5Qeye
	7GbsFSautHi/i0077YEcLds8ZA7lwsEVlyGwAGkTZplVK5aF25cFsEhtE2yysO3qWv/I
	14tEYzheP9nOnHa2Y9MKlKQS8vsC3RpnG8qrKklHqU19nQuLOpUxYSJ8lgdp12849S6S
	we2w==
MIME-Version: 1.0
X-Received: by 10.182.87.42 with SMTP id u10mr9755274obz.73.1370897520670;
	Mon, 10 Jun 2013 13:52:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 13:52:00 -0700 (PDT)
In-Reply-To: <694bdc11ba7066ca142d101c4dba08987fbfcb9c.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
	<694bdc11ba7066ca142d101c4dba08987fbfcb9c.1370896970.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 17:52:00 -0300
X-Google-Sender-Auth: kB5y2RcASpXWSuqddutnlGKTinE
Message-ID: <CAP9ODKobnzNLsU16N9Dp_Kr0RgXzOGjGOx5o6tY_po2uCSS3eQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] sstate.bbclass: fetch archive+siginfo in a single pstaging_fetch
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
X-List-Received-Date: Mon, 10 Jun 2013 20:52:00 -0000
Content-Type: multipart/alternative; boundary=089e013cba62be3d9004ded2f373

--089e013cba62be3d9004ded2f373
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This avoids unnecessary duplication of setup. The only visible change in
> behavior will be the case if siginfo exists and the archive does not, in
> which
> case it'll redownload both, but this doesn't seem unresasonable to me,
> particularly since the archive is downloaded first, making this case
> particularly unlikely.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e013cba62be3d9004ded2f373
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
This avoids unnecessary duplication of setup. The only visible change in<br=
>
behavior will be the case if siginfo exists and the archive does not, in wh=
ich<br>
case it&#39;ll redownload both, but this doesn&#39;t seem unresasonable to =
me,<br>
particularly since the archive is downloaded first, making this case<br>
particularly unlikely.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div>R=
eviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">=
otavio@ossystems.com.br</a>&gt;</div>
<div><br></div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e013cba62be3d9004ded2f373--
