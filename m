Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCC66A9DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:53:09 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id up14so10887491obb.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=qLOAkKlOiSrVwearEgfKdCtTAlS+Hz9Iii2lxR3ySFU=;
	b=XtpJl1q+N0LKmYVsr6N+66zCJoBPgEsUtITsv8lZUwAID4ZmW1E3J4exhCTzkR6RZL
	melDYXtae8LH51cBVf3nZn1Yqv8ZkO7nsd3WoZVor+OEWc6ew+RE981W8rkgj+rj9ueR
	UK3sT+47jZlBe/4OOj1SBSBoaRhq4nuuw0b0ON/uNm153dxT7yEA5hfbz9gn4V2xXOdV
	5papGWPqPXFozxmnqh5ca/Y4rxz88mEXep7os7nNSr+XbyWpqgUfmk/JKBuou8lCc36a
	wlpH363IvbPDjuq2cCpS3EDJ9MGXrR0Nt7IkFU9kGiW46e2yorlWdLHOvX3RJ85Vbddf
	zKxw==
MIME-Version: 1.0
X-Received: by 10.60.57.101 with SMTP id h5mr10041229oeq.0.1370897590808; Mon,
	10 Jun 2013 13:53:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 13:53:10 -0700 (PDT)
In-Reply-To: <08c6a3eaf32dae3a636cbe9728850b28f079c9c4.1370896970.git.chris_larson@mentor.com>
References: <cover.1370896970.git.chris_larson@mentor.com>
	<08c6a3eaf32dae3a636cbe9728850b28f079c9c4.1370896970.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 17:53:10 -0300
X-Google-Sender-Auth: n4HZu_kJlFc1BSsTGBtUw3Nk0cU
Message-ID: <CAP9ODKq6xXZNDaBCZZkXWmm_YMP=WHtnRKOTHxhtkj3Z1rfkww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] sstate.bbclass: brute force silence fetch errors
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
X-List-Received-Date: Mon, 10 Jun 2013 20:53:10 -0000
Content-Type: multipart/alternative; boundary=089e0141abacec778404ded2f790

--089e0141abacec778404ded2f790
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> bb.fetch2.Fetcher.download() prints any fetch errors that come from the
> underlying fetcher, rather than letting the caller do so, which means
> there's
> no way to silence the fetch error messages without manipulating the
> loggers.
> So we do so. The reason for doing this is that the user doesn't care if we
> failed to fetch an sstate archive, the failure mode is just to rerun the
> real
> task anyway.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0141abacec778404ded2f790
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
bb.fetch2.Fetcher.download() prints any fetch errors that come from the<br>
underlying fetcher, rather than letting the caller do so, which means there=
&#39;s<br>
no way to silence the fetch error messages without manipulating the loggers=
.<br>
So we do so. The reason for doing this is that the user doesn&#39;t care if=
 we<br>
failed to fetch an sstate archive, the failure mode is just to rerun the re=
al<br>
task anyway.<br>
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

--089e0141abacec778404ded2f790--
