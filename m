Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 837E06A430
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 03:14:46 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n12so9450444oag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 20:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=JKH6gOZBrQx6WXeYUtl7H0VPp71wsRkJFszTB27qzng=;
	b=GSZ1cHSBRHrYuOMdcZSf80HyACI7fJICduwpogFTBFZov3hiR85aehgBvYeH2r815/
	jKm9QQqFzN0GXQNy0JAINRKfeYxpo29VE7YNKg2l32+uB2uS0TU/YcxjHNAbHvd6UYQ2
	05pFATbz1hqcNslnxugft1KALUFakAh2117GvbWKVpHaI6DmcfY5TS5p91czEuL4X4Zf
	Fx476KbUQ3dDPacLezmNrZOa6xgDNqH7CfHG/NIQJI9x5z6VBN5IAuCVDv+ZUo+8RwDn
	jzq3ahcI/6hZHvpSdLZ29mDgaz72RzlnvkCsElO9wzf2qU90P+1hjJo0agoFUWozEok9
	gSew==
MIME-Version: 1.0
X-Received: by 10.182.240.136 with SMTP id wa8mr19997538obc.2.1369710887233;
	Mon, 27 May 2013 20:14:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 27 May 2013 20:14:47 -0700 (PDT)
In-Reply-To: <000701ce5b4e$3c7684e0$b5638ea0$@com>
References: <1369119875-4984-1-git-send-email-b40527@freescale.com>
	<CAJTo0LZA89rPdGy65ShyfxjS4jenHsinO5JPsTbWNi3sgOD=Eg@mail.gmail.com>
	<000701ce5b4e$3c7684e0$b5638ea0$@com>
Date: Tue, 28 May 2013 00:14:47 -0300
X-Google-Sender-Auth: xIja2VU08H27t7QD_qwcNPUqWx8
Message-ID: <CAP9ODKo8453_vw-9u+8308vsvy3zRoSk0ptoEzgo8gFpwp76SQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Zongchun YU <b40527@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files:fix the command line wrap around issue
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
X-List-Received-Date: Tue, 28 May 2013 03:14:46 -0000
Content-Type: multipart/alternative; boundary=089e01634f0ee13e7104ddbeaa28

--089e01634f0ee13e7104ddbeaa28
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 27, 2013 at 11:51 PM, Zongchun YU <b40527@freescale.com> wrote:

>   Hello Ross.****
>
> ** **
>
> Do you have any other comments about this patch?
>

It seems that setting it in environment is a workaround for the real issue.
Can't the same be accomplished changing busybox settings?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e01634f0ee13e7104ddbeaa28
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, May 27, 2013 at 11:51 PM, Zongchun YU <span dir=3D"ltr">&lt=
;<a href=3D"mailto:b40527@freescale.com" target=3D"_blank">b40527@freescale=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">








<div lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple">

<div>

<div>

<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">Hello Ross=
.<u></u><u></u></span></p>

<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0=
<u></u></span></p>

<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">Do you hav=
e any other comments about this patch?</span></p></div></div></div></blockq=
uote>
<div><br></div><div style>It seems that setting it in environment is a work=
around for the real issue. Can&#39;t the same be accomplished changing busy=
box settings?=A0</div></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--089e01634f0ee13e7104ddbeaa28--
