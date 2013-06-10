Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED576A9DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:06:19 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so10872253obc.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=/ViWbHJufbDHtvLCz/P7+gA3q1zA+CnRMO2vMvfqURQ=;
	b=CYyCaqdElFFmGjAWSauCK8aj9LexMX3+bjNiQsdsfH2k779UA3oAihVVGJa8oiXZ7e
	8vmSj+mwZyelgwwvp4q3PLOp1tN8axYl6tAQ0mK0ByPr0gdPtxRaxZY03yGqq4u8B0Yh
	SnLF1vWVfdCho4TtynRNe2B5mCLePEJHsTv3bTHKX2+H/ACJ5dU1IBNrgc834giFToNo
	fASxJn+t4oRjuMR3JqfWA8fmrGwC2kCdc5imgsyacitTPo3JvpMMYM3xJUPQKfEvLq1i
	amG7YF19A5i3v5y04O05Rg3ztpG/dhRpwTEFokTHm9w+0+NgDveMc7ynXJitkLdAv5Oz
	fNYA==
MIME-Version: 1.0
X-Received: by 10.182.135.161 with SMTP id pt1mr9652405obb.3.1370898379986;
	Mon, 10 Jun 2013 14:06:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 14:06:19 -0700 (PDT)
In-Reply-To: <7f9158be5a4849dccea0ed848d29f963697c22e3.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
	<7f9158be5a4849dccea0ed848d29f963697c22e3.1370896990.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 18:06:19 -0300
X-Google-Sender-Auth: 3sPdXBeDS82bxqsB2Ev7CT8C-QQ
Message-ID: <CAP9ODKo+VwrLEOH7coCbGWqDCp8CYKVVS_XVtV8Wbw=9jpL6=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>, "Eggleton,
	Paul" <paul.eggleton@linux.intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] connman: use PACKAGECONFIG for WISPr support
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
X-List-Received-Date: Mon, 10 Jun 2013 21:06:20 -0000
Content-Type: multipart/alternative; boundary=089e013c6c3ef6810904ded32604

--089e013c6c3ef6810904ded32604
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:47 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>


Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

This seems safe for backporting to 1.4.2 and would allow for more control
on connman build; Paul?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e013c6c3ef6810904ded32604
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 5:47 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Christopher Larson &lt;<a href=3D"mailto:chris_larso=
n@mentor.com">chris_larson@mentor.com</a>&gt;<br>

<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div><=
br class=3D"">Reviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@oss=
ystems.com.br">otavio@ossystems.com.br</a>&gt;</div>
<div><br></div></div><div style>This seems safe for backporting to 1.4.2 an=
d would allow for more control on connman build; Paul?</div><div><br></div>=
-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blan=
k">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projeto=
s.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br</a><=
br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e013c6c3ef6810904ded32604--
